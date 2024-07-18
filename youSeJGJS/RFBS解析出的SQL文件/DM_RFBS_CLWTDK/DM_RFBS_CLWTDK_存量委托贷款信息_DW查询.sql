-- 步骤类型: N/A, 步骤名称: 存量委托贷款信息_DW查询
-- 标签: name, 属性: {}, 内容: 存量委托贷款信息_DW查询
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
  where org.org_type = 1)
select SEQ_DM_RFBS_CLWTDK.NEXTVAL ID,
         '${reportId}' REPORT_ID,
         '${BATCH}' BATCH,
          head.JRJGDM,--金融机构代码
          head.NBJGH,--内部机构号
          head.JRJGDQDM,--金融机构地区代码
          xdjj.V_DEPT_ID,--部门编号
          'A01' JKRZJLX,--借款人证件类型
          clt.CREDIT_CODE JKRZJDM,--借款人证件代码
          clt.ECONOMIC_SECTOR JKRGMJJBM,--借款人国民经济部门
          case clt.AREA
                when 1 then substr(clt.INDUSTRY,0,3)
                when 2 then '200'
                else null end JKRHY,--借款人行业
         case clt.AREA
                when 1 then decode(clt.ADMIN_DIVISION,'542225','540524',clt.ADMIN_DIVISION) --琼结县转码值
                when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(clt.COUNTRY_CODE)
          else null end  JKRDQDM,--借款人地区代码
          PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',clt.QYKGLX) JKRJJCF,--借款人经济成分
        case clt.AREA 
       		when 1 then 
				(case when substr(clt.ECONOMIC_SECTOR,0,1) in ('A','B','D','E') then 'CS05'
					  else DECODE(clt.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') end)
            when 2 then null
			else null end JKRQYGM,--借款人企业规模
        xdjj.LOAN_NO WTDKJJBM,--委托贷款借据编码
        ywht.CONTRACT_NO WTDKHTBM,--委托贷款合同编码
        case clt.AREA
      when 1 then substr(ywht.INVEST_DIRECTION,0,4)
      when 2 then '2000'
      else null end  DKSJTX,--贷款实际投向
      to_char(xdjj.START_DATE,'YYYY-MM-DD') WTDKFFRQ,--委托贷款发放日期
      to_char(xdjj.MATURITY,'YYYY-MM-DD') WTDKDQRQ,--委托贷款到期日期
	  case when ywht.STATE  in (2,3,4) then (select to_char(max(rr.rollover_end),'YYYY-MM-DD') from DH_FB_ROLLOVER rr where rr.bid=ywht.bid and rr.loan_no=xdjj.loan_no and rr.POSTPONE_DATE<=date'${endDate}')
		else null end WTDKZQDQRQ,--委托贷款展期到期日期
      ywht.CURRENCY_NO BZ,--币种
      xdjj.balance WTDKYE,--委托贷款余额
      xdjj.balance*PKG_RMM_FUNCTIONS.CurrencyRate(ywht.CURRENCY_NO,date'${endDate}') WTDKYEZRMB,--委托贷款余额折人民币
      decode(ywht.IS_FLOATING_RATE,0, 'RF01', 1, 'RF02',null) LLSFGD,--利率是否固定
      --ywht.LAST_RATE LLSP,--利率水平
 case when xdjj.loan_no='(2016)冶色财司(委贷)-55号 -1' then 4.35 else  xdjj.bjll end LLSP,--利率水平
 	    case when xdjj.loan_no in ('(2020)有色财司(委贷)-3号-1','(2020)有色财司(委贷)-4号-1') then 500
 --when xdjj.loan_no in ('(2016)冶色财司(委贷)-55号 -1') then 1000
	when xdjj.loan_id = (select min(txd.loan_id) from dh_fb_xdjj txd where txd.ht_s_dt <= date'${endDate}' and txd.ht_e_dt > date'${endDate}'and txd.bid=ywht.bid ) then
    ywht.CHARGE_AMT*PKG_RMM_FUNCTIONS.CurrencyRate(ywht.CURE_CODE,date'${endDate}') else 0 end  SXFJEZRMB,--手续费金额折人民币
      case when sus.SURE_MODE like 'A%' then 'A'
        when sus.SURE_MODE like 'B%' then 'B01'
      when sus.SURE_MODE like 'C%' then 'C99'
      else sus.SURE_MODE end DKDBFS,--贷款担保方式
     -- PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','FIVE_LEVEL','DKZL',ywht.FIVE_LEVEL) DKZL,--贷款质量
	null DKZL,--贷款质量
    decode(ywht.STATE,2,'LS03',3,'LS03',4,'LS03',8,'LS02',5,'LS04','LS01') DKZT,--贷款状态
     ct.ECONOMIC_SECTOR WTRGMJJBM,--委托人国民经济部门
    'A01' WTRZJLX,--委托人证件类型
    ct.CREDIT_CODE WTRZJLXDM, --委托人证件代码
     case  ct.AREA
           when 1 then substr(ct.INDUSTRY,0,3)
           when 2 then '200'
           else null end WTRHY,--委托人行业
     case ct.AREA 
           when 1 then ct.ADMIN_DIVISION
           when 2 then PKG_RMM_FUNCTIONS.getCountrySixNum(ct.COUNTRY_CODE)
      else null end  WTRDQDM,--委托人地区代码
        PKG_RMM_FUNCTIONS.DICT_TRANSFER_DM('RFBS','HOLDSHARE','JJCF',ct.QYKGLX) WTRJJCF,--委托人经济成分
        case ct.AREA 
       		when 1 then 
				(case when substr(ct.ECONOMIC_SECTOR,0,1) in ('A','B','D','E') then 'CS05'
					  else DECODE(ct.ENTERPRISE_SCALE,0,'CS01',1,'CS02',2,'CS03',3,'CS04') end)
            when 2 then null
			else null end WTRQYGM,--委托人企业规模
        ywht.DKYT DKYT --贷款用途
   from   DH_FB_YWHT ywht 
   left join DH_FB_XDJJ xdjj on xdjj.BID = ywht.BID  --关联信贷借据
   left join DH_GL_CLTINFO clt  on ywht.CLTNO = clt.cltno and clt.ht_e_dt = date'3000-12-31'  --关联单位基本信息
   left join DH_WTDK_ADDITION wt on wt.BID = ywht.BID  --关联委托贷款补充信息表
  -- left join DH_FB_RELATION ral on ral.bid = ywht.bid
  -- and ral.HT_S_DT <= date'${endDate}'
  -- and ral.HT_E_DT > date'${endDate}'
   left join DH_CT_SURETIES sus --on ral.GUARATEECONTRACTNO = sus.GUARATEECONTRACTNO 
	 on sus.bid=ywht.bid AND SUS.STATE=0
	and sus.ht_s_dt <= date'${endDate}' and sus.ht_e_dt > date'${endDate}' --关联担保方式
   left join DH_GL_CLTINFO ct  on wt.CONSIGNER = ct.cltno and ct.ht_e_dt = date'3000-12-31'   
   ,head  
   where ywht.balance <> 0
   and ywht.biz_type in (104)
   and ywht.ht_s_dt <= date'${endDate}'
   and ywht.ht_e_dt > date'${endDate}'
   and xdjj.ht_s_dt <= date'${endDate}'
   and xdjj.ht_e_dt > date'${endDate}'
   and wt.ht_s_dt <= date'${endDate}'
   and wt.ht_e_dt > date'${endDate}'--委托人基本信息
	and xdjj.balance >0

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
