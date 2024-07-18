-- 步骤类型: N/A, 步骤名称: 从DW取金融机构（法人）资产负债及风险统计表数据
-- 标签: name, 属性: {}, 内容: 从DW取金融机构（法人）资产负债及风险统计表数据
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
--注意V_VALUE的数据类型为NUMBER
SELECT tab.K_CODE AS K_CODE , tab.V_VALUE AS V_VALUE,'${reportId}' AS REPORT_ID,'${BATCH}' BATCH FROM (
--数据状态 抽数时默认填0 未核对
SELECT 'IS_CHECKED' AS K_CODE , 0 AS V_VALUE FROM dual
UNION ALL
--各项存款
SELECT '20202001' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'BASH_NOTES_GXCK'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--各项贷款
SELECT '20202002' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'BASH_NOTES_GXDK'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--资产总计
SELECT '20202003' AS K_CODE , RMM_RFBS_PACKGE.TOTAL_ASSETS_CDT('CUSTBZ',NULL,DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--负债总计
SELECT '20202004' AS K_CODE , RMM_RFBS_PACKGE.TOTAL_LIABILITIES_CDT('CUSTBZ',NULL,DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--所有者权益合计
SELECT '20202005' AS K_CODE , RMM_RFBS_PACKGE.TOTAL_EQUITY_CDT('CUSTBZ',NULL,DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--生息资产
SELECT '20202006' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'BASH_NOTES_SXZC'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--付息负债
SELECT '20202007' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'BASH_NOTES_FXFZ'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--流动性资产
SELECT '20202008' AS K_CODE , RMM_RFBS_PACKGE.LIQUID_ASSETS_CDT('CUSTBZ',NULL,DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--流动性负债
SELECT '20202009' AS K_CODE , RMM_RFBS_PACKGE.CURRENT_LIABILITIES_CDT('CUSTBZ',NULL,DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--正常类贷款
SELECT '20202010' AS K_CODE , PKG_RMM_FUNCTIONS.LBS_FIVELEVEL(NULL,NULL,1,DATE'${dataDate}') AS V_VALUE  FROM dual
UNION ALL
--关注类贷款
SELECT '20202011' AS K_CODE , PKG_RMM_FUNCTIONS.LBS_FIVELEVEL(NULL,NULL,2,DATE'${dataDate}') AS V_VALUE  FROM dual
UNION ALL
--次级类贷款
SELECT '20202012' AS K_CODE , PKG_RMM_FUNCTIONS.LBS_FIVELEVEL(NULL,NULL,3,DATE'${dataDate}') AS V_VALUE  FROM dual
UNION ALL
--可疑类贷款
SELECT '20202013' AS K_CODE , PKG_RMM_FUNCTIONS.LBS_FIVELEVEL(NULL,NULL,4,DATE'${dataDate}') AS V_VALUE  FROM dual
UNION ALL
--损失类贷款
SELECT '20202014' AS K_CODE , PKG_RMM_FUNCTIONS.LBS_FIVELEVEL(NULL,NULL,5,DATE'${dataDate}') AS V_VALUE  FROM dual
UNION ALL
--逾期贷款
SELECT '20202015' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,'130304','K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--逾期90天以上贷款
SELECT '20202016' AS K_CODE , PKG_RMM_FUNCTIONS.OVERDUE_LOANS(NULL,NULL,'101;102;109;128;130',NULL,'OT03;OT04;OT05;OT06',NULL,NULL,NULL,DATE'${dataDate}') AS V_VALUE  FROM dual
UNION ALL
--贷款减值准备
SELECT '20202017' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,'1304','K2',DATE'${dataDate}') AS V_VALUE FROM dual
) tab

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
