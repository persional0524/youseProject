-- 步骤类型: N/A, 步骤名称: 存量专项贷款信息_DW查询
-- 标签: name, 属性: {}, 内容: 存量专项贷款信息_DW查询
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
  where org.org_type = 1)
select SEQ_DM_RFBS_DWDKFS.NEXTVAL ID,
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
         0 SFXWQYZDK,--是否小微企业主贷款
         nvl(ywht.SFSNDK,0) SFSNDK,--是否涉农贷款
         CASE WHEN ywht.SFSNDK = 1 THEN (
                                 case when SNDKXZ in ('010103','010203','010303','010403','010503','010603','0107')
                                          then 'N01'
                                          when substr(SNDKXZ,0,4) = '0101'
                                          then 'N02'
                                           when substr(SNDKXZ,0,4) = '0102'
                                          then 'N03'
                                          when substr(SNDKXZ,0,4) = '0103'
                                          then 'N04'
                                          when substr(SNDKXZ,0,4) = '0104'
                                          then 'N05'
                                          when substr(SNDKXZ,0,4) = '0105'
                                          then 'N06'
                                          else
                                           'N09'
                                   end)  
                   ELSE NULL 
             END  SNDKLX,--涉农贷款类型
       0 SFJZFPDK, --是否精准扶贫贷款
       0 ISJDLK, --是否建档立卡贫困人口贷款
       null  ISDFZFRZ, --是否地方政府融资平台贷款
       null  FLXZFLLX, --地方融资平台按法律性质分类类型
       null  LSGXFLLX, --地方融资平台按隶属关系分类类型
       null  CZZJLYFL, --地方融资平台偿债资金来源分类
       nvl(ywht.IS_HOUSEPRO_LOAN,0) SFBZXAJGCDK, --是否保障性安居工程贷款
       ywht.HOUSEPRO_LOAN_TYPE BZXAJGCDKLX,--保障性安居工程贷款类型
       ywht.IS_GREEN_LOAN SFLSDK,--是否绿色贷款
       nvl(ywht.IS_SECURE_LOAN,0) SFCYDBDK,--是否创业担保贷款
       ywht.SECURE_LOAN_TYPE CYDBLX--创业担保贷款类型
   from   DH_FB_YWHT ywht 
   left join DH_FB_XDJJ xdjj on xdjj.BID = ywht.BID
   left join DH_GL_CLTINFO clt  on ywht.CLTNO = clt.cltno and clt.ht_e_dt = date'3000-12-31'
   where ywht.balance <> 0 and ywht.biz_type in (100,101,102,105,109,110,111,128,130,106,160,170)
   and ywht.ht_s_dt <= date'${endDate}'
   and ywht.ht_e_dt > date'${endDate}'
   and xdjj.ht_s_dt <= date'${endDate}'
   and xdjj.ht_e_dt > date'${endDate}'
   ) u ,head   
 where 1=1 and (u.SFGTGSHDK =1 or SFSNDK = 1 or  SFJZFPDK = 1 or ISJDLK = 1 or  ISDFZFRZ = 1 or SFBZXAJGCDK = 1 or  SFLSDK = 1 or  SFCYDBDK = 1)

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
