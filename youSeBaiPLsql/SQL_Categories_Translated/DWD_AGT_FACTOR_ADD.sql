create table BLSCDW.DWD_AGT_FACTOR_ADD
(
  acct_amount      NUMBER(20,2),
  balance          NUMBER(20,2),
  contract_id      VARCHAR2(128),
  buyercode        VARCHAR2(64),
  buyername        VARCHAR2(500),
  contract_no      VARCHAR2(64),
  end_date         DATE,
  flowid           VARCHAR2(128),
  interest         NUMBER(20,2),
  invoice_amt      NUMBER(20,2),
  invoice_currency VARCHAR2(3),
  invoice_no       VARCHAR2(150),
  invoice_type     VARCHAR2(10),
  purchase_loan_no VARCHAR2(64),
  rate             NUMBER(20,6),
  receive_type     VARCHAR2(10),
  start_date       DATE,
  hxcode           VARCHAR2(64),
  hxname           VARCHAR2(500),
  gyscode          VARCHAR2(64),
  gysname          VARCHAR2(500),
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
comment on table BLSCDW.DWD_AGT_FACTOR_ADD
  is '保理补充信息表';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is acct_amount
  is '实有金额';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is balance
  is '余额';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is buyercode
  is '购货方code';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is buyername
  is '购货方';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is contract_no
  is '合同号';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is end_date
  is '应收账款到期日';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is flowid
  is '主键ID';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is interest
  is '利息';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is invoice_amt
  is '商业发票金额';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is invoice_currency
  is '商业发票币种';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is invoice_no
  is '商业发票号码';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is invoice_type
  is '商业发票种类';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is purchase_loan_no
  is '购销合同号';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is rate
  is '利率';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is receive_type
  is '应收账款类型';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is start_date
  is '应收账款开始日';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is hxcode
  is '核心企业code';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is hxname
  is '核心企业name';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is gyscode
  is '供应商code';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is gysname
  is '供应商name';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_AGT_FACTOR_ADD is ht_e_dt
  is '拉链结束日';
