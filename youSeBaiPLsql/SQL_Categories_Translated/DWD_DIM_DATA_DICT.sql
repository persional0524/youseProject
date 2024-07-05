create table BLSCDW.DWD_DIM_DATA_DICT
(
  dict_type_code VARCHAR2(50),
  dict_type_name VARCHAR2(128),
  standard_code  VARCHAR2(32),
  standard_name  VARCHAR2(128),
  remark         VARCHAR2(500),
  is_enabled     INTEGER
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
comment on table BLSCDW.DWD_DIM_DATA_DICT
  is '数据dictionary表';
comment on column BLSCDW.DWD_DIM_DATA_DICT is dict_type_code
  is 'dictionary类型code';
comment on column BLSCDW.DWD_DIM_DATA_DICT is dict_type_name
  is 'dictionary类型name';
comment on column BLSCDW.DWD_DIM_DATA_DICT is standard_code
  is '标准代码';
comment on column BLSCDW.DWD_DIM_DATA_DICT is standard_name
  is '标准name';
comment on column BLSCDW.DWD_DIM_DATA_DICT is remark
  is '描述';
comment on column BLSCDW.DWD_DIM_DATA_DICT is is_enabled
  is '生效标记，0:不生效，1:生效';
