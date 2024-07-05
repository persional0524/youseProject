create table BLSCDW.V_TC_BLJT_CWBBSJ
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
  month_value  NUMBER(16,4),
  vdate        DATE,
  cltno        VARCHAR2(64)
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
