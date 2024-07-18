-- 步骤类型: N/A, 步骤名称: 委托贷款发生额信息_DW查询
-- 标签: name, 属性: {}, 内容: 委托贷款发生额信息_DW查询
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
  where org.org_type = 1)
select 
       SEQ_DM_RFBS_DWDKFS.NEXTVAL ID,
       '${reportId}' REPORT_ID,
       '${BATCH}' BATCH,
       head.JRJGDM,--金融机构代码
       head.NBJGH,--内部机构号
       head.JRJGDQDM,--金融机构地区代码
       fhkjl.V_DEPT_ID,--部门编号
       clt.ECONOMIC_SECTOR JKRGMJJBM,--借款人国民经济部门
       'A01' JKRZJLX, --借款人证件类型
       clt.CREDIT_CODE JKRZJDM,--借款人证件代码
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
       jj.LOAN_NO WTDKJJBM,--委托贷款借据编码
       ywht.CONTRACT_NO WTDKHTBM,--委托贷款合同编码
       case clt.AREA
    when 1 then substr(ywht.INVEST_DIRECTION,0,4)
    when 2 then '2000'
    else null end  DKSJTX,--贷款实际投向
       to_char(jj.START_DATE,'YYYY-MM-DD') WTDKFFRQ,--委托贷款发放日期
       to_char(jj.MATURITY,'YYYY-MM-DD') WTDKDQRQ,--委托贷款到期日期
       fhkjl.LEDGERID JYLSH,--交易流水号
       ywht.CURRENCY_NO BZ,--币种
       fhkjl.ACTUAL_PRINCIPAL WTDKFSJE,--委托贷款发生金额
       fhkjl.ACTUAL_PRINCIPAL*PKG_RMM_FUNCTIONS.CurrencyRate(ywht.CURRENCY_NO,date'${endDate}') WTDKFSJEZRMB,--委托贷款发生金额折人民币
       decode(ywht.IS_FLOATING_RATE,0, 'RF01', 1, 'RF02',null) LLSFGD,--利率是否固定
       --ywht.LAST_RATE LLSP,--利率水平
 case when jj.loan_no='(2016)冶色财司(委贷)-55号 -1' then 4.35 else  jj.bjll end LLSP,--利率水平
    case when jj.loan_no in ('(2020)有色财司(委贷)-3号-1','(2020)有色财司(委贷)-4号-1') then 500
 when jj.loan_id = (select min(txd.loan_id) from dh_fb_xdjj txd where txd.ht_s_dt <= date'${endDate}' and txd.ht_e_dt > date'${endDate}'and txd.bid=ywht.bid ) then
    ywht.CHARGE_AMT*PKG_RMM_FUNCTIONS.CurrencyRate(ywht.CURE_CODE,date'${endDate}') else 0 end  SXFJEZRMB,--手续费金额折人民币
       case when sus.SURE_MODE like 'A%' then 'A'
       when sus.SURE_MODE like 'B%' then 'B01'
    when sus.SURE_MODE like 'C%' then 'C99'
    else sus.SURE_MODE end DKDBFS,--贷款担保方式
     wtr.ECONOMIC_SECTOR WTRGMJJBM,--委托人国民经济部门
     'A01' WTRZJLX,--委托人证件类型
     wtr.CREDIT_CODE WTRZJDM,--委托人证件代码
     case wtr.AREA
    when 1 then substr(wtr.INDUSTRY,0,3)
    when 2 then '200'
    else null end WTRXY,--委托人行业
     case wtr.AREA
    when 1 then wtr.ADMIN_DIVISION
    when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(wtr.COUNTRY_CODE)
    else null end WTRDQDM,--委托人地区代码
     PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',wtr.QYKGLX) WTRJJCF,--委托人经济成分
     case wtr.AREA 
          when 1 then 
        (case when substr(wtr.ECONOMIC_SECTOR,0,1) in ('A','B','D','E') then 'CS05'
            else DECODE(wtr.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') end)
            when 2 then null
      else null end WTRQYGM,--委托人企业规模
     decode(fhkjl.flag, 1, 1, 2, 0, null) FFSHBS,--发放/收回标识
       ywht.DKYT DKYT,--贷款用途
       'system' CREATER--创建人
  from DH_FB_YWHT ywht --业务合同
  left join DH_FB_XDJJ jj 
  on jj.bid = ywht.bid
  and jj.ht_s_dt <= date'${endDate}'
  and jj.ht_e_dt > date'${endDate}'
  left join DH_FB_FHKJL fhkjl --放还款记录
 -- on ywht.BID = fhkjl.bid
 on jj.loan_no = fhkjl.loan_no
  left join DH_GL_CLTINFO clt --借款人
  on ywht.CLTNO = clt.cltno
  and clt.ht_e_dt = date'3000-12-31'
 --left join DH_FB_RELATION ral on ral.bid = ywht.bid
 --  and ral.HT_S_DT <= date'${endDate}'
  -- and ral.HT_E_DT > date'${endDate}'
  left join DH_CT_SURETIES sus --担保
  --on ral.GUARATEECONTRACTNO = sus.GUARATEECONTRACTNO
   on sus.bid=ywht.bid --and SUS.STATE=0
  and sus.HT_S_DT <= date'${endDate}'
  and sus.HT_e_DT > date'${endDate}'
  left join DH_WTDK_ADDITION wt --委托贷款补充信息
  on ywht.bid = wt.BID
  and wt.HT_S_DT <= date'${endDate}'
  and wt.HT_e_DT > date'${endDate}'
  left join DH_GL_CLTINFO wtr --委托人
  on wt.CONSIGNER = wtr.cltno
  and wtr.ht_e_dt = date'3000-12-31'
  ,head
 where clt.clt_info_type in (1, 3)
   and ywht.biz_type = 104
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
      
