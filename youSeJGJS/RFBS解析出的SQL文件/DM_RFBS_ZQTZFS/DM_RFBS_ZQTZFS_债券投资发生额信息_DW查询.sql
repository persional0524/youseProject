-- 步骤类型: N/A, 步骤名称: 债券投资发生额信息_DW查询
-- 标签: name, 属性: {}, 内容: 债券投资发生额信息_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
with head as (
 select org.ORG_CLTNO NBJGH,
		org.ORG_CREDIT_CODE	JRJGDM,
        org.org_area JRJGDQDM
   from dm_pub_org org
  where org.org_type = 1),
rat as (
select p.paramvalue,p.paramname
        from dm_pub_param p
        where p.paramno = 'BondCreditRating' order by p.paramvalue
)
  select SEQ_DM_RFBS_ZQTZFS.NEXTVAL ID,
         '${reportId}' REPORT_ID,
         '${BATCH}' BATCH,
          head.JRJGDM,--金融机构代码
          head.NBJGH,--内部机构号
          tx.v_dept_id,--部门编码
        -- ba.FINANCE_NO ZQDM,--债券代码
			nvl(substr(ba.FINANCE_NO,1,instr(ba.FINANCE_NO,'.',1)-1),ba.FINANCE_NO) ZQDM,--债券代码
          case  when bo.BOND_CUSTODIAN= '999' then '000'
                when ba.FINANCE_NO='F102101759' then '300'
				when ba.FINANCE_NO='2000004.IB' then '400'
               else bo.BOND_CUSTODIAN 
          end ZQZTGJG,--债券总托管机构  
          nvl(PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BOTTOM_DEBT_BIZTYPE','bondsonDifferentLocationsType',ba.product_type),'TB99') ZQPZ,--债券品种
           case when bo.DEBE_CREDIT_RATING = '000' then 'C00'
             else nvl((select paramvalue from rat where paramname = bo.DEBE_CREDIT_RATING ),'C00')
          end  ZQXYJB,--债券信用级别 
          ba.CUR_CODE BZ,--币种
          to_char(ba.ACT_DATE,'YYYY-MM-DD') ZQZWDJR,--债权债务登记日
              case when ba.FINANCE_NO='2000004.IB' then to_char(ba.ACT_DATE+1,'YYYY-MM-DD')
			else  to_char(ba.ACT_DATE,'YYYY-MM-DD') end QXR,--起息日
          to_char(nvl(ba.ACCT_END_DATE,ba.END_DATE),'YYYY-MM-DD') TFRQ,--兑付日期
          ba.rate  PMLL,--票面利率
           case when ba.FINANCE_NO='2000004.IB' then '11100000000013186G' else  ba.CREDIT_CODE end FHRZJDM,--发行人证件代码
		case when ba.FINANCE_NO='2000004.IB' then  '000000'  else      
		nvl(case ba.ISSUER_COUNTRY
                  when 'CHN' then (case  when ba.product_type in ('1010101','1010102','1010103','10103') then '000000'
                                      else ba.ISSUER_REGION
                                 end)
                  ELSE PKG_RMM_FUNCTIONS.getCountrySixNum(ba.ISSUER_COUNTRY)
          end ,clt.ADMIN_DIVISION) end FHRDQDM,-- --发行人地区代码  
         case when ba.FINANCE_NO='2000004.IB' then  'S'  else 
		( case when ba.ISSUER_COUNTRY= 'CHN' or ba.ISSUER_COUNTRY is null then nvl(substr(ba.ISSUER_INDUSTRY,0,1),substr(clt.INDUSTRY,0,1))
                   ELSE '2'end) END FHRHY,--发行人行业
         DECODE(nvl(ba.ISSUER_SCALE,clt.ENTERPRISE_SCALE),0,'CS01',1,'CS02',2,'CS03',3,'CS04','CS05') FHRQYGM,--发行人企业规模
         case  substr(ba.ECONOMIC_INGREDIENT,0,2) 
                  when '01' then 'A01'
                  when '02' then 'A02' 
                  when '03' then 'B01'
                  when '04' then 'B02'
                  when '05' then 'B03'          
          else substr(M2.PARAMVALUE,0,3) end FHRJJCF,--发行人经济成分
        case when ba.FINANCE_NO='2000004.IB' then  'A01'  else   
		nvl(ba.ECONOMIC_SECTOR,clt.Economic_Sector) END FHRGMJJBM, --发行人国民经济部门
          to_char(tx.TX_DATE,'YYYY-MM-DD') JYRQ,--交易日期
          ba.TRADE_ID JYLSH,--交易流水号
          tx.TX_AMOUNT CJJE,--成交金额
          tx.TX_AMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(ba.CUR_CODE,date'${endDate}') CJJEZRMB,--成交金额折人民币
          case tx.BUY_REMEED_FLAG when '1' then '1' 
               when '2' then '0'
               else null
          end FLAG--买入/卖出标志
          from  DH_INVEST_DETAIL tx
          left join DH_INVEST_BASEINFO ba on ba.TRADE_ID = tx.TRADE_ID
          left join DH_INVEST_BOND bo on bo.TRADE_ID = ba.TRADE_ID
          left join dh_gl_cltinfo clt on ba.ISSUER_NAME =clt.chinese_name
          and clt.ht_s_dt <= date'${endDate}'
          and clt.ht_e_dt > date'${endDate}' 
           LEFT JOIN DICT_PARAM_MAPPING M2
  ON M2.APPNO = 'RIMAS' AND 
     M2.CODE_TYPE = 'HOLDSHARE' AND 
     M2.PARAMNO = 'rimasHoldShare' AND 
     M2.STANDARD_CODE = clt.QYKGLX
           ,head
          where   tx.TX_DATE between date'${startDate}' and date'${endDate}'
          and ba.product_type in (select STANDARD_CODE from DICT_PARAM_MAPPING where CODE_TYPE ='BOTTOM_DEBT_BIZTYPE' and appno='RFBS')
          and ba.ht_s_dt <= date'${endDate}'
          and ba.ht_e_dt > date'${endDate}' 
          and bo.ht_s_dt <= date'${endDate}'
          and bo.ht_e_dt > date'${endDate}'

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
