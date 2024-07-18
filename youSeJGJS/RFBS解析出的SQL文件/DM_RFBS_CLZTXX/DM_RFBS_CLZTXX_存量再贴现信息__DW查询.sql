-- 步骤类型: N/A, 步骤名称: 存量再贴现信息__DW查询
-- 标签: name, 属性: {}, 内容: 存量再贴现信息__DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
WITH 
  ORG AS ( 
  SELECT ORG_FNAME JRJGMC,             --金融机构名称
         ORG_FINANCIALLICENSE JRXKZH,  --金融许可证号
         ORG_CREDIT_CODE JGDM,         --机构代码
         ORG_CLTNO NBJGH,              --内部机构号
         ORG_INTER_CUSTOMER_CODE,      --内部客户代码
         ORG_AREA                      --区域编码
    FROM DM_PUB_ORG
   WHERE ORG_TYPE = 1 AND ROWNUM = 1
),
opcustCPR as (
select distinct a.CPRMC,a.CPRZJLX,a.CPRZJDM  from DM_RFBS_CLZTXX@dcab_dm a right outer join (
select CPRMC ,max(CREATE_TIME) CREATE_TIME from DM_RFBS_CLZTXX@dcab_dm a where a.CPRZJDM is not null group by CPRMC 
) b on a.CPRMC=b.CPRMC and a.CREATE_TIME=b.CREATE_TIME 
where a.CPRZJDM is not null
),
  CLT AS (
     SELECT CLT.*,
            DECODE(AREA,1,NVL2(CREDIT_CODE,'A01','A02'),NVL2(LEI_CODE,'L01','Z99')) AS OP_CUST_TYPE,
            DECODE(AREA,1,NVL(CREDIT_CODE,ORG_CODE),NVL(LEI_CODE,CLTNO))        AS OP_CUST_CODE,
            ROW_NUMBER() OVER(PARTITION BY CLTNO ORDER BY HT_E_DT DESC) RK
       FROM DH_GL_CLTINFO CLT
      WHERE HT_S_DT <= DATE '${endDate}'
        AND HT_E_DT >  DATE '${endDate}'
)
 SELECT '${reportId}' as REPORT_ID,
        '${BATCH}' AS BATCH,        
        ORG.JGDM AS JRJGDM,                     --金融机构代码
        ORG.NBJGH AS NBJGH,                     --内部机构号
        ORG.ORG_AREA AS JRJGDQDM,               --金融机构地区代码
        PJ.BILLNO AS PJBH,                     --票据编号
        CASE PJ.ACCPTMODE 
             WHEN 0 THEN '01'
             WHEN 1 THEN '02'
        END  AS PJZL,--票据种类
        DECODE(PJ.BILLKIND,0,'02','01') PJJZ,  --票据介质
        NVL(TO_CHAR(PJ.ISSUEDATE,'YYYY-MM-DD'),'9999-12-31') AS CPRQ,      --出票日期
        NVL(TO_CHAR(PJ.DUEDATE,'YYYY-MM-DD'),'9999-12-31')   AS PJDQRQ,    --票据到期日期
        --to_char(RE.START_DATE,'YYYY-MM-DD') AS TXRQ,               --再贴现日期
		to_char((select max(TX_DATE)  from DH_FB_TXPJ  where NOTE_NO =PJ.BILLNO and TX_TYPE=1 ),'YYYY-MM-DD') AS TXRQ,               --再贴现日期
        TO_CHAR(PJCD.BUYBACK_DATE,'YYYY-MM-DD') AS HGDQRQ,  --回购到期日期
        TO_CHAR(RE.START_DATE,'YYYY-MM-DD') AS JYRQ ,  --交易日期
        PJ.DRAWERNAME AS CPRMC,               --出票人名称
       --CPR.OP_CUST_TYPE AS CPRZJLX,          --出票人证件类型
       -- CPR.OP_CUST_CODE AS CPRZJDM,          --出票人证件代码
  nvl(CPR.op_cust_type,CPR1.CPRZJLX) AS  CPRZJLX,--出票人证件类型
  nvl(CPR.op_cust_code,CPR1.CPRZJDM) AS CPRZJDM,-- 出票人证件代码
  PJ.ACCEPTORNAME1 AS CDRMC,--承兑人名称
  nvl(CDR.op_cust_type,'A01') AS CDRZJLX,--承兑人证件类型
  PJ.ACCEPTORCREDITCODE AS  CDRZJDM,--承兑人证件代码
        PJ.CURE_CODE AS BZ,                    --币种
        NVL(PJ.AMOUNT,0) AS PMJE,                     --票面金额
        NVL(CASE WHEN PJ.CURE_CODE =  'CNY' THEN PJ.AMOUNT
             WHEN PJ.CURE_CODE <> 'CNY' 
             THEN PJ.AMOUNT * PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJ.CURE_CODE,'CNY', DATE '${endDate}') 
       END,0) AS PMJEZRMB,                      --票面金额折人民币
       RE.LAST_RATE AS ZTXLL,                        --再贴现利率
       RE.CURRENCY_NO AS ZTXBZ,                      --再贴现币种
       /* NVL(PJ.AMOUNT,0)*PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJ.CURE_CODE, RE.CURRENCY_NO, DATE '${endDate}') /(((PJ.DUEDATE-date '${endDate}')/360)*(RE.LAST_RATE/100)+1) AS ZTXJE, --再贴现金额
       NVL(CASE WHEN  RE.CURRENCY_NO =  'CNY' THEN NVL(PJ.AMOUNT,0)*PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJ.CURE_CODE, RE.CURRENCY_NO, DATE '${endDate}')/(((PJ.DUEDATE-date '${endDate}')/360)*(RE.LAST_RATE/100)+1)
             WHEN  RE.CURRENCY_NO <> 'CNY' 
             THEN (NVL(PJ.AMOUNT,0)*PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW(PJ.CURE_CODE, RE.CURRENCY_NO, DATE '${endDate}')/(((PJ.DUEDATE-date '${endDate}')/360)*(RE.LAST_RATE/100)+1)) * PKG_RMM_FUNCTIONS.CURRENCYRATE_NEW( RE.CURRENCY_NO,'CNY', DATE '${endDate}') 
       END,0) AS ZTXJEZRMB                    --再贴现金额折人民币 */
		--re.ACCT_AMOUNT AS ZTXJE, --再贴现金额
		--re.ACCT_AMOUNT   AS ZTXJEZRMB                    --再贴现金额折人民币
		(select re.ACCT_AMOUNT+(select nvl(sum(jl.interest),0) from dh_fb_lxtxjl jl where jl.BUS_ID = PJCD.NOTE_NO
    and jl.actual_date between RE.START_DATE  and date'${endDate}' and jl.bustype =3) from dual)   AS ZTXJE, --再贴现金额
     (select re.ACCT_AMOUNT+(select nvl(sum(jl.interest),0) from dh_fb_lxtxjl jl where jl.BUS_ID = PJCD.NOTE_NO
    and jl.actual_date between RE.START_DATE  and date'${endDate}' and jl.bustype =3) from dual)   AS ZTXJEZRMB                    --再贴现金额折人民币
