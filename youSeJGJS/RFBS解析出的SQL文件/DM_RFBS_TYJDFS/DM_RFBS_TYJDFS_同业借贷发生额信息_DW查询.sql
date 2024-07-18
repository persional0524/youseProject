-- 步骤类型: N/A, 步骤名称: 同业借贷发生额信息_DW查询
-- 标签: name, 属性: {}, 内容: 同业借贷发生额信息_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
with head as (
 select org.ORG_CLTNO NBJGH,
    org.ORG_CREDIT_CODE JRJGDM,
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
select SEQ_DM_RFBS_TYJDFS.NEXTVAL ID,
       '${reportId}' REPORT_ID,
       '${BATCH}' BATCH,
        head.JRJGDM,--金融机构代码
        head.NBJGH,--内部机构号
        u.* 
   from(
   -----同业资产 同业拆出
  select tyjy.V_DEPT_ID,--部门编号        
         ds.CREDIT_CODE JYDSDM,--交易对手代码  
         'A01' JYDSLB,--交易对手代码类别
         cf.ORDER_ID HTBM,--合同编码
         tyjy.STLID JYLSH,--交易流水号
         'AL01' ZCFZLB,--资产负债类型   资产
          'F03'   CPLB,--产品类别
         to_char(cf.START_DATE,'YYYY-MM-DD') HTQSRQ,--合同起始日期
         to_char(cf.END_DATE,'YYYY-MM-DD')  HTDQRQ,--合同到期日期
         case when tyjy.TX_DIR=1 then null else  to_char(cf.END_DATE,'YYYY-MM-DD') end HTSJZZRQ,--合同实际终止日期
          cf.CUR_CODE BZ ,--币种
          tyjy.AMOUNT FSJE,--发生金额
          tyjy.AMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(cf.CUR_CODE,date'${endDate}') FSJEZRMB,--发生金额折人民币
         decode(cf.LLLX,'1','RF01','2','RF02',null) LLSFGD,--利率是否固定
         cf.INTR_RATE LLSP,--利率水平
    --PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE = cf.BASE_RATE_TYPE)) DJJZLX,--定价基准类型
   -- 'TR99' DJJZLX,--定价基准类型
   case  when cf.CUR_CODE='CNY' then 'TR01' else 'TR99' end DJJZLX,--定价基准类型
    case when cf.LLLX = '2' then 
      PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(cf.base_rate_type,cf.CUR_CODE,date'${endDate}')
    else null end JZLL,--基准利率
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','INTEREST_METHOD','JXFS',cf.INTEREST_METHOD) JXFS,--计息方式
         --case cf.STATE when 9 then '0'
          --   when 1 then '1'
       case when tyjy.TX_DIR=2 then '0'
             when tyjy.TX_DIR=1 then '1'
         end FLAG ---发生/结清标识
         from DH_TYJY_TX tyjy --同业资产交易表
         left join DH_IB_CFTY cf on cf.ORDER_ID = tyjy.ORDER_ID --同业资产信息 
         left join DH_GL_FINANC ds   on ds.CLTNO = cf.OP_CUST_NO    --关联交易对手
        where substr(cf.BIZ_TYPE,0,3)= 'C02'
        and trunc(tyjy.TX_DATE) between date'${startDate}' and date'${endDate}'
        and cf.ht_s_dt <= date'${endDate}'
        and cf.ht_e_dt > date'${endDate}'
        and cf.END_DATE >= date'${startDate}'
        and ds.ht_s_dt <= date'${endDate}'
       and ds.ht_e_dt > date'${endDate}'
      UNION ALL
      
     ----同业负债 同业拆入
      select tycf.V_DEPT_ID,--部门编号
         ds.CREDIT_CODE JYDSDM,--交易对手代码  
         'A01' JYDSLB,--交易对手代码类别
         --cf.ORDER_ID HTBM,--合同编码
