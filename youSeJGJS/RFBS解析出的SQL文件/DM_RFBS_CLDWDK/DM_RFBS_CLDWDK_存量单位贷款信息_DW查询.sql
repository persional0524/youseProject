-- 步骤类型: N/A, 步骤名称: 存量单位贷款信息_DW查询
-- 标签: name, 属性: {}, 内容: 存量单位贷款信息_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
with org as (
select org.org_code ORG,
       org.org_city CITY
  from dm_pub_org org
 where org.org_type = 1
),
clt as (
select clt.cltno        ORG,
       clt.ADMIN_DIVISION     ADMIN_DIVISION,
       clt.CREDIT_CODE
  from dh_gl_cltinfo clt
 where clt.clt_info_type = 0
   and clt.ht_e_dt = date '3000-12-31'
   and clt.CLTSTATE = 0
   and rownum = 1
),
head as (select c.CREDIT_CODE JRJGDM,
       decode((select o.ORG from org o), null, c.ORG, (select o.ORG from org o)) NBJGH,
       case 
       when c.ADMIN_DIVISION is not null then c.ADMIN_DIVISION
       when  (select o.CITY from org o) is not null then  (select o.CITY from org o)
       end JRJGDQDM
  from  clt c )
select 
       SEQ_DM_RFBS_CLDWDK.NEXTVAL ID,
       '${reportId}' REPORT_ID, 
	  '${BATCH}' BATCH,
       head.JRJGDM,--金融机构代码
       head.NBJGH,--内部机构号
       head.JRJGDQDM,--金融机构地区代码
       'A01' JKRZJLX, --借款人证件类型
       clt.CREDIT_CODE JKRZJDM,--借款人证件代码
       clt.ECONOMIC_SECTOR JKRGMJJBM,--借款人国民经济部门
	   case clt.AREA
	   when 1 then substr(clt.INDUSTRY,0,3)
	   when 2 then '200'
	   else null end JKRXY,--借款人行业
	   case clt.AREA
	   when 1 then decode(clt.DISTRICT,null,clt.CITY,clt.DISTRICT)
	   when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(clt.COUNTRY_CODE)
	   else null end  JKRDQDM,--借款人地区代码
       case clt.QYKGLX 
       when '01' then 'A01'
       when '0101' then 'A0101'
       when '0102' then 'A0102'
       when '02' then 'A02'
       when '0201' then '0201'
       when '0202' then '0202'
       when '03' then 'B01'
       when '0301' then 'B0101'
       when '0302' then 'B0102'
       when '04' then 'B02'
       when '0401' then 'B0201'
       when '0402' then 'B0202'
       when '05' then 'B03'
       when '0501' then 'B0301'
       when '0502' then 'B0302'
       else null end JKRJJCF,--借款人经济成分
       DECODE(clt.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04','CS05') JKRQYGM,--借款人企业规模
       jj.LOAN_NO DKJJBM,--贷款借据编码
       ywht.CONTRACT_NO DKHTBM,--贷款合同编码
       case ywht.BIZ_TYPE
       when 100 then 'F99'
       when 101 then 'F022'
       when 102 then 'F022'
       when 109 then 'F022'
       when 128 then 'F041'
       when 160 then 'F023'
       when 170 then 'F012'
       when 130 then 'F99'
       else null end  DKCPLB,--贷款产品类别
	   case clt.AREA
	   when 1 then substr(ywht.INVEST_DIRECTION,0,4)
	   when 2 then '2000'
	   else null end  DKSJTX,--贷款实际投向
       to_char(jj.START_DATE,'YYYY-MM-DD') DKFFRQ,--贷款发放日期
       to_char(jj.MATURITY,'YYYY-MM-DD') DKDQRQ,--贷款到期日期
       ywht.EXPIRY_DATE DKZQDQRQ,--贷款展期到期日期
       ywht.CURRENCY_NO BZ,--币种
         case when jj.balance>0 then  jj.balance
       else ywht.balance end DKYE,--贷款余额 (取借据表放款金额)      
       case when jj.balance>0 then 
       jj.balance*PKG_RMM_FUNCTIONS.CurrencyRate(ywht.CURRENCY_NO,date'${endDate}') 
       else ywht.balance*PKG_RMM_FUNCTIONS.CurrencyRate(ywht.CURRENCY_NO,date'${endDate}')
       end DKYEZRMB,--贷款余额折人民币
       decode(ywht.IS_FLOATING_RATE,0, 'RF01', 1, 'RF02',null) LLSFGD,--利率是否固定
      -- ywht.LAST_RATE LLSP,--利率水平
		 jj.bjll  LLSP,--利率水平
        (select m2.paramvalue
          from DICT_PARAM_MAPPING M2
         where M2.APPNO = 'RIMAS'
           AND M2.CODE_TYPE = 'DK_BASE_INTR_TYPE'
           AND M2.PARAMNO = 'rimasBaseLoanRate'
           and m2.standard_code = ywht.RATE_TYPE) DKDJJZLX,--贷款定价基准类型
      --  ywht.RATE_TYPE DKDJJZLX,--贷款定价基准类型
     /* case ywht.IS_FLOATING_RATE
     when 1 then (
    case ywht.FINANCETERM   
     when 0 then (select t.rate_value from DH_GL_BASERATE t where t.active_date = (select max(a.active_date) from DH_GL_BASERATE a where a.buss_type = 'L_CL_6M') and  t.buss_type = 'L_CL_6M' and t.ht_e_dt = date '3000-12-31')
     when 1 then (select t.rate_value from DH_GL_BASERATE t where t.active_date = (select max(a.active_date) from DH_GL_BASERATE a where a.buss_type = 'L_CL_9M1Y') and  t.buss_type = 'L_CL_9M1Y' and t.ht_e_dt = date '3000-12-31')
    when 2 then (select t.rate_value from DH_GL_BASERATE t where t.active_date = (select max(a.active_date) from DH_GL_BASERATE a where a.buss_type = 'L_TL_1Y3Y') and  t.buss_type = 'L_TL_1Y3Y' and t.ht_e_dt = date '3000-12-31')
     when 3 then (select t.rate_value from DH_GL_BASERATE t where t.active_date = (select max(a.active_date) from DH_GL_BASERATE a where a.buss_type = 'L_TL_3Y5Y') and  t.buss_type = 'L_TL_3Y5Y' and t.ht_e_dt = date '3000-12-31')
     when 4 then (select t.rate_value from DH_GL_BASERATE t where t.active_date = (select max(a.active_date) from DH_GL_BASERATE a where a.buss_type = 'L_TL_5Y') and  t.buss_type = 'L_TL_5Y' and t.ht_e_dt = date '3000-12-31')
     when 5 then (select t.rate_value from DH_GL_BASERATE t where t.active_date = (select max(a.active_date) from DH_GL_BASERATE a where a.buss_type = 'L_TL_5Y') and  t.buss_type = 'L_TL_5Y' and t.ht_e_dt = date '3000-12-31')
     else null end )                             
     else null end  JZLL,--基准利率 */
  case ywht.IS_FLOATING_RATE
	   when 1 then PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(ywht.RATE_TYPE,ywht.CURRENCY_NO,date'${endDate}')
	   else null end  JZLL,--基准利率
      ywht.FINANCIAL_SUPPORT DKCZFCFS,--贷款财政扶持方式
     case ywht.IS_FLOATING_RATE
              when 0 then to_char(jj.MATURITY,'YYYY-MM-DD') 
              when 1 then ( case 
                           -- when  ywht.STATE=9 then to_char(fhkjl.TXDATE,'YYYY-MM-DD')
                            when jj.MATURITY <= ywht.CDJ_DATE  then to_char(jj.MATURITY,'YYYY-MM-DD') 
                            else to_char(ywht.CDJ_DATE,'YYYY-MM-DD') end
                           )
        else to_char(jj.MATURITY,'YYYY-MM-DD') end DKLLZXDJR,--贷款利率重新定价日
       case when sus.SURE_MODE like 'A%' then 'A'
       when sus.SURE_MODE like 'B%' then 'B01'
	   when sus.SURE_MODE like 'C%' then 'C99'
	   else sus.SURE_MODE end DKDBFS,--贷款担保方式
        ywht.TAG_FIRST_LOAN SFSCDK,--是否首次贷款
       case ywht.FIVE_LEVEL
       when 1 then 'FQ01'
       when 2 then 'FQ02'
       when 3 then 'FQ03'
       when 4 then 'FQ04'
       when 5 then 'FQ05'
       else null end DKZL,--贷款质量
       case
       when ywht.STATE in (2, 3, 4) then 'LS03'
       when ywht.EXT_FLAG = 1 then 'LS02'
       else 'LS01' end DKZT,--贷款状态
         case ywht.STATE
       when 2 then OVERDUE_TYPE
       else null end YQLX,--逾期类型
       ywht.DKYT DKYT,--贷款用途
       'system' CREATER--创建人
 	  -- clt.CLTNO JKRBH,--借款人编号
     --  clt.CHINESE_NAME JKRMC --借款人名称
  from DH_FB_YWHT ywht--合同主表
  left join DH_FB_XDJJ jj 
  on jj.bid = ywht.bid
  and jj.ht_s_dt <= date'${endDate}'
  and jj.ht_e_dt > date'${endDate}'
  left join DH_GL_CLTINFO clt --关联借款人
  on ywht.CLTNO = clt.cltno
  and clt.ht_e_dt = date'3000-12-31'
  left join DH_CT_SURETIES sus --关联担保方式
    on ywht.bid = sus.bid
  and sus.ht_s_dt <= date'${endDate}'
  and sus.ht_e_dt > date'${endDate}'
  ,head
 where ywht.STATE not in (0, -1)--不要加上已结清的
   and jj.balance <> 0
   and clt.clt_info_type in (1, 3, 4)--集团公司要加上
   and ywht.biz_type in (100, 101, 102, 109, 110, 111, 128, 130)--不要贴现
   and ywht.ht_s_dt <= date'${endDate}'
   and ywht.ht_e_dt > date'${endDate}'

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
