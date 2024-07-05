create table BLSCDW.GP_RISKWARNING_VALUES
(
  id           VARCHAR2(36) not null,
  indicator_id VARCHAR2(36),
  start_date   DATE,
  end_date     DATE,
  flag         CHAR(1)
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
comment on table BLSCDW.GP_RISKWARNING_VALUES
  is 'risk预警阀value主表';
comment on column BLSCDW.GP_RISKWARNING_VALUES is id
  is 'ID';
comment on column BLSCDW.GP_RISKWARNING_VALUES is indicator_id
  is '管理indicatorID';
comment on column BLSCDW.GP_RISKWARNING_VALUES is start_date
  is '预警开始date';
comment on column BLSCDW.GP_RISKWARNING_VALUES is end_date
  is '预警结束date';
comment on column BLSCDW.GP_RISKWARNING_VALUES is flag
  is '表示启用/停用';
