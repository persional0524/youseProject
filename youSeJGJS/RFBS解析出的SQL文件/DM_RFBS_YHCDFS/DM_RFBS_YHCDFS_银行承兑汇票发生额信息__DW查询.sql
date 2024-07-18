-- 步骤类型: N/A, 步骤名称: 银行承兑汇票发生额信息__DW查询
-- 标签: name, 属性: {}, 内容: 银行承兑汇票发生额信息__DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DwData
with 
org as ( 
  select org_fname jrjgmc,        --金融机构名称
    org_financiallicense jrxkzh,  --金融许可证号
    org_credit_code jgdm,         --机构代码
    org_cltno nbjgh,              --内部机构号
    org_inter_customer_code,      --内部客户代码
    org_area                      --区域编码
  from dm_pub_org
  where org_type = 1 and rownum = 1
),
opcustskr as (
select distinct a.skrmc,a.skrZJLX,a.skrZJDM  from dm_rfbs_clyhcd@dcab_dm a right outer join (
select skrmc ,max(CREATE_TIME) CREATE_TIME from dm_rfbs_clyhcd@dcab_dm a where a.skrZJDM is not null group by skrMC 
) b on a.skrmc=b.skrmc and a.CREATE_TIME=b.CREATE_TIME 
where a.skrZJDM is not null
),

sxf as (
select row_number()over(partition by tx.bid order by tx.billno),tx.billno,
case when row_number()over(partition by tx.bid order by tx.billno)=count(*)over(partition by tx.bid )
 -- and count(*)over(partition by tx.bid )>1
  then  ywht.CHARGE_AMT- ywht.CHARGE_AMT*(ywht.amount-pj.amount)/ywht.amount
    else ywht.CHARGE_AMT*pj.amount/ywht.amount end sxfje
      , ywht.amount ,pj.amount
from  dh_fb_pjcd tx 
left join dh_fb_ywht ywht 
on ywht.contract_no = tx.contract_no and 
   ywht.ht_s_dt <= date '${endDate}' and 
   ywht.ht_e_dt >  date '${endDate}' and
   ywht.biz_type= 118
   left join dh_bms_pjxx pj on tx.BILLNO = pj.billno
   where tx.BILLNO is not null
     and pj.accptmode = 0                --承兑方式 0-银承
  and pj.ht_s_dt <= date '${endDate}'
  and pj.ht_e_dt >  date '${endDate}' 
   ),
clt as (
  select clt.*,
    decode(area,1,nvl2(credit_code,'A01','A02'),nvl2(lei_code,'L01','Z99')) as op_cust_type,
    decode(area,1,nvl(credit_code,org_code),nvl(lei_code,cltno))    as op_cust_code,
    row_number() over(partition by cltno order by ht_e_dt desc) rk
  from dh_gl_cltinfo clt
  where ht_s_dt <= date '${endDate}'
    and ht_e_dt >  date '${endDate}'
)
select '${reportId}' REPORT_ID,
	'${BATCH}' BATCH,	
    org.jgdm jrjgdm,            --金融机构代码
    org.nbjgh nbjgh,               --内部机构号
    org.org_area jrjgdqdm,         --金融机构地区代码
    pj.drawername cprmc,           --出票人名称
    drawer.op_cust_type cprzjlx,   --出票人证件类型
    drawer.op_cust_code cprzjdm,   --出票人证件代码
    case drawer.area 
        when 1 then substr(drawer.industry,0,3)
        when 2 then '200'
    end cprhy,                     --出票人行业
    case drawer.area
       when 1 then drawer.admin_division
       when 2 then pkg_rmm_functions.getcountrysixnum(drawer.country_code)
    end cprdqdm,                   --出票人地区代码
    pkg_rmm_functions.dict_transfer_dm('RFBS','HOLDSHARE','JJCF',drawer.qykglx) cprjjcf,               --出票人经济成分
    case drawer.area 
       when 1 then ( case when substr(drawer.economic_sector,0,1) in ('A','B','D','E') then 'CS05'
                          else decode(drawer.enterprise_scale,0,'CS01',1,'CS02',2,'CS03',3,'CS04') end )
       when 2 then null
    end cprqygm,                   									--出票人企业规模
    pj.payeename skrmc,            									--收款人名称
    nvl(payer.op_cust_type,skr.skrZJLX) skrzjlx,    	--收款人证件类型
    nvl(payer.op_cust_code,skr.skrZJdm) skrzjdm,    	--收款人证件代码
    pj.billno pjbh,                									--票据编号
    decode(pj.billkind,0,'02','01') pjjz,                           --票据介质
    nvl(to_char(pj.issuedate,'yyyy-mm-dd'),'9999-12-31') cprq,      --出票日期
    nvl(to_char(pj.duedate,'yyyy-mm-dd'),'9999-12-31')   pjdqrq,    --票据到期日期
    nvl(to_char(jymx.tx_date,'yyyy-mm-dd'),'9999-12-31') jyrq,      --票据到期日期
    pj.cure_code bz,               									--币种
    pj.amount jyje,                									--交易金额
    case when pj.cure_code =  'CNY' then pj.amount
         when pj.cure_code <> 'CNY' 
         then pj.amount * pkg_rmm_functions.currencyrate_new(pj.cure_code,'CNY', date '${endDate}') 
    end as jyjezrmb,            									--交易金额折人民币
    case when pj.cure_code =  'CNY' then (select sxfje from sxf a where a.billno= pj.billno)
         when pj.cure_code <> 'CNY' 
         then nvl(jymx.aux_expenses,0) * pkg_rmm_functions.currencyrate_new(pj.cure_code,'CNY', date '${endDate}') 
         else 0
    end as sxfzrmb,             									--手续费折人民币金额
    nvl(ywht.margin_rt,0) as bzjbl,              					--保证金比例
    decode(jymx.tx_type,2,'01',12,'02',null) cdbs, 					--承兑/兑付标识  
    0 as dkjezrmb,              									--垫款金额折人民币
    jymx.flow_id as jylsh,      									--交易流水号                                        
    ct.sure_mode as dbfs,               		--担保方式
    pj.v_dept_id v_dept_id,											--部门编号
	'System' CREATER            									--创建人
from dh_bms_detail jymx
left join dh_bms_pjxx pj on jymx.billno = pj.billno
left join dh_fb_pjcd tx on tx.billno = pj.billno
left join dh_fb_ywht ywht 
on ywht.contract_no = tx.contract_no and 
   ywht.ht_s_dt <= date '${endDate}' and 
   ywht.ht_e_dt >  date '${endDate}' and
   ywht.biz_type= 118
-- 出票人
left join clt drawer
on drawer.chinese_name = pj.drawername and drawer.rk = 1 
-- 收款人
left join clt payer
on payer.chinese_name = pj.payeename and payer.rk = 1
left join opcustskr skr on skr.skrmc =pj.payeename

--承兑人
left join clt acceptor
on acceptor.chinese_name = pj.acceptorname and acceptor.rk = 1
left join DH_CT_SURETIES ct on ct.bid = ywht.bid and ct.ht_s_dt <= date '${endDate}' and 
   ct.ht_e_dt >  date '${endDate}' 
,org
where acceptor.cltno = org.org_inter_customer_code  		--承兑人为财务公司的票据
  and pj.accptmode = 0										--承兑方式 0-银承
  and jymx.tx_type in (2,12)								--票据交易类型 2-承兑 / 12-兑付													
  and pj.ht_s_dt <= date '${endDate}'
  and pj.ht_e_dt >  date '${endDate}' 
  and jymx.tx_date between date '${startDate}' and date '${endDate}'

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
