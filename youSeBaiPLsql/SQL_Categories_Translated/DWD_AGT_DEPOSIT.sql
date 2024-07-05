create table BLSCDW.DWD_AGT_DEPOSIT
(
  bizid          INTEGER,
  biztype        VARCHAR2(2),
  memberno       VARCHAR2(32),
  fixedaccountno VARCHAR2(32),
  account_name   VARCHAR2(128),
  amount         NUMBER(16,2),
  startdate      DATE,
  enddate        DATE,
  rate           NUMBER(10,6),
  orgid          VARCHAR2(6),
  subject_no     VARCHAR2(16),
  currency       VARCHAR2(8),
  biz_code       VARCHAR2(60),
  pdc_type       VARCHAR2(32),
  treat_way      INTEGER,
  ht_s_dt        DATE,
  ht_e_dt        DATE,
  account_state  INTEGER,
  clear_date     DATE
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
comment on table BLSCDW.DWD_AGT_DEPOSIT
  is '存款协议';
comment on column BLSCDW.DWD_AGT_DEPOSIT is treat_way
  is '1为不转存,
3为自动本息转存,
4为自动本金转存';
