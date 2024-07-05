create table BLSCDW.DWD_DIM_COUNTRY
(
  code        VARCHAR2(5) not null,
  name        VARCHAR2(24) not null,
  englisname  VARCHAR2(96),
  chinesename VARCHAR2(96),
  isenable    INTEGER,
  codeorder   INTEGER,
  ht_s_dt     DATE,
  ht_e_dt     DATE
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
comment on table BLSCDW.DWD_DIM_COUNTRY
  is '国家';
comment on column BLSCDW.DWD_DIM_COUNTRY is code
  is '英文缩写';
comment on column BLSCDW.DWD_DIM_COUNTRY is name
  is '中文简称';
comment on column BLSCDW.DWD_DIM_COUNTRY is englisname
  is '英文name';
comment on column BLSCDW.DWD_DIM_COUNTRY is chinesename
  is '中文name';
comment on column BLSCDW.DWD_DIM_COUNTRY is isenable
  is 'ISENABLE';
comment on column BLSCDW.DWD_DIM_COUNTRY is codeorder
  is '排列顺序';
comment on column BLSCDW.DWD_DIM_COUNTRY is ht_s_dt
  is ' 拉链开始date ';
comment on column BLSCDW.DWD_DIM_COUNTRY is ht_e_dt
  is '拉链结束date';
