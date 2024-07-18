-- 步骤类型: N/A, 步骤名称: 从表DH_INVEST_DETAIL取数
-- 标签: name, 属性: {}, 内容: 从表DH_INVEST_DETAIL取数
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
investOther as (
SELECT A.TRADE_ID, A.OPERATION_MODE
  FROM DH_INVEST_PUBLICFUND A
 where A.HT_S_DT <= date '${endDate}'
   and A.HT_E_DT > date '${endDate}'
union all
SELECT B.TRADE_ID, B.OPERATION_MODE
  FROM DH_INVEST_PRIVATEFUND B
 where B.HT_S_DT <= date '${endDate}'
   and B.HT_E_DT > date '${endDate}'
union all
  SELECT C.TRADE_ID, C.OPERATION_MODE
    FROM DH_INVEST_MANAGE C
   where C.HT_S_DT <= date '${endDate}'
     and C.HT_E_DT > date '${endDate}'
)
select
SEQ_DM_RFBS_FTYDWC.NEXTVAL ID,
'${reportId}' REPORT_ID,
'${BATCH}' BATCH,
head.JRJGDM JRJGDM,--金融机构代码
head.NBJGH NBJGH,--金融机构代码
L.V_DEPT_ID,--部门编码
PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BOTTOM_DEBT_BIZTYPE','TDMDZTLX',D.PRODUCT_TYPE) TDMDZTLX,--特定目的载体类型
D.FINANCE_NO ZGCPTJBM,--资管产品统计编码
D.FINANCE_NO TDMDZTDM,--特定目的载体代码
D.CREDIT_CODE FXRDM,--发行人代码
--ISSUER_REGION  FXRDQDM,--发行人地区代码
clt.ADMIN_DIVISION  FXRDQDM,--发行人地区代码
'01' YXFS,--运行方式
--to_char(L.TX_DATE,'YYYY-MM-DD') RGRQ,--认购日期
to_char((select min(TX_DATE) from DH_INVEST_DETAIL a where a.PRODUCT_NO = L.PRODUCT_NO ) ,'YYYY-MM-DD') RGRQ,--认购日期
to_char(L.TX_DATE+1,'YYYY-MM-DD') DQRQ,--到期日期
to_char(L.TX_DATE,'YYYY-MM-DD') JYRQ,--交易日期
D.CUR_CODE BZ,--币种
L.TX_AMOUNT JYJE,--交易金额
L.TX_AMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(D.CUR_CODE,date'${endDate}') JYJEZRMB,--交易金额折人民币
decode(L.BUY_REMEED_FLAG,'1','1','2','0') JYFX,--交易方向
'system'	CREATER,
sysdate	CREATE_TIME
from DH_INVEST_DETAIL L
left join DH_INVEST_BASEINFO D on D.TRADE_ID = L.TRADE_ID 
 left join dh_gl_cltinfo clt on d.ISSUER_NAME =clt.chinese_name
          and clt.ht_s_dt <= date'${endDate}'
          and clt.ht_e_dt > date'${endDate}' ，head --,investOther
where L.TX_DATE between  date'${startDate}' and date'${endDate}'
  --and D.TRADE_ID = investOther.TRADE_ID
  and D.PRODUCT_TYPE in (301,302,303,304,305,306,401,402,403,404,501,502,503,504,505)
  and D.ht_e_dt >  date'${endDate}'
  and D.ht_s_dt <=  date'${endDate}'

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
