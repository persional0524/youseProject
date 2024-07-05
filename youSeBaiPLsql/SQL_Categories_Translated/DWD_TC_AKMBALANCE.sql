create table BLSCDW.DWD_TC_AKMBALANCE
(
  vdate        DATE not null,
  clt_no       VARCHAR2(32) not null,
  clt_name     VARCHAR2(128),
  akm_code     VARCHAR2(32) not null,
  akm_name     VARCHAR2(128),
  balance      NUMBER(16,2),
  secondary_id VARCHAR2(64)
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
comment on column BLSCDW.DWD_TC_AKMBALANCE is secondary_id
  is '二级单位代码';
