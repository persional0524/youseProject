create table BLSCDW.DWD_BNS_CREDIT_USE_LOG
(
  use_log_id     INTEGER not null,
  credit_id      INTEGER,
  detail_id      INTEGER,
  cltno          VARCHAR2(30),
  sx_contract_no VARCHAR2(64),
  type           VARCHAR2(32),
  act_date       DATE,
  amount         NUMBER(18,2),
  create_time    TIMESTAMP(6),
  credit_no      VARCHAR2(64)
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
comment on table BLSCDW.DWD_BNS_CREDIT_USE_LOG
  is '授信占用记录表';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is use_log_id
  is '使用流水号';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is credit_id
  is '授信流水号';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is detail_id
  is '交易流水号';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is cltno
  is 'client号';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is sx_contract_no
  is '授信合同号';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is type
  is '授信占用类型(1:占用 2:释放)';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is act_date
  is '交易date';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is amount
  is '本次占用金额';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is create_time
  is 'created时间';
comment on column BLSCDW.DWD_BNS_CREDIT_USE_LOG is credit_no
  is '授信协议号';
