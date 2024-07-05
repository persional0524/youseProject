create table BLSCDW.DWD_PDC_IN_DEPOSIT
(
  p_code VARCHAR2(32),
  p_name VARCHAR2(128),
  p_type VARCHAR2(30)
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
comment on table BLSCDW.DWD_PDC_IN_DEPOSIT
  is '存款产品';
comment on column BLSCDW.DWD_PDC_IN_DEPOSIT is p_code
  is '产品代码';
comment on column BLSCDW.DWD_PDC_IN_DEPOSIT is p_name
  is '产品name';
comment on column BLSCDW.DWD_PDC_IN_DEPOSIT is p_type
  is '业务种类';
