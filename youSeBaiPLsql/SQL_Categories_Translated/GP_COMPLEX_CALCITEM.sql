create table BLSCDW.GP_COMPLEX_CALCITEM
(
  id                  VARCHAR2(36) not null,
  indicator_id        VARCHAR2(36),
  calculate_item      VARCHAR2(36),
  calculate_direction VARCHAR2(36),
  baseindicator_id    VARCHAR2(36)
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
comment on table BLSCDW.GP_COMPLEX_CALCITEM
  is '复合indicator计算项';
comment on column BLSCDW.GP_COMPLEX_CALCITEM is id
  is 'ID';
comment on column BLSCDW.GP_COMPLEX_CALCITEM is indicator_id
  is 'indicatorID';
comment on column BLSCDW.GP_COMPLEX_CALCITEM is calculate_item
  is '计算项';
comment on column BLSCDW.GP_COMPLEX_CALCITEM is calculate_direction
  is '计算方向';
comment on column BLSCDW.GP_COMPLEX_CALCITEM is baseindicator_id
  is '基础indicatorid';
