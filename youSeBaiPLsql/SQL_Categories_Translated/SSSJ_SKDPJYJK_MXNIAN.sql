create table BLSCDW.SSSJ_SKDPJYJK_MXNIAN
(
  cltno           VARCHAR2(100),
  accountname     VARCHAR2(300),
  op_account_name VARCHAR2(300),
  count_          INTEGER,
  amount          NUMBER(16,2),
  dejy            NUMBER(16,2),
  jymgje          NUMBER(16,2),
  yuedate         DATE
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
