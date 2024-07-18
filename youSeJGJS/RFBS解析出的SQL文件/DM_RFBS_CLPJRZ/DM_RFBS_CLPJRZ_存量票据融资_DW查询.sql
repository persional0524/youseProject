-- 步骤类型: N/A, 步骤名称: 存量票据融资_DW查询
-- 标签: name, 属性: {}, 内容: 存量票据融资_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
WITH 
HEAD AS (
  SELECT ORG.ORG_CLTNO NBJGH,
    ORG.ORG_CREDIT_CODE  JRJGDM,
    ORG.ORG_AREA JRJGDQDM
  FROM DM_PUB_ORG ORG
  WHERE ORG.ORG_TYPE = 1
),

opcustCPR as (
select distinct a.CPRMC,a.CPRZJLX,a.CPRZJDM  from dm_rfbs_clpjrz@dcab_dm a right outer join (
select CPRMC ,max(CREATE_TIME) CREATE_TIME from dm_rfbs_clpjrz@dcab_dm a where a.CPRZJDM is not null group by CPRMC 
) b on a.CPRMC=b.CPRMC and a.CREATE_TIME=b.CREATE_TIME 
where a.CPRZJDM is not null
),
clt as (
  select clt.*,
    decode(area,1,nvl2(credit_code,'A01','A02'),nvl2(lei_code,'L01','Z99')) as op_cust_type,
    decode(area,1,nvl(credit_code,org_code),nvl(lei_code,cltno))        as op_cust_code,
    row_number() over(partition by cltno order by ht_e_dt desc) rk
  from dh_gl_cltinfo clt
  where ht_s_dt <= date '${endDate}'
    and ht_e_dt >  date '${endDate}'
)
SELECT '${reportId}' REPORT_ID,
  '${BATCH}' BATCH,   
  HEAD.JRJGDM,                     --金融机构代码
  HEAD.NBJGH,                      --内部机构号
  HEAD.JRJGDQDM,                   --金融机构地区代码
  '01' AS TXFS,                            --直贴
  decode(PJXX.ACCPTMODE,'0','01','1','02') AS PJZL,          --承兑方式 银商  0 银承 1  商承
  decode(PJXX.BILLKIND,'1','01','0','02')  AS PJJZ,          --票据介质 纸电  0 电票 1  纸票 
  TXPJ.Note_No   AS PJBH,          --票据编号
  KH.op_cust_type  AS TXSQRZJLX,  --贴现申请人证件类型
  KH.op_cust_code AS  TXSQRZJDM, --贴现申请人证件代码
  KH.ECONOMIC_SECTOR  AS  TXSQRGMJJBM,--贴现申请人国民经济部门
  CASE WHEN  KH.AREA='1' THEN   SUBSTR(KH.INDUSTRY,1,3)
       WHEN  KH.AREA='2' THEN   '200' 
       ELSE  NULL  END   AS   TXSQRHY,--贴现申请人行业
  CASE WHEN  KH.AREA='1' THEN  KH.ADMIN_DIVISION 
       WHEN  KH.AREA='2' THEN  PKG_RMM_FUNCTIONS.GETCOUNTRYSIXNUM(KH.COUNTRY_CODE) END AS  TXSQRDQDM,--贴现申请人地区代码
  PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',KH.QYKGLX)     AS  TXSQRJJCF,--贴现申请人经济成分 
  CASE WHEN KH.AREA ='1' THEN (CASE WHEN SUBSTR(KH.ECONOMIC_SECTOR,0,1) IN ('A','B','D','E') THEN 'CS05'
                                    ELSE DECODE(KH.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') END )
       WHEN KH.AREA ='2' THEN NULL
  ELSE NULL END  AS  TXSQRQYGM,          --贴现申请人企业规模
  PJXX.ACCEPTORNAME1 AS CDRMC,--承兑人名称
  nvl(CDR.op_cust_type,'A01') AS CDRZJLX,--承兑人证件类型
  PJXX.ACCEPTORCREDITCODE AS  CDRZJDM,--承兑人证件代码
  PJXX.DRAWERNAME AS CPRMC ,--出票人名称
  nvl(CPR.op_cust_type,CPR1.CPRZJLX) AS  CPRZJLX,--出票人证件类型
  nvl(CPR.op_cust_code,CPR1.CPRZJDM) AS CPRZJDM,-- 出票人证件代码
  TO_CHAR(PJXX.ISSUEDATE,'YYYY-MM-DD')  AS CPRQ,--出票日期
  TO_CHAR(PJXX.DUEDATE,'YYYY-MM-DD')    AS PJDQRQ,--票据到期日期
  TO_CHAR(HT.START_DATE,'YYYY-MM-DD')   AS JYRQ,--交易日期
  PJXX.CURE_CODE  AS  BZ,--币种
  PJXX.AMOUNT AS PMJE,--票面金额
  CASE WHEN PJXX.CURE_CODE='CNY' THEN  PJXX.AMOUNT
       WHEN PJXX.CURE_CODE!='CNY' THEN PJXX.AMOUNT*pkg_rmm_functions.currencyrate_new(PJXX.CURE_CODE,'CNY', date '${endDate}' ) 
       END  AS  PMJEZRMB,--票面金额折人民币
  HT.CURRENCY_NO AS TXBZ  ,--贴现币种
 -- NVL(PJXX.AMOUNT,0)*PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJXX.CURE_CODE,HT.CURRENCY_NO, DATE'${endDate}')
  --/(((PJXX.DUEDATE-date '${endDate}')/360)*(HT.LAST_RATE/100)+1)  AS TXJE,--贴现金额
  (select TXPJ.Par_Value-txpj.intrest+(select nvl(sum(jl.interest),0) from dh_fb_lxtxjl jl where jl.BUS_ID = txpj.NOTE_NO
    and jl.actual_date<=date'${endDate}' and jl.bustype =1) from dual)   AS TXJE,--贴现金额
  
   CASE WHEN HT.CURRENCY_NO='CNY' THEN  (select TXPJ.Par_Value-txpj.intrest+(select nvl(sum(jl.interest),0) from dh_fb_lxtxjl jl where jl.BUS_ID = txpj.NOTE_NO
    and jl.actual_date<=date'${endDate}' and jl.bustype =1) from dual)
        WHEN HT.CURRENCY_NO!='CNY' THEN pkg_rmm_functions.currencyrate_new(HT.CURRENCY_NO,'CNY', date '${endDate}' ) *(
                                        NVL(PJXX.AMOUNT,0)*PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJXX.CURE_CODE,HT.CURRENCY_NO, DATE'${endDate}')
                                        /(((PJXX.DUEDATE-date '${endDate}')/360)*(HT.LAST_RATE/100)+1))
             
        END  AS  TXJEZRMB,--贴现金额折人民币
  HT.LAST_RATE AS TXLL, --贴现利率
  DECODE(HT.FIVE_LEVEL,'1','FQ01','2','FQ02','3','FQ03','4','FQ04','5','FQ05','FQ01') AS  DKZL,---贷款质量 
  DECODE(HT.STATE,'1','LS01','8','LS02','2','LS03','5','LS04','LS01') AS  DKZT---贷款状态
