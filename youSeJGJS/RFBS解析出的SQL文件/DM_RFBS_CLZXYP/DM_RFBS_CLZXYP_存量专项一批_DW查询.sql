-- 步骤类型: N/A, 步骤名称: 存量专项一批_DW查询
-- 标签: name, 属性: {}, 内容: 存量专项一批_DW查询
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
         case BORR_NATURE when 3
                  then 1
                  else 0
         end SFGTGSHDK,--是否个体工商户贷款
         0 SFXWQYZDK--是否小微企业主贷款
         
   from   DH_FB_YWHT ywht 
   left join DH_FB_XDJJ xdjj on xdjj.BID = ywht.BID
   left join DH_GL_CLTINFO clt  on ywht.CLTNO = clt.cltno and clt.ht_e_dt = date'3000-12-31'
   where ywht.balance <> 0 and ywht.biz_type in (100,101,102,105,109,110,111,128,130,106,160,170)
   and ywht.ht_s_dt <= date'${endDate}'
   and ywht.ht_e_dt > date'${endDate}'
   and xdjj.ht_s_dt <= date'${endDate}'
   and xdjj.ht_e_dt > date'${endDate}'
   ) u ,head   
 where 1=1 and u.SFGTGSHDK=1

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