case when  cf.DATA_SOURCE= 'SUPPLEMENT' then cf.DEPOSIT_CODE else cf.ORDER_ID end HTBM,--合同编码
         tycf.STLID JYLSH,--交易流水号
         'AL02' ZCFZLB,--资产负债类型   负债
          'F03'   CPLB,--产品类别
         to_char(cf.START_DATE,'YYYY-MM-DD') HTQSRQ,--合同起始日期
         to_char(cf.END_DATE,'YYYY-MM-DD')  HTDQRQ,--合同到期日期
         case when tycf.TX_DIR=1 then null else to_char(cf.END_DATE,'YYYY-MM-DD') end HTSJZZRQ,--合同实际终止日期
          cf.CUR_CODE BZ ,--币种
          tycf.AMOUNT FSJE,--发生金额
          tycf.AMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(cf.CUR_CODE,date'${endDate}') FSJEZRMB,--发生金额折人民币
         decode(cf.LLLX,'1','RF01','2','RF02',null) LLSFGD,--利率是否固定
         cf.INTR_RATE LLSP,--利率水平
      --  PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE = cf.BASE_RATE_TYPE)) DJJZLX,--定价基准类型
   -- 'TR99' DJJZLX,--定价基准类型
    case  when cf.CUR_CODE='CNY' then 'TR01' else 'TR99' end DJJZLX,--定价基准类型 
     case when cf.LLLX = '2' then 
      PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(cf.base_rate_type,cf.CUR_CODE,date'${endDate}')
    else null end JZLL,--基准利率
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','INTEREST_METHOD','JXFS',cf.INTEREST_METHOD)  JXFS,--计息方式
         --case cf.STATE when 9 then '0'
           --  when 1 then '1'
       case when tycf.TX_DIR=2 then '0'
             when tycf.TX_DIR=1 then '1'
         end FLAG ---发生/结清标识
         from DH_TYCF_TX tycf
         left join DH_IB_TYCF cf on cf.ORDER_ID = tycf.ORDER_ID --同业资产信息
         left join DH_GL_FINANC ds  on ds.CLTNO = cf.OP_CUST_NO    --关联交易对手
      where substr(cf.BIZ_TYPE,0,3)= 'C04'
      and tycf.TX_DATE between date'${startDate}' and date'${endDate}'
      and cf.ht_s_dt <= date'${endDate}'
      and cf.ht_e_dt > date'${endDate}'
      and cf.END_DATE >= date'${startDate}'
      and ds.ht_s_dt <= date'${endDate}'
      and ds.ht_e_dt > date'${endDate}'
   UNION ALL
        ----同业债券回购
          select tra.V_DEPT_ID,--部门编号
         ds.CREDIT_CODE JYDSDM,--交易对手代码  
         'A01' JYDSLB,--交易对手代码类别
         repu.BUSINESSNO HTBM,--合同编码
         tra.ID JYLSH,--交易流水号
         case when repu.REPUR_TYPE = '2'
            then  'AL01' 
            when repu.REPUR_TYPE = '1'
            then  'AL02' 
         end ZCFZLB,--资产负债类型
         'F061'   CPLB,--产品类别
         to_char(repu.START_DATE,'YYYY-MM-DD') HTQSRQ,--合同起始日期
         to_char(repu.MATURITY,'YYYY-MM-DD')  HTDQRQ,--合同到期日期
         to_char(repu.MATURITY,'YYYY-MM-DD') HTSJZZRQ,--合同实际终止日期
         repu.CURE_CODE BZ ,--币种
         tra.TRADE_AMT FSJE,--发生金额
         tra.TRADE_AMT*PKG_RMM_FUNCTIONS.CurrencyRate(repu.CURE_CODE,date'${endDate}') FSJEZRMB,--发生金额折人民币
       'RF01' LLSFGD,--利率是否固定
        repu.BUYBACK_RATE LLSP,--利率水平
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE = repu.RATE_TYPE)) DJJZLX,--定价基准类型
        PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(repu.RATE_TYPE,repu.CURE_CODE,date'${endDate}') JZLL,--基准利率     
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','INTEREST_METHOD','JXFS',repu.INTEREST_METHOD) JXFS,--计息方式
        case repu.REPUR_TYPE when '1' then decode(tra.IS_REPAY,0,'0',1,'1')
             when '2' then decode(tra.IS_REPAY,0,'1',1,'0')
             else null
        end  FLAG---发生/结清标识
        from DH_IB_REPUR_TRADE tra
        left join  DH_IB_REPUR repu on tra.BUSINESSNO = repu.BUSINESSNO
        left join DH_GL_FINANC ds   on ds.cltno = repu.TRADER   --关联交易对手  
     where tra.ACT_DATE between date'${startDate}' and date'${endDate}'
      and  repu.ht_s_dt <= date'${endDate}'
      and  repu.ht_e_dt > date'${endDate}' 
      and ds.ht_s_dt <= date'${endDate}'
      and ds.ht_e_dt > date'${endDate}' 
    union all--信贷资产转让
    select tx.V_DEPT_ID,--部门编号  
         ds.CREDIT_CODE JYDSDM,--交易对手代码  
         'A01' JYDSLB,--交易对手代码类别
         ywht.CONTRACT_NO HTBM,--合同编码
         tx.TRADE_ID JYLSH,--交易流水号 
         case zc.BIZ_TYPE when '1' then 'AL01' 
               when '2' then 'AL02' 
         END ZCFZLB,--资产负债类型
         'F063'   CPLB,--产品类别
         to_char(to_date(zc.ZRJGRQ,'YYYY-MM-DD'),'YYYY-MM-DD') HTQSRQ,--合同起始日期
         to_char(zc.REBUY_DATE,'YYYY-MM-DD')  HTDQRQ,--合同到期日期
         to_char(to_date(zc.ACCT_DATE,'YYYY-MM-DD'),'YYYY-MM-DD')  HTSJZZRQ,--结束日期
         zc.CURRENCY_NO BZ ,--币种
         tx.FEE_AMOUNT FSJE,--发生金额
         tx.FEE_AMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(zc.CURRENCY_NO,date'${endDate}') FSJEZRMB,--发生金额折人民币
         decode(zc.RATE_IS_FLOAT,0, 'RF01', 1, 'RF02',null) LLSFGD,--利率是否固定
          zc.HGLL LLSP,--利率水平
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE = zc.RATE_TYPE)) DJJZLX,--定价基准类型  
        case when zc.RATE_IS_FLOAT = 1 then null
             else PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(zc.RATE_TYPE,zc.CURRENCY_NO,date'${endDate}') end  JZLL,--基准利率        
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','INTREST_PERIOD','JXFS',zc.INTREST_PERIOD) JXFS,--计息方式  
     case  zc.STATE when '1' then '1'
       when '2' then '0'
    end  FLAG---发生/结清标识 
    from DH_ZCZR_TX tx 
    left join DH_IB_ZCZRYWHT zc on tx.CONTRACT_NO =zc.CONTRACT_NO
    left join DH_GL_FINANC ds   on ds.cltno = zc.OP_CLTNO   --关联交易对手  
    left join DH_ZCZR_LIST li on li.bid = zc.bid
    left join DH_FB_YWHT ywht on ywht.CONTRACT_NO = li.CONTRACT_NO
    where tx.TX_DATE between date'${startDate}' and date'${endDate}'
    and zc.ht_s_dt <= date'${endDate}'
    and zc.ht_e_dt > date'${endDate}' 
    and ds.ht_s_dt <= date'${endDate}'
    and ds.ht_e_dt > date'${endDate}' 
    and li.ht_s_dt <= date'${endDate}'
    and li.ht_e_dt > date'${endDate}' 
    and ywht.ht_s_dt <= date'${endDate}'
    and ywht.ht_e_dt > date'${endDate}'
    and zc.BIZ_TYPE in ('1','2')
