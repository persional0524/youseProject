create table BLSCDW.DIM_REGION
(
  code_type          VARCHAR2(50),
  code_type_name     VARCHAR2(128),
  standard_code      VARCHAR2(32),
  standard_code_name VARCHAR2(200),
  code_type_desc     VARCHAR2(4000),
  is_private         INTEGER,
  pre_code           VARCHAR2(32),
  is_used            INTEGER,
  code_mark          VARCHAR2(500)
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
comment on table BLSCDW.DIM_REGION
  is '数据dictionary表';
comment on column BLSCDW.DIM_REGION is code_type
  is 'dictionary类型';
comment on column BLSCDW.DIM_REGION is code_type_name
  is 'dictionary类型name';
comment on column BLSCDW.DIM_REGION is standard_code
  is '标准代码';
comment on column BLSCDW.DIM_REGION is standard_code_name
  is '标准代码name';
comment on column BLSCDW.DIM_REGION is code_type_desc
  is 'dictionary类型描述';
comment on column BLSCDW.DIM_REGION is is_private
  is '是否client化';
comment on column BLSCDW.DIM_REGION is pre_code
  is '上级代码';
comment on column BLSCDW.DIM_REGION is is_used
  is '是否启用 0否1是';
comment on column BLSCDW.DIM_REGION is code_mark
  is '备注';
