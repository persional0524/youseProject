create table BLSCDW.DWS_BANK_SAVING
(
  accountid           INTEGER,
  accountcode         VARCHAR2(32),
  bank_code           VARCHAR2(6),
  accountno           VARCHAR2(32),
  balance_date        DATE,
  available_balance   NUMBER(16,2),
  currency_code       VARCHAR2(16),
  cltno               VARCHAR2(32),
  branch_bank_no      VARCHAR2(64),
  regno               VARCHAR2(12),
  openaccountdate     DATE,
  accountname         VARCHAR2(128),
  associateflag       VARCHAR2(2),
  acntstate           INTEGER,
  canceldate          DATE,
  cash_manage_type    INTEGER,
  xjgllx_cn           VARCHAR2(128),
  bank_account_nature INTEGER,
  yhzhxz_cn           VARCHAR2(128),
  account_type        VARCHAR2(128),
  account_type_name   VARCHAR2(128),
  bank_short_name     VARCHAR2(128),
  cs_account_flag     NUMBER(1),
  account_balance     NUMBER(15,2),
  atype               VARCHAR2(36),
  account_rate        NUMBER(15,6)
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
comment on table BLSCDW.DWS_BANK_SAVING
  is 'bank账户余额表';
comment on column BLSCDW.DWS_BANK_SAVING is accountid
  is '账户流水号';
comment on column BLSCDW.DWS_BANK_SAVING is accountcode
  is '账户代码';
comment on column BLSCDW.DWS_BANK_SAVING is bank_code
  is 'bankcode';
comment on column BLSCDW.DWS_BANK_SAVING is accountno
  is '账号';
comment on column BLSCDW.DWS_BANK_SAVING is balance_date
  is '余额date';
comment on column BLSCDW.DWS_BANK_SAVING is available_balance
  is '可用余额';
comment on column BLSCDW.DWS_BANK_SAVING is currency_code
  is '币种';
comment on column BLSCDW.DWS_BANK_SAVING is cltno
  is '单位code';
comment on column BLSCDW.DWS_BANK_SAVING is branch_bank_no
  is '合作金融网点code(支行号)';
comment on column BLSCDW.DWS_BANK_SAVING is regno
  is '地区编码';
comment on column BLSCDW.DWS_BANK_SAVING is openaccountdate
  is '开户date';
comment on column BLSCDW.DWS_BANK_SAVING is accountname
  is '户名';
comment on column BLSCDW.DWS_BANK_SAVING is associateflag
  is '联网方式 0：非直连;
comment on column BLSCDW.DWS_BANK_SAVING is acntstate
  is '账户状态 0：正常;
comment on column BLSCDW.DWS_BANK_SAVING is canceldate
  is '销户date';
comment on column BLSCDW.DWS_BANK_SAVING is cash_manage_type
  is '1:二级户2:三级户3:普通户4:联动户5:代理行账户6:虚拟户7:头寸户8:investment户9:代理investment户10:国内资金主账户11:国际资金主账户12:保证金账户13:多币种账户';
comment on column BLSCDW.DWS_BANK_SAVING is bank_account_nature
  is 'bank账户性质';
comment on column BLSCDW.DWS_BANK_SAVING is account_type
  is '账户类型';
comment on column BLSCDW.DWS_BANK_SAVING is account_type_name
  is '账户类型name';
comment on column BLSCDW.DWS_BANK_SAVING is bank_short_name
  is 'bank简称';
comment on column BLSCDW.DWS_BANK_SAVING is cs_account_flag
  is '是否N9挂接账户：0否1是';
comment on column BLSCDW.DWS_BANK_SAVING is account_balance
  is '账户余额';
comment on column BLSCDW.DWS_BANK_SAVING is atype
  is '存款类型S1-活期，S2-协定，S3-定期，S4-通知，S6-保证金';
comment on column BLSCDW.DWS_BANK_SAVING is account_rate
  is '账户利率';
