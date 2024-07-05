create table BLSCDW.MDM_BANK
(
  bank_cnaps_no        VARCHAR2(16),
  bank_name            VARCHAR2(100),
  bank_no              VARCHAR2(3),
  chinese_name         VARCHAR2(100),
  cltno                VARCHAR2(30) not null,
  clt_info_type        NUMBER,
  credit_code          VARCHAR2(50),
  data_source          VARCHAR2(30),
  finan_institute_type VARCHAR2(10),
  ht_e_dt              DATE,
  ht_s_dt              DATE,
  legal_financ_code    VARCHAR2(20),
  swiftcode            VARCHAR2(20),
  v_dept_id            VARCHAR2(36),
  connect_flag         INTEGER,
  is_enable            INTEGER
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
comment on table BLSCDW.MDM_BANK
  is '金融机构信息表';
comment on column BLSCDW.MDM_BANK is bank_cnaps_no
  is 'CNAPS网点code';
comment on column BLSCDW.MDM_BANK is bank_name
  is '总行name';
comment on column BLSCDW.MDM_BANK is bank_no
  is '总行code';
comment on column BLSCDW.MDM_BANK is chinese_name
  is 'client中文name';
comment on column BLSCDW.MDM_BANK is cltno
  is 'clientcode';
comment on column BLSCDW.MDM_BANK is clt_info_type
  is 'client类型';
comment on column BLSCDW.MDM_BANK is credit_code
  is '统一社会信用代码';
comment on column BLSCDW.MDM_BANK is finan_institute_type
  is '金融机构类型';
comment on column BLSCDW.MDM_BANK is legal_financ_code
  is '总行金融许可证号';
comment on column BLSCDW.MDM_BANK is swiftcode
  is 'SWIFTCODE';
comment on column BLSCDW.MDM_BANK is v_dept_id
  is '部门code';
