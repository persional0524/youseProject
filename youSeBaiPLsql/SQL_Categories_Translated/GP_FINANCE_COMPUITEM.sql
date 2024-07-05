create table BLSCDW.GP_FINANCE_COMPUITEM
(
  id                  VARCHAR2(36) not null,
  indicator_id        VARCHAR2(36),
  calculate_item      VARCHAR2(36),
  calculate_direction VARCHAR2(36),
  subject_id          VARCHAR2(36),
  currency            VARCHAR2(36),
  subject_amount_type VARCHAR2(36),
  year                NUMBER(4),
  logic_type          VARCHAR2(100)
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
comment on table BLSCDW.GP_FINANCE_COMPUITEM
  is 'financeindicator计算项';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is id
  is 'ID';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is indicator_id
  is 'indicatorID';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is calculate_item
  is '计算项';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is calculate_direction
  is '计算方向';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is subject_id
  is '科目号';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is currency
  is '币种';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is subject_amount_type
  is '科目金额类别';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is year
  is '年';
comment on column BLSCDW.GP_FINANCE_COMPUITEM is logic_type
  is '计算逻辑';
