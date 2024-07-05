create table BLSCDW.DWD_AGT_DWYSXX
(
  unit_no          VARCHAR2(32),
  budget_unit_no   VARCHAR2(512),
  budget_unit_name VARCHAR2(512),
  sub_unit_id      INTEGER,
  group_id         INTEGER,
  group_tree_no    VARCHAR2(32),
  ht_s_dt          DATE,
  ht_e_dt          DATE
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
comment on table BLSCDW.DWD_AGT_DWYSXX
  is '单位budget信息';
comment on column BLSCDW.DWD_AGT_DWYSXX is unit_no
  is '单位code';
comment on column BLSCDW.DWD_AGT_DWYSXX is budget_unit_no
  is 'budget单位code';
comment on column BLSCDW.DWD_AGT_DWYSXX is budget_unit_name
  is '单位name';
comment on column BLSCDW.DWD_AGT_DWYSXX is sub_unit_id
  is 'budget体系单位ID';
comment on column BLSCDW.DWD_AGT_DWYSXX is group_id
  is 'budget体系ID';
comment on column BLSCDW.DWD_AGT_DWYSXX is group_tree_no
  is 'budget体系层级code';
comment on column BLSCDW.DWD_AGT_DWYSXX is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_AGT_DWYSXX is ht_e_dt
  is '拉链结束date';
