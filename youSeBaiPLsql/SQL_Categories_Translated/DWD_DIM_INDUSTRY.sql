create table BLSCDW.DWD_DIM_INDUSTRY
(
  type_code   VARCHAR2(64),
  type_name   VARCHAR2(128),
  parent_code VARCHAR2(64),
  type_level  INTEGER,
  remark      VARCHAR2(2048),
  is_enable   INTEGER,
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
comment on table BLSCDW.DWD_DIM_INDUSTRY
  is '行业分类';
comment on column BLSCDW.DWD_DIM_INDUSTRY is type_code
  is '行业code';
comment on column BLSCDW.DWD_DIM_INDUSTRY is type_name
  is '行业name';
comment on column BLSCDW.DWD_DIM_INDUSTRY is parent_code
  is '上级行业code';
comment on column BLSCDW.DWD_DIM_INDUSTRY is type_level
  is '分类级别';
comment on column BLSCDW.DWD_DIM_INDUSTRY is remark
  is '备注';
comment on column BLSCDW.DWD_DIM_INDUSTRY is is_enable
  is '使用状态,0:启用，1：停用';
comment on column BLSCDW.DWD_DIM_INDUSTRY is ht_s_dt
  is ' 拉链开始date ';
comment on column BLSCDW.DWD_DIM_INDUSTRY is ht_e_dt
  is '拉链结束date';
