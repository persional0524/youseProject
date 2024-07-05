create table BLSCDW.DWS_BUDGET_YSXX
(
  quota_id            INTEGER not null,
  cltno               VARCHAR2(32),
  clt_name            VARCHAR2(512),
  budget_code         VARCHAR2(128),
  budget_account_code VARCHAR2(32),
  budget_account_name VARCHAR2(80),
  budget_account_type INTEGER,
  group_name          VARCHAR2(255),
  budget_type_no      VARCHAR2(32),
  budget_type_name    VARCHAR2(100),
  used_amount         NUMBER(15,2),
  amount              NUMBER(15,2),
  cash_amount         NUMBER(15,2),
  bill_amount         NUMBER(15,2),
  lc_amount           NUMBER(15,2),
  term_no             VARCHAR2(50),
  term_name           VARCHAR2(100),
  start_date          DATE,
  end_date            DATE,
  currency_no         VARCHAR2(32)
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
comment on table BLSCDW.DWS_BUDGET_YSXX
  is '单位budget额度信息';
comment on column BLSCDW.DWS_BUDGET_YSXX is quota_id
  is '额度ID';
comment on column BLSCDW.DWS_BUDGET_YSXX is cltno
  is '单位code';
comment on column BLSCDW.DWS_BUDGET_YSXX is clt_name
  is '单位name';
comment on column BLSCDW.DWS_BUDGET_YSXX is budget_code
  is 'budget号';
comment on column BLSCDW.DWS_BUDGET_YSXX is budget_account_code
  is 'budget科目';
comment on column BLSCDW.DWS_BUDGET_YSXX is budget_account_name
  is 'budget科目name';
comment on column BLSCDW.DWS_BUDGET_YSXX is budget_account_type
  is 'budget科目类型';
comment on column BLSCDW.DWS_BUDGET_YSXX is group_name
  is 'budget体系name';
comment on column BLSCDW.DWS_BUDGET_YSXX is budget_type_no
  is 'budget种类code';
comment on column BLSCDW.DWS_BUDGET_YSXX is budget_type_name
  is 'budget种类name';
comment on column BLSCDW.DWS_BUDGET_YSXX is used_amount
  is '已占用金额';
comment on column BLSCDW.DWS_BUDGET_YSXX is amount
  is '总金额';
comment on column BLSCDW.DWS_BUDGET_YSXX is cash_amount
  is '现金金额';
comment on column BLSCDW.DWS_BUDGET_YSXX is bill_amount
  is '票据金额';
comment on column BLSCDW.DWS_BUDGET_YSXX is lc_amount
  is '信用证金额';
comment on column BLSCDW.DWS_BUDGET_YSXX is term_no
  is 'budget期间号';
comment on column BLSCDW.DWS_BUDGET_YSXX is term_name
  is '期间name';
comment on column BLSCDW.DWS_BUDGET_YSXX is start_date
  is '期间开始date';
comment on column BLSCDW.DWS_BUDGET_YSXX is end_date
  is '期间结束date';
comment on column BLSCDW.DWS_BUDGET_YSXX is currency_no
  is '币种';
