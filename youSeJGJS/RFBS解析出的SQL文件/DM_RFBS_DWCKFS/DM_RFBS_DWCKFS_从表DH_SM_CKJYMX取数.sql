-- 步骤类型: N/A, 步骤名称: 从表DH_SM_CKJYMX取数
-- 标签: name, 属性: {}, 内容: 从表DH_SM_CKJYMX取数
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
with head as (
 select org.ORG_CLTNO NBJGH,
    org.ORG_CREDIT_CODE  JRJGDM,
        org.org_area JRJGDQDM,
      'DR0' || org.DEPOSIT_RESERVE_WAY RESERVE_WAY
   from dm_pub_org org
  where org.org_type = 1),
  JYDS as (
        select * from (   
        select distinct a.CERT_TYPE_CODE, a.CERT_NUM, a.OP_NAME, a.OP_TYPE,row_number() over (partition by a.op_name order by CREATE_TIME desc ) fn  from CUST_OP_INFO@DCAB_DM  a
        where  CERT_NUM not like '% %' ) a where fn=1
  ),
  YHHH as -- 银行行号
  (select distinct JYDSCKZHBM, max(trim(JYDSZHKHHH)) JYDSZHKHHH from dm_rfbs_dwckfs@dcab_dm where JYDSZHKHHH is not null group by JYDSCKZHBM
   )

select  '${reportId}' REPORT_ID,
        '${BATCH}' BATCH,
    head.JRJGDM JRJGDM,--金融机构代码
    head.NBJGH NBJGH,--内部机构号
    --head.RESERVE_WAY  JCZBJFS,--缴存准备金方式
    tab.*,
    'system'  CREATER,
    sysdate  CREATE_TIME
 from (
    --活期存款
    select jymx.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    --when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 1 then decode(c.DISTRICT,'542225','540524','542221','540502','652201','650500','340702','340705',c.DISTRICT) --琼结县转码值 
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.ACCOUNT_NO   CKXYDM,--存款协议代码
    'D011' CKCPLB,--存款产品类别
    Z.KHRQ  CKXYQSRQ,--存款协议起始日期
    '9999-12-31' CKXYDQRQ,--存款协议到期日期
    case when Z.XHRQ <='${endDate}' and jymx.JYFS=2 and Z.XHRQ=to_char(jymx.BOOK_DATE,'yyyy-mm-dd')  then Z.XHRQ else null end  CKXYSJZZRQ,--存款协议实际终止日期
    Z.BZ  CKBZ,--币种
  abs(jymx.AMOUNT)  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then abs(jymx.AMOUNT)
             when Z.BZ != 'CNY' then abs(jymx.AMOUNT) * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${endDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    D.RATE_VALUE  LLSP,--利率水平
    to_char(jymx.BOOK_DATE,'yyyy-mm-dd') JYRQ,--交易日期
    jymx.TRADE_ID JYLSH,--交易流水号
    --decode(jymx.JYFS,1,'1',2,'0') JYFX,--交易方向
  case when jymx.AMOUNT<0 then  decode(jymx.JYFS,1,'0',2,'1')   else decode(jymx.JYFS,1,'1',2,'0') end JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    case jymx.BZHYT when 'A' then null else decode(jymx.dgdsbz,'1',jymx.op_name,'2',null,jymx.op_name) end JYDSMC,--交易对手名称
    decode(jymx.BZHYT,'A',null,jymx.op_acct)   JYDSCKZHBM,--交易对手存款账户编码
    --decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH,) JYDSZHKHHH,--交易对手账户开户行号
    case when BANK_NAME ='有色矿业集团财务有限公司'  then '907521000084' else nvl(jymx.JYDSZHKHHH,YHHH.JYDSZHKHHH) end JYDSZHKHHH,--交易对手账户开户行号
    case when nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM) is null then null else --decode(jymx.BZHYT,'A',null,NULL,jymx.JYDSZJLX,'A01')
  NVL(jymx.JYDSZJLX,'A01') end JYDSZJLX,--交易对手证件类型
    --decode(jymx.BZHYT,'A',null,jymx.JYDSDM,clt.CREDIT_CODE) JYDSZJDM,--交易对手代码
    nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM)  JYDSZJDM,--交易对手代码
    --nvl(jymx.BZHYT,jymx.REMARK)  CKJYYT--存款交易用途
REGEXP_REPLACE(nvl(jymx.BZHYT,jymx.REMARK),'([|,@,\,/,#,?,!,？,！,&,$,||,*,.,^,+,_,-])|\s',' ')   CKJYYT--存款交易用途 
    from DH_SM_CKJYMX jymx
    left join DH_SM_CKCD D on D.DEPOSIT_ID = jymx.DEPOSIT_ID
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    --left join DH_GL_CLTINFO Clt on REGEXP_REPLACE(Clt.chinese_name,'(\(.*\）|\（.*\）)','') = REGEXP_REPLACE(jymx.op_name,'(\(.*\）|\（.*\）)','') and Clt.ht_s_dt <=  date'${endDate}' and Clt.ht_e_dt >  date'${endDate}'
    left join DH_GL_CLTINFO Clt on replace(replace(replace(replace(Clt.chinese_name,'(',''),')',''),'（',''),'）','') = replace(replace(replace(replace(jymx.op_name,'(',''),')',''),'（',''),'）','')
 and Clt.ht_s_dt <=  date'${endDate}' and Clt.ht_e_dt >  date'${endDate}'
  and  clt.cltstate not in (2,1)
