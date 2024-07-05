create table BLSCDW.DWD_BNS_TZLCDQJHB
(
  plan_id          INTEGER not null,
  contract_id      INTEGER,
  class            VARCHAR2(20),
  business_type    VARCHAR2(64),
  clt_no           VARCHAR2(64),
  issuer           VARCHAR2(64),
  issuer_name      VARCHAR2(128),
  currency_no      VARCHAR2(12),
  currency_name    VARCHAR2(32),
  product_no       VARCHAR2(128),
  product_name     VARCHAR2(128),
  except_rate      NUMBER(15,2),
  clt_name         VARCHAR2(128),
  deposit_no       VARCHAR2(64),
  amount           NUMBER(15,2),
  expire_date      DATE,
  except_income    NUMBER(15,2),
  actual_income    NUMBER(15,2),
  state            INTEGER,
  create_time      DATE,
  last_update_time DATE,
  remark           VARCHAR2(64),
  ht_s_dt          DATE,
  ht_e_dt          DATE
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
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is plan_id
  is '主键';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is contract_id
  is '合同id';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is class
  is '业务类别  DEPOSIT:存款,FINANCIAL:理财';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is business_type
  is '业务品种  LARGE_DEPOSIT:大额存单,MARGIN_DEPOSIT:保证金存款,TIME_DEPOSIT:定期存款,CALL_DEPOSIT:通知存款,MONETARY_FUND:货币基金,STRUCTURED_DEPOSIT:结构性存款,FINANCIAL_PRODUCTS:理财产品';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is clt_no
  is '单位编码';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is issuer
  is '发行机构';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is issuer_name
  is '发行机构name';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is currency_no
  is '币种';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is currency_name
  is '币种name';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is product_no
  is '产品编码';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is product_name
  is '产品name';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is except_rate
  is '预期年化收益率';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is clt_name
  is '单位name';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is deposit_no
  is '存单号';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is amount
  is '金额';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is expire_date
  is '到期date';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is except_income
  is '预期收益';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is actual_income
  is '实际收益';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is state
  is '状态  0:未到期.1:已到期,2:已执行';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is create_time
  is 'created时间';
comment on column BLSCDW.DWD_BNS_TZLCDQJHB is last_update_time
  is '最后更新时间';
