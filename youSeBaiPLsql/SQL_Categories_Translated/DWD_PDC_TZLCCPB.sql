create table BLSCDW.DWD_PDC_TZLCCPB
(
  product_id        INTEGER not null,
  class             VARCHAR2(20),
  issuer            VARCHAR2(64),
  issuer_name       VARCHAR2(128),
  business_type     VARCHAR2(64),
  clt_no            VARCHAR2(64),
  clt_name          VARCHAR2(128),
  product_name      VARCHAR2(128),
  product_no        VARCHAR2(128),
  except_rate       NUMBER(15,2),
  currency_no       VARCHAR2(32),
  risk_level        INTEGER,
  is_open           INTEGER,
  is_net_value      INTEGER,
  establishment     DATE,
  create_time       DATE,
  last_update_time  DATE,
  deposit_period    INTEGER,
  period_unit       VARCHAR2(2),
  product_scale     NUMBER(15,2),
  currency_name     VARCHAR2(32),
  transaction_type  VARCHAR2(10),
  risk_registration VARCHAR2(10),
  ht_s_dt           DATE,
  ht_e_dt           DATE
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
comment on column BLSCDW.DWD_PDC_TZLCCPB is product_id
  is '主键';
comment on column BLSCDW.DWD_PDC_TZLCCPB is class
  is '业务大类  DEPOSIT:存款,FINANCIAL:理财';
comment on column BLSCDW.DWD_PDC_TZLCCPB is issuer
  is '发行机构';
comment on column BLSCDW.DWD_PDC_TZLCCPB is issuer_name
  is '发行机构name';
comment on column BLSCDW.DWD_PDC_TZLCCPB is business_type
  is '业务品种';
comment on column BLSCDW.DWD_PDC_TZLCCPB is clt_no
  is '单位code';
comment on column BLSCDW.DWD_PDC_TZLCCPB is clt_name
  is '单位name';
comment on column BLSCDW.DWD_PDC_TZLCCPB is product_name
  is '产品name';
comment on column BLSCDW.DWD_PDC_TZLCCPB is product_no
  is '产品代码';
comment on column BLSCDW.DWD_PDC_TZLCCPB is except_rate
  is '预期收益率';
comment on column BLSCDW.DWD_PDC_TZLCCPB is currency_no
  is '币种';
comment on column BLSCDW.DWD_PDC_TZLCCPB is risk_level
  is 'risk等级  1:R1,2:R2,3:R3,4:R4,5:R5';
comment on column BLSCDW.DWD_PDC_TZLCCPB is is_open
  is '是否开放型  0:否,1:是';
comment on column BLSCDW.DWD_PDC_TZLCCPB is is_net_value
  is '是否净value型  0:否,1:是';
comment on column BLSCDW.DWD_PDC_TZLCCPB is establishment
  is '成立date';
comment on column BLSCDW.DWD_PDC_TZLCCPB is create_time
  is 'created时间';
comment on column BLSCDW.DWD_PDC_TZLCCPB is last_update_time
  is '最后更新时间';
comment on column BLSCDW.DWD_PDC_TZLCCPB is deposit_period
  is '存期';
comment on column BLSCDW.DWD_PDC_TZLCCPB is period_unit
  is '存期单位';
comment on column BLSCDW.DWD_PDC_TZLCCPB is product_scale
  is '产品规模';
comment on column BLSCDW.DWD_PDC_TZLCCPB is currency_name
  is '币种name';
comment on column BLSCDW.DWD_PDC_TZLCCPB is transaction_type
  is '交易类型';
comment on column BLSCDW.DWD_PDC_TZLCCPB is risk_registration
  is 'risk登记';