left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    left join JYDS  on jymx.op_name=jyds.op_name
    left join YHHH  on YHHH.JYDSCKZHBM=decode(jymx.BZHYT,'A',null,jymx.op_acct)  and jymx.JYDSZHKHHH is null
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
  and jymx.BOOK_DATE between  date'${startDate}' and  date'${endDate}'
    and D.BIZ_TYPE_ID in ('A01','D011')
    and (EXISTS (SELECT  1 from DH_SM_CKCD ck where  ck.ht_s_dt <=  date'${endDate}'
    and ck.ht_e_dt >  date'${endDate}'  and ck.BIZ_TYPE_ID = 'A01012' 
    and ck.account_no = d.account_no  GROUP BY ck.account_no HAVING jymx.BOOK_DATE <= MIN(ck.BEGIN_DATE)) -- and jymx.BOOK_DATE< ck.BEGIN_DATE )
    or not EXISTS (SELECT  1 from DH_SM_CKCD ck where  ck.ht_s_dt <=  date'${endDate}'
    and ck.ht_e_dt >  date'${endDate}'  and ck.BIZ_TYPE_ID = 'A01012' 
    and ck.account_no = d.account_no ))
    and  z.mxkmbh not like '2012%'
   /* and d.account_no not in  ( select ck.account_no from DH_SM_CKCD ck where  ck.ht_s_dt <=  date'${endDate}'
    and ck.ht_e_dt >  date'${endDate}'  and ck.BIZ_TYPE_ID = 'A01012' )*/
    --定期存款
    union all
    select jymx.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    when 1 then c.ADMIN_DIVISION
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end  KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO   CKXYDM,--存款协议代码
    'D012' CKCPLB,--存款产品类别
    to_char(D.BEGIN_DATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    to_char(D.END_DATE,'YYYY-MM-DD') CKXYDQRQ,--存款协议到期日期
    case  when  D.ACCT_END_DATE<= DATE'${endDate}' and jymx.JYFS=2 and D.ACCT_END_DATE=jymx.BOOK_DATE then to_char(D.ACCT_END_DATE,'YYYY-MM-DD') else null end CKXYSJZZRQ, --存款协议实际终止日期
    Z.BZ  CKBZ,--币种
    jymx.AMOUNT  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then jymx.AMOUNT
             when Z.BZ != 'CNY' then jymx.AMOUNT * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${endDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    D.RATE_VALUE  LLSP,--利率水平
    to_char(jymx.BOOK_DATE,'yyyy-mm-dd') JYRQ,--交易日期
    jymx.TRADE_ID JYLSH,--交易流水号
    decode(jymx.JYFS,1,'1',2,'0') JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    case jymx.BZHYT when 'A' then null else decode(jymx.dgdsbz,'1',jymx.op_name,'2',null,jymx.op_name) end JYDSMC,--交易对手名称
  decode(jymx.BZHYT,'A',null,jymx.op_acct)   JYDSCKZHBM,--交易对手存款账户编码
    --decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH,) JYDSZHKHHH,--交易对手账户开户行号
    case when BANK_NAME ='有色矿业集团财务有限公司'  then '907521000084' else jymx.JYDSZHKHHH end JYDSZHKHHH,--交易对手账户开户行号
    case when nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM) is null then null else --decode(jymx.BZHYT,'A',null,jymx.JYDSZJLX) 
    NVL(jymx.JYDSZJLX,'A01') end JYDSZJLX,--交易对手证件类型
    --decode(jymx.BZHYT,'A',null,jymx.JYDSDM,clt.CREDIT_CODE) JYDSZJDM,--交易对手代码
    nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM)  JYDSZJDM,--交易对手代码
    --nvl(jymx.BZHYT,jymx.REMARK)  CKJYYT--存款交易用途
