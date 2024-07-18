-- 步骤类型: N/A, 步骤名称: 从表DH_GL_CLTINFO取数
-- 标签: name, 属性: {}, 内容: 从表DH_GL_CLTINFO取数
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: custom_distribution, 属性: {}, 内容: None
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
WITH
HEAD AS (
  SELECT ORG.ORG_CLTNO NBJGH,
  ORG.ORG_CREDIT_CODE  JRJGDM,
    ORG.ORG_AREA JRJGDQDM
  FROM DM_PUB_ORG ORG
  WHERE ORG.ORG_TYPE = 1
),
--客户信息
CLTINFO AS (
  SELECT C.*,
    CASE WHEN C.CREDIT_CODE IS NOT NULL THEN 'A01' 
	  	 WHEN C.CREDIT_CODE IS NULL AND C.ORG_CODE IS NOT NULL THEN 'A02'	
	     ELSE ''	END AS CUST_TYPE,	   --客户证件类型
	CASE WHEN C.CREDIT_CODE IS NOT NULL THEN C.CREDIT_CODE
	  	 WHEN C.CREDIT_CODE IS NULL AND C.ORG_CODE IS NOT NULL THEN REPLACE(C.ORG_CODE,'-','')
	  	 ELSE '' END AS CUST_CODE	   --客户证件代码	 
  FROM DH_GL_CLTINFO C
  WHERE CLT_INFO_TYPE NOT IN (0,8)         --非同业客户（除去自己及金融机构即为非同业客户）
    AND C.HT_S_DT <= DATE '${endDate}'
    AND C.HT_E_DT >  DATE '${endDate}'
)
SELECT DISTINCT '${reportId}' REPORT_ID,
  '${BATCH}' BATCH,
  HEAD.JRJGDM JRJGDM,                      --金融机构代码
  C.V_DEPT_ID,                             --部门编号
  C.CHINESE_NAME KHMC,                     --客户名称
  C.CUST_TYPE KHZJLX,                      --客户证件类型
  C.CUST_CODE KHZJDM,                      --客户证件代码
  C.ACNT_NO  JBCKZH,                       --基本存款账号
  C.OP_BANK  JBZHKHXMC,                    --基本账户开户行名称
  C.BUSS_SCOPE JYFW,                       --经营范围
  C.REGCAPITAL ZCZB,                       --注册资本
  C.PAIDIN_CAPITAL SSZB,                   --实收资本
  C.TOTAL_ASSETS ZZC,                      --总资产
  C.OPERAT_INCOME YYSR,                    --营业收入
  C.EMPLOYEES_NUM CYRYS,                   --从业人员数
  DECODE(C.LISTED_FLAG,1,1,0) SFSSGS,      --是否上市公司
  NULL SCJLXDGXRQ,                         --首次建立信贷关系日期
  C.BUSS_ADDR ZCDZ,                        --注册地址
  CASE C.AREA
     WHEN 1 THEN C.ADMIN_DIVISION
     WHEN 2 THEN (SELECT '000'||Y.PARAMVALUE FROM DICT_PARAM_MAPPING Y WHERE Y.APPNO = 'RFBS' AND Y.PARAMNO = 'COUNTRY_CODE3_JS' AND  Y.STANDARD_CODE = C.COUNTRY_CODE)
     ELSE NULL 
  END DQDM,                                --地区代码
  CASE C.CLTSTATE WHEN 0 THEN '01'
     WHEN 2 THEN '02'
     WHEN 3 THEN '04'
     WHEN 4 THEN '03'
     WHEN 5 THEN '05'
     WHEN 6 THEN '07'
     WHEN 1 THEN '06'
     ELSE '99'
  END JYZT,                                --经营状态
  TO_CHAR(C.DAYOFESTB,'YYYY-MM-DD')  CLRQ, --成立日期
  CASE C.AREA WHEN 1 THEN SUBSTR(C.INDUSTRY,0,3)
     WHEN 2 THEN '200'
     ELSE NULL
  END SSXY,                                --所属行业
  CASE C.AREA WHEN 1 THEN (
                        CASE WHEN SUBSTR(C.ECONOMIC_SECTOR,0,1) IN ('A','B','D','E') 
                 THEN 'CS05'
                   ELSE DECODE(C.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') END
              )
     WHEN 2 THEN NULL
  ELSE NULL END QYGM,                                                            --企业规模
  CASE WHEN C.AREA=2 THEN NULL 
       WHEN SUBSTR(C.ECONOMIC_SECTOR,0,1) IN ('A','B','D','E') THEN NULL 
  ELSE PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',C.QYKGLX) END KHJJCF,      --客户经济成分
  C.ECONOMIC_SECTOR  KHGMJJBM,                                                    --客户国民经济部门
  NULL SXED,                                                                      --授信额度
  NULL YYED,                                                                      --已用额度
  DECODE((SELECT COUNT(1) FROM DH_CUST_RELATED R WHERE R.CLTNO = HEAD.NBJGH 
  AND R.RELATED_CODE = C.CLTNO
  AND R.RELATED_STATUS_CODE=1 
  AND R.HT_S_DT <= DATE'${endDate}' 
  AND R.HT_E_DT >  DATE'${endDate}'),0,'0',1)  SFGLF,                             --是否关联方
  (SELECT LISTAGG(PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','CERTIF_TYPE','ID_Type',COL.CERTTP),',') WITHIN GROUP (ORDER BY CERTTP,CERTNO) 
   FROM DH_GL_CONTROLLER COL 
   WHERE COL.CLTNO = C.CLTNO AND COL.HT_S_DT <= DATE '${endDate}' AND  COL.HT_E_DT > DATE'${endDate}') SJKZRZJLX,    --实际控制人证件类型
  (SELECT LISTAGG(CERTNO,',') WITHIN GROUP (ORDER BY CERTTP,CERTNO) 
   FROM DH_GL_CONTROLLER COL 
   WHERE COL.CLTNO = C.CLTNO AND COL.HT_S_DT <= DATE '${endDate}' AND COL.HT_E_DT > DATE '${endDate}') SJKZRZJDM,    --实际控制人证件代码
  NULL KHXYJBZDJS,                                                                --客户信用级别总等级数
  NULL KHXYPJ,                                                                    --客户信用评级
  'SYSTEM' CREATER,
  SYSDATE CREATE_TIME
FROM CLTINFO C,HEAD
--发生存款业务
WHERE EXISTS (
  SELECT 1 FROM DH_SM_CKCD S
  WHERE S.CUST_ID = C.CLTNO
    AND S.HT_S_DT <= DATE'${endDate}' 
  )

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
