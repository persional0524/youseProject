create table BLSCDW.DWD_SK_JYJC
(
  record_id INTEGER,
  v_date    DATE,
  jclx      INTEGER
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
