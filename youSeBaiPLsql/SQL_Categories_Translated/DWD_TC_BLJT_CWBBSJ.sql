create table BLSCDW.DWD_TC_BLJT_CWBBSJ
(
  id           INTEGER,
  year         VARCHAR2(50),
  month        VARCHAR2(50),
  currency     VARCHAR2(50),
  account_code VARCHAR2(100),
  account_name VARCHAR2(100),
  entity_code  VARCHAR2(100),
  entity_name  VARCHAR2(100),
  year_value   NUMBER(16,4),
  month_value  NUMBER(16,4)
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
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is id
  is '自增主键';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is year
  is '年份';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is month
  is '月份';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is currency
  is '币种';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is account_code
  is '科目code';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is account_name
  is '科目name';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is entity_code
  is '企业code';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is entity_name
  is '企业name';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is year_value
  is '年份维度value';
comment on column BLSCDW.DWD_TC_BLJT_CWBBSJ is month_value
  is '期间维度value';
