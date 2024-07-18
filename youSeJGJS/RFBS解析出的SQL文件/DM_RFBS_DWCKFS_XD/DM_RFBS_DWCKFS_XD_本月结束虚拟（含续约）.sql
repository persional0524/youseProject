-- 步骤类型: N/A, 步骤名称: 本月结束虚拟（含续约）
-- 标签: name, 属性: {}, 内容: 本月结束虚拟（含续约）
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: custom_distribution, 属性: {}, 内容: None
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
with 
head as (
  select org.org_cltno nbjgh,
    org.org_credit_code jrjgdm,
    org.org_area jrjgdqdm,
    'DR0' || org.deposit_reserve_way reserve_way
  from dm_pub_org org
  where org.org_type = 1
),
clt_zj_info as (
  select cltno,
    decode(area,1,nvl2(ampcode,'C01','C02'),nvl2(lei_code,'L01','Z99')) as cust_type,
    decode(area,1,nvl(ampcode,amp_reg_code),nvl(lei_code,self_def_code)) as cust_code
  from dh_gl_cltinfo 
  where ht_s_dt <= date '${endDate}'
    and ht_e_dt > date '${endDate}'
    and is_spv='1'
  union all
  select cltno,
    decode(area,1,nvl2(credit_code,'A01',nvl2(org_code,'A02','A03')),nvl2(lei_code,'L01','Z99')) as cust_type,
    decode(area,1,nvl(credit_code,replace(org_code,'-','')),nvl(lei_code,self_def_code)) as cust_code
  from dh_gl_cltinfo
  where ht_s_dt <= date '${endDate}'
    and ht_e_dt > date '${endDate}'
    and nvl(is_spv,'0')='0'
)
select 
  '${reportId}' report_id,
  '${BATCH}' batch,
  head.jrjgdm jrjgdm,                                       --金融机构代码
  head.nbjgh nbjgh,                                         --内部机构号
  bb.*,
  'system' creater,
  sysdate  create_time
