create table BLSCDW.DWDTP_CLT_YSDWXX
(
  budget_unit_no   VARCHAR2(256) not null,
  budget_unit_name VARCHAR2(512),
  unit_no          VARCHAR2(32),
  sub_unit_id      INTEGER not null,
  group_id         INTEGER,
  group_tree_no    VARCHAR2(64)
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
comment on table BLSCDW.DWDTP_CLT_YSDWXX
  is 'budget单位';
comment on column BLSCDW.DWDTP_CLT_YSDWXX is budget_unit_no
  is 'budget单位code';
comment on column BLSCDW.DWDTP_CLT_YSDWXX is budget_unit_name
  is 'budget单位name';
comment on column BLSCDW.DWDTP_CLT_YSDWXX is unit_no
  is '单位code';
comment on column BLSCDW.DWDTP_CLT_YSDWXX is sub_unit_id
  is 'budget体系单位ID';
comment on column BLSCDW.DWDTP_CLT_YSDWXX is group_id
  is 'budget体系ID';
comment on column BLSCDW.DWDTP_CLT_YSDWXX is group_tree_no
  is 'budget体系层级code';
