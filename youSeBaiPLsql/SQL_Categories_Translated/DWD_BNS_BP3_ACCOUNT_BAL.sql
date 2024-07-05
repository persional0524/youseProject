create table BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL
(
  balance_id        INTEGER not null,
  account_id        INTEGER,
  bank_code         VARCHAR2(6) not null,
  account_no        VARCHAR2(100) not null,
  balance_date      DATE not null,
  currency_code     VARCHAR2(10),
  account_balance   NUMBER(15,2),
  available_balance NUMBER(15,2),
  yesterday_balance NUMBER(15,2),
  available_tuota   NUMBER(15,2),
  create_time       DATE default SYSDATE,
  update_time       DATE default SYSDATE,
  reserved1         VARCHAR2(300),
  reserved2         VARCHAR2(300),
  reserved3         VARCHAR2(300),
  reserved4         VARCHAR2(300),
  reserved5         VARCHAR2(3000),
  receiver_date     DATE
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
comment on table BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL
  is 'bank账户余额';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is balance_id
  is '账户余额ID';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is account_id
  is 'bank账户ID';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is bank_code
  is 'bankcode';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is account_no
  is '账号';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is balance_date
  is '余额date';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is currency_code
  is '币种编码(CNY：人民币;
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is account_balance
  is '当前余额';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is available_balance
  is '可用余额';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is yesterday_balance
  is '昨日余额';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is available_tuota
  is '可用额度';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is create_time
  is 'created时间';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is update_time
  is '更新时间';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is reserved1
  is '备用字段1';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is reserved2
  is '备用字段2';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is reserved3
  is '备用字段3';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is reserved4
  is '备用字段4';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is reserved5
  is '备用字段5';
comment on column BLSCDW.DWD_BNS_BP3_ACCOUNT_BAL is receiver_date
  is 'front接收处理时间';
