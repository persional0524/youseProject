create table BLSCDW.GP_RISKWARNING_VALUES_SUB
(
  id                  VARCHAR2(36) not null,
  riskwarningvalue_id VARCHAR2(36),
  risklevel_id        VARCHAR2(36),
  order_item          NUMBER(2),
  uplimit             NUMBER(36,4),
  downlimit           NUMBER(36,4),
  warning_templet     VARCHAR2(500)
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
comment on table BLSCDW.GP_RISKWARNING_VALUES_SUB
  is 'risk预警阀value子表';
comment on column BLSCDW.GP_RISKWARNING_VALUES_SUB is id
  is 'ID';
comment on column BLSCDW.GP_RISKWARNING_VALUES_SUB is riskwarningvalue_id
  is 'risk预警阀value主表ID';
comment on column BLSCDW.GP_RISKWARNING_VALUES_SUB is risklevel_id
  is 'risk级别子表ID';
comment on column BLSCDW.GP_RISKWARNING_VALUES_SUB is order_item
  is '顺序号';
comment on column BLSCDW.GP_RISKWARNING_VALUES_SUB is uplimit
  is '上线';
comment on column BLSCDW.GP_RISKWARNING_VALUES_SUB is downlimit
  is '下线';
comment on column BLSCDW.GP_RISKWARNING_VALUES_SUB is warning_templet
  is '预警信息模版';
