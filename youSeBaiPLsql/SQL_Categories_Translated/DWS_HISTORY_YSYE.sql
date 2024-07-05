create table BLSCDW.DWS_HISTORY_YSYE
(
  budget_code  VARCHAR2(128),
  balance      NUMBER(15,2),
  cash_balance NUMBER(15,2),
  bill_balance NUMBER(15,2),
  lc_balance   NUMBER(15,2),
  balance_date DATE
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
comment on table BLSCDW.DWS_HISTORY_YSYE
  is 'budgethistory余额';
comment on column BLSCDW.DWS_HISTORY_YSYE is budget_code
  is 'budget号';
comment on column BLSCDW.DWS_HISTORY_YSYE is balance
  is '余额';
comment on column BLSCDW.DWS_HISTORY_YSYE is cash_balance
  is '现金余额';
comment on column BLSCDW.DWS_HISTORY_YSYE is bill_balance
  is '票据余额';
comment on column BLSCDW.DWS_HISTORY_YSYE is lc_balance
  is '信用证余额';
comment on column BLSCDW.DWS_HISTORY_YSYE is balance_date
  is '余额date';
