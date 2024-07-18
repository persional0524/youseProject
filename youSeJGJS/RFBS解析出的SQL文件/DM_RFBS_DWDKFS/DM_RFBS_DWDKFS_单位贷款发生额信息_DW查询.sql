-- 步骤类型: N/A, 步骤名称: 单位贷款发生额信息_DW查询
-- 标签: name, 属性: {}, 内容: 单位贷款发生额信息_DW查询
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
  where org.org_type = 1),
BRT AS (
 SELECT A.STANDARD_CODE, 
   CASE WHEN CONNECT_BY_ISLEAF = 1 AND LEVEL >=3 THEN PRE_CODE ELSE A.STANDARD_CODE END AS PRE_CODE
 FROM(
   SELECT A.* FROM DICT_DETAIL A WHERE A.CODE_TYPE = 'BASE_INTR_TYPE'
   ) A START WITH PRE_CODE IS NULL
     CONNECT BY PRIOR STANDARD_CODE = PRE_CODE
)
select 
       SEQ_DM_RFBS_DWDKFS.NEXTVAL ID,
       '${reportId}' REPORT_ID,
       '${BATCH}' BATCH,
       head.JRJGDM,--金融机构代码
       head.NBJGH,--内部机构号
       head.JRJGDQDM,--金融机构地区代码
       fhkjl.v_dept_id,--部门编号
       'A01' JKRZJLX, --借款人证件类型
       clt.CREDIT_CODE JKRZJDM,--借款人证件代码
       clt.ECONOMIC_SECTOR JKRGMJJBM,--借款人国民经济部门
       case clt.AREA
	   when 1 then substr(clt.INDUSTRY,0,3)
	   when 2 then '200'
	   else null end JKRXY,--借款人行业
	   case clt.AREA
	   when 1 then clt.ADMIN_DIVISION
	   when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(clt.COUNTRY_CODE)
	   else null end JKRDQDM,--借款人地区代码
       PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',clt.QYKGLX) JKRJJCF,--借款人经济成分
       case clt.AREA 
       		when 1 then 
				(case when substr(clt.ECONOMIC_SECTOR,0,1) in ('A','B','D','E') then 'CS05'
					  else DECODE(clt.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') end)
            when 2 then null
			else null end JKRQYGM,--借款人企业规模
       jj.LOAN_NO DKJJBM,--贷款借据编码
       ywht.CONTRACT_NO DKHTBM,--贷款合同编码
       case when ywht.BIZ_TYPE = 130 then   
								decode((select an.TRADE_FINANCE_TYPE
  								 from DH_TRADE_FINANCE_ADDITION an
 								where an.bid = ywht.bid
 								  and an.ht_s_dt <= date'${endDate}'
   								  and an.ht_e_dt > date'${endDate}'),'2301','F082','2302','F081')
      	 else PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BIZ_TYPE','DKCPLB',ywht.BIZ_TYPE) end  DKCPLB,--贷款产品类别
       case clt.AREA
	   when 1 then substr(ywht.INVEST_DIRECTION,0,4)
	   when 2 then '2000'
	   else null end  DKSJTX,--贷款实际投向
       to_char(jj.START_DATE,'YYYY-MM-DD') DKFFRQ,--贷款发放日期
       to_char(jj.MATURITY,'YYYY-MM-DD') DKDQRQ,--贷款到期日期
		case when  jj.STATE = 9 and fhkjl.flag=2 
 			then to_char((select max(RQ.TXDATE) from DH_FB_FHKJL RQ where RQ.BID = ywht.BID and RQ.LOAN_NO = jj.LOAN_NO and RQ.flag = 2),'YYYY-MM-DD')
		else null end DKSJZZRQ,--贷款实际终止日期
       ywht.CURRENCY_NO BZ,--币种
       fhkjl.ACTUAL_PRINCIPAL DKFSJE,--贷款发生金额
       fhkjl.ACTUAL_PRINCIPAL*PKG_RMM_FUNCTIONS.CurrencyRate(ywht.CURRENCY_NO,date'${endDate}') DKFSJEZRMB,--贷款发生金额折人民币
       decode(ywht.IS_FLOATING_RATE,0, 'RF01', 1, 'RF02',null) LLSFGD,--利率是否固定
       --ywht.LAST_RATE LLSP,--利率水平
		 jj.bjll  LLSP,--利率水平
	   PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE = ywht.RATE_TYPE)) DKDJJZLX,--贷款定价基准类型
       case ywht.IS_FLOATING_RATE
	   when 1 then PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(ywht.RATE_TYPE,ywht.CURRENCY_NO,date'${endDate}')
	   else null end  JZLL,--基准利率
	   PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','FINANCIAL_SUPPORT','FINANCIAL_SUPPORT',ywht.FINANCIAL_SUPPORT) DKCZFCFS,--贷款财政扶持方式
       case ywht.IS_FLOATING_RATE
              when 0 then to_char(jj.MATURITY,'YYYY-MM-DD') 
              when 1 then ( case 
                           -- when  ywht.STATE=9 then to_char(fhkjl.TXDATE,'YYYY-MM-DD')
                            when jj.MATURITY <= ywht.CDJ_DATE  then to_char(jj.MATURITY,'YYYY-MM-DD') 
                            else to_char(ywht.CDJ_DATE,'YYYY-MM-DD') end
                           )
        else to_char(jj.MATURITY,'YYYY-MM-DD') end DKLLZXDJR,--贷款利率重新定价日
       case when sus.SURE_MODE like 'A%' then 'A'
       when sus.SURE_MODE like 'B%' then 'B01'
	   when sus.SURE_MODE like 'C%' then 'C99'
	   else sus.SURE_MODE end DKDBFS,--贷款担保方式
       ywht.TAG_FIRST_LOAN SFSCDK,--是否首次贷款
       case
       when ywht.STATE = 1 then 'LF01'
       when ywht.STATE = 9 then 'LF01'--结束的合同为正常（有色客户）
       when ywht.STATE =-1 then 'LF02'
       else 'LF99' end DKZT,--贷款状态
       null ZCZQHCPDM,--资产证券化产品代码
       decode(ywht.LOAN_RESTRUCTUR,'99','09',ywht.LOAN_RESTRUCTUR) DKZZFS,--贷款重组方式
       decode(fhkjl.flag, 1, 1, 2, 0, null) FFSHBS,--发放/收回标识
       fhkjl.LEDGERID JYLSH,--交易流水号
       ywht.DKYT DKYT,--贷款用途
       'system' CREATER--创建人
  from DH_FB_YWHT ywht --业务合同
  left join DH_FB_XDJJ jj 
  on jj.bid = ywht.bid
  and jj.ht_s_dt <= date'${endDate}'
  and jj.ht_e_dt > date'${endDate}'
  left join DH_FB_FHKJL fhkjl --放还款记录
  on jj.loan_no = fhkjl.loan_no
  left join DH_GL_CLTINFO clt --借款人
  on ywht.CLTNO = clt.cltno
  and clt.ht_e_dt = date'3000-12-31'
 -- left join DH_FB_RELATION ral on ral.bid = ywht.bid
 --  and ral.HT_S_DT <= date'${endDate}'
  -- and ral.HT_E_DT > date'${endDate}'
  left join DH_CT_SURETIES sus --担保
	 on sus.bid=ywht.bid
  --on ral.GUARATEECONTRACTNO = sus.GUARATEECONTRACTNO
  and sus.HT_S_DT <= date'${endDate}'
  and sus.HT_e_DT > date'${endDate}'
  ,head
 where clt.clt_info_type in (1, 3，4) --修改dm增加类型4，取(2020)有色财司(循贷)-1号-02 ；fyx1109
   and ywht.biz_type in (100, 101, 102, 109, 128, 130,160,170)
   and ywht.ht_s_dt <= date'${endDate}'
   and ywht.ht_e_dt > date'${endDate}'
   AND fhkjl.txdate >= DATE'${startDate}'
   AND fhkjl.txdate <= DATE'${endDate}'
   AND fhkjl.ACTUAL_PRINCIPAL > 0
	and fhkjl.RESERVE_ENTRY_TYPE = 1

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
