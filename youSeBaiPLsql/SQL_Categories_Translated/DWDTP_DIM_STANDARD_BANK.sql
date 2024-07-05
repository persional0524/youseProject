create table BLSCDW.DWDTP_DIM_STANDARD_BANK
(
  bank_code               VARCHAR2(9) not null,
  bank_name               VARCHAR2(120) not null,
  bank_key                VARCHAR2(60) not null,
  bank_short_name         VARCHAR2(120) not null,
  cnaps_bank_no           VARCHAR2(10) not null,
  cnaps_bank_name         VARCHAR2(100),
  connect_flag            INTEGER not null,
  branch_type             INTEGER,
  is_enable               INTEGER not null,
  organization_type       INTEGER,
  organization_attributes INTEGER
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
comment on table BLSCDW.DWDTP_DIM_STANDARD_BANK
  is 'bank表';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is bank_code
  is 'bankcode';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is bank_name
  is 'bankname';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is bank_key
  is '英文缩写代码';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is bank_short_name
  is 'bank简称';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is cnaps_bank_no
  is 'CNAPSbankcode';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is cnaps_bank_name
  is 'CNAPSbankname';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is connect_flag
  is '是否直连bank(1：是，0：否)';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is branch_type
  is '0:非bank 1:bank 2:外资bank 3:其他';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is is_enable
  is '0:停用 1:启用';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is organization_type
  is '机构类型';
comment on column BLSCDW.DWDTP_DIM_STANDARD_BANK is organization_attributes
  is '机构属性';
