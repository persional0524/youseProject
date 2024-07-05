create table BLSCDW.DWD_LOAN_INTEREST_INFO
(
  actual_enddate      DATE,
  amount              NUMBER(15,2),
  balance             NUMBER(16,2),
  base_rate           NUMBER(10,6),
  bid                 VARCHAR2(128),
  biz_type            INTEGER,
  cltno               VARCHAR2(32),
  contract_no         VARCHAR2(64),
  loan_no             VARCHAR2(64),
  currency_no         VARCHAR2(4),
  five_level          INTEGER,
  invest_direction    VARCHAR2(20),
  invest_region       VARCHAR2(20),
  last_rate           NUMBER(10,6),
  start_date          DATE,
  maturity            DATE,
  state               INTEGER,
  provistion_interest NUMBER(16,2),
  loan_provide        NUMBER(16,2),
  loan_recover        NUMBER(16,2),
  statistic_date      DATE
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
comment on column BLSCDW.DWD_LOAN_INTEREST_INFO is provistion_interest
  is '计提利息';
comment on column BLSCDW.DWD_LOAN_INTEREST_INFO is loan_provide
  is '放款金额';
comment on column BLSCDW.DWD_LOAN_INTEREST_INFO is loan_recover
  is '回收金额';
comment on column BLSCDW.DWD_LOAN_INTEREST_INFO is statistic_date
  is '统计date';
