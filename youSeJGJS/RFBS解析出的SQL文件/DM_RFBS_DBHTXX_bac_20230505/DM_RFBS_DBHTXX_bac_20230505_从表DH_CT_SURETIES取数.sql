-- 步骤类型: N/A, 步骤名称: 从表DH_CT_SURETIES取数
-- 标签: name, 属性: {}, 内容: 从表DH_CT_SURETIES取数
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
with head as (
 select org.ORG_CLTNO NBJGH,
    org.ORG_CREDIT_CODE JRJGDM,
        org.org_area JRJGDQDM
   from dm_pub_org org
  where org.org_type = 1),
COLLATERAL as (
select ACCT_EVALUATION, GUARATEECONTRACTNO 
       from DH_COLLATERAL_INFO 
      where  HT_S_DT <= date'${endDate}'
        and  HT_E_DT > date'${endDate}'
    and  ACCT_EVALUATION is not null 
        and  ACCT_EVALUATION != 0
)
select   
'${reportId}' REPORT_ID,
'${BATCH}' BATCH,
head.JRJGDM JRJGDM,--金融机构代码
head.NBJGH NBJGH,--内部机构号
S.V_DEPT_ID,--部门编号
S.GUARATEECONTRACTNO DBHTBM,--担保合同编码
Y.CONTRACT_NO BDBHTBM,--被担保合同编码
DECODE(S.DBHTLX,'1','01','2','02') DBHTLX,--担保合同类型
'02' JYLX,--交易类型
to_char(s.START_DATE,'YYYY-MM-DD') DBHTQSRQ,--担保合同起始日期
to_char(s.end_date,'YYYY-MM-DD') DBHTDQRQ,--担保合同到期日期
S.BZ BZ,--币种
--S.SURE_AMOUNT DBHTJE,--担保合同金额
--S.SURE_AMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(S.BZ,date'${endDate}') DBHTJEZRMB,--担保合同金额折人民币
I.ACCT_EVALUATION DBHTJE,--担保合同金额
I.ACCT_EVALUATION*PKG_RMM_FUNCTIONS.CurrencyRate(S.BZ,date'${endDate}') DBHTJEZRMB,--担保合同金额折人民币
case when (select count(1) from COLLATERAL cl where cl.GUARATEECONTRACTNO = S.GUARATEECONTRACTNO) > 0
   then  
    --ROUND((S.GUARATE_AMOUNT - I.ACCT_EVALUATION)/(select sum(cl.ACCT_EVALUATION) from COLLATERAL cl where cl.GUARATEECONTRACTNO = S.GUARATEECONTRACTNO),2) * 100
        round((select sum(s.sure_amount)  from  DH_CT_SURETIES s where S.HT_S_DT <= date'${endDate}' and S.HT_E_DT > date'${endDate}'and S.GUARATEECONTRACTNO = I.GUARATEECONTRACTNO)/I.ACCT_EVALUATION,4)* 100
    else null end DZYL,--抵质押率
'A01' DBRZJLX,--担保人证件类型
C.CREDIT_CODE DBRZJDM,--担保人证件代码
C.ECONOMIC_SECTOR DBRGMJJBM,--担保人国民经济部门
case C.AREA
when 1 then substr(C.INDUSTRY,0,3)
when 2 then '200'
else null end DBRXY,--担保人行业
case C.AREA
when 1 then C.ADMIN_DIVISION
when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
else null end DBRDQDM,--担保人地区代码
case C.AREA 
      when 1 then 
        (case when substr(C.ECONOMIC_SECTOR,0,1) in ('A','B','D','E') then 'CS05'
            else DECODE(C.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') end)
      when 2 then null
    else null end DBRQYGM,--担保人企业规模
'system' CREATER,
sysdate CREATE_TIME
FROM  DH_CT_SURETIES S

LEFT JOIN DH_GL_CLTINFO C ON C.CLTNO=S.WARRANTOR_ID 
and C.HT_S_DT <= date'${endDate}'
and C.HT_E_DT > date'${endDate}'
LEFT JOIN DH_FB_YWHT Y ON S.BID = Y.BID
and Y.HT_S_DT <= date'${endDate}'
and Y.HT_E_DT > date'${endDate}'
left join DH_COLLATERAL_INFO I on S.GUARATEECONTRACTNO = I.GUARATEECONTRACTNO
and I.HT_S_DT <= date'${endDate}'
and I.HT_E_DT > date'${endDate}'
,head 
where Y.STATE not in (0, -1, 9)
and Y.BALANCE <> 0 --未结清的合同
and Y.BIZ_TYPE not in (104,105,116) --委托贷款去除/贴现
and S.SURE_MODE !='D' --去除担保方式为信用的
and S.HT_S_DT <= date'${endDate}'
and S.HT_E_DT > date'${endDate}'
order by s.bid

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
