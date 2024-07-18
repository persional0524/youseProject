-- 步骤类型: N/A, 步骤名称: 从表DH_SM_CKCD取数
-- 标签: name, 属性: {}, 内容: 从表DH_SM_CKCD取数
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
with head as (
 select org.ORG_CLTNO NBJGH,
    org.ORG_CREDIT_CODE JRJGDM,
        org.org_area JRJGDQDM,
      'DR0' || org.DEPOSIT_RESERVE_WAY RESERVE_WAY
   from dm_pub_org org
  where org.org_type = 1)
select  '${reportId}' REPORT_ID,
        '${BATCH}' BATCH,
    head.JRJGDM JRJGDM,--金融机构代码
    head.NBJGH NBJGH,--金融机构代码
    head.RESERVE_WAY  JCZBJFS,--缴存准备金方式
    tab.*,
    'system'  CREATER,
    sysdate CREATE_TIME
 from (
    --活期存款
    select distinct D.V_DEPT_ID,--部门编号
    'A01' KHZJLX,--客户证件类型
    C.CREDIT_CODE KHZJDM,--客户证件代码
    C.BUSS_ADDR ZCDZ,--注册地址
    case C.AREA
    --when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 1 then decode(c.DISTRICT,'542225','540524','542221','540502','652201','650500','340702','340705',c.DISTRICT) --琼结县转码值 
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.ACCOUNT_NO  CKXYDM,--存款协议代码
    'D011' CKCPLB,--存款产品类别
    Z.KHRQ  CKXYQSRQ,--存款协议起始日期
    '9999-12-31' CKXYDQRQ,--存款协议到期日期
    Z.BZ  BZ,--币种
    B.BALANCE CKYE,--存款余额
    case when Z.BZ = 'CNY'  then B.BALANCE
             when Z.BZ != 'CNY' then B.BALANCE * PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end CKYEZRMB,--存款余额折人民币
    D.RATE_VALUE  LLSP--利率水平
    from DH_SM_CKCD D
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
    --and (D.END_DATE  >  date'${endDate}' or D.END_DATE is null or B.BALANCE != 0)
    and B.BALANCE != 0
    and D.BIZ_TYPE_ID in ('A01','D011')
    and z.mxkmbh not like '2012%'
    AND not EXISTS
    (SELECT 1
          FROM dh_sm_ckcd C
         WHERE C.ht_s_dt <= date '${endDate}'
           and C.ht_e_dt > date '${endDate}'
           AND biz_type_id = 'A01012'
           and c.account_no = D.account_no)
    --定期存款
    union all
    select distinct D.V_DEPT_ID,--部门编号
    'A01' KHZJLX,--客户证件类型
    C.CREDIT_CODE KHZJDM,--客户证件代码
    C.BUSS_ADDR ZCDZ,--注册地址
    case C.AREA
    when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO   CKXYDM,--存款协议代码
    'D012' CKCPLB,--存款产品类别
    to_char(D.BEGIN_DATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    to_char(D.END_DATE,'YYYY-MM-DD') CKXYDQRQ,--存款协议到期日期
    Z.BZ  BZ,--币种
    B.BALANCE CKYE,--存款余额
    case when Z.BZ = 'CNY'  then B.BALANCE
             when Z.BZ != 'CNY' then B.BALANCE * PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end CKYEZRMB,--存款余额折人民币
    D.RATE_VALUE  LLSP--利率水平
    from DH_SM_CKCD D
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
      and B.BALANCE != 0
    and D.BIZ_TYPE_ID in ('01','02','03','04','05','08','09') 
    and z.mxkmbh not like '2012%'
    --通知存款
    union all
    select distinct D.V_DEPT_ID,--部门编号
    'A01' KHZJLX,--客户证件类型
    C.CREDIT_CODE KHZJDM,--客户证件代码
    C.BUSS_ADDR ZCDZ,--注册地址
    case C.AREA
    when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO CKXYDM,--存款协议代码
    'D03' CKCPLB,--存款产品类别
    to_char(D.BEGIN_DATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    decode(D.BIZ_TYPE_ID,'06','1999-01-01','07','1999-01-07')  CKXYDQRQ,--存款协议到期日期
    Z.BZ  BZ,--币种
    B.BALANCE CKYE,--存款余额
    case when Z.BZ = 'CNY'  then B.BALANCE
             when Z.BZ != 'CNY' then B.BALANCE * PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end CKYEZRMB,--存款余额折人民币
    D.RATE_VALUE  LLSP--利率水平
    from DH_SM_CKCD D
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    --left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
	left join DH_DEPOSIT_BALANCE B ON B.TZ_ACCOUNT_NO = D.TZ_ACCOUNT_NO
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
      and B.BALANCE != 0
    and D.BIZ_TYPE_ID in ('06','07')
and z.mxkmbh not like '2012%'
    --协议存款
    union all
    select distinct D.V_DEPT_ID,--部门编号
    'A01' KHZJLX,--客户证件类型
    C.CREDIT_CODE KHZJDM,--客户证件代码
    C.BUSS_ADDR ZCDZ,--注册地址
    case C.AREA
    when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.CERTNUMBER  CKXYDM,--存款协议代码
    'D04' CKCPLB,--存款产品类别
    to_char(D.BEGIN_DATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    to_char(D.END_DATE,'YYYY-MM-DD')  CKXYDQRQ,--存款协议到期日期
    Z.BZ  BZ,--币种
    B.BALANCE CKYE,--存款余额
    case when Z.BZ = 'CNY'  then B.BALANCE
             when Z.BZ != 'CNY' then B.BALANCE * PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end CKYEZRMB,--存款余额折人民币
    D.RATE_VALUE  LLSP--利率水平
    from DH_SM_CKCD D
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
      and B.BALANCE != 0
    and D.BIZ_TYPE_ID in ('D04')
  and z.mxkmbh not like '2012%'
    --协定存款   结算户
    union all
    /* select distinct D.V_DEPT_ID,--部门编号
    'A01' KHZJLX,--客户证件类型
    C.CREDIT_CODE KHZJDM,--客户证件代码
    C.BUSS_ADDR ZCDZ,--注册地址
    case C.AREA
    when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO CKXYDM,--存款协议代码
    'D051' CKCPLB,--存款产品类别
    to_char(T.XD_SDATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    nvl(to_char(T.XD_EDATE,'YYYY-MM-DD'),'9999-12-31')  CKXYDQRQ,--存款协议到期日期
    Z.BZ  BZ,--币种
    CASE WHEN  D.BIZ_TYPE_ID='A01011' THEN  B.BALANCE
         WHEN  D.BIZ_TYPE_ID='A0101'  AND   B.BALANCE>T.XDED  THEN  T.XDED
       WHEN  D.BIZ_TYPE_ID='A0101'  AND   B.BALANCE<=T.XDED  THEN  B.BALANCE
    END AS  CKYE,--存款余额
    case when Z.BZ = 'CNY'  then B.BALANCE
             when Z.BZ != 'CNY' then B.BALANCE * PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end CKYEZRMB,--存款余额折人民币
    D.RATE_VALUE  LLSP--利率水平
    from DH_SM_CKCD D
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    left join DH_SM_AGREEMENT T ON T.DEPOSIT_ID = B.DEPOSIT_ID
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and T.ht_s_dt <=  date'${endDate}'
    and T.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
    and B.BALANCE != 0
    and D.BIZ_TYPE_ID in ('A0101','A01011')*/

  select distinct D.V_DEPT_ID,--部门编号
    'A01' KHZJLX,--客户证件类型
    C.CREDIT_CODE KHZJDM,--客户证件代码
    C.BUSS_ADDR ZCDZ,--注册地址
    case C.AREA
    --when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 1 then decode(c.DISTRICT,'542225','540524','542221','540502','652201','650500','340702','340705',c.DISTRICT) --琼结县转码值 
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.ACCOUNT_NO  CKXYDM,--存款协议代码
    'D051' CKCPLB,--存款产品类别
    Z.KHRQ  CKXYQSRQ,--存款协议起始日期
    '9999-12-31' CKXYDQRQ,--存款协议到期日期
    Z.BZ  BZ,--币种
    B.BALANCE CKYE,--存款余额
    case when Z.BZ = 'CNY'  then B.BALANCE
             when Z.BZ != 'CNY' then B.BALANCE * PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'2021-11-30') end CKYEZRMB,--存款余额折人民币
    D.RATE_VALUE  LLSP--利率水平
    from DH_SM_CKCD D
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    and B.BALANCE != 0
    and D.BIZ_TYPE_ID in ('A01','D011')
    and z.mxkmbh not like '2012%'
    AND  EXISTS
     (SELECT 1
          FROM dh_sm_ckcd C
         WHERE C.ht_s_dt <= date '${endDate}'
           and C.ht_e_dt > date '${endDate}'
           AND biz_type_id = 'A01012'
           and c.account_no = D.account_no)
    --协定存款  协定户
    union all
    select distinct D.V_DEPT_ID,--部门编号
    'A01' KHZJLX,--客户证件类型
    C.CREDIT_CODE KHZJDM,--客户证件代码
    C.BUSS_ADDR ZCDZ,--注册地址
    case C.AREA
    --when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 1 then decode(c.DISTRICT,'542225','540524','542221','540502','652201','650500','340702','340705',c.DISTRICT) --琼结县转码值 
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO CKXYDM,--存款协议代码
    'D052' CKCPLB,--存款产品类别
    to_char(T.XD_SDATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    nvl(to_char(T.XD_EDATE,'YYYY-MM-DD'),'9999-12-31')  CKXYDQRQ,--存款协议到期日期
    Z.BZ  BZ,--币种
    CASE WHEN D.BIZ_TYPE_ID='A01012'  THEN B.BALANCE 
         WHEN D.BIZ_TYPE_ID='A0101'   THEN B.BALANCE-T.XDED 
    END   CKYE,--存款余额
    case when Z.BZ = 'CNY'  then B.BALANCE
             when Z.BZ != 'CNY' then B.BALANCE * PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end CKYEZRMB,--存款余额折人民币
    T.XDLL  LLSP--利率水平
    from DH_SM_CKCD D
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    left join DH_SM_AGREEMENT T ON T.DEPOSIT_ID = B.DEPOSIT_ID
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and T.ht_s_dt <=  date'${endDate}'
    and T.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
    --and (D.BIZ_TYPE_ID in ('A01012') OR (D.BIZ_TYPE_ID IN  ('A0101')  AND  B.BALANCE>=T.XDED))
    --and (D.END_DATE  >  date'${endDate}' or D.END_DATE is null or B.BALANCE != 0)
    and B.BALANCE != 0
      and d.BIZ_TYPE_ID in ('A01012','A0101')
    and z.mxkmbh not like '2012%'
    --保证金存款
    union all
    select distinct D.V_DEPT_ID,--部门编号
    'A01' KHZJLX,--客户证件类型
    C.CREDIT_CODE KHZJDM,--客户证件代码
    C.BUSS_ADDR ZCDZ,--注册地址
    case C.AREA
    when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO    CKXYDM,--存款协议代码
    case 
       when D.BIZ_TYPE_ID in ('D061','D0611','D0612','0001','0005') then 'D061' --银行承兑汇票保证金存款
       when D.BIZ_TYPE_ID in ('D062','0002','0006') then 'D062' --信用证保证金存款
       when D.BIZ_TYPE_ID in ('D063','D0631','D0632','0004','0008') then 'D063' --保函保证金存款
       when D.BIZ_TYPE_ID in ('D064','D06701','D06702') then 'D064' --保函保证金存款
       when D.BIZ_TYPE_ID in ('D065','D06601','D06602') then 'D065' --信用卡保证金存款
       when D.BIZ_TYPE_ID in ('D066') then 'D066' --金融衍生品交易保证金存款
       when D.BIZ_TYPE_ID in ('D067') then 'D067' --黄金交易保证金存款
       when D.BIZ_TYPE_ID in ('D068') then 'D068' --证券交易保证金存款
       when D.BIZ_TYPE_ID in ('D069','D0691','D0692','0003','0007','9999') then 'D069' --其他保证金存款
    end  CKCPLB,--存款产品类别
    to_char(D.BEGIN_DATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    --to_char(D.END_DATE,'YYYY-MM-DD')  CKXYDQRQ,--存款协议到期日期
    nvl(to_char(D.END_DATE,'YYYY-MM-DD'),'9999-12-31')  CKXYDQRQ,--存款协议到期日期
    Z.BZ  BZ,--币种
    B.BALANCE CKYE,--存款余额
    case when Z.BZ = 'CNY'  then B.BALANCE
             when Z.BZ != 'CNY' then B.BALANCE * PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end CKYEZRMB,--存款余额折人民币
    D.RATE_VALUE  LLSP--利率水平
    from DH_SM_CKCD D
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
      --and (D.END_DATE  >  date'2022-02-28' or D.END_DATE is null or B.BALANCE != 0)
    and B.BALANCE != 0
    and D.BIZ_TYPE_ID in (
    'D061','0001','0005','D0611','D0612','D0631','D0632','D0691','D0692',
    'D062','0002','0006',
    'D063','0004','0008',
    'D064','D06701','D06702',
    'D065','D06601','D06602',
    'D066',
    'D067',
    'D068',
    'D069','0003','0007','9999')) tab,head

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
