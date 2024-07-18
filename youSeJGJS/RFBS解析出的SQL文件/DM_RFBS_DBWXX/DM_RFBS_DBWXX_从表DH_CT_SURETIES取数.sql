-- 步骤类型: N/A, 步骤名称: 从表DH_CT_SURETIES取数
-- 标签: name, 属性: {}, 内容: 从表DH_CT_SURETIES取数
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
       clt.PROVINCE     PROVINCE,
       clt.city         CITY,
       clt.DISTRICT     DISTRICT,
       clt.CREDIT_CODE
  from dh_gl_cltinfo clt
 where clt.clt_info_type = 0
   and clt.ht_e_dt = date '3000-12-31'
   and clt.CLTSTATE = 0
   and rownum = 1
),
head as (
select c.CREDIT_CODE JRJGDM,
       decode(c.ORG, null, o.ORG, c.ORG) NBJGH,
       case 
       when c.DISTRICT is not null then c.DISTRICT
       when o.CITY is not null then o.CITY
       else c.CITY end JRJGDQDM
  from org o, clt c
)
select   
'${reportId}' REPORT_ID,
'${BATCH}' BATCH,
head.JRJGDM JRJGDM,--金融机构代码
head.NBJGH NBJGH,--内部机构号
I.GUARATEECONTRACTNO DBHTBM,--担保合同编码
Y.CONTRACT_NO BDBHTBM,--被担保合同编码
I.GUARANTEE_CODE DBWBM,--担保物编码
s.GUARATEEOBJTYPES DBWLB,--担保物类别
I.WARRANT_NO QZBH,--权证编号
I.IS_FIRST_RANK SFDYSW,--是否第一顺位
I.EVALUAT_METHOD PGFS,--评估方式
I.ASSESSMENT_METHOD PGFF,--评估方法
I.EVALUATION PGJZ,--评估价值
to_char(I.EVALUATION_BASEDATE,'YYYY-MM-DD') PGJZR,--评估基准日
'' DBWPMJZ,--担保物票面价值,有色客户暂时取空
I.PRIORITY YXSCQSE,--优先受偿权数额
I.VALUATION_CYCLE GZZQ,--估值周期
--clt.chinese_name JKRMC,--借款人
'system' CREATER,
sysdate CREATE_TIME
FROM  DH_COLLATERAL_INFO I
left join DH_CT_SURETIES S on S.GUARATEECONTRACTNO = I.GUARATEECONTRACTNO
left join DH_FB_YWHT Y on Y.BID = S.BID
left join DH_GL_CLTINFO clt on  clt.cltno = Y.cltno 
,head
where Y.STATE not in (0, -1, 9)
and Y.BIZ_TYPE not in (104,105,116) --委托贷款去除/贴现
and Y.BALANCE <> 0 --未结清的合同
and S.SURE_MODE !='D' --去除担保方式为信用的
and S.HT_S_DT <= date'${endDate}'
and S.HT_E_DT > date'${endDate}'
and Y.HT_S_DT <= date'${endDate}'
and Y.HT_E_DT > date'${endDate}'
and I.HT_S_DT <= date'${endDate}'
and I.HT_E_DT > date'${endDate}'
and clt.ht_s_dt <=  date'${endDate}'
and clt.ht_e_dt >  date'${endDate}'
order by s.bid

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
