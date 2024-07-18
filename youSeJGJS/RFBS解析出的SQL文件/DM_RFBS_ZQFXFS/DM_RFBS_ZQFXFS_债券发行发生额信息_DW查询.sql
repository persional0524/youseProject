-- 步骤类型: N/A, 步骤名称: 债券发行发生额信息_DW查询
-- 标签: name, 属性: {}, 内容: 债券发行发生额信息_DW查询
-- 标签: type, 属性: {}, 内容: TableInput
-- 标签: description, 属性: {}, 内容: None
-- 标签: distribute, 属性: {}, 内容: Y
-- 标签: custom_distribution, 属性: {}, 内容: None
-- 标签: copies, 属性: {}, 内容: 1
-- 标签: partitioning, 属性: {}, 内容: 
           
-- 标签: connection, 属性: {}, 内容: nstc/jdbc/DmData
with head as (
 select org.ORG_CLTNO NBJGH,
		org.ORG_CREDIT_CODE	JRJGDM,
        org.org_area JRJGDQDM
   from dm_pub_org org
  where org.org_type = 1),
rat as (
select p.paramvalue,p.paramname
        from dm_pub_param p
        where p.paramno = 'BondCreditRating' order by p.paramvalue
)
select SEQ_DM_RFBS_CLZQFX.NEXTVAL ID,
         '${reportId}' REPORT_ID,
         '${BATCH}' BATCH,
          head.JRJGDM,--金融机构代码
          u.*
from ( 
          select de.v_dept_id,--部门编码
          ba.PRODUCT_ID ZQDM,--债券代码   
          case ba.BOND_CUSTODIAN when '999' then '000'
             else ba.BOND_CUSTODIAN
          end  ZQZTGJG,--债券总托管机构
          ba.product_type ZQPZ,--债券品种
          case when ba.product_rate = '000' then 'C00'
             else nvl((select paramvalue from rat where paramname = ba.product_rate),'C99')
          end ZQXYJB,--债券信用级别
          nvl(ba.REISSUES,0) XFCS,--续发次数
          ba.currency BZ,--币种
          de.PAR_VALUE ZQMZ,--发行/兑付债券面值
          de.PAR_VALUE*PKG_RMM_FUNCTIONS.CurrencyRate(ba.currency,date'${endDate}') ZQMZZRMB,--发行/兑付债券面值折人民币
          de.TX_AMOUNT ZQJE,--发行/兑付债券金额
          de.TX_AMOUNT*PKG_RMM_FUNCTIONS.CurrencyRate(ba.currency,date'${endDate}') ZQJEZRMB,----发行/兑付债券金额折人民币
          to_char(ba.isused_startdate,'YYYY-MM-DD') ZQZWDJR,--债券债务登记日 
          to_char(de.INTER_START_DATE,'YYYY-MM-DD') QXR,--起息日
          to_char(ba.ISUSED_ENDDATE,'YYYY-MM-DD') TFRQ,--兑付日期
          to_char(de.TX_DATE,'YYYY-MM-DD') JYRQ,--交易日期
          ba.isused_rate PMLL, --票面利率
          de.BUY_REMEED_FLAG FLAG --发行/兑付标识
         from DH_ZQFX_DETIAL de
         left join DH_ZQFX_BASEINFO ba on de.tx_id = ba.tx_id         
         where  ba.ht_s_dt <= date'${endDate}'
             and ba.ht_e_dt > date'${endDate}'
             and de.TX_DATE between date'${startDate}' and date'${endDate}'
) u,head

-- 标签: limit, 属性: {}, 内容: 0
-- 标签: lookup, 属性: {}, 内容: None
-- 标签: execute_each_row, 属性: {}, 内容: N
-- 标签: variables_active, 属性: {}, 内容: Y
-- 标签: lazy_conversion_active, 属性: {}, 内容: N
-- 标签: cluster_schema, 属性: {}, 内容: None
-- 标签: remotesteps, 属性: {}, 内容:    
-- 标签: GUI, 属性: {}, 内容: 
      
