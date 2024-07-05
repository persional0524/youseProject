create table BLSCDW.DWD_ACNT_RATEHISTORY
(
  no      VARCHAR2(32),
  eftdate DATE,
  rateval NUMBER(10,6)
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
comment on table BLSCDW.DWD_ACNT_RATEHISTORY
  is '账户利率history表';
comment on column BLSCDW.DWD_ACNT_RATEHISTORY is no
  is '账号';
comment on column BLSCDW.DWD_ACNT_RATEHISTORY is rateval
  is '利率';
