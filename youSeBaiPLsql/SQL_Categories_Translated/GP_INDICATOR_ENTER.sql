create table BLSCDW.GP_INDICATOR_ENTER
(
  indicator_name VARCHAR2(50),
  indicator_code VARCHAR2(36),
  balance        NUMBER(21,6),
  sjrq           DATE,
  id             VARCHAR2(36)
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
comment on table BLSCDW.GP_INDICATOR_ENTER
  is 'indicator录入表';
comment on column BLSCDW.GP_INDICATOR_ENTER is indicator_name
  is 'indicatorname';
comment on column BLSCDW.GP_INDICATOR_ENTER is indicator_code
  is 'indicator代码';
comment on column BLSCDW.GP_INDICATOR_ENTER is balance
  is '余额';
comment on column BLSCDW.GP_INDICATOR_ENTER is sjrq
  is 'date';
