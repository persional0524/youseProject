-- 步骤类型: N/A, 步骤名称: 本月开始结算户（含续签）
-- 标签: name, 属性: {}, 内容: 本月开始结算户（含续签）
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
    org.org_credit_code  jrjgdm,
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
xdjy_base as (
  select
    jymx.v_dept_id v_dept_id,                   --部门编号
    czj.cust_type khzjlx,                       --客户证件类型
    czj.cust_code khzjdm,                       --客户证件代码   
    c.buss_addr  khzcdz,                        --注册地址
    case c.area
      when 1 then c.admin_division
      when 2 then (select '000'||y.paramvalue from dict_param_mapping y where y.appno = 'RFBS' and y.paramno = 'COUNTRY_CODE3_JS' and  y.standard_code = c.country_code)
      else null 
    end khdqdm,                                 --客户地区代码
    cd.account_no ckzhbm,                       --存款账户编码
    cd.account_no ckxydm,                       --存款协议代码
    'D051' ckcplb,                              --存款产品类别  结算户
    z.khrq ckxyqsrq,                            --存款协议起始日期
    nvl(z.dqrq,'9999-12-31') ckxydqrq,          --存款协议到期日期
    to_char(cd.acct_end_date,'yyyy-mm-dd') ckxysjzzrq, --存款协议实际终止日期
    z.bz ckbz,                                  --币种
    cd.rate_value llsp,                        --利率水平
    to_char(jymx.book_date,'yyyy-mm-dd') jyrq, --交易日期
    jymx.trade_id||'01' jylsh,                 --交易流水号
    decode(jymx.jyfs,1,'1',2,'0') jyfx,        --交易方向
    case when jymx.jy_channel in ('06','07') then '03' else  jymx.jy_channel end as jyqd,              --交易渠道
    '0' xjzzbs,                                --现金转账标识
    case jymx.bzhyt when 'A' then null else decode(jymx.dgdsbz,'1',jymx.op_name,'2',null) end jydsmc,  --交易对手名称
    decode(jymx.bzhyt,'A',null,jymx.op_acct) jydsckzhbm,               --交易对手存款账户编码
    decode(jymx.bzhyt,'A',null,jymx.jydszhkhhh) jydszhkhhh,            --交易对手账户开户行号
    decode(jymx.bzhyt,'A',null,app.paramvalue) jydszjlx,               --交易对手证件类型
    decode(jymx.bzhyt,'A',null,replace(jymx.jydsdm,'-','')) jydszjdm,  --交易对手代码
    nvl(jymx.bzhyt,jymx.remark) ckjyyt,        --存款交易用途
    jymx.amount jyje,                          --交易金额
    xdxy.xded xded,                            --协定额度
    nvl(b.balance,0) ycye,                     --协定起始前余额
    nvl(dqljfs.dqljfs,0) dqljfs,               --当前累计发生
    nvl(b.balance,0)+nvl(dqljfs.dqljfs,0)-( case when jymx.jyfs='2' then   jymx.amount*-1 else jymx.amount end ) jyqye     --本次交易前余额
  from dh_sm_ckjymx jymx 
  inner join dh_sm_ckcd cd 
  on jymx.deposit_id = cd.deposit_id and 
     cd.biz_type_id = 'A0101' and 
     cd.end_date >= jymx.book_date and 
     cd.ht_s_dt <=  jymx.book_date and 
     cd.ht_e_dt > jymx.book_date
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
  inner join dh_sm_agreement xdxy
  on cd.deposit_id = xdxy.deposit_id and   
     xdxy.ht_s_dt <= jymx.book_date and 
     xdxy.ht_e_dt >  jymx.book_date and 
     xdxy.xd_sdate > = to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd') and    --协议开始日期大于月初   
     xdxy.xd_sdate < = date '${endDate}'   --协议开始日期小于月末
  left join  (
    select max(tx_date) max_date,a.deposit_id  
    from dh_sm_agreement a
    inner join dh_deposit_balance b 
    on a.deposit_id = b.deposit_id and 
       a.xd_sdate-1 >= b.tx_date and 
       a.xd_sdate >= to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd') and    
       a.xd_sdate <= date '${endDate}' and    
       a.ht_s_dt <= date '${endDate}' and    
       a.ht_e_dt >  date '${endDate}'
    group by  a.deposit_id
  ) b1
  on xdxy.deposit_id = b1.deposit_id
  left join dh_deposit_balance b
  on b1.deposit_id = b.deposit_id and 
     b.tx_date = b1.max_date and 
     b.balance > 0         
  left join (
    select aa.deposit_id,
      aa.trade_time,
      sum(case when bb.jyfs='1' then bb.amount when bb.jyfs='2' then bb.amount*-1 else bb.amount end ) dqljfs 
    from  dh_sm_ckjymx aa
    inner join dh_sm_ckcd d 
    on d.deposit_id = aa.deposit_id and 
       d.biz_type_id = 'A0101' and 
       d.end_date >= aa.book_date and 
       d.ht_s_dt <= aa.book_date and 
       d.ht_e_dt >  aa.book_date
    inner join dh_sm_agreement t
    on d.deposit_id = t.deposit_id and   
       t.ht_s_dt <= aa.book_date and   
       t.ht_e_dt >  aa.book_date and 
       t.xd_sdate >= to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd') and    --协议开始日期大于月初                     
       t.xd_sdate <= date '${endDate}'   --协议开始日期小于月末     
    left join dh_sm_ckjymx bb
    on aa.deposit_id = bb.deposit_id and 
       bb.book_date <= date '${endDate}' and 
       bb.book_date >= t.xd_sdate and 
       bb.trade_time <= aa.trade_time
    where aa.book_date <= date '${endDate}'
      and aa.book_date >= t.xd_sdate
    group by aa.deposit_id,aa.trade_time
  ) dqljfs
  on dqljfs.deposit_id = jymx.deposit_id and 
     dqljfs.trade_time = jymx.trade_time   
  left join dict_param_mapping app 
  on jymx.jydszjlx = app.standard_code and 
     appno = 'RFBS' and 
     code_type = 'idTypeZgcpList'
  where jymx.book_date >= to_date((substr('${endDate}',1,8)||'01'),'yyyy-mm-dd')
    and jymx.book_date <= date'${endDate}' 
  order by jymx.trade_time  
),
xdjy_sol as (
  select jylsh,                         --交易流水号
    case when jyqye <= xded and ycye+dqljfs <= xded then jyje 
      when jyqye <= xded and ycye+dqljfs >  xded then xded-jyqye
      when jyqye >  xded and ycye+dqljfs >  xded then 0
      when jyqye >  xded and ycye+dqljfs <= xded then xded-(ycye+dqljfs)
    end as jshjyje ,                    --结算户交易金额
    case when jyqye <= xded and ycye+dqljfs<=xded then  0 
      when jyqye <= xded and ycye+dqljfs >  xded then ycye+dqljfs-xded
      when jyqye >  xded and ycye+dqljfs >  xded then jyje
      when jyqye >  xded and ycye+dqljfs <= xded then jyqye-xded
    end as xdhjyje                      --协定户交易金额
  from xdjy_base
)
select    
  '${reportId}' report_id,
  '${BATCH}' batch,
  head.jrjgdm jrjgdm,                   --金融机构代码
  head.nbjgh nbjgh,                     --内部机构号
  xdjy_base.v_dept_id,                  --部门编号
  xdjy_base.khzjlx,                     --客户证件类型
  xdjy_base.khzjdm,                     --客户证件代码   
  xdjy_base.khzcdz,                     --注册地址
  xdjy_base.khdqdm,                     --客户地区代码
  xdjy_base.ckzhbm,                     --存款账户编码
  xdjy_base.ckxydm,                     --存款协议代码
  xdjy_base.ckcplb,                     --存款产品类别  结算户
  xdjy_base.ckxyqsrq,                   --存款协议起始日期
  xdjy_base.ckxydqrq,                   --存款协议到期日期
  xdjy_base.ckxysjzzrq,                 --存款协议实际终止日期
  xdjy_base.ckbz,                       --币种
  xdjy_sol.jshjyje ckfsje,              --存款发生金额
  case when xdjy_base.ckbz = 'CNY' then xdjy_sol.jshjyje
    when xdjy_base.ckbz != 'CNY' then xdjy_sol.jshjyje * (case when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '1' 
                                  then nvl((select avg_rate from avg_exchange_rate where cur_orig = xdjy_base.ckbz and cur_dest = 'CNY' and sjrq = '${endDate}'),
                                           (select avg(hl) from dh_gl_hlb where ht_e_dt >= add_months(last_day(date'${endDate}'),-1)+1 and ht_s_dt <= date'${endDate}' and cur_orig = xdjy_base.ckbz and cur_dest = 'CNY'))
                                  when (select s.value_ from dm_report_param_set s where s.bspzbh='RFBS' and s.key_='AVG_EXCHANGE_RATE') = '0' 
                                  then pkg_rmm_functions.currencyrate_new(xdjy_base.ckbz,'CNY',date '${endDate}') 
                            end ) 
  end ckfsjezrmb,--存款发生金额折人民币        
  xdjy_base.llsp,                       --利率水平
  xdjy_base.jyrq,                       --交易日期
  xdjy_base.jylsh,                      --交易流水号
  xdjy_base.jyfx,                       --交易方向
  xdjy_base.jyqd,                       --交易渠道
  xdjy_base.xjzzbs,                     --现金转账标识
  xdjy_base.jydsmc,                     --交易对手名称
  xdjy_base.jydsckzhbm,                 --交易对手存款账户编码
  xdjy_base.jydszhkhhh,                 --交易对手账户开户行号
  xdjy_base.jydszjlx,                   --交易对手证件类型
  xdjy_base.jydszjdm,                   --交易对手代码
  xdjy_base.ckjyyt,                     --存款交易用途
  'system' creater,
  sysdate create_time
from xdjy_base
left join xdjy_sol on xdjy_base.jylsh = xdjy_sol.jylsh
,head
where xdjy_sol.jshjyje <> 0

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
