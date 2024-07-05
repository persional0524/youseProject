create table BLSCDW.GP_RISK_LEVEL_TYEP
(
  id                VARCHAR2(36) not null,
  warning_teyp_name VARCHAR2(50),
  warning_teyp_code VARCHAR2(36),
  risk_level        VARCHAR2(36),
  flag              CHAR(1)
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
comment on table BLSCDW.GP_RISK_LEVEL_TYEP
  is 'risk预警类型';
comment on column BLSCDW.GP_RISK_LEVEL_TYEP is id
  is 'ID';
comment on column BLSCDW.GP_RISK_LEVEL_TYEP is warning_teyp_name
  is 'risk预警name';
comment on column BLSCDW.GP_RISK_LEVEL_TYEP is warning_teyp_code
  is 'risk预警代码';
comment on column BLSCDW.GP_RISK_LEVEL_TYEP is risk_level
  is 'risk预警级别';
comment on column BLSCDW.GP_RISK_LEVEL_TYEP is flag
  is '表示启用/停用';
