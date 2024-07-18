-- 步骤类型: N/A, 步骤名称: 存量同业存款信息_DW查询
-- 标签: name, 属性: {}, 内容: 存量同业存款信息_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
with head as (
 select org.ORG_CLTNO NBJGH,
    org.ORG_CREDIT_CODE  JRJGDM,
        org.org_area JRJGDQDM
   from dm_pub_org org
  where org.org_type = 1)
select 
SEQ_DM_RFBS_CLTYCK.NEXTVAL ID,
'${reportId}' REPORT_ID,
'${BATCH}' BATCH,
head.JRJGDM,--金融机构代码
head.NBJGH,--内部机构号
tab.*,
'system' CREATER--创建人
from (
select cfty.v_dept_id,--部门编号
  case  when cfty.BIZ_TYPE in('C0101','C0103') then 'T021' 
        when cfty.BIZ_TYPE ='C0102' then 'T022'
        else null
  end  YWLX,--业务类型   
  'A01' JYDSZJLX,--交易对手证件类型
  clt.CREDIT_CODE JYDSDM,--交易对手代码
  cfty.BANK_ACCOUNT_NO CKZHBM,--存款账户编码
  cfty.BANK_ACCOUNT_NO CKXYDM,--存款协议代码
  to_char(cfty.START_DATE,'YYYY-MM-DD') XYQSRQ,--协议起始日期
   case  when  cfty.BIZ_TYPE ='C0101'  then '9999-12-31'
      else to_char(cfty.END_DATE,'YYYY-MM-DD') 
  end XYDQRQ,--协议到期日期
  cfty.CUR_CODE BZ,--币种
  cfty.YE CKYE,--存款余额
  cfty.YE*PKG_RMM_FUNCTIONS.CurrencyRate(cfty.CUR_CODE,date'${endDate}') CKYEZRMB,--存款余额折人民币
  cfty.INTR_RATE LLSP,--利率水平
  'DR01' JCZBJFS--缴存准备金方式 不缴存
from DH_IB_CFTY cfty
left join dh_gl_cltinfo clt 
on cfty.OP_CUST_NO=clt.cltno
and clt.ht_s_dt <= date'${endDate}'
and clt.ht_e_dt > date'${endDate}'
where 1=1 and (  cfty.YE>0)  --去掉  or cfty.STATE =1 
and cfty.BIZ_TYPE in ('C0101','C0102','C0103')
and cfty.ht_s_dt <= date'${endDate}'
and cfty.ht_e_dt > date'${endDate}'
and cfty.deposit_code not like '1002%'

union all  --取金晟保险的数据
select ck.v_dept_id,--部门编号 
 case when ck.biz_type_id like 'A01%' THEN 'T011' 
   ELSE 'T012' END YWLX,--业务类型   
  'A01' JYDSZJLX,--交易对手证件类型
  clt.CREDIT_CODE JYDSDM,--交易对手代码
  ck.account_no CKZHBM,--存款账户编码
  ck.certnumber CKXYDM,--存款协议代码
  to_char(ck.book_date,'YYYY-MM-DD') XYQSRQ,--协议起始日期
  NVL(to_char(ck.end_date,'YYYY-MM-DD'),'9999-12-31' ) XYDQRQ,--协议到期日期
  ck.CUR_CODE BZ,--币种
  CASE WHEN   ck.biz_type_id like 'A01%'  THEN (SELECT SUM(A.BALANCE) FROM dh_sm_ckcd A WHERE A.account_no=CK.ACCOUNT_NO and A.ht_s_dt <= date'${endDate}'
and A.ht_e_dt > date'${endDate}')
    ELSE ck.balance END CKYE,--存款余额
  --ck.balance*PKG_RMM_FUNCTIONS.CurrencyRate(ck.CUR_CODE,date'${endDate}') CKYEZRMB,--存款余额折人民币
    CASE WHEN   ck.biz_type_id like 'A01%'  THEN (SELECT SUM(A.BALANCE) FROM dh_sm_ckcd A WHERE A.account_no=CK.ACCOUNT_NO and A.ht_s_dt <= date'${endDate}'
and A.ht_e_dt > date'${endDate}')
    ELSE ck.balance END CKYEZRMB,--存款余额折人民币
   CASE WHEN   ck.biz_type_id like 'A01%'  THEN  nvl((SELECT distinct rate_value FROM dh_sm_ckcd A WHERE A.account_no=ck.account_no and A.ht_s_dt <= date'${endDate}'
and A.ht_e_dt > date'${endDate}' AND A.BIZ_TYPE_ID='A01012'),ck.rate_value）
    ELSE nvl(ck.rate_value,0) END LLSP,--利率水平
  'DR01' JCZBJFS--缴存准备金方式 不缴存
 from dh_sm_ckcd  ck 
 left join dh_gl_cltinfo clt 
on ck.cust_id=clt.cltno
and clt.ht_s_dt <= date'${endDate}'
and clt.ht_e_dt > date'${endDate}'
left join dh_fz_zhxx z on ck.account_no = z.ckzh
where 1=1 and ck.balance>0
and ck.ht_s_dt <= date'${endDate}'
and ck.ht_e_dt > date'${endDate}'
and z.ht_s_dt <= date '${endDate}' 
and z.ht_e_dt > date '${endDate}'
and z.mxkmbh like '2012%' --根据科目判断2012属于同业
and ck.biz_type_id NOT in('A01011','A01012')--同业无需拆分


union all
select tycf.v_dept_id,--部门编号
   case when tycf.BIZ_TYPE in('C0301','C0303') then 'T011' --同业存放-活期存放
        when tycf.BIZ_TYPE ='C0302' then 'T012' --同业存放-定期存放
        else null
  end  YWLX,--业务类型
  'A01',--交易对手证件类型
  clt.CREDIT_CODE JYDSDM,--交易对手代码
  tycf.BANK_ACCOUNT_NO CKZHBM,--存款账户编码
  tycf.DEPOSIT_CODE CKXYDM,--存款协议代码
  to_char(tycf.START_DATE,'YYYY-MM-DD') XYQSRQ,--协议起始日期
  case  when tycf.BIZ_TYPE='C0301' then '9999-12-31'
      else to_char(tycf.END_DATE,'YYYY-MM-DD') 
  end XYDQRQ,--协议到期日期
  tycf.CUR_CODE BZ,--币种
  tycf.YE CKYE,--存款余额
  tycf.YE*PKG_RMM_FUNCTIONS.CurrencyRate(tycf.CUR_CODE,date'${endDate}') CKYEZRMB,--存款余额折人民币
  tycf.INTR_RATE,--利率水平
  (select  'DR0'||DEPOSIT_RESERVE_WAY from DM_PUB_ORG where org_type = 1 and rownum = 1) JCZBJFS--缴存准备金方式
from DH_IB_TYCF tycf
left join dh_gl_cltinfo clt 
on tycf.OP_CUST_NO=clt.cltno
and clt.ht_s_dt <= date'${endDate}'
and clt.ht_e_dt > date'${endDate}'
where 1=1 and (tycf.STATE =1 or tycf.YE>0)
and tycf.BIZ_TYPE in ('C0301','C0302','C0303')
union all
  select Y.v_dept_id,--部门编号
  'T04' YWLX,--业务类型
  'A01' JYDSZJLX,--交易对手证件类型
  Y.CREDIT_CODE JYDSDM,--交易对手代码
  nvl(Y.ACCTNO,Y.PRODUCT_NO) CKZHBM,--存款账户编码
  Y.PRODUCT_NO CKXYDM,--存款协议代码
   nvl(to_char(Y.ISSUER_DATE,'YYYY-MM-DD'),to_char(t.tx_date,'YYYY-MM-DD')) XYQSRQ,--协议起始日期
  nvl(to_char(Y.END_DATE,'YYYY-MM-DD'),'9999-12-31') XYDQRQ,--协议到期日期
  Y.CUR_CODE BZ,--币种
  Y.BOOK_VALUE CKYE,--存款余额
  Y.BOOK_VALUE*PKG_RMM_FUNCTIONS.CurrencyRate(Y.CUR_CODE,date'${endDate}')  CKYEZRMB,--存款余额折人民币
  Y.RATE LLSP,--利率水平
  'DR01' JCZBJFS--缴存准备金方式
  FROM DH_HOLDPEERS_DEPOSIT Y 
  LEFT JOIN DH_HOLDPEERS_DEPTX T on T.TRADE_ID = Y.TRADE_ID
  where Y.HT_S_DT <= date'${endDate}'
  and Y.HT_E_DT > date'${endDate}'
  and Y.BOOK_VALUE > 0
AND 1=2

union all
  select Y.v_dept_id,--部门编号
  'T03' YWLX,--业务类型
  'A01' JYDSZJLX,--交易对手证件类型
  de.OP_CREDIT_CODE JYDSDM,--交易对手代码
  de.ACCTNO CKZHBM,--存款账户编码
  Y.PRODUCT_NO CKXYDM,--存款协议代码
  to_char(Y.ISSUER_DATE,'YYYY-MM-DD') XYQSRQ,--协议起始日期
  nvl(to_char(Y.END_DATE,'YYYY-MM-DD'),'9999-12-31') XYDQRQ,--协议到期日期
  Y.CUR_CODE BZ,--币种
  Y.BOOK_VALUE CKYE,--存款余额
  Y.BOOK_VALUE*PKG_RMM_FUNCTIONS.CurrencyRate(Y.CUR_CODE,date'${endDate}')  CKYEZRMB,--存款余额折人民币
  Y.RATE LLSP,--利率水平
  'DR01' JCZBJFS--缴存准备金方式
  FROM DH_ISSUEPEERS_DEPOSIT Y 
  left join DH_ISSUEPEERS_DEPTX de on de.TRADE_ID = Y.TRADE_ID
  where Y.HT_S_DT <= date'${endDate}'
  and Y.HT_E_DT > date'${endDate}'
  and Y.BOOK_VALUE > 0
) tab,head

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
