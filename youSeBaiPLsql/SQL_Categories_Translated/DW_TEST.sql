create table BLSCDW.DW_TEST
(
  accountno   VARCHAR2(32) not null,
  accountname VARCHAR2(128) not null
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
