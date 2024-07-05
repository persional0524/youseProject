create table BLSCDW.DWD_ACNT_INNERSUBACNT
(
  account_no    VARCHAR2(32),
  account_name  VARCHAR2(128),
  amassno       VARCHAR2(32),
  amassid       VARCHAR2(32),
  subject_no    VARCHAR2(16),
  account_state INTEGER,
  open_date     DATE,
  maturity_date DATE,
  close_date    DATE,
  calcintr      NUMBER,
  atype         VARCHAR2(2),
  account_id    INTEGER,
  ht_s_dt       DATE,
  ht_e_dt       DATE
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
comment on table BLSCDW.DWD_ACNT_INNERSUBACNT
  is '内部子账户';