from (
  select 
    b.v_dept_id v_dept_id,                                  --部门编号
    czj.cust_type khzjlx,                                   --客户证件类型
    czj.cust_code khzjdm,                                   --客户证件代码
    c.buss_addr khzcdz,                                     --注册地址
    case c.area
      when 1 then c.admin_division
      when 2 then (select '000'||y.paramvalue from dict_param_mapping y where y.appno = 'RFBS' and y.paramno = 'COUNTRY_CODE3_JS' and  y.standard_code = c.country_code)
      else null 
    end khdqdm,                                             --客户地区代码
    cd.account_no ckzhbm,                                   --存款账户编码
    cd.account_no ckxydm,                                   --存款协议代码
    'D051' ckcplb,                                          --存款产品类别  结算户
    z.khrq ckxyqsrq,                                        --存款协议起始日期
    nvl(z.dqrq,'9999-12-31') ckxydqrq,                      --存款协议到期日期
    to_char(cd.acct_end_date,'yyyy-mm-dd') ckxysjzzrq,      --存款协议实际终止日期
    z.bz ckbz,                                              --币种
    case when b.balance >= xdxy.xded then xdxy.xded else b.balance end as ckfsje, --存款发生金额
    case when z.bz = 'CNY' then (case when b.balance >= xdxy.xded then xdxy.xded else b.balance end) 
      when z.bz != 'CNY' then (case when b.balance >= xdxy.xded then xdxy.xded else b.balance end)*(case when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                  then nvl((select avg_rate from avg_exchange_rate where cur_orig = z.bz and cur_dest = 'CNY' and sjrq = '${endDate}'),
                                           (select avg(hl) from dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' and cur_orig = z.bz and cur_dest = 'CNY'))
                                  when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                  then pkg_rmm_functions.currencyrate_new(z.bz,'CNY',date '${endDate}') 
                            end ) 
    end ckfsjezrmb,                                         --存款发生金额折人民币
    cd.rate_value llsp,                                     --利率水平
    to_char(xdxy.xd_edate,'yyyy-mm-dd') jyrq,               --交易日期
    b.deposit_id||'END01' jylsh,                            --交易流水号
    '0' jyfx,                                               --交易方向  
    '99' jyqd,                                              --交易渠道
    '0' xjzzbs,                                             --现金转账标识
    c.chinese_name jydsmc,                                  --交易对手名称
    xdxy.account_no jydsckzhbm,                             --交易对手存款账户编码
    c.op_bank_code jydszhkhhh,                              --交易对手账户开户行号
    czj.cust_type jydszjlx,                                 --客户证件类型
    czj.cust_code jydszjdm,                                 --客户证件代码
    '协定协议到期后从结算户转出到活期' ckjyyt                  --存款交易用途
  from dh_sm_agreement xdxy
  left join  (
    select max(tx_date) max_date,a.deposit_id  
    from dh_sm_agreement a
    inner join dh_deposit_balance b 
    on a.deposit_id = b.deposit_id and 
       a.xd_edate >= b.tx_date and 
       a.xd_edate >= to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd') and    --协议结束日期大于月初 
       a.xd_edate <= date '${endDate}' and  --协议结束日期小于月末 
       a.ht_s_dt <= date '${endDate}' and
       a.ht_e_dt >  date '${endDate}' and
       b.balance>0  
    group by a.deposit_id
  ) b1
  on xdxy.deposit_id = b1.deposit_id
  inner join dh_deposit_balance b
  on b1.deposit_id = b.deposit_id and 
     b.tx_date = b1.max_date and
     b.balance > 0
  inner join dh_sm_ckcd cd 
  on b.deposit_id = cd.deposit_id and 
     cd.ht_s_dt <= b.tx_date and 
     cd.ht_e_dt >  b.tx_date and 
     cd.end_date is null
  left join dh_gl_cltinfo c 
  on c.cltno = cd.cust_id and 
     c.ht_s_dt <= date '${endDate}' and 
     c.ht_e_dt >  date '${endDate}' and 
     c.clt_info_type not in (0,8)
  left join clt_zj_info czj on czj.cltno = cd.cust_id
  left join dh_fz_zhxx z 
  on cd.account_no = z.ckzh and 
     z.ht_s_dt <= date '${endDate}' and 
     z.ht_e_dt >  date '${endDate}'  
  where xdxy.xd_edate > to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd')
    and xdxy.xd_edate <= date '${endDate}'  
    and xdxy.ht_s_dt <= date '${endDate}'  
    and xdxy.ht_e_dt >  date '${endDate}'   
  union  all 
  select 
    b.v_dept_id v_dept_id,                                  --部门编号
    czj.cust_type khzjlx,                                   --客户证件类型
    czj.cust_code khzjdm,                                   --客户证件代码
    c.buss_addr khzcdz,                                     --注册地址
        case c.area
          when 1 then c.admin_division
          when 2 then (select '000'||y.paramvalue from dict_param_mapping y where y.appno = 'RFBS' and y.paramno = 'COUNTRY_CODE3_JS' and  y.standard_code = c.country_code)
      else null 
    end khdqdm,                                             --客户地区代码
    cd.account_no ckzhbm,                                   --存款账户编码
    xdxy.flow_id ckxydm,                                    --存款协议代码
    'D052' ckcplb,                                          --存款产品类别  协定户
    to_char(xdxy.xd_sdate,'yyyy-mm-dd') ckxyqsrq,           --存款协议起始日期
    nvl(to_char(xdxy.xd_edate,'yyyy-mm-dd'),'9999-12-31') ckxydqrq,                 --存款协议到期日期
    to_char(cd.acct_end_date,'yyyy-mm-dd') ckxysjzzrq,      --存款协议实际终止日期
    z.bz ckbz,                                              --币种
    b.balance-xdxy.xded as ckfsje,                          --存款发生金额
    case when z.bz = 'CNY' then b.balance-xdxy.xded
      when z.bz != 'CNY' then ( b.balance-xdxy.xded ) * (case when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                  then nvl((select avg_rate from avg_exchange_rate where cur_orig = z.bz and cur_dest = 'CNY' and sjrq = '${endDate}'),
                                           (select avg(hl) from dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' and cur_orig = z.bz and cur_dest = 'CNY'))
                                  when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                  then pkg_rmm_functions.currencyrate_new(z.bz,'CNY',date '${endDate}') 
                            end ) 
    end ckfsjezrmb,                                         --存款发生金额折人民币
    xdxy.xdll llsp,                                         --利率水平
    to_char(xdxy.xd_edate,'yyyy-mm-dd') jyrq,               --交易日期
    b.deposit_id||'END02' jylsh,                            --交易流水号
    '0' jyfx,                                               --交易方向  
    '99' jyqd,                                              --交易渠道
    '0' xjzzbs,                                             --现金转账标识
    c.chinese_name jydsmc,                                  --交易对手名称
    xdxy.account_no jydsckzhbm,                             --交易对手存款账户编码
    c.op_bank_code jydszhkhhh,                              --交易对手账户开户行号
    czj.cust_type jydszjlx,                                 --客户证件类型
    czj.cust_code jydszjdm,                                 --客户证件代码
    '协定协议到期后从协定户转出到活期' ckjyyt                  --存款交易用途
  from dh_sm_agreement xdxy
  left join (
    select max(tx_date) max_date,a.deposit_id  
    from dh_sm_agreement   a
    inner join dh_deposit_balance b 
    on a.deposit_id = b.deposit_id and 
       a.xd_edate >= b.tx_date and 
       a.xd_edate >= to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd') and    --协议结束日期大于月初 
       a.xd_edate <= date '${endDate}' and   --协议结束日期小于月末 
       a.ht_s_dt <= date '${endDate}' AND    
       a.ht_e_dt >  date '${endDate}' and    
       b.balance >0  
    group by a.deposit_id
  ) B1
  on xdxy.deposit_id = b1.deposit_id
  inner join dh_deposit_balance b
  on b1.deposit_id = b.deposit_id and 
     b.tx_date = b1.max_date and 
     b.balance > 0 
  inner join dh_sm_ckcd cd 
  on b.deposit_id = cd.deposit_id and 
     cd.ht_s_dt <= b.tx_date and 
     cd.ht_e_dt >  b.tx_date and 
     cd.end_date is null
  left join dh_gl_cltinfo c 
  on c.cltno = cd.cust_id and 
     c.ht_s_dt <= date '${endDate}' and 
     c.ht_e_dt >  date '${endDate}'  and 
     c.clt_info_type not in (0,8)
  left join clt_zj_info czj on czj.cltno = cd.cust_id
  left join dh_fz_zhxx z 
  on cd.account_no = z.ckzh and 
     z.ht_s_dt <= date '${endDate}' and 
     z.ht_e_dt >  date '${endDate}'  
  where xdxy.xd_edate > to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd')
    and xdxy.xd_edate <= date '${endDate}'  
    and xdxy.ht_s_dt <= date '${endDate}'  
    and xdxy.ht_e_dt >  date '${endDate}'   
    and b.balance > xdxy.xded
  union  all 
  select    
    b.v_dept_id v_dept_id,                                  --部门编号
    czj.cust_type khzjlx,                                   --客户证件类型
    czj.cust_code khzjdm,                                   --客户证件代码 
    c.buss_addr khzcdz,                                     --注册地址
    case c.area
      when 1 then c.admin_division
      when 2 then (select '000'||y.paramvalue from dict_param_mapping y where y.appno = 'RFBS' and y.paramno = 'COUNTRY_CODE3_JS' and  y.standard_code = c.country_code)
      else null 
    end khdqdm,                                             --客户地区代码
    cd.account_no ckzhbm,                                   --存款账户编码
    cd.account_no ckxydm,                                   --存款协议代码
    'D051' ckcplb,                                          --存款产品类别  结算户
    z.khrq ckxyqsrq,                                        --存款协议起始日期
    nvl(z.dqrq,'9999-12-31') ckxydqrq,                      --存款协议到期日期
    to_char(cd.acct_end_date,'yyyy-mm-dd') ckxysjzzrq,      --存款协议实际终止日期
    z.bz ckbz,                                              --币种
    b.balance as ckfsje,                                    --存款发生金额
    case when z.bz = 'CNY' then b.balance
      when z.bz != 'CNY' then b.balance * (case when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                  then nvl((select avg_rate from avg_exchange_rate where cur_orig = z.bz and cur_dest = 'CNY' and sjrq = '${endDate}'),
                                           (select avg(hl) from dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' and cur_orig = z.bz and cur_dest = 'CNY'))
                                  when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                  then pkg_rmm_functions.currencyrate_new(z.bz,'CNY',date '${endDate}') 
                            end ) 
    end ckfsjezrmb,                             
    cd.rate_value llsp,                                     --利率水平
    to_char(xdxy.xd_edate,'yyyy-mm-dd') jyrq,               --交易日期
    b.deposit_id||'END03' jylsh,                            --交易流水号
    '1' jyfx,                                               --交易方向  
    '99'jyqd,                                               --交易渠道
    '0' xjzzbs,                                             --现金转账标识
    c.chinese_name jydsmc,                                  --交易对手名称
    xdxy.account_no jydsckzhbm,                             --交易对手存款账户编码
    c.op_bank_code jydszhkhhh,                              --交易对手账户开户行号
    czj.cust_type jydszjlx,                                 --客户证件类型
    czj.cust_code jydszjdm,                                 --客户证件代码 
    '协定协议到期后从协定户转出到活期' ckjyyt                  --存款交易用途
  from dh_sm_agreement xdxy
  left join (
    select max(tx_date) max_date,a.deposit_id  
    from dh_sm_agreement a
    inner join dh_deposit_balance b 
    on a.deposit_id = b.deposit_id and 
       a.xd_edate >= b.tx_date and 
       a.xd_edate >= to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd') and    --协议结束日期大于月初 
       a.xd_edate <= date '${endDate}' and   --协议结束日期小于月末 
       a.ht_s_dt <= date '${endDate}' AND    
       a.ht_e_dt >  date '${endDate}' and    
       b.balance > 0  
    group by a.deposit_id
  ) b1
  on xdxy.deposit_id = b1.deposit_id
  inner join dh_deposit_balance b
  on b1.deposit_id = b.deposit_id and 
     b.tx_date = b1.max_date and 
     b.balance > 0 
  inner join dh_sm_ckcd cd 
  on b.deposit_id = cd.deposit_id and 
     cd.ht_s_dt <= b.tx_date and 
     cd.ht_e_dt >  b.tx_date and 
     cd.end_date is null
  left join dh_gl_cltinfo c 
  on c.cltno = cd.cust_id and 
     c.ht_s_dt <= date '${endDate}' and 
     c.ht_e_dt >  date '${endDate}' and 
     c.clt_info_type not in (0,8)
  left join clt_zj_info czj on czj.cltno = cd.cust_id
  left join dh_fz_zhxx z 
  on cd.account_no = z.ckzh and 
     z.ht_s_dt <= date '${endDate}' and 
     z.ht_e_dt >  date '${endDate}'  
  where xdxy.xd_edate > to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd')
    and xdxy.xd_edate<= date '${endDate}'  
    and xdxy.ht_s_dt <= date '${endDate}'  
    and xdxy.ht_e_dt >  date '${endDate}'  
) bb,head

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
