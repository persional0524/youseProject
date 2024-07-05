create table BLSCDW.DWD_AGT_TZLCHT
(
  contract_id           INTEGER not null,
  class                 VARCHAR2(20),
  business_type         VARCHAR2(64),
  message_type          VARCHAR2(12),
  issuer                VARCHAR2(64),
  issuer_name           VARCHAR2(128),
  product_id            INTEGER,
  apply_id              INTEGER,
  currency_no           VARCHAR2(12),
  security_deposit_type INTEGER,
  deposit_period        INTEGER,
  period_unit           VARCHAR2(10),
  except_rate           NUMBER(15,6),
  clt_no                VARCHAR2(64),
  clt_name              VARCHAR2(128),
  apply_date            DATE,
  deposit_no            VARCHAR2(64),
  amount                NUMBER(15,2),
  except_deposit_date   DATE,
  except_value_date     DATE,
  except_expiration     DATE,
  account_id            INTEGER,
  account_no            VARCHAR2(64),
  account_name          VARCHAR2(128),
  except_days           VARCHAR2(32),
  interest_base         VARCHAR2(32),
  is_net_value          INTEGER,
  is_open               INTEGER,
  risk_level            INTEGER,
  net_value             NUMBER(15,8),
  investment_share      NUMBER(15,2),
  product_scale         NUMBER(15,2),
  balance               NUMBER(15,2),
  share_balance         NUMBER(15,2),
  state                 INTEGER,
  parent_contract_id    INTEGER,
  finish_reason         VARCHAR2(128),
  dividend_total        NUMBER(15,2),
  redeem_total          NUMBER(15,2),
  actual_income         NUMBER(15,2),
  create_time           DATE,
  last_update_time      DATE,
  remark                VARCHAR2(600),
  expired_type          INTEGER,
  reject_reason         VARCHAR2(256),
  currency_name         VARCHAR2(20),
  actual_expiration     DATE,
  actual_rate           NUMBER(15,6),
  transfer_total        NUMBER(15,2),
  actual_deposit_date   DATE,
  actual_value_date     DATE,
  actual_deposit_period INTEGER,
  actual_period_unit    VARCHAR2(10),
  record_id             INTEGER,
  transaction_type      VARCHAR2(10),
  risk_registration     VARCHAR2(10),
  ht_s_dt               DATE,
  ht_e_dt               DATE,
  product_name          VARCHAR2(128),
  product_no            VARCHAR2(128)
)
tablespace BLSC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column BLSCDW.DWD_AGT_TZLCHT is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_TZLCHT is class
  is '业务类别  DEPOSIT:存款,FINANCIAL:理财';
comment on column BLSCDW.DWD_AGT_TZLCHT is business_type
  is '业务品种  LARGE_DEPOSIT:大额存单,MARGIN_DEPOSIT:保证金存款,TIME_DEPOSIT:定期存款,CALL_DEPOSIT:通知存款,MONETARY_FUND:货币基金,STRUCTURED_DEPOSIT:结构性存款,FINANCIAL_PRODUCTS:理财产品';
comment on column BLSCDW.DWD_AGT_TZLCHT is message_type
  is '通知类型  0:通知一天,1:通知七天';
comment on column BLSCDW.DWD_AGT_TZLCHT is issuer
  is '发行机构';
comment on column BLSCDW.DWD_AGT_TZLCHT is issuer_name
  is '发行机构name';
comment on column BLSCDW.DWD_AGT_TZLCHT is product_id
  is '产品ID';
comment on column BLSCDW.DWD_AGT_TZLCHT is apply_id
  is '申请单ID';
comment on column BLSCDW.DWD_AGT_TZLCHT is currency_no
  is '币种';
comment on column BLSCDW.DWD_AGT_TZLCHT is security_deposit_type
  is '保证金类型  1:活期 ,2:定期';
comment on column BLSCDW.DWD_AGT_TZLCHT is deposit_period
  is '存期/investment周期';
comment on column BLSCDW.DWD_AGT_TZLCHT is period_unit
  is '存期/investment周期类型  Y:年,M:月,D:日';
comment on column BLSCDW.DWD_AGT_TZLCHT is except_rate
  is '预期年化收益率';
comment on column BLSCDW.DWD_AGT_TZLCHT is clt_no
  is '申请单位';
comment on column BLSCDW.DWD_AGT_TZLCHT is clt_name
  is '申请单位name';