FROM  DH_BMS_PJXX    PJXX  --票据信息
inner join DH_FB_TXPJ   TXPJ--贴现票据
ON PJXX.BILLNO=TXPJ.NOTE_NO
inner join DH_FB_YWHT   HT--合同信息（贴现）
ON TXPJ.CONTRACT_NO=HT.CONTRACT_NO
AND HT.BIZ_TYPE='105'  --贴现
AND HT.HT_S_DT <= DATE '${endDate}' 
AND HT.HT_E_DT >  DATE '${endDate}'
LEFT JOIN DH_BMS_DETAIL  PJJY --票据交易记录
ON PJJY.TX_TYPE='5'    --贴现
AND PJXX.BILLNO=PJJY.BILLNO
and PJJY.Contract_No=ht.contract_no
LEFT JOIN clt  KH  --贴现申请人
ON HT.CLTNO=KH.CLTNO
LEFT JOIN clt CDR --承兑人
ON PJXX.ACCEPTORNAME=CDR.CHINESE_NAME
LEFT JOIN clt CPR --出票人
ON PJXX.DRAWERNAME=CPR.CHINESE_NAME

LEFT JOIN opcustCPR CPR1 --出票人
ON PJXX.DRAWERNAME=CPR1.CPRMC

,head
WHERE --PJXX.Status='1'  --票据状态 正常
  PJXX.HT_S_DT <= DATE '${endDate}' 
