create table BLSCDW.DW_FXQ_BCS_CODE
(
  txid    INTEGER,
  gz_code INTEGER,
  txdate  VARCHAR2(20)
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
