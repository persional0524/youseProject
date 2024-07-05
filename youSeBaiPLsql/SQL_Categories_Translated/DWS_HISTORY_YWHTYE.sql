create table BLSCDW.DWS_HISTORY_YWHTYE
(
  bid          VARCHAR2(128) not null,
  loan_id      VARCHAR2(128) not null,
  contract_no  VARCHAR2(64),
  sheet_no     VARCHAR2(128) not null,
  biz_type     VARCHAR2(12),
  state        VARCHAR2(5),
  amount       NUMBER(15,2),
  balance      NUMBER(16,2),
  balance_date DATE,
  start_date   DATE,
  end_date     DATE
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
comment on table BLSCDW.DWS_HISTORY_YWHTYE
  is '合同借据每日余额';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is bid
  is '借据ID';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is contract_no
  is '借据号';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is biz_type
  is '贷款业务品种';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is state
  is '状态';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is amount
  is '金额';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is balance
  is '余额';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is balance_date
  is '余额date';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is start_date
  is '借据开始date';
comment on column BLSCDW.DWS_HISTORY_YWHTYE is end_date
  is '借据结束date';
