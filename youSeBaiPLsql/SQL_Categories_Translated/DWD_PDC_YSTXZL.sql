create table BLSCDW.DWD_PDC_YSTXZL
(
  group_id         INTEGER,
  group_name       VARCHAR2(255),
  budget_type_no   VARCHAR2(100),
  budget_type_name VARCHAR2(100),
  ht_s_dt          DATE,
  ht_e_dt          DATE,
  budget_type_id   INTEGER,
  type_set_id      INTEGER
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
comment on table BLSCDW.DWD_PDC_YSTXZL
  is 'budget体系种类';
comment on column BLSCDW.DWD_PDC_YSTXZL is group_id
  is 'budget体系ID';
comment on column BLSCDW.DWD_PDC_YSTXZL is group_name
  is 'budget体系name';
comment on column BLSCDW.DWD_PDC_YSTXZL is budget_type_no
  is 'budget种类code';
comment on column BLSCDW.DWD_PDC_YSTXZL is budget_type_name
  is 'budget种类name';
comment on column BLSCDW.DWD_PDC_YSTXZL is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_PDC_YSTXZL is ht_e_dt
  is '拉链结束date';
comment on column BLSCDW.DWD_PDC_YSTXZL is budget_type_id
  is 'budget种类ID';
comment on column BLSCDW.DWD_PDC_YSTXZL is type_set_id
  is '设置流水号ID';
