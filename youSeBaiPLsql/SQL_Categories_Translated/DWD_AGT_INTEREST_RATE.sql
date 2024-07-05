create table BLSCDW.DWD_AGT_INTEREST_RATE
(
  rate_id     NUMBER,
  kind_name   VARCHAR2(40),
  rate_no     VARCHAR2(10),
  rate_type   VARCHAR2(1),
  period_name VARCHAR2(40),
  active_date DATE,
  rate_value  NUMBER(17,6),
  is_base     NUMBER,
  cy_id       VARCHAR2(10),
  lpr_dt_flag NUMBER
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
comment on column BLSCDW.DWD_AGT_INTEREST_RATE is rate_id
  is '利率ID';
comment on column BLSCDW.DWD_AGT_INTEREST_RATE is rate_no
  is 'code   利率种类   利率周期L';
comment on column BLSCDW.DWD_AGT_INTEREST_RATE is rate_type
  is '存款=D贷款=L';
comment on column BLSCDW.DWD_AGT_INTEREST_RATE is is_base
  is '0挂牌利率1基准利率';
comment on column BLSCDW.DWD_AGT_INTEREST_RATE is cy_id
  is '币种';
comment on column BLSCDW.DWD_AGT_INTEREST_RATE is lpr_dt_flag
  is 'LPR生效flag只取1';
