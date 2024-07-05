create table BLSCDW.DWD_D_BASEINFO
(
  dim_type VARCHAR2(32),
  dw_code  VARCHAR2(32),
  dw_name  VARCHAR2(128),
  sor_code VARCHAR2(32)
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
comment on table BLSCDW.DWD_D_BASEINFO
  is 'ETL转码表';
