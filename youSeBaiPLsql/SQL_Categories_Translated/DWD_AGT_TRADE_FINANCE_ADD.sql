create table BLSCDW.DWD_AGT_TRADE_FINANCE_ADD
(
  contract_id        VARCHAR2(128),
  confirm_bank_name  VARCHAR2(255),
  credit_amount      NUMBER(15,2),
  credit_currency    VARCHAR2(3),
  credit_end_date    DATE,
  credit_number      VARCHAR2(120),
  credit_str_date    DATE,
  duration_type      VARCHAR2(20),
  fft_type           VARCHAR2(10),
  invoice_amount     NUMBER(15,2),
  invoice_currency   VARCHAR2(3),
  invoice_num        VARCHAR2(120),
  invoice_type       VARCHAR2(20),
  total_amount       NUMBER(15,2),
  trade_no           VARCHAR2(120),
  trade_currency     VARCHAR2(3),
  trade_finance_type VARCHAR2(60),
  ht_s_dt            DATE,
  ht_e_dt            DATE
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
comment on table BLSCDW.DWD_AGT_TRADE_FINANCE_ADD
  is '贸易融资补充信息表';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is confirm_bank_name
  is '信用证承兑行(或保兑行)name';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is credit_amount
  is '信用证金额';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is credit_currency
  is '信用证币种';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is credit_end_date
  is '信用证有效期';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is credit_number
  is '信用证code';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is credit_str_date
  is '信用证开证date';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is duration_type
  is '信用证期限类型';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is fft_type
  is '福费廷种类';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is invoice_amount
  is '商业发票金额';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is invoice_currency
  is '商业发票币种';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is invoice_num
  is '商业发票号码';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is invoice_type
  is '商业发票种类';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is total_amount
  is '贸易合同总金额';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is trade_no
  is '贸易融资合同号';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is trade_currency
  is '贸易合同总金额币种';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is trade_finance_type
  is '贸易融资品种';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_AGT_TRADE_FINANCE_ADD is ht_e_dt
  is '拉链结束';