--转贴现
  UNION ALL 
   select  pj.V_DEPT_ID,--部门编号
         ds.CREDIT_CODE JYDSDM,--交易对手代码
         'A01' JYDSLB,--交易对手代码类别
         tr.CONTRACT_NO HTBM,--合同编码 
         max(pj.FLOWID) JYLSH,--交易流水号
          case when tr.DISCOUNT_TYPE = '1' and ds.CLT_INFO_TYPE = 0 then 'AL01' 
            when tr.DISCOUNT_TYPE = '1' and ds.CLT_INFO_TYPE != 0 then 'AL02' 
            /* when tr.DISCOUNT_TYPE = '2' and ds.CLT_INFO_TYPE = 0 then 'AL02' 
               when tr.DISCOUNT_TYPE = '2' and ds.CLT_INFO_TYPE != 0 then 'AL01' */
              when tr.DISCOUNT_TYPE = '2' then 'AL02' 
         else null  end ZCFZLB,--资产负债类型 
         'F062'   CPLB,--产品类别
          to_char(tr.START_DATE,'YYYY-MM-DD') HTQSRQ,--合同起始日期
          case tr.DISCOUNT_TYPE when '1' then 
               to_char(tr.START_DATE,'YYYY-MM-DD')  ---买断式取贴现日期
              when '2' then to_char(tr.MATURITY,'YYYY-MM-DD')  --回购式取回购日期  
         end HTDQRQ,--合同到期日期
         case when DIR_FLAG='2' then null else to_char(pj.BUYBACK_DATE,'YYYY-MM-DD') end HTSJZZRQ,--合同实际终止日期
          tr.CURRENCY_NO BZ ,--币种
          sum(xx.AMOUNT) FSJE,--发生金额
          sum(xx.AMOUNT)*PKG_RMM_FUNCTIONS.CurrencyRate(xx.CURE_CODE,date'${endDate}') FSJEZRMB,--发生金额折人民币
          'RF01' LLSFGD,--利率是否固定
         tr.LAST_RATE LLSP,--利率水平
          --'TR99'  DJJZLX,--定价基准类型 
           case  when tr.CURRENCY_NO='CNY' then 'TR01' else 'TR99' end DJJZLX,--定价基准类型 
          null JZLL,--基准利率        
          'B99' JXFS,--计息方式 
         decode(tr.DIR_FLAG,'2','1','1','0')  FLAG ---发生/结清标识
    from DH_FB_TXPJ pj
    left join DH_BMS_PJXX xx on xx.BILLNO = pj.NOTE_NO
    left join DH_TRDISCOUNT_INFO tr   on pj.BID  = tr.BID
    left join DH_GL_CLTINFO ds   on ds.cltno = tr.OP_CUSTNO
    where pj.TX_TYPE = '2'
    and pj.TX_DATE between date'${startDate}' and date'${endDate}'
	and tr.MATURITY is not null
    and  tr.ht_s_dt <= date'${endDate}'
    and  tr.ht_e_dt > date'${endDate}'
    and  ds.ht_s_dt <= date'${endDate}'
    and  ds.ht_e_dt > date'${endDate}'
    and  xx.ht_s_dt <= date'${endDate}'
    and  xx.ht_e_dt > date'${endDate}'
    group by pj.V_DEPT_ID,xx.CURE_CODE,DIR_FLAG,
    ds.CREDIT_CODE,
    tr.CONTRACT_NO ,
    tr.DISCOUNT_TYPE,    
    ds.CLT_INFO_TYPE,
    tr.START_DATE,
    tr.MATURITY,
    pj.BUYBACK_DATE,
    tr.CURRENCY_NO,
    tr.LAST_RATE 
        ) u  ,head

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
