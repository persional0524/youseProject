create table BLSCDW.DWDTP_DIM_COUNTRY
(
  code        VARCHAR2(5) not null,
  name        VARCHAR2(24) not null,
  englisname  VARCHAR2(96),
  chinesename VARCHAR2(96),
  isenable    INTEGER,
  codeorder   INTEGER
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
comment on table BLSCDW.DWDTP_DIM_COUNTRY
  is '国家';
comment on column BLSCDW.DWDTP_DIM_COUNTRY is code
  is '英文缩写';
comment on column BLSCDW.DWDTP_DIM_COUNTRY is name
  is '中文简称';
comment on column BLSCDW.DWDTP_DIM_COUNTRY is englisname
  is '英文name';
comment on column BLSCDW.DWDTP_DIM_COUNTRY is chinesename
  is '中文name';
comment on column BLSCDW.DWDTP_DIM_COUNTRY is codeorder
  is '排列顺序';