AND  PJXX.HT_E_DT >  DATE '${endDate}'
and TXPJ.note_no not in (select note_no from DH_FB_TXPJ a where a.tx_type in (2,3) and ((a.tx_date <=date'${endDate}' and a.buyback_date is null ) ))
and PJXX.DUEDATE >DATE '${endDate}'
and ht.start_date <= DATE '${endDate}'

 
union all
select  
'${reportId}' REPORT_ID,
  '${BATCH}' BATCH,   
  HEAD.JRJGDM,                     --金融机构代码
  HEAD.NBJGH,                      --内部机构号
  HEAD.JRJGDQDM,                   --金融机构地区代码
  '02' AS TXFS,                            --转贴
  decode(PJXX.ACCPTMODE,'0','01','1','02') AS PJZL,          --承兑方式 银商  0 银承 1  商承
  decode(PJXX.BILLKIND,'1','01','0','02')  AS PJJZ,          --票据介质 纸电  0 电票 1  纸票 
  TXPJ.Note_No   AS PJBH,          --票据编号
  KH.op_cust_type  AS TXSQRZJLX,  --贴现申请人证件类型
  KH.op_cust_code AS  TXSQRZJDM, --贴现申请人证件代码
  KH.ECONOMIC_SECTOR  AS  TXSQRGMJJBM,--贴现申请人国民经济部门
  CASE WHEN  KH.AREA='1' THEN   SUBSTR(KH.INDUSTRY,1,3)
       WHEN  KH.AREA='2' THEN   '200' 
       ELSE  NULL  END   AS   TXSQRHY,--贴现申请人行业
  CASE WHEN  KH.AREA='1' THEN  KH.ADMIN_DIVISION 
       WHEN  KH.AREA='2' THEN  PKG_RMM_FUNCTIONS.GETCOUNTRYSIXNUM(KH.COUNTRY_CODE) END AS  TXSQRDQDM,--贴现申请人地区代码
  PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',KH.QYKGLX)     AS  TXSQRJJCF,--贴现申请人经济成分 
  CASE WHEN KH.AREA ='1' THEN (CASE WHEN SUBSTR(KH.ECONOMIC_SECTOR,0,1) IN ('A','B','D','E') THEN 'CS05'
                                    ELSE DECODE(KH.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') END )
       WHEN KH.AREA ='2' THEN NULL
  ELSE NULL END  AS  TXSQRQYGM,          --贴现申请人企业规模
  PJXX.ACCEPTORNAME AS CDRMC,--承兑人名称
  CDR.op_cust_type AS CDRZJLX,--承兑人证件类型
  CDR.op_cust_code AS  CDRZJDM,--承兑人证件代码
  PJXX.DRAWERNAME AS CPRMC ,--出票人名称
  CPR.op_cust_type AS  CPRZJLX,--出票人证件类型
  CPR.op_cust_code AS CPRZJDM,-- 出票人证件代码
  TO_CHAR(PJXX.ISSUEDATE,'YYYY-MM-DD')  AS CPRQ,--出票日期
  TO_CHAR(PJXX.DUEDATE,'YYYY-MM-DD')    AS DQRQ,--票据到期日期
  TO_CHAR(HT.START_DATE,'YYYY-MM-DD')   AS JYRQ,--交易日期
  PJXX.CURE_CODE  AS  BZ,--币种
  PJXX.AMOUNT AS PMJE,--票面金额
  CASE WHEN PJXX.CURE_CODE='CNY' THEN  PJXX.AMOUNT
       WHEN PJXX.CURE_CODE!='CNY' THEN PJXX.AMOUNT*pkg_rmm_functions.currencyrate_new(PJXX.CURE_CODE,'CNY', date '${endDate}' ) 
       END  AS  PMJEZRMB,--票面金额折人民币
  HT.CURRENCY_NO AS TXBZ  ,--贴现币种
  NVL(PJXX.AMOUNT,0)*PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJXX.CURE_CODE,HT.CURRENCY_NO, DATE'${endDate}')
  /(((PJXX.DUEDATE-date '${endDate}')/360)*(HT.LAST_RATE/100)+1)  AS TXJE,--贴现金额
   CASE WHEN HT.CURRENCY_NO='CNY' THEN  NVL(PJXX.AMOUNT,0)*PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJXX.CURE_CODE,HT.CURRENCY_NO, DATE'${endDate}')
                                        /(((PJXX.DUEDATE-date '${endDate}')/360)*(HT.LAST_RATE/100)+1)
        WHEN HT.CURRENCY_NO!='CNY' THEN pkg_rmm_functions.currencyrate_new(HT.CURRENCY_NO,'CNY', date '${endDate}' ) *(
                                        NVL(PJXX.AMOUNT,0)*PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJXX.CURE_CODE,HT.CURRENCY_NO, DATE'${endDate}')
                                        /(((PJXX.DUEDATE-date '${endDate}')/360)*(HT.LAST_RATE/100)+1))
             
        END  AS  TXJEZRMB,--贴现金额折人民币
  HT.LAST_RATE AS TXLL, --贴现利率
  DECODE(HT.FIVE_LEVEL,'1','FQ01','2','FQ02','3','FQ03','4','FQ04','5','FQ05','FQ01') AS  DKZL,---贷款质量 
  DECODE(HT.STATE,'1','LS01','2','LS03','LS01') AS  DKZT---贷款状态