comment on column BLSCDW.DWD_AGT_TZLCHT is apply_date
  is '申请date';
comment on column BLSCDW.DWD_AGT_TZLCHT is deposit_no
  is '存单号';
comment on column BLSCDW.DWD_AGT_TZLCHT is amount
  is '存款金额/理财本金';
comment on column BLSCDW.DWD_AGT_TZLCHT is except_deposit_date
  is '预计存入日/预计申购日';
comment on column BLSCDW.DWD_AGT_TZLCHT is except_value_date
  is '预计起息日';
comment on column BLSCDW.DWD_AGT_TZLCHT is except_expiration
  is '预计到期日';
comment on column BLSCDW.DWD_AGT_TZLCHT is account_id
  is '理财存入账户id';
comment on column BLSCDW.DWD_AGT_TZLCHT is account_no
  is '理财存入账户';
comment on column BLSCDW.DWD_AGT_TZLCHT is account_name
  is '理财存入账户name';
comment on column BLSCDW.DWD_AGT_TZLCHT is except_days
  is '计息天数';
comment on column BLSCDW.DWD_AGT_TZLCHT is interest_base
  is '计息基数';
comment on column BLSCDW.DWD_AGT_TZLCHT is is_net_value
  is '是否净value型产品  0:非净value型,1:净value型';
comment on column BLSCDW.DWD_AGT_TZLCHT is is_open
  is '是否开放型  0:否,1:是';
comment on column BLSCDW.DWD_AGT_TZLCHT is risk_level
  is 'risk等级  1:I低,2:II较低,3:III中等,4:IV较高,5:V高';
comment on column BLSCDW.DWD_AGT_TZLCHT is net_value
  is '单位净value';
comment on column BLSCDW.DWD_AGT_TZLCHT is investment_share
  is 'investment份额';
comment on column BLSCDW.DWD_AGT_TZLCHT is product_scale
  is '产品规模';
comment on column BLSCDW.DWD_AGT_TZLCHT is balance
  is '余额';
comment on column BLSCDW.DWD_AGT_TZLCHT is share_balance
  is '剩余份额';
comment on column BLSCDW.DWD_AGT_TZLCHT is state
  is '合同状态  -1:已废弃,0:已生效,1:已到期,2:已结束,3:修正中,4:废弃中';
comment on column BLSCDW.DWD_AGT_TZLCHT is parent_contract_id
  is '父合同ID';
comment on column BLSCDW.DWD_AGT_TZLCHT is finish_reason
  is '结束原因';
comment on column BLSCDW.DWD_AGT_TZLCHT is dividend_total
  is '累计分红';
comment on column BLSCDW.DWD_AGT_TZLCHT is redeem_total
  is '累计赎回';
comment on column BLSCDW.DWD_AGT_TZLCHT is actual_income
  is '实际收益';
comment on column BLSCDW.DWD_AGT_TZLCHT is create_time
  is 'created时间';
comment on column BLSCDW.DWD_AGT_TZLCHT is last_update_time
  is '更新时间';
comment on column BLSCDW.DWD_AGT_TZLCHT is remark
  is '备注';
comment on column BLSCDW.DWD_AGT_TZLCHT is expired_type
  is '到期处理方式  0:正常结束,1:到期本金转存,2:到期本息转存';
comment on column BLSCDW.DWD_AGT_TZLCHT is reject_reason
  is '拒绝原因';
comment on column BLSCDW.DWD_AGT_TZLCHT is currency_name
  is '币种name';
comment on column BLSCDW.DWD_AGT_TZLCHT is actual_expiration
  is '实际到期date';
comment on column BLSCDW.DWD_AGT_TZLCHT is actual_rate
  is '实际收益率';
comment on column BLSCDW.DWD_AGT_TZLCHT is transfer_total
  is '累计转让';
comment on column BLSCDW.DWD_AGT_TZLCHT is actual_deposit_date
  is '实际存入日';
comment on column BLSCDW.DWD_AGT_TZLCHT is actual_value_date
  is '实际起息日';
comment on column BLSCDW.DWD_AGT_TZLCHT is actual_deposit_period
  is '实际存期/investment周期';
comment on column BLSCDW.DWD_AGT_TZLCHT is actual_period_unit
  is '实际存期/investment周期类型  Y:年,M:月,D:日';
comment on column BLSCDW.DWD_AGT_TZLCHT is record_id
  is '关联明细id';
