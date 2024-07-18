-- 步骤类型: N/A, 步骤名称: 存量债券发行信息_DW查询
-- 标签: name, 属性: {}, 内容: 存量债券发行信息_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: custom_distribution, 属性: {}, 内容: None
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
select SEQ_DM_RFBS_CLZQFX.NEXTVAL ID,
         '${reportId}' REPORT_ID,
         '${BATCH}' BATCH,
          head.JRJGDM,--金融机构代码
          u.*
 from (
          select ba.v_dept_id,--部门编码
          ba.PRODUCT_ID ZQDM,--债券代码    
          case ba.BOND_CUSTODIAN when '999' then '000'
             else ba.BOND_CUSTODIAN
          end  ZQZTGJG,--债券总托管机构
          ba.product_type ZQPZ,--债券品种
          case when ba.product_rate = '000' then 'C00'
             else nvl((select paramvalue from rat where paramname = ba.product_rate),'C99')
          end ZQXYJB,--债券信用级别
          nvl(ba.REISSUES,0) XFCS,--续发次数
          ba.currency BZ,--币种
          ba.isused_value QMZQMZ,--期末债券面值
          ba.isused_value*PKG_RMM_FUNCTIONS.CurrencyRate(ba.currency,date'${endDate}') QMZQMZZRMB,--期末债券面值折人民币
          ba.BOND_BALANCE QMZQYE,--期末债券余额
          ba.BOND_BALANCE*PKG_RMM_FUNCTIONS.CurrencyRate(ba.currency,date'${endDate}') QMZQYEZRMB,--期末债券余额折人民币
          to_char(ba.isused_startdate,'YYYY-MM-DD') ZQZWDJR,--债券债务登记日 
          to_char(nvl((select min(INTER_START_DATE) from DH_ZQFX_DETIAL where TX_DATE between ba.ISUSED_STARTDATE and ba.value_paydate and tx_id = ba.tx_id) ,ba.isused_startdate),'YYYY-MM-DD') QXR,--起息日
          to_char(ba.ISUSED_ENDDATE,'YYYY-MM-DD') TFRQ,--兑付日期
          ba.product_redemtype  FXFS,--付息方式
          ba.isused_rate PMLL --票面利率
         from DH_ZQFX_BASEINFO ba
         where  ba.ht_s_dt <= date'${endDate}'
             and ba.ht_e_dt > date'${endDate}'
             and ba.BOND_BALANCE > 0
             and ba.product_redemtype not in ('99')
) u,head

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