REGEXP_REPLACE(nvl(jymx.BZHYT,jymx.REMARK),'([|,@,\,/,#,?,!,？,！,&,$,||,*,.,^,+,_,-])|\s',' ')   CKJYYT--存款交易用途 
    from DH_SM_CKJYMX jymx
    left join DH_SM_CKCD D on D.DEPOSIT_ID = jymx.DEPOSIT_ID
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
  left join DH_GL_CLTINFO Clt on REGEXP_REPLACE(Clt.chinese_name,'(\(.*\）|\（.*\）)','') = REGEXP_REPLACE(jymx.op_name,'(\(.*\）|\（.*\）)','') and Clt.ht_s_dt <=  date'${endDate}' and Clt.ht_e_dt >  date'${endDate}'
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    left join JYDS  on jymx.op_name=jyds.op_name
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
    and jymx.BOOK_DATE between  date'${startDate}' and  date'${endDate}'
    and D.BIZ_TYPE_ID in ('01','02','03','04','05','08','09')
    and  z.mxkmbh not like '2012%'
    --通知存款
    union all
    select jymx.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    when 1 then c.ADMIN_DIVISION
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end  KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO   CKXYDM,--存款协议代码
    'D03' CKCPLB,--存款产品类别
    to_char(D.BEGIN_DATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    decode(D.BIZ_TYPE_ID,'06','1999-01-01','07','1999-01-07')  CKXYDQRQ,--存款协议到期日期
    case when jymx.JYFS = '2'  then to_char(jymx.BOOK_DATE,'YYYY-MM-DD')
      else null end CKXYSJZZRQ, --存款协议实际终止日期
    Z.BZ  CKBZ,--币种
    jymx.AMOUNT  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then jymx.AMOUNT
             when Z.BZ != 'CNY' then jymx.AMOUNT * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${endDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    D.RATE_VALUE  LLSP,--利率水平
    to_char(jymx.BOOK_DATE,'yyyy-mm-dd') JYRQ,--交易日期
    jymx.TRADE_ID JYLSH,--交易流水号
    decode(jymx.JYFS,1,'1',2,'0') JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    case jymx.BZHYT when 'A' then null else decode(jymx.dgdsbz,'1',jymx.op_name,'2',null,jymx.op_name) end JYDSMC,--交易对手名称
    decode(jymx.BZHYT,'A',null,jymx.op_acct)   JYDSCKZHBM,--交易对手存款账户编码
    --decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH,) JYDSZHKHHH,--交易对手账户开户行号
    case when BANK_NAME ='有色矿业集团财务有限公司'  then '907521000084' else jymx.JYDSZHKHHH end JYDSZHKHHH,--交易对手账户开户行号
    case when nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM) is null then null else --decode(jymx.BZHYT,'A',null,jymx.JYDSZJLX) 
    NVL(jymx.JYDSZJLX,'A01') end JYDSZJLX,--交易对手证件类型
    --decode(jymx.BZHYT,'A',null,jymx.JYDSDM,clt.CREDIT_CODE) JYDSZJDM,--交易对手代码
    nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM)  JYDSZJDM,--交易对手代码
    --nvl(jymx.BZHYT,jymx.REMARK)  CKJYYT--存款交易用途
    case when nvl(jymx.BZHYT,jymx.REMARK) is not null then  REGEXP_REPLACE(nvl(jymx.BZHYT,jymx.REMARK),'([|,@,\,/,#,?,!,？,！,&,$,||,*,.,^,+,_,-])|\s',' ') 
      else ( case when jymx.JYFS=1 then '通知存款存入' else '通知存款支取' end
        ) end CKJYYT--存款交易用途 
    from DH_SM_CKJYMX jymx
    left join DH_SM_CKCD D on D.DEPOSIT_ID = jymx.DEPOSIT_ID
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
    left join DH_GL_CLTINFO Clt on REGEXP_REPLACE(Clt.chinese_name,'(\(.*\）|\（.*\）)','') = REGEXP_REPLACE(jymx.op_name,'(\(.*\）|\（.*\）)','') and Clt.ht_s_dt <=  date'${endDate}' and Clt.ht_e_dt >  date'${endDate}'
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    --left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    left join JYDS  on jymx.op_name=jyds.op_name
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
   -- and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
    and jymx.BOOK_DATE between  date'${startDate}' and  date'${endDate}'
    and D.BIZ_TYPE_ID in ('06','07')
    and  z.mxkmbh not like '2012%'
    --协议存款
    union all
    select jymx.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    when 1 then c.ADMIN_DIVISION
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end  KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.CERTNUMBER   CKXYDM,--存款协议代码
    'D04' CKCPLB,--存款产品类别
    to_char(D.BEGIN_DATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    to_char(D.END_DATE,'YYYY-MM-DD')  CKXYDQRQ,--存款协议到期日期
    to_char(D.ACCT_END_DATE,'YYYY-MM-DD') CKXYSJZZRQ, --存款协议实际终止日期
    Z.BZ  CKBZ,--币种
    jymx.AMOUNT  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then jymx.AMOUNT
             when Z.BZ != 'CNY' then jymx.AMOUNT * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${endDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    D.RATE_VALUE  LLSP,--利率水平
    to_char(jymx.BOOK_DATE,'yyyy-mm-dd') JYRQ,--交易日期
    jymx.TRADE_ID JYLSH,--交易流水号
    decode(jymx.JYFS,1,'1',2,'0') JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    case jymx.BZHYT when 'A' then null else decode(jymx.dgdsbz,'1',jymx.op_name,'2',null) end JYDSMC,--交易对手名称
    decode(jymx.BZHYT,'A',null,jymx.op_acct)   JYDSCKZHBM,--交易对手存款账户编码
    decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH) JYDSZHKHHH,--交易对手账户开户行号
    decode(jymx.BZHYT,'A',null,jymx.JYDSZJLX) JYDSZJLX,--交易对手证件类型
    decode(jymx.BZHYT,'A',null,jymx.JYDSDM) JYDSZJDM,--交易对手代码
    nvl(jymx.BZHYT,jymx.REMARK)  CKJYYT--存款交易用途
    from DH_SM_CKJYMX jymx
    left join DH_SM_CKCD D on D.DEPOSIT_ID = jymx.DEPOSIT_ID
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
    and jymx.BOOK_DATE between  date'${startDate}' and  date'${endDate}'
    and D.BIZ_TYPE_ID in ('D04')
    and  z.mxkmbh not like '2012%'
    --协定存款当期到期
    union all
  select distinct jymx.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    --when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 1 then decode(c.DISTRICT,'542225','540524','542221','540502','652201','650500','340702','340705',c.DISTRICT) --琼结县转码值 
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO CKXYDM,--存款协议代码
    CASE WHEN  D.BIZ_TYPE_ID ='A01011' THEN 'D051'
         WHEN  D.BIZ_TYPE_ID ='A01012' THEN 'D052'
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE<=T.XDED THEN 'D051'
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE>T.XDED THEN 'D052'
    END CKCPLB,--存款产品类别
    to_char(T.XD_SDATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    nvl(to_char(T.XD_EDATE,'YYYY-MM-DD'),'99991-12-31')  CKXYDQRQ,--存款协议到期日期
    case  when  D.ACCT_END_DATE<= DATE'${endDate}' and jymx.JYFS=2 and D.ACCT_END_DATE=jymx.BOOK_DATE then to_char(D.ACCT_END_DATE,'YYYY-MM-DD') else null end CKXYSJZZRQ, --存款协议实际终止日期
    Z.BZ  CKBZ,--币种
    abs(jymx.AMOUNT)  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then abs(jymx.AMOUNT)
             when Z.BZ != 'CNY' then abs(jymx.AMOUNT) * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${endDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    CASE WHEN  D.BIZ_TYPE_ID ='A01011' THEN D.RATE_VALUE
         WHEN  D.BIZ_TYPE_ID ='A01012' THEN T.XDLL
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE<=T.XDED THEN D.RATE_VALUE
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE>T.XDED THEN T.XDLL
    END LLSP,--利率水平
    to_char(jymx.BOOK_DATE,'yyyy-mm-dd') JYRQ,--交易日期
    jymx.TRADE_ID JYLSH,--交易流水号
     case when jymx.AMOUNT<0 then  decode(jymx.JYFS,1,'0',2,'1')   else decode(jymx.JYFS,1,'1',2,'0') end JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    case jymx.BZHYT when 'A' then null else decode(jymx.dgdsbz,'1',jymx.op_name,'2',null,jymx.op_name) end JYDSMC,--交易对手名称
    decode(jymx.BZHYT,'A',null,jymx.op_acct)   JYDSCKZHBM,--交易对手存款账户编码
    --decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH,) JYDSZHKHHH,--交易对手账户开户行号
    case when BANK_NAME ='有色矿业集团财务有限公司'  then '907521000084' else nvl(jymx.JYDSZHKHHH,YHHH.JYDSZHKHHH) end JYDSZHKHHH,--交易对手账户开户行号
    case when nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM) is null then null else --decode(jymx.BZHYT,'A',null,jymx.JYDSZJLX) 
NVL(jymx.JYDSZJLX,'A01') end JYDSZJLX,--交易对手证件类型
    --decode(jymx.BZHYT,'A',null,jymx.JYDSDM,clt.CREDIT_CODE) JYDSZJDM,--交易对手代码
    nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM)  JYDSZJDM,--交易对手代码
    --nvl(jymx.BZHYT,jymx.REMARK)  CKJYYT--存款交易用途
