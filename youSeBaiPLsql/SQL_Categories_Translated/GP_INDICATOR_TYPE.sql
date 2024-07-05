create table BLSCDW.GP_INDICATOR_TYPE
(
  id         VARCHAR2(36) not null,
  type_name  VARCHAR2(50),
  type_code  VARCHAR2(36),
  grade_code VARCHAR2(1024),
  showname   VARCHAR2(50),
  order_item NUMBER(4),
  parentid   VARCHAR2(36),
  type_level NUMBER(2)
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
comment on table BLSCDW.GP_INDICATOR_TYPE
  is 'indicator类别';
comment on column BLSCDW.GP_INDICATOR_TYPE is id
  is 'ID';
comment on column BLSCDW.GP_INDICATOR_TYPE is type_name
  is 'indicator类别name';
comment on column BLSCDW.GP_INDICATOR_TYPE is type_code
  is 'indicator类别代码';
comment on column BLSCDW.GP_INDICATOR_TYPE is grade_code
  is 'indicator类别编码';
comment on column BLSCDW.GP_INDICATOR_TYPE is showname
  is 'indicator类别显示name';
comment on column BLSCDW.GP_INDICATOR_TYPE is order_item
  is '类别顺序';
comment on column BLSCDW.GP_INDICATOR_TYPE is parentid
  is '父类别代码';
comment on column BLSCDW.GP_INDICATOR_TYPE is type_level
  is '级别';
