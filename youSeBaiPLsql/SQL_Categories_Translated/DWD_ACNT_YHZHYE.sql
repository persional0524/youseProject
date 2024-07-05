create table BLSCDW.DWD_ACNT_YHZHYE
(
  balance_id        INTEGER not null,
  accountid         INTEGER,
  accountcode       VARCHAR2(32),
  bank_code         VARCHAR2(6) not null,
  accountno         VARCHAR2(32) not null,
  balance_date      DATE not null,
  account_balance   NUMBER(16,2),
  available_balance NUMBER(16,2),
  yesterday_balance NUMBER(15,2),
  available_tuota   NUMBER(15,2),
  data_type         VARCHAR2(2),
  create_time       DATE,
  update_time       DATE,
  currency_code     VARCHAR2(16)
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
comment on table BLSCDW.DWD_ACNT_YHZHYE
  is 'bank账户余额';
comment on column BLSCDW.DWD_ACNT_YHZHYE is balance_id
  is '账户余额id';
comment on column BLSCDW.DWD_ACNT_YHZHYE is accountid
  is '账户流水号';
comment on column BLSCDW.DWD_ACNT_YHZHYE is accountcode
  is '账户代码';
comment on column BLSCDW.DWD_ACNT_YHZHYE is bank_code
  is 'bankcode';
comment on column BLSCDW.DWD_ACNT_YHZHYE is accountno
  is '账号';
comment on column BLSCDW.DWD_ACNT_YHZHYE is balance_date
  is '余额date';
comment on column BLSCDW.DWD_ACNT_YHZHYE is account_balance
  is '当前余额';
comment on column BLSCDW.DWD_ACNT_YHZHYE is available_balance
  is '可用余额';
comment on column BLSCDW.DWD_ACNT_YHZHYE is yesterday_balance
  is '昨日余额';
comment on column BLSCDW.DWD_ACNT_YHZHYE is available_tuota
  is '可用额度';
comment on column BLSCDW.DWD_ACNT_YHZHYE is data_type
  is '数据源类型，01：bp通知;
comment on column BLSCDW.DWD_ACNT_YHZHYE is create_time
  is 'created时间';
comment on column BLSCDW.DWD_ACNT_YHZHYE is update_time
  is '最后修改时间';
comment on column BLSCDW.DWD_ACNT_YHZHYE is currency_code
  is '币种';