REGEXP_REPLACE(nvl(jymx.BZHYT,jymx.REMARK),'([|,@,\,/,#,?,!,？,！,&,$,||,*,.,^,+,_,-])|\s',' ')   CKJYYT--存款交易用途 
   -- select  count(jymx.TRADE_ID)
    from DH_SM_CKJYMX jymx
    left join DH_SM_CKCD D on D.ACCOUNT_NO = jymx.ACCOUNT_NO
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
  left join DH_GL_CLTINFO Clt on REGEXP_REPLACE(Clt.chinese_name,'(\(.*\）|\（.*\）)','') = REGEXP_REPLACE(jymx.op_name,'(\(.*\）|\（.*\）)','') and Clt.ht_s_dt <=  date'${endDate}' and Clt.ht_e_dt >  date'${endDate}'
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    left join DH_SM_AGREEMENT T ON T.DEPOSIT_ID = B.DEPOSIT_ID
    left join JYDS  on jymx.op_name=jyds.op_name
    left join YHHH  on YHHH.JYDSCKZHBM=decode(jymx.BZHYT,'A',null,jymx.op_acct) and jymx.JYDSZHKHHH is null
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and T.ht_s_dt <=  date'${endDate}'
    and T.ht_e_dt >  date'${endDate}'
 and B.TX_DATE = d.acct_end_date
    --and (D.STATE in (1,2) or B.BALANCE != 0)
 -- and (nvl(d.acct_end_date,T.XD_EDATE) >= jymx.BOOK_DATE or d.acct_end_date is  null)
  and  d.acct_end_date >= jymx.BOOK_DATE  and  jymx.BOOK_DATE > T.XD_SDATE
  and jymx.BOOK_DATE between  date'${startDate}' and  date'${endDate}'
    and D.BIZ_TYPE_ID in ('A0101','A01011','A01012')   
    and d.acct_end_date between date'${startDate}' and date'${endDate}'
    and d.balance =0
    and z.mxkmbh not like '2012%'

