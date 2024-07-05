create table BLSCDW.DWD_DIM_CNAPS
(
  cnapsno         VARCHAR2(20) not null,
  bankno          VARCHAR2(3),
  opbankname      VARCHAR2(256) not null,
  opbankaddr      VARCHAR2(256),
  regno           VARCHAR2(16),
  std_region_code VARCHAR2(12),
  country         VARCHAR2(50),
  is_domestic     INTEGER,
  bank_code       VARCHAR2(32),
  ht_s_dt         DATE,
  ht_e_dt         DATE
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
comment on table BLSCDW.DWD_DIM_CNAPS
  is '支行基本信息';
comment on column BLSCDW.DWD_DIM_CNAPS is cnapsno
  is '支行code';
comment on column BLSCDW.DWD_DIM_CNAPS is bankno
  is '支付机构code(bank真实code,与联行号前三位一致)';
comment on column BLSCDW.DWD_DIM_CNAPS is opbankname
  is '支行name';
comment on column BLSCDW.DWD_DIM_CNAPS is opbankaddr
  is '支行地址';
comment on column BLSCDW.DWD_DIM_CNAPS is regno
  is '行政编码';
comment on column BLSCDW.DWD_DIM_CNAPS is std_region_code
  is '人行region编码';
comment on column BLSCDW.DWD_DIM_CNAPS is country
  is '国家';
comment on column BLSCDW.DWD_DIM_CNAPS is is_domestic
  is '是否是境内 1、是;
comment on column BLSCDW.DWD_DIM_CNAPS is bank_code
  is '支付机构code(资金系统内部code,在资金系统内部使用都应该使用此code)';