FROM  DH_BMS_PJXX    PJXX  --票据信息
inner join DH_FB_TXPJ   TXPJ--贴现票据
ON PJXX.BILLNO=TXPJ.NOTE_NO
inner join DH_TRDISCOUNT_INFO   HT--合同信息（转贴现）
ON TXPJ.CONTRACT_NO=HT.CONTRACT_NO
AND HT.DIR_FLAG='1'  --买入
AND HT.DISCOUNT_TYPE='1'  --买断式
AND HT.HT_S_DT <= DATE '${endDate}' 
AND HT.HT_E_DT >  DATE '${endDate}'
LEFT JOIN DH_BMS_DETAIL  PJJY --票据交易记录
ON PJJY.TX_TYPE='9'    --转贴现
AND PJXX.BILLNO=PJJY.BILLNO
and PJJY.Contract_No=ht.contract_no
LEFT JOIN clt  KH  --贴现申请人
ON HT.OP_CUSTNO=KH.CLTNO
LEFT JOIN clt CDR --承兑人
ON PJXX.ACCEPTORNAME=CDR.CHINESE_NAME
LEFT JOIN clt CPR --出票人
ON PJXX.DRAWERNAME=CPR.CHINESE_NAME
,head
WHERE PJXX.Status='1'  --票据状态 正常
AND  PJXX.HT_S_DT <= DATE '${endDate}' 
AND  PJXX.HT_E_DT >  DATE '${endDate}'
and 1=0

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
