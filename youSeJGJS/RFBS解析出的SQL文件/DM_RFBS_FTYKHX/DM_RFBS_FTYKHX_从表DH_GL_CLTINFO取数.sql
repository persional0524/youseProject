-- 步骤类型: N/A, 步骤名称: 从表DH_GL_CLTINFO取数
-- 标签: name, 属性: {}, 内容: 从表DH_GL_CLTINFO取数
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
sxed as (
  select  cedit_amount,cltno 
    from(
      select S.CEDIT_AMOUNT as cedit_amount,S.CLTNO as cltno  from DH_FB_SX S where  S.STATE = 1 
          and S.HT_S_DT <= date'${endDate}'
          and S.HT_E_DT > date'${endDate}'
      UNION ALL
      select b.balance as cedit_amount,b.CLTNO as cltno from dh_fb_ywht b
          where b.biz_type=130
           and ht_s_dt<=date'${endDate}'
           and ht_e_dt>date'${endDate}'
      UNION ALL
      select c.par_value as cedit_amount,c.OPNAME as cltno from dh_fb_txpj c
          where c.tx_date <= date'${endDate}'
          and c.cash_date > date'${endDate}'
          and c.end_date between date'${startDate}' and date'${endDate}'
          and c.tx_type = 1
     )
)
select
SEQ_DM_RFBS_FTYKHX.NEXTVAL ID,
'${reportId}' REPORT_ID,
'${BATCH}' BATCH,
head.JRJGDM JRJGDM,--金融机构代码
C.V_DEPT_ID,--部门编号
C.CHINESE_NAME  KHMC,--客户名称
'A01' KHZJLX,--客户证件类型
C.CREDIT_CODE KHZJDM,--客户证件代码
C.ACNT_NO JBCKZH,--基本存款账号
C.OP_BANK JBZHKHXMC,--基本账户开户行名称
C.BUSS_SCOPE  JYFW,--经营范围
C.REGCAPITAL  ZCZB,--注册资本
C.PAIDIN_CAPITAL  SSZB,--实收资本
case when C.TOTAL_ASSETS=0 then  null  else C.TOTAL_ASSETS end   ZZC,--总资产
nvl(C.OPERAT_INCOME,0) YYSR,--营业收入
C.EMPLOYEES_NUM CYRYS,--从业人员数
DECODE(C.LISTED_FLAG,1,1,0) SFSSGS,--是否上市公司
nvl(to_char((select min(t.start_date) from DH_FB_YWHT t where t.cltno = C.CLTNO and t.biz_type not in('105','130','150','128')),'YYYY-MM-DD') , 
to_char((select min(t.start_date) from DH_FB_SX t where t.cltno = C.CLTNO ),'YYYY-MM-DD') ) SCJLXDGXRQ,--首次建立信贷关系日期
C.BUSS_ADDR ZCDZ,--注册地址
case C.AREA
when 1 then  decode(c.ADMIN_DIVISION,'542225','540524',c.ADMIN_DIVISION) --琼结县转码值
when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
else null end DQDM,--地区代码
case C.CLTSTATE when 0 then '01'
     when 2 then '02'
     when 3 then '04'
     when 4 then '03'
     when 5 then '05'
     when 6 then '07'
     when 1 then '06'
     else '99'
end JYZT,--经营状态
to_char(C.DAYOFESTB,'YYYY-MM-DD') CLRQ,--成立日期
case C.AREA when 1 then substr(C.INDUSTRY,0,3)
            when 2 then '200'
     else null
end SSXY,--所属行业
case C.AREA 
      when 1 then 
        (case when substr(C.ECONOMIC_SECTOR,0,1) in ('A','B','D','E') then 'CS05'
            else DECODE(C.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') end)
      when 2 then null
    else null end QYGM,--企业规模
PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',C.QYKGLX)  KHJJCF,--客户经济成分
C.ECONOMIC_SECTOR KHGMJJBM,--客户国民经济部门
nvl((select sum(CEDIT_AMOUNT) from sxed S where S.CLTNO = C.CLTNO),0)  SXED,--授信额度
nvl((select sum(S.USEDAMOUNT) from DH_FB_SX S where S.CLTNO = C.CLTNO and S.STATE = 1 
and S.HT_S_DT <= date'${endDate}'
and S.HT_E_DT > date'${endDate}'),0)  YYED,--已用额度
/*decode((select count(1) from DH_CUST_RELATED r 
where r.CLTNO = head.NBJGH 
and r.RELATED_CODE = c.CLTNO
and r.RELATED_STATUS_CODE=1 
and r.ht_s_dt <= date'2021-09-30' 
and r.ht_e_dt > date'2021-09-30'),0,'0',1)  SFGLF,--是否关联方*/
nvl(c.RELATED_PARTY,1) SFGLF,--是否关联方
/*(SELECT listagg(PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','CERTIF_TYPE','ID_Type',col.CERTTP),',') within group (order by col.CERTTP) from DH_GL_CONTROLLER col 
        where col.cltno = C.cltno and col.HT_S_DT <= date'2021-09-30' and  col.HT_E_DT > date'2021-09-30' ) SJKZRZJLX,--实际控制人证件类型*/
case when c.CONTROLLER_ID is not null then 'A01' else '' end SJKZRZJLX,--实际控制人证件类型
/*(SELECT listagg(CERTNO,',') within group (order by CERTNO) from DH_GL_CONTROLLER col 
        where col.cltno = C.cltno and col.HT_S_DT <= date'2021-09-30' and  col.HT_E_DT > date'2021-09-30' ) SJKZRZJDM,--实际控制人证件代码*/
c.CONTROLLER_ID SJKZRZJDM,--实际控制人证件代码
(select count(1) from DM_RFBS_RATING_MAPPING) KHXYJBZDJS,--客户信用级别总等级数
(select M.TARGET_CODE 
  from DM_RFBS_RATING_MAPPING M 
  where  M.ORIGIN_CODE = (select CREDIT_LEVEL from (select  * from DH_CLT_CLIENTCREDITGRADE rad left join sxed on rad.CLT_CODE=sxed.cltno  where rad.start_date <= date'${endDate}' and (rad.end_date >= date'${endDate}' or sxed.CEDIT_AMOUNT >0) and rad.ht_s_dt <= date'${endDate}' and rad.ht_e_dt > date'${endDate}' order by rid desc)r where r.CLT_CODE = C.cltno  
   and rownum=1)) KHXYPJ,--客户信用评级
'system'  CREATER,
sysdate CREATE_TIME
FROM DH_GL_CLTINFO C
,head
WHERE 
exists ( (select S.CLTNO from DH_FB_SX S where S.CLTNO = C.CLTNO  and s.end_date >=date'2020-05-01'
  and S.HT_S_DT <= date'${endDate}' group by S.CLTNO)--发生过授信
  union  ( select distinct ywht.cltno
   from   DH_FB_YWHT ywht where  (( ywht.balance <> 0 and ywht.biz_type  in (104) 
      and ywht.ht_s_dt <= date'2021-09-30' 
   and ywht.ht_e_dt > date'2021-09-30' ) or ywht.cltno in ('01050000','01190000')  ) and ywht.cltno= C.CLTNO   ) )
  and C.CLT_INFO_TYPE not in (0,8) --非同业客户（除去自己 及金融机构即为非同业客户）
  and C.HT_S_DT <= date'${endDate}'
  and C.HT_E_DT > date'${endDate}'

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
