-- 步骤类型: N/A, 步骤名称: 从DW取金融机构（法人）基础信息-利润及资本统计表数据
-- 标签: name, 属性: {}, 内容: 从DW取金融机构（法人）基础信息-利润及资本统计表数据
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
--一、营业收入
SELECT '20203001' AS K_CODE , RMM_RFBS_PACKGE.BUSINESS_INCOME_CDT('CUSTBZ',NULL,trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--1.利息净收入
SELECT '20203002' AS K_CODE , RMM_RFBS_PACKGE.NET_INTEREST_INCOME_CDT('CUSTBZ',NULL,trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--利息收入
SELECT '20203003' AS K_CODE , PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_LXSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--金融机构往来利息收入
SELECT '20203004' AS K_CODE , PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_JJWLXSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--其中：系统内往来利息收入
SELECT '20203005' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QZXWLXSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--各项贷款利息收入
SELECT '20203006' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_GXDKLXSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--债券利息收入
SELECT '20203007' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_ZQLXSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--其他利息收入
SELECT '20203008' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QTLXSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--利息支出
SELECT '20203009' AS K_CODE , PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_LXZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--金融机构往来利息支出
SELECT '20203010' AS K_CODE , PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_JJWLXZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--其中：系统内往来利息支出
SELECT '20203011' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QZXWLXZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--各项存款利息支出
SELECT '20203012' AS K_CODE , PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_GXCKLXZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--债券利息支出
SELECT '20203013' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_ZQLXZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--其他利息支出
SELECT '20203014' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QTLXZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--2.手续费及佣金净收入
SELECT '20203015' AS K_CODE , RMM_RFBS_PACKGE.SXFJYJJSR_CDT('CUSTBZ',NULL,trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--手续费及佣金收入
SELECT '20203016' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_SXFYJSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--手续费及佣金支出
SELECT '20203017' AS K_CODE , PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_SXFYJZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--3.租赁收益
SELECT '20203018' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_ZLSY'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--4.投资收益
SELECT '20203019' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_TZSY'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--债券投资收益
SELECT '20203020' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_ZQTZSY'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--股权投资收益
SELECT '20203021' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_GQTZSY'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--其他投资收益
SELECT '20203022' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QTTZSY'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--5.公允价值变动收益
SELECT '20203023' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_GYJZBD'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--6.汇兑净收益
SELECT '20203024' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_HDSY'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}')+ PKG_RMM_LOCAL_FUNCTIONS.bnlrc(DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--7.资产处置收益
SELECT '20203025' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_ZCCZSY'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
SELECT '20203049' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QTSY'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--9.其他业务收入
SELECT '20203026' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QTYWSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--二、营业支出
SELECT '20203027' AS K_CODE , PKG_RMM_LOCAL_FUNCTIONS.KA('CNY;USD;EUR;HKD;JPY',NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--1.业务及管理费
SELECT '20203028' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YWGLF'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--其中:职工工资
SELECT '20203029' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QZZGGZ'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--福利费
SELECT '20203030' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_FLF'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--住房公积金和住房补贴
SELECT '20203031' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_ZFGJJBT'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--2.税金及附加
SELECT '20203032' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYSJFJ'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--3.资产减值损失
SELECT '20203033' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_ZCJZSS'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--4.其他业务支出
SELECT '20203034' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_QTYWZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--三、营业利润
SELECT '20203035' AS K_CODE , (RMM_RFBS_PACKGE.BUSINESS_INCOME_CDT('CUSTBZ',NULL,trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_LOCAL_FUNCTIONS.KA('CNY;USD;EUR;HKD;JPY',NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}')) AS V_VALUE FROM DUAL
UNION ALL
--营业外收入（加）
SELECT '20203036' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYWSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--营业外支出（减）
SELECT '20203037' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYWZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--四、利润总额
SELECT '20203038' AS K_CODE , (RMM_RFBS_PACKGE.BUSINESS_INCOME_CDT('CUSTBZ',NULL,trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))+(PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYWSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYWZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}')) AS V_VALUE FROM DUAL
UNION ALL
--所得税（减）
SELECT '20203039' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_SDS'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--五、净利润
SELECT '20203040' AS K_CODE , (RMM_RFBS_PACKGE.BUSINESS_INCOME_CDT('CUSTBZ',NULL,trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))+(PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYWSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYWZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_LOCAL_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_SDS'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}')) AS V_VALUE FROM DUAL
UNION ALL
--年度损益调整（加）
SELECT '20203041' AS K_CODE , PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_NDSYTZ'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE from dual
UNION ALL
--留存利润
SELECT '20203042' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_LCLR'),'K5',DATE'${dataDate}')- PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_LCLR'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--六、未分配利润
SELECT '20203043' AS K_CODE , (SELECT (RMM_RFBS_PACKGE.BUSINESS_INCOME_CDT('CUSTBZ',NULL,trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))+(PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYWSR'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YYWZC'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}'))-(PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_SDS'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}')) FROM DUAL)+PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_NDSYTZ'),'2',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}')+PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_LCLR'),'K5',DATE'${dataDate}') - PKG_RMM_FUNCTIONS.KA(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_LCLR'),'1',trunc(DATE'${startDate}','YYYY'),DATE'${dataDate}')  AS V_VALUE FROM dual
UNION ALL
--应纳增值税
SELECT '20203044' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'PROFIT_YNZZS'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--核心一级资本净额
SELECT '20203045' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'Capital_HXYJZBJE'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--一级资本净额
SELECT '20203046' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'Capital_YJZBJE'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--资本净额
SELECT '20203047' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'Capital_ZBJE'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
UNION ALL
--应用资本底线及校准后的风险加权资产合计
SELECT '20203048' AS K_CODE , PKG_RMM_FUNCTIONS.KB(NULL,NULL,(SELECT A.VALUE_ FROM  dcab_gsk_key_value_detail A WHERE a.detail_key = 'Capital_YZDJJDFXJQZCHJ'),'K2',DATE'${dataDate}') AS V_VALUE FROM dual
) tab

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
