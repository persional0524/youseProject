create table BLSCDW.GP_INDICATOR_VALUE
(
  indicator_id VARCHAR2(36) not null,
  vdate        DATE not null,
  d_value      NUMBER(21,6) default 0,
  m_value      NUMBER(21,6) default 0,
  y_value      NUMBER(21,6) default 0,
  mavg_value   NUMBER(21,6),
  yavg_value   NUMBER(21,6)
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
comment on table BLSCDW.GP_INDICATOR_VALUE
  is '所有indicatorvaluehistory';
comment on column BLSCDW.GP_INDICATOR_VALUE is indicator_id
  is '基础indicator';
comment on column BLSCDW.GP_INDICATOR_VALUE is vdate
  is 'date';
comment on column BLSCDW.GP_INDICATOR_VALUE is d_value
  is 'indicatorvalue日';
comment on column BLSCDW.GP_INDICATOR_VALUE is m_value
  is 'indicatorvalue月';
comment on column BLSCDW.GP_INDICATOR_VALUE is y_value
  is 'indicatorvalue年';
comment on column BLSCDW.GP_INDICATOR_VALUE is mavg_value
  is 'indicatorvalue月平均';
comment on column BLSCDW.GP_INDICATOR_VALUE is yavg_value
  is 'indicatorvalue年平均';
