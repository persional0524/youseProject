create table BLSCDW.DWD_AGT_FIN_LEASE_ADD
(
  rzzlcpm                 VARCHAR2(50),
  rzzlamount              NUMBER(18,2),
  leasing_mode            VARCHAR2(8),
  pay_type                VARCHAR2(10),
  product_enterprise_name VARCHAR2(120),
  contract_no             VARCHAR2(64),
  rzzlms                  VARCHAR2(200),
  contract_id             VARCHAR2(128),
  rzzlsl                  INTEGER,
  flow_id                 VARCHAR2(128),
  rzzlfphm                VARCHAR2(200),
  product_name            VARCHAR2(120),
  ht_s_dt                 DATE,
  ht_e_dt                 DATE
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
comment on table BLSCDW.DWD_AGT_FIN_LEASE_ADD
  is '融资租赁补充信息表';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is rzzlcpm
  is '融资租赁产品名';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is rzzlamount
  is '融资租赁金额';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is leasing_mode
  is '租赁方式';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is pay_type
  is '租金支付方式';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is product_enterprise_name
  is '产品所属企业的name';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is contract_no
  is '合同号';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is rzzlms
  is '融资租赁租赁物描述';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is rzzlsl
  is '融资租赁数量';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is flow_id
  is '主键ID';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is rzzlfphm
  is '融资租赁发票号码';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is product_name
  is '产品name';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_AGT_FIN_LEASE_ADD is ht_e_dt
  is '拉链结束日 ';
