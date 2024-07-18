-- 步骤类型: N/A, 步骤名称: 同业客户基础信息_DW查询
-- 标签: name, 属性: {}, 内容: 同业客户基础信息_DW查询
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
  SEQ_DM_RFBS_TYKHXX.NEXTVAL ID,
  '${reportId}' REPORT_ID,
  '${BATCH}' BATCH,
  head.JRJGDM JRJGDM,--金融机构代码
  u.*
  from ( select
  fin.v_dept_id,--部门编号
  clt.CHINESE_NAME KHMC,--客户名称
  fin.CREDIT_CODE KHDM,--客户代码
  nvl(clt.FINANCIAL_CODE,fin.CREDIT_CODE ) KHJRJGBM,--客户金融机构编码
  clt.CLTNO KHNBBM,--客户内部编码
  clt.ACNT_NO JBCKZH,--基本存款账号
  clt.OP_BANK JBZHKHXMC,--基本账户开户行名称
  clt.BUSS_ADDR ZCDZ,--注册地址
  case clt.AREA
  when 1 then clt.ADMIN_DIVISION
  when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(clt.COUNTRY_CODE)
  else null end DQDM,--地区代码
 /* nvl((select p.paramvalue 
        from dm_pub_param p
        where p.paramno = 'FinanceCltType' 
        and p.paramname = (select code_name from dict_detail a where   a.code_type ='FINAN_INSTITUTE_TYPE' and standard_code = fin.FINAN_INSTITUTE_TYPE)),'B10') KHLB,--客户类别 
  		case  when fin.FINAN_INSTITUTE_TYPE ='C02'  then 'B0312'
        when fin.FINAN_INSTITUTE_TYPE ='C04'  then 'B03131'
        when fin.FINAN_INSTITUTE_TYPE ='C11'  then 'B035'
        when fin.FINAN_INSTITUTE_TYPE ='D02'  then 'B042'
        when fin.FINAN_INSTITUTE_TYPE ='G'  then 'B07'
          ELSE 'B10'  END KHLB,--客户类别   */		
		  case  when fin.FINAN_INSTITUTE_TYPE ='C101'  then 'B0311'
        when fin.FINAN_INSTITUTE_TYPE ='C102'  then 'B0312'
        when fin.FINAN_INSTITUTE_TYPE ='C10201'  then 'B03131'
        when fin.FINAN_INSTITUTE_TYPE ='C5'  then 'B035'
        when fin.FINAN_INSTITUTE_TYPE ='E1'  then 'B051'
		when fin.FINAN_INSTITUTE_TYPE ='E2'  then 'B052'
		when fin.FINAN_INSTITUTE_TYPE ='E7'  then 'B094'
		when fin.FINAN_INSTITUTE_TYPE ='G0'  then 'B07'
          ELSE 'B10'  END KHLB,--客户类别 
  to_char(clt.DAYOFESTB,'YYYY-MM-DD') CLRQ,--成立日期
/*decode((select count(1) from DH_CUST_RELATED r 
where r.CLTNO = head.NBJGH 
and r.RELATED_CODE = clt.CLTNO
and r.RELATED_STATUS_CODE=1 
and r.ht_s_dt <= date'${endDate}' 
and r.ht_e_dt > date'${endDate}'),0,'0',1) SFGLF,--是否关联方*/
clt.RELATED_PARTY SFGLF,--是否关联方
  PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',clt.QYKGLX) KHJJCF,--客户经济成分
  clt.ECONOMIC_SECTOR KHGMJJBM,--客户国民经济部门
  -- 'B08'  KHGMJJBM,--客户国民经济部门
  --(select count(*) from DM_RFBS_RATING_MAPPING t) KHXYJBZDJS,--客户信用级别总等级数
  '4'  KHXYJBZDJS,--客户信用级别总等级数
   (select CREDIT_LEVEL from dh_CLT_CLIENTCREDITGRADE a where a.CLT_CODE =clt.cltno and a.ht_s_dt <= date'${endDate}'
 and a.ht_e_dt > date'${endDate}') KHXYPJ,--客户信用评级
  'system' CREATER--创建人
  from dh_GL_FINANC fin
  left join dh_gl_cltinfo clt on clt.cltno = fin.cltno 
  and clt.ht_s_dt <= date'${endDate}'
  and clt.ht_e_dt > date'${endDate}'

 where fin.CLT_INFO_TYPE <> 0
 and fin.ht_s_dt <= date'${endDate}'
 and fin.ht_e_dt > date'${endDate}'
 and (clt.colsed_date >= date'${endDate}' or  clt.colsed_date is null)

 and (fin.cltno in (select distinct OP_CUST_NO cltno from DH_IB_CFTY
union
select distinct OP_CUST_NO cltno from DH_IB_tycf)  or fin.cltno in ('20000013','20000016') )
union all
select

  clt.v_dept_id,--部门编号
  clt.CHINESE_NAME KHMC,--客户名称
  clt.CREDIT_CODE KHDM,--客户代码
  clt.CREDIT_CODE KHJRJGBM,--客户金融机构编码
  clt.CLTNO KHNBBM,--客户内部编码
  clt.ACNT_NO JBCKZH,--基本存款账号
  clt.OP_BANK JBZHKHXMC,--基本账户开户行名称
  clt.BUSS_ADDR ZCDZ,--注册地址
  case clt.AREA
  when 1 then clt.ADMIN_DIVISION
  when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(clt.COUNTRY_CODE)
  else null end DQDM,--地区代码
 /* nvl((select p.paramvalue 
        from dm_pub_param p
        where p.paramno = 'FinanceCltType' 
        and p.paramname = (select code_name from dict_detail a where   a.code_type ='FINAN_INSTITUTE_TYPE' and standard_code = clt.FINAN_INSTITUTE_TYPE)),'B10') KHLB,--客户类别 */
 'B064' KHLB,--客户类别
  to_char(clt.DAYOFESTB,'YYYY-MM-DD') CLRQ,--成立日期
/*decode((select count(1) from DH_CUST_RELATED r 
where r.CLTNO = head.NBJGH 
and r.RELATED_CODE = clt.CLTNO
and r.RELATED_STATUS_CODE=1 
and r.ht_s_dt <= date'${endDate}' 
and r.ht_e_dt > date'${endDate}'),0,'0',1) SFGLF,--是否关联方*/
clt.RELATED_PARTY SFGLF,--是否关联方
  PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',clt.QYKGLX) KHJJCF,--客户经济成分
  clt.ECONOMIC_SECTOR KHGMJJBM,--客户国民经济部门
  -- 'B08'  KHGMJJBM,--客户国民经济部门
 -- (select count(*) from DM_RFBS_RATING_MAPPING t) KHXYJBZDJS,--客户信用级别总等级数
	  '4'  KHXYJBZDJS,--客户信用级别总等级数
  (select M.TARGET_CODE 
  from DM_RFBS_RATING_MAPPING M 
  where  M.ORIGIN_CODE = clt.creditl_evel) KHXYPJ,--客户信用评级
  'system' CREATER--创建人
  from   dh_gl_cltinfo clt 
 where clt.cltno ='00000012'
 and clt.ht_s_dt <= date'${endDate}'
 and clt.ht_e_dt > date'${endDate}'  ) u ,head

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
