-- 步骤类型: N/A, 步骤名称: 金融机构（分支机构）基础信息_DW查询
-- 标签: name, 属性: {}, 内容: 金融机构（分支机构）基础信息_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
select SEQ_DM_RFBS_JRJGFZ.Nextval ID,
       '${reportId}' REPORT_ID,
       '${BATCH}' BATCH,
       ORG_FNAME JRJGMC,--金融机构名称
       ORG_CREDIT_CODE JRJGDM,--金融机构代码
       ORG_FINANCIAL_INSTITUTION_CODE JRJGBM,--金融机构编码
       ORG_CLTNO NBJGH,--内部机构号
       ORG_FINANCIALLICENSE XKZH,--许可证号
       ORG_PAYBANKNO ZFXH,--支付行号
       '01' JGJB,--机构级别
       ORG_FNAME ZSSJGLJGMC,--直属上级管理机构名称
       ORG_FINANCIAL_INSTITUTION_CODE ZSSJGLJGJRJGBM,--直属上级管理机构金融机构编码
       ORG_CLTNO ZSSJGLJGNBJGH,--直属上级管理机构金融内部机构号
       ORG_ADDRESS ZCDZ,--注册地址
       ORG_AREA DQDM,--地区代码
       to_char(ORG_DAYOFESTB,'YYYY-MM-DD') CLSJ,--成立时间
       '01'   YYZT,--营业状态
       'system' CREATER--创建人
  from dm_pub_org
 where org_type = 1

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
