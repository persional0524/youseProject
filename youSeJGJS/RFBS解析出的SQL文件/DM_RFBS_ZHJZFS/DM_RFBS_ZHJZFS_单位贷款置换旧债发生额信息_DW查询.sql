-- 步骤类型: N/A, 步骤名称: 单位贷款置换旧债发生额信息_DW查询
-- 标签: name, 属性: {}, 内容: 单位贷款置换旧债发生额信息_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
with 
head as (
  select org.org_cltno nbjgh,
    org.org_credit_code jrjgdm,
    org.org_area jrjgdqdm
  from dm_pub_org org
  where org.org_type = 1
),
clt_zj_info as (
  select cltno,
    decode(area,1,nvl2(ampcode,'C01','C02'),nvl2(lei_code,'L01','Z99')) as cust_type,
    decode(area,1,nvl(ampcode,amp_reg_code),nvl(lei_code,self_def_code)) as cust_code
  from dh_gl_cltinfo 
  where ht_s_dt <= date '${endDate}'
    and ht_e_dt >  date '${endDate}'
    and is_spv='1'
  union all
  select cltno,
    decode(area,1,nvl2(credit_code,'A01',nvl2(org_code,'A02','A03')),nvl2(lei_code,'L01','Z99')) as cust_type,
    decode(area,1,nvl(credit_code,replace(org_code,'-','')),nvl(lei_code,self_def_code)) as cust_code
  from dh_gl_cltinfo
  where ht_s_dt <= date '${endDate}'
    and ht_e_dt >  date '${endDate}'
    and nvl(is_spv,'0')='0'
),
data_old_debt as (select *
  from dh_fb_rp_old_debt t
 where not exists
 (select null
          from dh_fb_rp_old_debt t1
         where t.contract_no = t1.contract_no
           and t.loan_no = t1.loan_no
           and t.rp_debt_voucher = t1.rp_debt_voucher
           and t1.HT_S_DT <= date '${endDate}'
           AND t1.HT_E_DT > date '${startDate}'
           and t1.ht_s_dt >= t.ht_s_dt
           and t1.ht_e_dt > t.ht_e_dt)
   and t.HT_S_DT <= date '${endDate}'
   AND t.HT_E_DT > date '${startDate}'
),
bzhzw as (select t.contract_no,t.loan_no,md5(t.ledgerid||rp_debt_voucher) as flowid,t.amt from (
select sum(fhkjl.actual_principal) over(partition by fhkjl.contract_no,fhkjl.loan_no) as amt,
      row_number() over(partition by fhkjl.loan_no, fhkjl.contract_no order by fhkjl.loan_no, fhkjl.contract_no) as rn,
      fhkjl.loan_no, fhkjl.contract_no,fhkjl.ledgerid,b.rp_debt_voucher
  from dh_fb_fhkjl fhkjl
  inner join data_old_debt b
   on fhkjl.contract_no=b.contract_no
  and fhkjl.loan_no=b.loan_no
 where fhkjl.txdate >= date '${startDate}'
   and fhkjl.txdate <= date '${endDate}'
   and fhkjl.actual_principal > 0
   and fhkjl.flag=1) t
   where rn=1)
select '${reportId}' report_id,
  '${BATCH}' batch,
  head.jrjgdm,                          --金融机构代码
  jj.v_dept_id,                      --部门编号
  czj.cust_type jkrzjlx,                --借款人证件类型 
  czj.cust_code jkrzjdm,              --借款人证件代码  
  ywht.contract_no dkhtbm,             --贷款合同编码
  jj.loan_no dkjjbm,                   --贷款借据编码
  ywht.currency_no bz,                --币种
  --b.amt dkfsjezrmb,     -- 贷款发生金额折人民币
  case when ywht.currency_no  = 'CNY' then b.amt
       when ywht.currency_no != 'CNY' then b.amt * ( case when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                                              then nvl((select avg_rate from avg_exchange_rate where cur_orig = ywht.currency_no and cur_dest = 'CNY' and sjrq = '${endDate}'),
                                                                                   (select avg(hl) from dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' 
                                           and cur_orig = ywht.currency_no and cur_dest = 'CNY'))
                                                                when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                then pkg_rmm_functions.currencyrate_new(ywht.currency_no,'CNY', date '${endDate}') end) 
  end as dkfsjezrmb,     -- 贷款发生金额折人民币
  jj.bjll llsp,  --利率水平
  b.flowid jylsh,         --交易流水号
  db.rp_debt_type  bzhzwlx ,-- 被置换债务类型 
  db.rp_creditor_idtype  bzhzwqrzjlx , -- 被置换债务债权人证件类型 
  db.rp_creditor_id bzhzwqrzjdm , -- 被置换债务债权人证件代码 
  db.is_rp_gover_loan sfzhdfzfrzptzw , -- 是否置换地方政府融资平台债务
  db.rp_debt_voucher bzhzwpzbm , -- 被置换债务凭证编码 
  db.rp_debt_currency bzhzwbz , -- 被置换债务币种 
  db.rp_debt_amt bzhzwjezrmb , -- 被置换债务金额折人民币
  db.rp_debt_rate bzhzwllsp , -- 被置换债务利率水平 
  'System' creater              --创建人
from dh_fb_ywht ywht            --业务合同
inner join dh_fb_xdjj jj 
on jj.bid = ywht.bid and 
   jj.ht_s_dt <= date '${endDate}' and 
   jj.ht_e_dt >  date '${endDate}'
inner join data_old_debt db
 on jj.loan_no=db.loan_no
 and jj.contract_no=db.contract_no
inner join bzhzw b
 on jj.contract_no=b.contract_no
and jj.loan_no=b.loan_no
left join dh_gl_cltinfo clt   --关联借款人信息
on clt.cltno = ywht.cltno and 
   clt.ht_s_dt <= date '${endDate}' and 
   clt.ht_e_dt >  date '${endDate}'
left join clt_zj_info czj
on czj.cltno = ywht.cltno
,head
where clt.clt_info_type in (1, 3)
  and ywht.biz_type in (100, 101, 102, 109, 128, 160, 170, 180,106,201)
  and ywht.ht_s_dt <= date '${endDate}'
  and ywht.ht_e_dt >  date '${endDate}'
  and 1=2--add by LDY 20240222 只支持空模板手工报送 不通过系统取数

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
