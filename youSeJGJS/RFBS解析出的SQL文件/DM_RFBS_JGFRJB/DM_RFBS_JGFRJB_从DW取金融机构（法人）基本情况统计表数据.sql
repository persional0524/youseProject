-- 步骤类型: N/A, 步骤名称: 从DW取金融机构（法人）基本情况统计表数据
-- 标签: name, 属性: {}, 内容: 从DW取金融机构（法人）基本情况统计表数据
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: N
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
--注意V_VALUE的数据类型为varchar2
SELECT tab.K_CODE AS K_CODE , tab.V_VALUE AS V_VALUE,to_number('${reportId}') AS REPORT_ID,'${BATCH}' BATCH FROM (

WITH STKSHARE AS (
   select t.SHH_RATIO as PROPOFSHARE, t.SHH_TNO as REGISTER_NO,ROWNUM AS ORDERNUM from (select *
          from DM_ORG_SHAREHOLDER_INFO
         where org_id = (select org_id from dm_pub_org where org_type = 1)
         order by SHH_RATIO desc) t where ROWNUM < 11
)
--是否核对 抽数时默认填0未核对
SELECT 'IS_CHECKED' AS K_CODE , '0' AS V_VALUE FROM dual
UNION ALL
--金融机构名称
SELECT '20201001' AS K_CODE, b.org_fname AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--金融机构代码
SELECT '20201002' AS K_CODE, b.org_credit_code AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--金融机构编码
--SELECT '20201003' AS K_CODE, b.org_inter_customer_code AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
SELECT '20201003' AS K_CODE, b.org_financial_institution_code AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--机构类别
SELECT '20201004' AS K_CODE, 'C11' AS V_VALUE FROM DUAL
UNION ALL
--注册地址
SELECT '20201005' AS K_CODE, b.ORG_ADDRESS AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--地区代码
SELECT '20201006' AS K_CODE, b.ORG_AREA AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--注册资本
--SELECT '20201007' AS K_CODE, to_char(b.ORG_REGCAPITAL) AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
SELECT '20201007' AS K_CODE, trim(to_char(b.ORG_REGCAPITAL,'99999999999999.99')) AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--成立日期
SELECT '20201008' AS K_CODE, to_char(b.ORG_DAYOFESTB,'YYYY-MM-DD') AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--联系人
--SELECT '20201009' AS K_CODE, b.ORG_EXTERNAL_CONTACT AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
select  '20201009' AS K_CODE, VALUE_ AS V_VALUE from dm_report_param_set  where KEY_ ='QTBMLXR'
UNION ALL
--联系电话
--SELECT '20201010' AS K_CODE, b.ORG_EXTERNAL_CONTACT_TEL AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
select  '20201010' AS K_CODE, VALUE_ AS V_VALUE  from dm_report_param_set  where KEY_ ='QTBMLXDH'
UNION ALL
--经营状态
SELECT '20201011' AS K_CODE, decode(b.ORG_STATUS,'0','01','1','06','2','02','3','04','4','03','5','05','6','07','99') AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--经济成分
SELECT '20201012' AS K_CODE, decode(b.ORG_ECONOMIC_SECTOR,'01','A01','0101','A0101','0102','A0102','02','A02','0201','A0201','0202','A0202',
'03','B01','0301','B0101','0302','B0102','04','B02','0401','B0201','0402','B0202','05','B03','0501','B0301','0502','B0302') AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--企业规模
SELECT '20201013' AS K_CODE, decode(b.ORG_ENTERPRISE_SCALE,'0','01','1','02','2','03','3','04') AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--实际控制人名称
SELECT '20201014' AS K_CODE, b.act_name AS V_VALUE 
  from (select *
          from dm_org_actual_controller
         where org_id = (select org_id from dm_pub_org where org_type = 1)
         order by act_id) b
 where rownum = 1
UNION ALL
--实际控制人证件类型
SELECT '20201015' AS K_CODE, decode(b.act_ttp,'0','B01','1','B02','2','B03','3','B04','4','B05','5','B06','6','B07','7','B08','8','B09','9','B10','A','B12','B','B12','C','B12','X','B99','20','A01') AS V_VALUE 
  from (select *
          from dm_org_actual_controller
         where org_id = (select org_id from dm_pub_org where org_type = 1)
         order by act_id) b
 where rownum = 1
UNION ALL
--实际控制人证件代码
SELECT '20201016' AS K_CODE, b.act_tno AS V_VALUE 
  from (select *
          from dm_org_actual_controller
         where org_id = (select org_id from dm_pub_org where org_type = 1)
         order by act_id) b
 where rownum = 1
UNION ALL
--从业人员数
SELECT '20201017' AS K_CODE, to_char(b.ORG_EMPLOYEE_NUM) AS V_VALUE FROM DM_PUB_ORG b where b.org_type=1
UNION ALL
--第一大股东代码
SELECT '20201018' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 1) AS V_VALUE from dual
UNION ALL
--第二大股东代码
SELECT '20201019' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 2) AS V_VALUE from dual
UNION ALL
--第三大股东代码
SELECT '20201020' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 3) AS V_VALUE from dual
UNION ALL
--第四大股东代码
SELECT '20201021' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 4) AS V_VALUE from dual
UNION ALL
--第五大股东代码
SELECT '20201022' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 5) AS V_VALUE from dual
UNION ALL
--第六大股东代码
SELECT '20201023' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 6) AS V_VALUE from dual
UNION ALL
--第七大股东代码
SELECT '20201024' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 7) AS V_VALUE from dual
UNION ALL
--第八大股东代码
SELECT '20201025' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 8) AS V_VALUE from dual
UNION ALL
--第九大股东代码
SELECT '20201026' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 9) AS V_VALUE from dual
UNION ALL
--第十大股东代码
SELECT '20201027' AS K_CODE, (select a.REGISTER_NO FROM STKSHARE a WHERE a.ORDERNUM = 10) AS V_VALUE from dual
UNION ALL
--第一大股东持股比例
SELECT '20201028' AS K_CODE, (select trim(to_char(a.PROPOFSHARE,'99999999999999.99')) FROM STKSHARE a WHERE a.ORDERNUM = 1) AS V_VALUE from dual
UNION ALL
--第二大股东持股比例
SELECT '20201029' AS K_CODE, (select trim(to_char(a.PROPOFSHARE,'99999999999999.99')) FROM STKSHARE a WHERE a.ORDERNUM = 2) AS V_VALUE from dual
UNION ALL
--第三大股东持股比例
SELECT '20201030' AS K_CODE, (select trim(to_char(a.PROPOFSHARE,'99999999999999.99')) FROM STKSHARE a WHERE a.ORDERNUM = 3) AS V_VALUE from dual
UNION ALL
--第四大股东持股比例
SELECT '20201031' AS K_CODE, (select to_char(a.PROPOFSHARE) FROM STKSHARE a WHERE a.ORDERNUM = 4) AS V_VALUE from dual
UNION ALL
--第五大股东持股比例
SELECT '20201032' AS K_CODE, (select to_char(a.PROPOFSHARE) FROM STKSHARE a WHERE a.ORDERNUM = 5) AS V_VALUE from dual
UNION ALL
--第六大股东持股比例
SELECT '20201033' AS K_CODE, (select to_char(a.PROPOFSHARE) FROM STKSHARE a WHERE a.ORDERNUM = 6) AS V_VALUE from dual
UNION ALL
--第七大股东持股比例
SELECT '20201034' AS K_CODE, (select to_char(a.PROPOFSHARE) FROM STKSHARE a WHERE a.ORDERNUM = 7) AS V_VALUE from dual
UNION ALL
--第八大股东持股比例
SELECT '20201035' AS K_CODE, (select to_char(a.PROPOFSHARE) FROM STKSHARE a WHERE a.ORDERNUM = 8) AS V_VALUE from dual
UNION ALL
--第九大股东持股比例
SELECT '20201036' AS K_CODE, (select to_char(a.PROPOFSHARE) FROM STKSHARE a WHERE a.ORDERNUM = 9) AS V_VALUE from dual
UNION ALL
--第十大股东持股比例
SELECT '20201037' AS K_CODE, (select to_char(a.PROPOFSHARE) FROM STKSHARE a WHERE a.ORDERNUM = 10) AS V_VALUE from dual

) tab

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
