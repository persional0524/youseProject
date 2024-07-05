create table BLSCDW.DWDTP_DIM_INDUSTRY
(
  type_code   VARCHAR2(64) not null,
  type_name   VARCHAR2(128),
  parent_code VARCHAR2(64),
  type_level  INTEGER,
  remark      VARCHAR2(2048),
  is_enable   INTEGER
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
comment on table BLSCDW.DWDTP_DIM_INDUSTRY
  is '行业分类';
comment on column BLSCDW.DWDTP_DIM_INDUSTRY is type_code
  is '行业code';
comment on column BLSCDW.DWDTP_DIM_INDUSTRY is type_name
  is '行业name';
comment on column BLSCDW.DWDTP_DIM_INDUSTRY is parent_code
  is '上级行业code';
comment on column BLSCDW.DWDTP_DIM_INDUSTRY is type_level
  is '分类级别';
comment on column BLSCDW.DWDTP_DIM_INDUSTRY is remark
  is '备注';
comment on column BLSCDW.DWDTP_DIM_INDUSTRY is is_enable
  is '使用状态,0:启用，1：停用';
