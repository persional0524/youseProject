create table BLSCDW.DWDTP_AGT_DEPOSIT
(
  bizid          INTEGER not null,
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
