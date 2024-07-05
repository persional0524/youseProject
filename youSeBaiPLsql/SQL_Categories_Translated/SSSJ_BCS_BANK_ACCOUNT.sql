create table BLSCDW.SSSJ_BCS_BANK_ACCOUNT
(
  account_no    VARCHAR2(32),
  account_state INTEGER,
  check_acc_no  VARCHAR2(32),
  belongto_flag INTEGER
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
