-- 步骤类型: N/A, 步骤名称: 存量同业借贷信息DW查询
-- 标签: name, 属性: {}, 内容: 存量同业借贷信息DW查询
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
select SEQ_DM_RFBS_CLTYJD.NEXTVAL ID,
       '${reportId}' REPORT_ID,
       '${BATCH}' BATCH,
          head.JRJGDM,--金融机构代码
          head.NBJGH,--内部机构号
        u.* 
   from(
   -----资产  同业拆出
  select cf.v_dept_id,--部门编号
         ds.CREDIT_CODE JYDSDM,--交易对手代码  
         'A01' JYDSDMLB,--交易对手代码类别
         cf.ORDER_ID HTBM,--合同编码
         'AL01' ZCFZLB,--资产负债类型   资产
         'F03'   CPLB,--产品类别
         to_char(cf.START_DATE,'YYYY-MM-DD') HTQSRQ,--合同起始日期
         to_char(cf.END_DATE,'YYYY-MM-DD')  HTDQRQ,--合同到期日期
         cf.CUR_CODE BZ ,--币种
         cf.YE HTYE,-- 合同余额
         cf.YE*PKG_RMM_FUNCTIONS.CurrencyRate(cf.CUR_CODE,date'${endDate}') HTYEZRMB,--合同余额折人民币
         decode(cf.LLLX,'1','RF01','2','RF02',null) LLSFGD,--利率是否固定
         cf.INTR_RATE LLSP,--利率水平         
       -- PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE = cf.BASE_RATE_TYPE)) DJJZLX,--定价基准类型
    --'TR99' DJJZLX,--定价基准类型
     case  when cf.CUR_CODE='CNY' then 'TR01' else 'TR99' end DJJZLX,--定价基准类型 
        case when cf.LLLX = '2' then 
      PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(cf.base_rate_type,cf.CUR_CODE,date'${endDate}')
    else null end JZLL,--基准利率
         PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','INTEREST_METHOD','JXFS',cf.INTEREST_METHOD) JXFS--计息方式
         from DH_IB_CFTY cf --同业资产交易表
         left join DH_GL_FINANC ds on ds.CLTNO = cf.OP_CUST_NO
        where cf.YE > 0 and substr(cf.BIZ_TYPE,0,3)= 'C02'
        and cf.ht_s_dt <= date'${endDate}'
        and cf.ht_e_dt > date'${endDate}'
        and ds.ht_s_dt <= date'${endDate}'
        and ds.ht_e_dt > date'${endDate}'
      UNION ALL
     ----负债 同业拆入
      select cf.v_dept_id,--部门编号       
         ds.CREDIT_CODE JYDSDM,--交易对手代码  
         'A01' JYDSDMLB,--交易对手代码类别
         cf.ORDER_ID HTBM,--合同编码
         'AL02' ZCFZLB,--资产负债类型   负债
         'F03'   CPLB,--产品类别
         to_char(cf.START_DATE,'YYYY-MM-DD') HTQSRQ,--合同起始日期
         to_char(cf.END_DATE,'YYYY-MM-DD')  HTDQRQ,--合同到期日期
         cf.CUR_CODE BZ ,--币种
         cf.YE HTYE,-- 合同余额
         cf.YE*PKG_RMM_FUNCTIONS.CurrencyRate(cf.CUR_CODE,date'${endDate}') HTYEZRMB,--合同余额折人民币
         decode(cf.LLLX,'1','RF01','2','RF02',null) LLSFGD,--利率是否固定
         cf.INTR_RATE LLSP,--利率水平
         --PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE =cf.BASE_RATE_TYPE)) DJJZLX,--定价基准类型 
    --'TR99' DJJZLX,--定价基准类型
    case  when cf.CUR_CODE='CNY' then 'TR01' else 'TR99' end DJJZLX,--定价基准类型 
         case when cf.LLLX = '2' then 
        PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(cf.base_rate_type,cf.CUR_CODE,date'${endDate}')
     else null end JZLL,--基准利率
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','INTEREST_METHOD','JXFS',cf.INTEREST_METHOD) JXFS--计息方式
    from DH_IB_TYCF cf --同业负债交易主表 
    left join DH_GL_FINANC ds  on ds.CLTNO = cf.OP_CUST_NO
    where cf.YE > 0 and substr(cf.BIZ_TYPE,0,3)= 'C04'
    and cf.ht_s_dt <= date'${endDate}'
    and cf.ht_e_dt > date'${endDate}'
    and ds.ht_s_dt <= date'${endDate}'
    and ds.ht_e_dt > date'${endDate}'
    and cf.start_date <=date'${endDate}'  --fyx 1115
 ----同业债券回购
      UNION ALL
      select repu.v_dept_id,--部门编号
         ds.CREDIT_CODE JYDSDM,--交易对手代码
         'A01' JYDSDMLB,--交易对手代码类别
      repu.BUSINESSNO HTBM,--合同编码
     case when repu.REPUR_TYPE in (2)
          then  'AL01' 
         when repu.REPUR_TYPE in (1)
          then  'AL02' 
      end ZCFZLB,--资产负债类型
          'F061'   CPLB,--产品类别
        to_char(repu.START_DATE,'YYYY-MM-DD') HTQSRQ,--合同起始日期
        to_char(repu.MATURITY,'YYYY-MM-DD')  HTDQRQ,--合同到期日期
        repu.CURE_CODE BZ ,--币种
        repu.FIRSTCLEARAMOUNT HTYE,-- 合同余额   
        repu.FIRSTCLEARAMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(repu.CURE_CODE,date'${endDate}') HTYEZRMB,--合同余额折人民币 
        'RF01' LLSFGD,--利率是否固定
        repu.BUYBACK_RATE LLSP,--利率水平
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE = repu.RATE_TYPE)) DJJZLX,--定价基准类型
        PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(repu.RATE_TYPE,repu.CURE_CODE,date'${endDate}') JZLL,--基准利率     
    PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','INTEREST_METHOD','JXFS',repu.INTEREST_METHOD) JXFS--计息方式
        from DH_IB_REPUR repu --同业债券回购主表
        left join DH_GL_FINANC ds   on ds.cltno = repu.TRADER 
        where repu.STATUS = '1'
        and repu.ht_s_dt <= date'${endDate}'
        and repu.ht_e_dt > date'${endDate}'
        and ds.ht_s_dt <= date'${endDate}'
        and ds.ht_e_dt > date'${endDate}'
 -- 信贷资产转让 
     UNION ALL 
        select zc.v_dept_id,--部门编号  
         ds.CREDIT_CODE JYDSDM,--交易对手代码
         'A01' JYDSDMLB,--交易对手代码类别
         ywht.CONTRACT_NO HTBM,--合同编码 
         case zc.BIZ_TYPE when '1' then 'AL01' 
               when '2' then 'AL02' 
         END ZCFZLB,--资产负债类型
         'F063'   CPLB,--产品类别
         to_char(to_date(zc.ZRJGRQ,'YYYY-MM-DD'),'YYYY-MM-DD') HTQSRQ,--合同起始日期
         to_char(zc.REBUY_DATE,'YYYY-MM-DD')  HTDQRQ,--合同到期日期
         zc.CURRENCY_NO BZ ,--币种
         zc.BALANCE HTYE,-- 合同余额      
         zc.BALANCE*PKG_RMM_FUNCTIONS.CurrencyRate(zc.CURRENCY_NO,date'${endDate}') HTYEZRMB,--合同余额折人民币
         decode(zc.RATE_IS_FLOAT,0, 'RF01', 1, 'RF02',null) LLSFGD,--利率是否固定
         zc.HGLL LLSP,--利率水平
    PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','BASE_INTR_TYPE','Pricing_Benchmark_Type',(select PRE_CODE from BRT where STANDARD_CODE = zc.RATE_TYPE)) DJJZLX,--定价基准类型 
        case when zc.RATE_IS_FLOAT = 1 then null
             else PKG_RMM_FUNCTIONS.GET_BASERATE_VALUE(zc.RATE_TYPE,zc.CURRENCY_NO,date'${endDate}') end  JZLL,--基准利率           
  PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','INTREST_PERIOD','JXFS',zc.INTREST_PERIOD) JXFS--计息方式  
    from DH_IB_ZCZRYWHT zc
    left join DH_GL_FINANC ds   on ds.cltno = zc.OP_CLTNO 
    left join DH_ZCZR_LIST li on li.bid = zc.bid
    left join DH_FB_YWHT ywht on ywht.CONTRACT_NO = li.CONTRACT_NO
    where  zc.ht_s_dt <= date'${endDate}'
    and   zc.ht_e_dt > date'${endDate}'
    and ds.ht_s_dt <= date'${endDate}'
    and ds.ht_e_dt > date'${endDate}'
    and li.ht_s_dt <= date'${endDate}'
    and li.ht_e_dt > date'${endDate}'
    and ywht.ht_s_dt <= date'${endDate}'
    and ywht.ht_e_dt > date'${endDate}'
    and zc.BALANCE > 0
    and zc.BIZ_TYPE in ('1','2')
 union all
