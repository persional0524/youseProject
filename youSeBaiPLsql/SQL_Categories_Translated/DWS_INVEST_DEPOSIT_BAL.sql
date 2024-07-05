create table BLSCDW.DWS_INVEST_DEPOSIT_BAL
(
  vdate                 DATE,
  contract_id           INTEGER not null,
  class                 VARCHAR2(20),
  business_type         VARCHAR2(64),
  message_type          VARCHAR2(12),
  issuer_name           VARCHAR2(128),
  currency_no           VARCHAR2(12),
  security_deposit_type INTEGER,
  deposit_period        INTEGER,
  period_unit           VARCHAR2(10),
  except_rate           NUMBER(15,6),
  clt_no                VARCHAR2(64),
  clt_name              VARCHAR2(128),
  amount                NUMBER(15,2),
  apply_date            DATE,
  deposit_no            VARCHAR2(64),
  except_deposit_date   DATE,
  except_value_date     DATE,
  except_expiration     DATE,
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
  dividend_total        NUMBER(15,2),
  redeem_total          NUMBER(15,2),
  actual_income         NUMBER(15,2),
  actual_expiration     DATE,
  actual_rate           NUMBER(15,6),
  secondary_id          VARCHAR2(64),
  product_name          VARCHAR2(128)
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
comment on table BLSCDW.DWS_INVEST_DEPOSIT_BAL
  is 'investment理财余额';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is vdate
  is 'date';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is contract_id
  is '合同ID';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is class
  is '业务类别  DEPOSIT:存款,FINANCIAL:理财';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is business_type
  is '业务品种  LARGE_DEPOSIT:大额存单,MARGIN_DEPOSIT:保证金存款,TIME_DEPOSIT:定期存款,CALL_DEPOSIT:通知存款,MONETARY_FUND:货币基金,STRUCTURED_DEPOSIT:结构性存款,FINANCIAL_PRODUCTS:理财产品';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is message_type
  is '通知类型  0:通知一天,1:通知七天';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is issuer_name
  is '发行机构name';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is currency_no
  is '币种';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is security_deposit_type
  is '保证金类型  1:活期 ,2:定期';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is deposit_period
  is '存期/investment周期';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is period_unit
  is '存期/investment周期类型  Y:年,M:月,D:日';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is except_rate
  is '预期年化收益率';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is clt_no
  is '申请单位';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is clt_name
  is '申请单位name';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is amount
  is '存款金额/理财本金';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is apply_date
  is '申请date';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is deposit_no
  is '存单号';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is except_deposit_date
  is '预计存入日/预计申购日';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is except_value_date
  is '预计起息日';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is except_expiration
  is '预计到期日';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is except_days
  is '计息天数';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is interest_base
  is '计息基数';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is is_net_value
  is '是否净value型产品  0:非净value型,1:净value型';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is is_open
  is '是否开放型  0:否,1:是';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is risk_level
  is 'risk等级  1:I低,2:II较低,3:III中等,4:IV较高,5:V高';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is net_value
  is '单位净value';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is investment_share
  is 'investment份额';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is product_scale
  is '产品规模';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is balance
  is '余额';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is share_balance
  is '剩余份额';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is state
  is '合同状态  -1:已废弃,0:已生效,1:已到期,2:已结束,3:修正中,4:废弃中';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is dividend_total
  is '累计分红';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is redeem_total
  is '累计赎回';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is actual_income
  is '实际收益';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is actual_expiration
  is '实际到期date';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is actual_rate
  is '实际收益率';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is secondary_id
  is '所属二级单位';
comment on column BLSCDW.DWS_INVEST_DEPOSIT_BAL is product_name
  is 'investment产品name';
