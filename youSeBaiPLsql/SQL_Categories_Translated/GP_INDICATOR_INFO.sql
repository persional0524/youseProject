create table BLSCDW.GP_INDICATOR_INFO
(
  id              VARCHAR2(36) not null,
  indicator_name  VARCHAR2(50),
  indicator_code  VARCHAR2(36),
  indicator_type  VARCHAR2(36),
  nature          VARCHAR2(36),
  unit            VARCHAR2(36),
  flag            CHAR(1),
  logic_type      VARCHAR2(4000),
  statistics_type VARCHAR2(36)
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
comment on table BLSCDW.GP_INDICATOR_INFO
  is 'indicator基础信息';
comment on column BLSCDW.GP_INDICATOR_INFO is id
  is 'ID';
comment on column BLSCDW.GP_INDICATOR_INFO is indicator_name
  is 'indicatorname';
comment on column BLSCDW.GP_INDICATOR_INFO is indicator_code
  is 'indicator代码';
comment on column BLSCDW.GP_INDICATOR_INFO is indicator_type
  is 'indicator类型';
comment on column BLSCDW.GP_INDICATOR_INFO is nature
  is '0finance;
comment on column BLSCDW.GP_INDICATOR_INFO is unit
  is '计量单位';
comment on column BLSCDW.GP_INDICATOR_INFO is flag
  is '是否有效';
comment on column BLSCDW.GP_INDICATOR_INFO is logic_type
  is 'financeindicator或者复合indicator的A*B-C，，，或者非finance基础indicator的sql';
comment on column BLSCDW.GP_INDICATOR_INFO is statistics_type
  is '余额或者发生额';
