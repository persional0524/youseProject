create table BLSCDW.GP_INDICATOR_LEVEL
(
  info_code    VARCHAR2(36),
  info_name    VARCHAR2(50),
  measurelevel INTEGER
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
comment on table BLSCDW.GP_INDICATOR_LEVEL
  is 'indicator级别信息(扩展用)';
comment on column BLSCDW.GP_INDICATOR_LEVEL is info_code
  is 'indicator级别代码';
comment on column BLSCDW.GP_INDICATOR_LEVEL is info_name
  is 'indicator级别name';
comment on column BLSCDW.GP_INDICATOR_LEVEL is measurelevel
  is 'indicator级别';