--协定存款未到期
union all
 select distinct jymx.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    --when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 1 then decode(c.DISTRICT,'542225','540524','542221','540502','652201','650500','340702','340705',c.DISTRICT) --琼结县转码值 
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO CKXYDM,--存款协议代码
    CASE WHEN  D.BIZ_TYPE_ID ='A01011' THEN 'D051'
         WHEN  D.BIZ_TYPE_ID ='A01012' THEN 'D052'
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE<=T.XDED THEN 'D051'
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE>T.XDED THEN 'D052'
    END CKCPLB,--存款产品类别
    to_char(T.XD_SDATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    nvl(to_char(T.XD_EDATE,'YYYY-MM-DD'),'99991-12-31')  CKXYDQRQ,--存款协议到期日期
    case  when  D.ACCT_END_DATE<= DATE'${endDate}' and jymx.JYFS=2 and D.ACCT_END_DATE=jymx.BOOK_DATE then to_char(D.ACCT_END_DATE,'YYYY-MM-DD') else null end CKXYSJZZRQ, --存款协议实际终止日期
    Z.BZ  CKBZ,--币种
    abs(jymx.AMOUNT)  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then abs(jymx.AMOUNT)
             when Z.BZ != 'CNY' then abs(jymx.AMOUNT) * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${endDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    CASE WHEN  D.BIZ_TYPE_ID ='A01011' THEN D.RATE_VALUE
         WHEN  D.BIZ_TYPE_ID ='A01012' THEN T.XDLL
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE<=T.XDED THEN D.RATE_VALUE
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE>T.XDED THEN T.XDLL
    END LLSP,--利率水平
    to_char(jymx.BOOK_DATE,'yyyy-mm-dd') JYRQ,--交易日期
    jymx.TRADE_ID JYLSH,--交易流水号
     case when jymx.AMOUNT<0 then  decode(jymx.JYFS,1,'0',2,'1')   else decode(jymx.JYFS,1,'1',2,'0') end JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    case jymx.BZHYT when 'A' then null else decode(jymx.dgdsbz,'1',jymx.op_name,'2',null,jymx.op_name) end JYDSMC,--交易对手名称
    decode(jymx.BZHYT,'A',null,jymx.op_acct)   JYDSCKZHBM,--交易对手存款账户编码
    --decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH,) JYDSZHKHHH,--交易对手账户开户行号
    case when BANK_NAME ='有色矿业集团财务有限公司'  then '907521000084' else nvl(jymx.JYDSZHKHHH,YHHH.JYDSZHKHHH) end JYDSZHKHHH,--交易对手账户开户行号
    case when nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM) is null then null else --decode(jymx.BZHYT,'A',null,jymx.JYDSZJLX) 
NVL(jymx.JYDSZJLX,'A01') end JYDSZJLX,--交易对手证件类型
    --decode(jymx.BZHYT,'A',null,jymx.JYDSDM,clt.CREDIT_CODE) JYDSZJDM,--交易对手代码
    nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM)  JYDSZJDM,--交易对手代码
    --nvl(jymx.BZHYT,jymx.REMARK)  CKJYYT--存款交易用途
REGEXP_REPLACE(nvl(jymx.BZHYT,jymx.REMARK),'([|,@,\,/,#,?,!,？,！,&,$,||,*,.,^,+,_,-])|\s',' ')   CKJYYT--存款交易用途 
    from DH_SM_CKJYMX jymx
    left join DH_SM_CKCD D on D.ACCOUNT_NO = jymx.ACCOUNT_NO
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
  left join DH_GL_CLTINFO Clt on REGEXP_REPLACE(Clt.chinese_name,'(\(.*\）|\（.*\）)','') = REGEXP_REPLACE(jymx.op_name,'(\(.*\）|\（.*\）)','') and Clt.ht_s_dt <=  date'${endDate}' and Clt.ht_e_dt >  date'${endDate}'
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    left join DH_SM_AGREEMENT T ON T.DEPOSIT_ID = B.DEPOSIT_ID
    left join JYDS  on jymx.op_name=jyds.op_name
    left join YHHH  on YHHH.JYDSCKZHBM=decode(jymx.BZHYT,'A',null,jymx.op_acct) and jymx.JYDSZHKHHH is null
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
  and jymx.BOOK_DATE between  date'${startDate}' and  date'${endDate}'
    and D.BIZ_TYPE_ID in ('A0101','A01011','A01012')   
    and D.TZ_ACCOUNT_NO not in (
    select ck.TZ_ACCOUNT_NO from DH_SM_CKCD ck where  ck.ht_s_dt <=  date'${endDate}'
    and ck.ht_e_dt >  date'${endDate}'  and ck.BIZ_TYPE_ID = 'A01012' and ck.acct_end_date >date'${startDate}'
    ) and T.XD_SDATE <jymx.BOOK_DATE
