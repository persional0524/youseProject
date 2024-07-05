create table BLSCDW.DWD_BNS_TZLCTZB
(
  ledgers_id               INTEGER not null,
  contract_id              INTEGER,
  class                    VARCHAR2(20),
  business_type            VARCHAR2(64),
  action                   VARCHAR2(64),
  record_id                INTEGER,
  act_date                 DATE,
  account_id               INTEGER,
  account_no               VARCHAR2(32),
  account_name             VARCHAR2(128),
  currency_no              VARCHAR2(12),
  attr_id                  VARCHAR2(32),
  amount                   NUMBER(15,2),
  draw_deposit             NUMBER(15,2),
  interest                 NUMBER(15,4),
  is_finish                INTEGER,
  remark                   VARCHAR2(128),
  reject_reason            VARCHAR2(128),
  investment_share         NUMBER(15,2),
  net_value                NUMBER(15,8),
  receipt_date             DATE,
  standard_balance         NUMBER(15,2),
  real_expiration          DATE,
  actual_income            NUMBER(15,2),
  actual_rate              NUMBER(15,6),
  shares_before_redemption NUMBER(15,2),
  end_mode                 INTEGER,
  redeposit_no             VARCHAR2(64),
  redeposit_rate           NUMBER(15,6),
  state                    INTEGER,
  create_time              DATE,
  last_update_time         DATE,
  currency_name            VARCHAR2(20),
  apply_id                 INTEGER,
  data_type                INTEGER,
  redeposit_end_mode       INTEGER,
  product_sum_value        NUMBER(15,4),
  redeem_value             INTEGER,
  redeem_sum_value         NUMBER(15,4),
  redeem_net               NUMBER(15,4),
  associate_fee            NUMBER(15,4),
  total_benefits           NUMBER(15,4),
  change_value             NUMBER(15,8),
  ht_s_dt                  DATE,
  ht_e_dt                  DATE
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
comment on table BLSCDW.DWD_BNS_TZLCTZB
  is '存款理财台账记录表';
comment on column BLSCDW.DWD_BNS_TZLCTZB is ledgers_id
  is '台账ID';
comment on column BLSCDW.DWD_BNS_TZLCTZB is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_BNS_TZLCTZB is class
  is '业务大类  DEPOSIT:存款,FINANCIAL:理财';
comment on column BLSCDW.DWD_BNS_TZLCTZB is business_type
  is '业务类型  LARGE_DEPOSIT:大额存单,MARGIN_DEPOSIT:保证金存款,TIME_DEPOSIT:定期存款,CALL_DEPOSIT:通知存款,MONETARY_FUND:货币基金,STRUCTURED_DEPOSIT:结构性存款,FINANCIAL_PRODUCTS:理财产品';
comment on column BLSCDW.DWD_BNS_TZLCTZB is action
  is '交易类型';
comment on column BLSCDW.DWD_BNS_TZLCTZB is record_id
  is '关联明细流水';
comment on column BLSCDW.DWD_BNS_TZLCTZB is act_date
  is '业务发生date';
comment on column BLSCDW.DWD_BNS_TZLCTZB is account_id
  is '发生账户id';
comment on column BLSCDW.DWD_BNS_TZLCTZB is account_no
  is '发生账户';
comment on column BLSCDW.DWD_BNS_TZLCTZB is account_name
  is '发生账户name';
comment on column BLSCDW.DWD_BNS_TZLCTZB is currency_no
  is '币种';
comment on column BLSCDW.DWD_BNS_TZLCTZB is attr_id
  is '关联业务ID';
comment on column BLSCDW.DWD_BNS_TZLCTZB is amount
  is '金额';
comment on column BLSCDW.DWD_BNS_TZLCTZB is draw_deposit
  is '支取本金';
comment on column BLSCDW.DWD_BNS_TZLCTZB is interest
  is '利息';
comment on column BLSCDW.DWD_BNS_TZLCTZB is is_finish
  is '是否结束  0:否 1:是';
comment on column BLSCDW.DWD_BNS_TZLCTZB is remark
  is '备注';
comment on column BLSCDW.DWD_BNS_TZLCTZB is reject_reason
  is '拒绝原因';
comment on column BLSCDW.DWD_BNS_TZLCTZB is investment_share
  is '交易份额';
comment on column BLSCDW.DWD_BNS_TZLCTZB is net_value
  is '单位净value';
comment on column BLSCDW.DWD_BNS_TZLCTZB is receipt_date
  is '到账date';
comment on column BLSCDW.DWD_BNS_TZLCTZB is standard_balance
  is '本位币余额';
comment on column BLSCDW.DWD_BNS_TZLCTZB is real_expiration
  is '实际到期日';
comment on column BLSCDW.DWD_BNS_TZLCTZB is actual_income
  is '实际收益';
comment on column BLSCDW.DWD_BNS_TZLCTZB is actual_rate
  is '实际收益率';
comment on column BLSCDW.DWD_BNS_TZLCTZB is shares_before_redemption
  is '赎回前份额';
comment on column BLSCDW.DWD_BNS_TZLCTZB is end_mode
  is '结束方式   0:正常结束,1:到期本金转存,2:到期本息转存';
comment on column BLSCDW.DWD_BNS_TZLCTZB is redeposit_no
  is '转存存单';
comment on column BLSCDW.DWD_BNS_TZLCTZB is redeposit_rate
  is '转存利率';
comment on column BLSCDW.DWD_BNS_TZLCTZB is state
  is '状态  -1:已废弃,0:已生效,1:已到期,2:已结束';
comment on column BLSCDW.DWD_BNS_TZLCTZB is create_time
  is 'created时间';
comment on column BLSCDW.DWD_BNS_TZLCTZB is last_update_time
  is '更新时间';
comment on column BLSCDW.DWD_BNS_TZLCTZB is currency_name
  is '币种name';
comment on column BLSCDW.DWD_BNS_TZLCTZB is apply_id
  is '申请单流水';
comment on column BLSCDW.DWD_BNS_TZLCTZB is data_type
  is '数据类型  1:手工登记 2:人工import 3:根据明细生成';
comment on column BLSCDW.DWD_BNS_TZLCTZB is redeposit_end_mode
  is '转存结束方式';
comment on column BLSCDW.DWD_BNS_TZLCTZB is product_sum_value
  is '产品总value';
comment on column BLSCDW.DWD_BNS_TZLCTZB is redeem_value
  is '赎回份数';
comment on column BLSCDW.DWD_BNS_TZLCTZB is redeem_sum_value
  is '赎回总额';
comment on column BLSCDW.DWD_BNS_TZLCTZB is redeem_net
  is '赎回净额';
comment on column BLSCDW.DWD_BNS_TZLCTZB is associate_fee
  is '相关费用';
comment on column BLSCDW.DWD_BNS_TZLCTZB is total_benefits
  is '产品生命周期收益总额';
comment on column BLSCDW.DWD_BNS_TZLCTZB is change_value
  is '净value变动变化量';
