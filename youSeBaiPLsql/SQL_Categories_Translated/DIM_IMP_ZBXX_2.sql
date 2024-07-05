create table BLSCDW.DIM_IMP_ZBXX_2
(
  indicator_id     VARCHAR2(50),
  indicator_name   VARCHAR2(200),
  indicator_unit   INTEGER,
  indicator_remark VARCHAR2(200),
  indicator_flag   INTEGER
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
comment on column BLSCDW.DIM_IMP_ZBXX_2 is indicator_id
  is 'indicatorid';
comment on column BLSCDW.DIM_IMP_ZBXX_2 is indicator_name
  is 'indicatorname';
comment on column BLSCDW.DIM_IMP_ZBXX_2 is indicator_unit
  is 'indicator单位0元，1万元，2亿，3百分比，4个';
comment on column BLSCDW.DIM_IMP_ZBXX_2 is indicator_remark
  is 'indicator备注';
comment on column BLSCDW.DIM_IMP_ZBXX_2 is indicator_flag
  is 'indicator可用flag0-正常，1-失效';
