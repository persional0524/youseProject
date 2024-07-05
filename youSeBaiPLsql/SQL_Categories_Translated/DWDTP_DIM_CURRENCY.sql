create table BLSCDW.DWDTP_DIM_CURRENCY
(
  codeno        VARCHAR2(12) not null,
  codename      VARCHAR2(150) not null,
  englisname    VARCHAR2(96),
  symbol        VARCHAR2(50),
  countryname   VARCHAR2(200),
  isenable      INTEGER,
  codeorder     INTEGER,
  currency_unit VARCHAR2(150)
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
comment on table BLSCDW.DWDTP_DIM_CURRENCY
  is '币种';
comment on column BLSCDW.DWDTP_DIM_CURRENCY is codeno
  is '国际代码';
comment on column BLSCDW.DWDTP_DIM_CURRENCY is codename
  is '中文name';
comment on column BLSCDW.DWDTP_DIM_CURRENCY is englisname
  is '英文name';
comment on column BLSCDW.DWDTP_DIM_CURRENCY is symbol
  is '货币符号';
comment on column BLSCDW.DWDTP_DIM_CURRENCY is countryname
  is '国家name';
comment on column BLSCDW.DWDTP_DIM_CURRENCY is codeorder
  is '排列顺序';
comment on column BLSCDW.DWDTP_DIM_CURRENCY is currency_unit
  is '货币基础单位';
