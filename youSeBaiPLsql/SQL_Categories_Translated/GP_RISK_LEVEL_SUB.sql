create table BLSCDW.GP_RISK_LEVEL_SUB
(
  id                 VARCHAR2(36) not null,
  risk_level_teyp_id VARCHAR2(36),
  risk_level_name    VARCHAR2(100),
  order_item         NUMBER(2),
  warning_name       VARCHAR2(36),
  warning_color      VARCHAR2(36),
  warning_desc       VARCHAR2(500),
  prompt_templet     VARCHAR2(1000)
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
comment on table BLSCDW.GP_RISK_LEVEL_SUB
  is 'risk预警级别子表';
comment on column BLSCDW.GP_RISK_LEVEL_SUB is id
  is 'ID';
comment on column BLSCDW.GP_RISK_LEVEL_SUB is risk_level_teyp_id
  is 'risk类型id';
comment on column BLSCDW.GP_RISK_LEVEL_SUB is risk_level_name
  is 'risk级别name';
comment on column BLSCDW.GP_RISK_LEVEL_SUB is order_item
  is '顺序号';
comment on column BLSCDW.GP_RISK_LEVEL_SUB is warning_name
  is '预警name：正常、警戒、失控;
comment on column BLSCDW.GP_RISK_LEVEL_SUB is warning_color
  is '警示色：0 红色、1黄色、2蓝色、3绿色、4橙色。';
comment on column BLSCDW.GP_RISK_LEVEL_SUB is warning_desc
  is '含义描述';
comment on column BLSCDW.GP_RISK_LEVEL_SUB is prompt_templet
  is '提示模版';