FROM DH_BMS_PJXX PJ
INNER JOIN DH_FB_TXPJ PJCD ON PJCD.NOTE_NO = PJ.BILLNO
--inner join DH_FB_YWHT   HT--合同信息（贴现）
--ON PJCD.CONTRACT_NO=HT.CONTRACT_NO
--AND HT.BIZ_TYPE='105'  --贴现
--AND HT.HT_S_DT <= DATE '${endDate}' 
--AND HT.HT_E_DT >  DATE '${endDate}'
INNER JOIN DH_REDISCOUNT_INFO RE ON PJCD.BID=RE.BID  --AND RE.STATE= 1 
 AND RE.HT_S_DT <= DATE '${endDate}'
 AND RE.HT_E_DT >  DATE '${endDate}' 
--LEFT JOIN DH_BMS_DETAIL DE ON DE.BILLNO = PJ.BILLNO  AND DE.TX_TYPE IN ('6','10')
-- 出票人
LEFT JOIN CLT CPR
ON CPR.CHINESE_NAME = PJ.DRAWERNAME AND CPR.RK = 1 
LEFT JOIN opcustCPR CPR1 --出票人
ON PJ.DRAWERNAME=CPR1.CPRMC

-- 承兑人
LEFT JOIN CLT CDR
ON CDR.CHINESE_NAME = PJ.ACCEPTORNAME AND CDR.RK = 1
,ORG
WHERE   re.start_date <= DATE '${endDate}'  --PJ.STATUS = 1                  --票据状态 1-正常
  AND PJ.HT_S_DT <= DATE '${endDate}'
  AND PJ.HT_E_DT >  DATE '${endDate}'
  and re.MATURITY > date'${endDate}'

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
