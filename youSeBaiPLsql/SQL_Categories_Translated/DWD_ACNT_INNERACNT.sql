create table BLSCDW.DWD_ACNT_INNERACNT
(
  branch_no     VARCHAR2(6),
  cur_no        VARCHAR2(8),
  account_no    VARCHAR2(32),
  account_name  VARCHAR2(128),
  member_no     VARCHAR2(32),
  subject_no    VARCHAR2(16),
  account_state INTEGER,
  open_date     DATE,
  maturity_date DATE,
  close_date    DATE,
  account_id    INTEGER,
  atype         VARCHAR2(8),
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
comment on table BLSCDW.DWD_ACNT_INNERACNT
  is '内部账户';