and z.mxkmbh not like '2012%'
and (d.acct_end_date >date'${startDate}' or  d.acct_end_date is null)
union all --协定存款到期自动转出
select  d.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    --when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 1 then decode(c.DISTRICT,'542225','540524','542221','540502','652201','650500','340702','340705',c.DISTRICT) --琼结县转码值 
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO CKXYDM,--存款协议代码
    CASE WHEN  D.BIZ_TYPE_ID ='A01011' THEN 'D051'
         WHEN  D.BIZ_TYPE_ID ='A01012' THEN 'D052'
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE<=T.XDED THEN 'D051'
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE>T.XDED THEN 'D052'
    END CKCPLB,--存款产品类别
    to_char(T.XD_SDATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    nvl(to_char(T.XD_EDATE,'YYYY-MM-DD'),'99991-12-31')  CKXYDQRQ,--存款协议到期日期 
    case  when  D.ACCT_END_DATE<= DATE'${endDate}'  then to_char(D.ACCT_END_DATE,'YYYY-MM-DD') else null end CKXYSJZZRQ, --存款协议实际终止日期
    Z.BZ  CKBZ,--币种
    abs(b.balance)  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then b.balance
             when Z.BZ != 'CNY' then b.balance * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${startDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${startDate}'),-1)+1 and ht_s_dt <= date'${startDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${startDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    CASE WHEN  D.BIZ_TYPE_ID ='A01011' THEN D.RATE_VALUE
         WHEN  D.BIZ_TYPE_ID ='A01012' THEN T.XDLL
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE<=T.XDED THEN D.RATE_VALUE
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE>T.XDED THEN T.XDLL
    END LLSP,--利率水平
    to_char(d.end_date,'yyyy-mm-dd') JYRQ,--交易日期
    to_char(d.BOOK_DATE,'yyyymmdd')||substr(d.account_no,-3,3)||'0'  JYLSH,--交易流水号
    '0' JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    Clt.chinese_name JYDSMC,--交易对手名称
    ck.TZ_ACCOUNT_NO  JYDSCKZHBM,--交易对手存款账户编码
    --decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH,) JYDSZHKHHH,--交易对手账户开户行号
    '907521000084'  JYDSZHKHHH,--交易对手账户开户行号
    'A01'  JYDSZJLX,--交易对手证件类型
    --decode(jymx.BZHYT,'A',null,jymx.JYDSDM,clt.CREDIT_CODE) JYDSZJDM,--交易对手代码
    clt.CREDIT_CODE  JYDSZJDM,--交易对手代码
   '协定存款到期顺延'   CKJYYT--存款交易用途 
    --select d.*
    from  DH_SM_CKCD D 
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
  left join DH_GL_CLTINFO Clt on Clt.CLTNO = D.CUST_ID and Clt.ht_s_dt <=  date'${startDate}' and Clt.ht_e_dt >  date'${startDate}'
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    --left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID and  B.TX_DATE=d.end_date-1
    left join DH_SM_AGREEMENT T ON T.DEPOSIT_ID = d.DEPOSIT_ID
    left join DH_SM_AGREEMENT ck on ck.account_no=t.account_no and (t.xd_edate =ck.xd_sdate or t.xd_edate-1 =ck.xd_sdate)
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = ck.DEPOSIT_ID-- and  B.TX_DATE=(select min(TX_DATE) from DH_DEPOSIT_BALANCE a where a.DEPOSIT_ID=ck.DEPOSIT_ID )
    --left join JYDS  on jymx.op_name=jyds.op_name
    --left join YHHH  on YHHH.JYDSCKZHBM=decode(jymx.BZHYT,'A',null,jymx.op_acct) and jymx.JYDSZHKHHH is null
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and ck.ht_s_dt <=  date'${endDate}'
    and ck.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and T.ht_s_dt <=  date'${endDate}'
    and T.ht_e_dt >  date'${endDate}'
    --and B.TX_DATE = date'${startDate}'
    and D.BIZ_TYPE_ID in ('A0101','A01011','A01012')    
    --and ck.BIZ_TYPE_ID in ('A0101','A01011','A01012') 
    and d.acct_end_date >= date'${startDate}' 
    and d.balance =0 and b.balance<>0
    and  B.TX_DATE=(select min(TX_DATE) from DH_DEPOSIT_BALANCE a where a.DEPOSIT_ID=ck.DEPOSIT_ID )
and z.mxkmbh not like '2012%'

  union all --协定存款到期自动存入
   select d.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    --when 1 then decode(C.DISTRICT,null,C.CITY,C.DISTRICT)
    when 1 then decode(c.DISTRICT,'542225','540524','542221','540502','652201','650500','340702','340705',c.DISTRICT) --琼结县转码值 
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO CKXYDM,--存款协议代码
    CASE WHEN  D.BIZ_TYPE_ID ='A01011' THEN 'D051'
         WHEN  D.BIZ_TYPE_ID ='A01012' THEN 'D052'
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE<=T.XDED THEN 'D051'
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE>T.XDED THEN 'D052'
    END CKCPLB,--存款产品类别
    to_char(T.XD_SDATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    nvl(to_char(T.XD_EDATE,'YYYY-MM-DD'),'99991-12-31')  CKXYDQRQ,--存款协议到期日期 
    case  when  D.ACCT_END_DATE<= DATE'${endDate}'  then to_char(D.ACCT_END_DATE,'YYYY-MM-DD') else null end CKXYSJZZRQ, --存款协议实际终止日期
    Z.BZ  CKBZ,--币种
    abs(b.balance)  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then b.balance
             when Z.BZ != 'CNY' then b.balance * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${startDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${startDate}'),-1)+1 and ht_s_dt <= date'${startDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${startDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    CASE WHEN  D.BIZ_TYPE_ID ='A01011' THEN D.RATE_VALUE
         WHEN  D.BIZ_TYPE_ID ='A01012' THEN T.XDLL
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE<=T.XDED THEN D.RATE_VALUE
       WHEN  D.BIZ_TYPE_ID ='A0101'  AND  B.BALANCE>T.XDED THEN T.XDLL
    END LLSP,--利率水平
    --to_char(ck.end_date,'yyyy-mm-dd') JYRQ,--交易日期
    to_char(nvl(ck.xd_edate,d.begin_date),'yyyy-mm-dd') JYRQ,--交易日期
    to_char(d.BOOK_DATE,'yyyymmdd')||substr(d.account_no,-3,3)||'1'  JYLSH,--交易流水号
    '1' JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    Clt.chinese_name JYDSMC,--交易对手名称
    --ck.TZ_ACCOUNT_NO  JYDSCKZHBM,--交易对手存款账户编码
    nvl(ck.TZ_ACCOUNT_NO,d.ACCOUNT_NO)  JYDSCKZHBM,--交易对手存款账户编码
    --decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH,) JYDSZHKHHH,--交易对手账户开户行号
    '907521000084'  JYDSZHKHHH,--交易对手账户开户行号
    'A01'  JYDSZJLX,--交易对手证件类型
    --decode(jymx.BZHYT,'A',null,jymx.JYDSDM,clt.CREDIT_CODE) JYDSZJDM,--交易对手代码
    clt.CREDIT_CODE  JYDSZJDM,--交易对手代码
    decode(ck.account_no,null,'协定存款申办','协定存款到期顺延')   CKJYYT--存款交易用途 
   --elect d.begin_date,ck.*
    from  DH_SM_CKCD D 
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
  left join DH_GL_CLTINFO Clt on Clt.CLTNO = D.CUST_ID and Clt.ht_s_dt <=  date'${startDate}' and Clt.ht_e_dt >  date'${startDate}'
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    --left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID and  B.TX_DATE=d.begin_date
    left join DH_SM_AGREEMENT T ON T.DEPOSIT_ID = d.DEPOSIT_ID
    left join DH_SM_AGREEMENT ck on ck.account_no=t.account_no and (t.xd_sdate =ck.xd_edate or t.xd_sdate-1 =ck.xd_edate)
    left join DH_DEPOSIT_BALANCE b ON B.DEPOSIT_ID = t.DEPOSIT_ID -- and  B.TX_DATE=t.xd_sdate
    --left join JYDS  on jymx.op_name=jyds.op_name
    --left join YHHH  on YHHH.JYDSCKZHBM=decode(jymx.BZHYT,'A',null,jymx.op_acct) and jymx.JYDSZHKHHH is null
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and(( ck.ht_s_dt <=  date'${endDate}'
    and ck.ht_e_dt >  date'${endDate}' ) or ck.account_no is null)
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and T.ht_s_dt <=  date'${endDate}'
    and T.ht_e_dt >  date'${endDate}'
    --and B.TX_DATE = date'${startDate}'
    and D.BIZ_TYPE_ID in ('A0101','A01011','A01012')    
   -- and (ck.BIZ_TYPE_ID in ('A0101','A01011','A01012') or ck.account_no is null)
    and d.begin_date >= date'${startDate}' 
    and  B.TX_DATE=(select min(TX_DATE) from DH_DEPOSIT_BALANCE a where a.DEPOSIT_ID=t.DEPOSIT_ID )
and b.balance<>0
and z.mxkmbh not like '2012%'
    --保证金存款
    union all
    select jymx.v_dept_id,--部门编号
    'A01'  KHZJLX,--客户证件类型
    C.CREDIT_CODE  KHZJDM,--客户证件代码
    C.BUSS_ADDR  KHZCDZ,--注册地址
    case C.AREA
    when 1 then c.ADMIN_DIVISION
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(C.COUNTRY_CODE)
    else null end  KHDQDM,--客户地区代码
    D.ACCOUNT_NO  CKZHBM,--存款账户编码
    D.TZ_ACCOUNT_NO    CKXYDM,--存款协议代码
    case 
       when D.BIZ_TYPE_ID in ('D061','D061','0001','0005') then 'D061' --银行承兑汇票保证金存款
       when D.BIZ_TYPE_ID in ('D062','0002','0006') then 'D062' --信用证保证金存款
       when D.BIZ_TYPE_ID in ('D063','D0631','0004','0008') then 'D063' --保函保证金存款
       when D.BIZ_TYPE_ID in ('D064','D06701','D06702') then 'D064' --保函保证金存款
       when D.BIZ_TYPE_ID in ('D065','D06601','D06602') then 'D065' --信用卡保证金存款
       when D.BIZ_TYPE_ID in ('D066') then 'D066' --金融衍生品交易保证金存款
       when D.BIZ_TYPE_ID in ('D067') then 'D067' --黄金交易保证金存款
       when D.BIZ_TYPE_ID in ('D068') then 'D068' --证券交易保证金存款
       when D.BIZ_TYPE_ID in ('D069','D0691','0003','0007','9999') then 'D069' --其他保证金存款
    end  CKCPLB,--存款产品类别
    to_char(D.BEGIN_DATE,'YYYY-MM-DD')  CKXYQSRQ,--存款协议起始日期
    --to_char(D.END_DATE,'YYYY-MM-DD')  CKXYDQRQ,--存款协议到期日期
  nvl(to_char(D.END_DATE,'YYYY-MM-DD'),'9999-12-31')  CKXYDQRQ,--存款协议到期日期
   case  when  D.ACCT_END_DATE<= DATE'${endDate}' and jymx.JYFS=2 and D.ACCT_END_DATE=jymx.BOOK_DATE then to_char(D.ACCT_END_DATE,'YYYY-MM-DD') else null end CKXYSJZZRQ, --存款协议实际终止日期
    Z.BZ  CKBZ,--币种
    jymx.AMOUNT  CKFSJE,--存款发生金额
        case when Z.BZ = 'CNY'  then jymx.AMOUNT
             when Z.BZ != 'CNY' then jymx.AMOUNT * ( case when (select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                                    then nvl((select AVG_RATE from avg_exchange_rate where CUR_ORIG = Z.BZ and CUR_DEST = 'CNY' and sjrq = '${endDate}'),
                                                                                   (SELECT avg(hl) FROM dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' 
                                           and CUR_ORIG = Z.BZ and CUR_DEST = 'CNY'))
                                                                      when 1=1 --(select s.VALUE_ from DM_REPORT_PARAM_SET s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE')  = '0' 
                                      then PKG_RMM_FUNCTIONS.CurrencyRate_New(Z.BZ,'CNY', DATE'${endDate}') end) end  CKFSJEZRMB,--存款发生金额折人民币
    D.RATE_VALUE  LLSP,--利率水平
    to_char(jymx.BOOK_DATE,'yyyy-mm-dd') JYRQ,--交易日期
    jymx.TRADE_ID JYLSH,--交易流水号
    decode(jymx.JYFS,1,'1',2,'0') JYFX,--交易方向
    '03' JYQD,--交易渠道
    '0' XJZZBS,--现金转账标识
    case jymx.BZHYT when 'A' then null else decode(jymx.dgdsbz,'1',jymx.op_name,'2',null,jymx.op_name) end JYDSMC,--交易对手名称
    decode(jymx.BZHYT,'A',null,jymx.op_acct)   JYDSCKZHBM,--交易对手存款账户编码
    --decode(jymx.BZHYT,'A',null,jymx.JYDSZHKHHH,) JYDSZHKHHH,--交易对手账户开户行号
    case when BANK_NAME ='有色矿业集团财务有限公司'  then '907521000084' else jymx.JYDSZHKHHH end JYDSZHKHHH,--交易对手账户开户行号
    case when nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM) is null then null else --decode(jymx.BZHYT,'A',null,jymx.JYDSZJLX) 
NVL(jymx.JYDSZJLX,'A01') end JYDSZJLX,--交易对手证件类型
    --decode(jymx.BZHYT,'A',null,jymx.JYDSDM,clt.CREDIT_CODE) JYDSZJDM,--交易对手代码
    nvl(nvl(jymx.JYDSDM,clt.CREDIT_CODE),jyds.CERT_NUM)  JYDSZJDM,--交易对手代码
    --nvl(jymx.BZHYT,jymx.REMARK)  CKJYYT--存款交易用途 
REGEXP_REPLACE(nvl(jymx.BZHYT,jymx.REMARK),'([|,@,\,/,#,?,!,？,！,&,$,||,*,.,^,+,_,-])|\s',' ')   CKJYYT--存款交易用途 
    from DH_SM_CKJYMX jymx
    left join DH_SM_CKCD D on D.DEPOSIT_ID = jymx.DEPOSIT_ID
    left join DH_GL_CLTINFO C on C.CLTNO = D.CUST_ID
  left join DH_GL_CLTINFO Clt on REGEXP_REPLACE(Clt.chinese_name,'(\(.*\）|\（.*\）)','') = REGEXP_REPLACE(jymx.op_name,'(\(.*\）|\（.*\）)','') and Clt.ht_s_dt <=  date'${endDate}' and Clt.ht_e_dt >  date'${endDate}'
    left join DH_FZ_ZHXX Z on D.ACCOUNT_NO = Z.CKZH
    left join DH_DEPOSIT_BALANCE B ON B.DEPOSIT_ID = D.DEPOSIT_ID
    left join JYDS  on jymx.op_name=jyds.op_name
    where  C.ht_s_dt <=  date'${endDate}'
    and C.ht_e_dt >  date'${endDate}'
    and C.CLT_INFO_TYPE not in (0,8)
    and D.ht_s_dt <=  date'${endDate}'
    and D.ht_e_dt >  date'${endDate}'
    and Z.ht_s_dt <=  date'${endDate}'
    and Z.ht_e_dt >  date'${endDate}'
    and B.TX_DATE = date'${endDate}'
    --and (D.STATE in (1,2) or B.BALANCE != 0)
  and jymx.BOOK_DATE between  date'${startDate}' and  date'${endDate}'
    and D.BIZ_TYPE_ID in (
    'D061','0001','0005','D0611','D0612','D0631','D0632','D0691',
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
      
