create table BLSCDW.DIM_IMP_EJGSHBKJ_TP
(
  jc   VARCHAR2(100),
  khh  VARCHAR2(20),
  qc   VARCHAR2(200),
  jcn9 VARCHAR2(100),
  px   INTEGER
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
