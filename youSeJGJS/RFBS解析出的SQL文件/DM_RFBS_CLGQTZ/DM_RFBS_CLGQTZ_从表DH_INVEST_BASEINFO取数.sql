-- 步骤类型: N/A, 步骤名称: 从表DH_INVEST_BASEINFO取数
-- 标签: name, 属性: {}, 内容: 从表DH_INVEST_BASEINFO取数
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
  where org.org_type = 1)
select
SEQ_DM_RFBS_FTYDWC.NEXTVAL ID,
'${reportId}' REPORT_ID,
'${BATCH}' BATCH,
head.JRJGDM JRJGDM,--金融机构代码
head.NBJGH NBJGH,--金融机构代码
D.V_DEPT_ID,--部门编码
D.FINANCE_NO PZBM,--凭证编码
PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BOTTOM_DEBT_BIZTYPE','GQLX',D.PRODUCT_TYPE) GQLX,--股权类型
--nvl((select PARAMVALUE from DICT_PARAM_MAPPING where code_type = 'FINAN_INSTITUTE_TYPE' and STANDARD_CODE = D.ORG_TYPE),'B10') JGLX,--机构类型
nvl((select PARAMVALUE from DICT_PARAM_MAPPING where code_type = 'FINAN_INSTITUTE_TYPE' and STANDARD_CODE = D.ORG_TYPE),'C') JGLX,--机构类型(人行要求增加C-非金融机构类型)
D.CREDIT_CODE JGZJDM,--机构证件代码
case D.ISSUER_COUNTRY
  when 'CHN' then D.ISSUER_REGION
  else  PKG_RMM_FUNCTIONS.getCountrySixNum(D.ISSUER_COUNTRY)
end DQDM,--地区代码
D.CUR_CODE BZ,--币种
D.BOOK_VALUE TZYE,--投资余额
D.BOOK_VALUE*PKG_RMM_FUNCTIONS.CurrencyRate(D.CUR_CODE,date'${endDate}') TZYEZRMB,--投资余额折人民币
'system'	CREATER,
sysdate	CREATE_TIME
from DH_INVEST_BASEINFO D，head
where D.PRODUCT_TYPE in (201,202,203,204)
  and D.BOOK_VALUE > 0
  and D.ht_s_dt <=  date'${endDate}'
  and D.ht_e_dt >  date'${endDate}'

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
