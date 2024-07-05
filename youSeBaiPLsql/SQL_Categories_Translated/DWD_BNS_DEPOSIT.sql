create table BLSCDW.DWD_BNS_DEPOSIT
(
  bizid            VARCHAR2(32),
  txtype           VARCHAR2(32),
  txdate           DATE,
  amount           NUMBER(16,2),
  last_update_time DATE
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
comment on table BLSCDW.DWD_BNS_DEPOSIT
  is '存款交易表';
comment on column BLSCDW.DWD_BNS_DEPOSIT is bizid
  is '业务数据流水号';
comment on column BLSCDW.DWD_BNS_DEPOSIT is txtype
  is '交易类型';
comment on column BLSCDW.DWD_BNS_DEPOSIT is txdate
  is '交易date';
comment on column BLSCDW.DWD_BNS_DEPOSIT is amount
  is '金额';
comment on column BLSCDW.DWD_BNS_DEPOSIT is last_update_time
  is '时间戳';