--转贴现
        select tr.v_dept_id,--部门编号  
         ds.CREDIT_CODE JYDSDM,--交易对手代码
         'A01' JYDSDMLB,--交易对手代码类别
         tr.CONTRACT_NO HTBM,--合同编码 
         case when tr.DISCOUNT_TYPE = '1' and ds.CLT_INFO_TYPE = 0 then 'AL01' 
            when tr.DISCOUNT_TYPE = '1' and ds.CLT_INFO_TYPE != 0 then 'AL02' 
        when tr.DISCOUNT_TYPE = '2' and ds.CLT_INFO_TYPE = 0 then 'AL02' 
        when tr.DISCOUNT_TYPE = '2' and ds.CLT_INFO_TYPE != 0 then 'AL01' 
         else null  end ZCFZLB,--资产负债类型
         'F062'   CPLB,--产品类别
         to_char(tr.START_DATE,'YYYY-MM-DD') HTQSRQ,--合同起始日期
         case tr.DISCOUNT_TYPE when '1' then 
               to_char(tr.START_DATE,'YYYY-MM-DD')  ---买断式取贴现日期
              when '2' then to_char(tr.MATURITY,'YYYY-MM-DD')  --回购式取回购日期  
         end HTDQRQ,--合同到期日期
         tr.CURRENCY_NO BZ ,--币种
         tr.AMOUNT HTYE,-- 合同余额      
         tr.AMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(tr.CURRENCY_NO,date'${endDate}') HTYEZRMB,--合同余额折人民币
         'RF01'  LLSFGD,--利率是否固定
         tr.LAST_RATE LLSP,--利率水平
         --'TR99' DJJZLX,--定价基准类型  
         case  when tr.CURRENCY_NO='CNY' then 'TR01' else 'TR99' end DJJZLX,--定价基准类型  
          null  JZLL,--基准利率     
        'B99'  JXFS--计息方式  
   from DH_TRDISCOUNT_INFO tr
   left join DH_GL_CLTINFO ds   on ds.cltno = tr.OP_CUSTNO
   where tr.AMOUNT >0
    and  tr.ht_s_dt <= date'${endDate}'
    and  tr.ht_e_dt > date'${endDate}'
    and  ds.ht_s_dt <= date'${endDate}'
    and  ds.ht_e_dt > date'${endDate}'
  and 1=0
        ) u,head

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
