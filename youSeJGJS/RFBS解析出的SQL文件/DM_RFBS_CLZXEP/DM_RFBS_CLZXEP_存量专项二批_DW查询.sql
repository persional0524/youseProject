-- 步骤类型: N/A, 步骤名称: 存量专项二批_DW查询
-- 标签: name, 属性: {}, 内容: 存量专项二批_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
with head as (
 select org.ORG_CLTNO NBJGH,
		org.ORG_CREDIT_CODE	JRJGDM,
        org.org_area JRJGDQDM
   from dm_pub_org org
  where org.org_type = 1)
select 
         '${reportId}' REPORT_ID,
         '${BATCH}' BATCH,
          head.JRJGDM,--金融机构代码
          head.NBJGH,--内部机构号
       u.* from(    
   select xdjj.v_dept_id,--部门编号
         ywht.CONTRACT_NO DKHTBM,--合同编码
         xdjj.LOAN_NO DKJJBM,--贷款借据编码
         ywht.SFSNDK SFSNDK,--是否涉农贷款
       0 SFJZBFDK, --是否精准扶贫贷款
       0 ISJDLK, --是否建档立卡贫困人口贷款
       ywht.IS_HOUSEPRO_LOAN SFBZXAJGCDK, --是否保障性安居工程贷款
       ywht.HOUSEPRO_LOAN_TYPE BZXAJGCDKLX,--保障性安居工程贷款类型
       ywht.IS_GREEN_LOAN SFLSDK,--是否绿色贷款
       ywht.IS_SECURE_LOAN SFCYDBDK,--是否创业担保贷款
       ywht.SECURE_LOAN_TYPE CYDBLX,--创业担保贷款类型
	  CASE WHEN  m.paramname  IS NOT NULL THEN '1' ELSE '0' END AS SFGJSZZYDK,--是否高技术制造业贷款
      m.paramname  AS GJSZZYDKLX --高技术制造业贷款类型
   from   DH_FB_YWHT ywht 
   left join DH_FB_XDJJ xdjj on xdjj.BID = ywht.BID
   left join DH_GL_CLTINFO clt  on ywht.CLTNO = clt.cltno and clt.ht_e_dt = date'3000-12-31'
   left join dict_param_mapping m on ywht.invest_direction = m.standard_code
      and m.paramno  =  'CUSTOM_INDUSTRY_ZZY'
   where ywht.balance <> 0 and ywht.biz_type in (100,101,102,105,109,110,111,128,130,106,160,170)
   and ywht.ht_s_dt <= date'${endDate}'
   and ywht.ht_e_dt > date'${endDate}'
   and xdjj.ht_s_dt <= date'${endDate}'
   and xdjj.ht_e_dt > date'${endDate}'
   ) u ,head   
 where 1=1 and ( SFSNDK = 1 or  SFJZBFDK = 1 or ISJDLK = 1 or   SFBZXAJGCDK = 1 or  SFLSDK = 1 or  SFCYDBDK = 1 or SFGJSZZYDK=1)

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
