create table BLSCDW.DWD_DIM_SKRATE
(
  rate_id     NUMBER,
  rate_type   VARCHAR2(10),
  rate_name   VARCHAR2(40),
  rate_value  NUMBER(17,6),
  currency_no VARCHAR2(10),
  active_date DATE,
  is_flag     VARCHAR2(5)
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
comment on column BLSCDW.DWD_DIM_SKRATE is rate_id
  is '利率ID';
comment on column BLSCDW.DWD_DIM_SKRATE is rate_type
  is '利率类型';
comment on column BLSCDW.DWD_DIM_SKRATE is rate_name
  is '利率类型name';
comment on column BLSCDW.DWD_DIM_SKRATE is rate_value
  is '利率';
comment on column BLSCDW.DWD_DIM_SKRATE is currency_no
  is '币种';
comment on column BLSCDW.DWD_DIM_SKRATE is active_date
  is '生效date';
comment on column BLSCDW.DWD_DIM_SKRATE is is_flag
  is '生效flag';
