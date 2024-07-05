create table BLSCDW.DWD_BNS_YSZYMX
(
  ledger_id           INTEGER not null,
  actual_id           INTEGER,
  quota_id            INTEGER,
  act_date            DATE,
  dir                 VARCHAR2(1),
  amount              NUMBER(15,2),
  cash_amount         NUMBER(15,2),
  bill_amount         NUMBER(15,2),
  lc_amount           NUMBER(15,2),
  channel             VARCHAR2(32),
  budget_code         VARCHAR2(128),
  budget_unit_no      VARCHAR2(256) not null,
  budget_account_code VARCHAR2(32),
  unit_no             VARCHAR2(32),
  account_no          VARCHAR2(64),
  bank_no             VARCHAR2(64),
  op_bank_no          VARCHAR2(64),
  op_account_no       VARCHAR2(64),
  op_account_name     VARCHAR2(64),
  active_flag         NUMBER default 0 not null,
  currency_code       VARCHAR2(64),
  locked              INTEGER default 0 not null
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
comment on table BLSCDW.DWD_BNS_YSZYMX
  is 'budget占用释放台账表';
comment on column BLSCDW.DWD_BNS_YSZYMX is ledger_id
  is '台账ID';
comment on column BLSCDW.DWD_BNS_YSZYMX is actual_id
  is 'budget占用ID';
comment on column BLSCDW.DWD_BNS_YSZYMX is quota_id
  is 'budget额度ID';
comment on column BLSCDW.DWD_BNS_YSZYMX is act_date
  is '占用时间';
comment on column BLSCDW.DWD_BNS_YSZYMX is dir
  is '占用方向:1-占用;
comment on column BLSCDW.DWD_BNS_YSZYMX is amount
  is '总额';
comment on column BLSCDW.DWD_BNS_YSZYMX is cash_amount
  is '现金金额';
comment on column BLSCDW.DWD_BNS_YSZYMX is bill_amount
  is '票据金额';
comment on column BLSCDW.DWD_BNS_YSZYMX is lc_amount
  is '信用证金额';
comment on column BLSCDW.DWD_BNS_YSZYMX is channel
  is '渠道code';
comment on column BLSCDW.DWD_BNS_YSZYMX is budget_code
  is 'budget号';
comment on column BLSCDW.DWD_BNS_YSZYMX is budget_unit_no
  is 'budget单位';
comment on column BLSCDW.DWD_BNS_YSZYMX is budget_account_code
  is 'budget科目';
comment on column BLSCDW.DWD_BNS_YSZYMX is unit_no
  is '业务单位code';
comment on column BLSCDW.DWD_BNS_YSZYMX is account_no
  is '业务bank账号';
comment on column BLSCDW.DWD_BNS_YSZYMX is bank_no
  is '支付机构code';
comment on column BLSCDW.DWD_BNS_YSZYMX is op_bank_no
  is '对方支付机构code';
comment on column BLSCDW.DWD_BNS_YSZYMX is op_account_no
  is '对方bank账号';
comment on column BLSCDW.DWD_BNS_YSZYMX is op_account_name
  is '对方bank账号户名';
comment on column BLSCDW.DWD_BNS_YSZYMX is active_flag
  is '生效标记';
comment on column BLSCDW.DWD_BNS_YSZYMX is currency_code
  is '明细币种code';
comment on column BLSCDW.DWD_BNS_YSZYMX is locked
  is '是否锁定,1-是,0-否';
