create table BLSCDW.SSSJ_SKDPJYJK_CDK
(
  cust_id      VARCHAR2(100),
  book_balance NUMBER(16,2),
  amount1      NUMBER(16,2),
  amount2      NUMBER(16,2),
  kmh          VARCHAR2(100),
  account_no   VARCHAR2(200)
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
comment on column BLSCDW.SSSJ_SKDPJYJK_CDK is cust_id
  is '单位code';
comment on column BLSCDW.SSSJ_SKDPJYJK_CDK is book_balance
  is '余额';
comment on column BLSCDW.SSSJ_SKDPJYJK_CDK is amount1
  is '贷款放款/存款支取';
comment on column BLSCDW.SSSJ_SKDPJYJK_CDK is amount2
  is '贷款还款/存款存入';
comment on column BLSCDW.SSSJ_SKDPJYJK_CDK is kmh
  is '存款。贷款';
