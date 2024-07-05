create table BLSCDW.DWD_ACNT_201101BAL
(
  book_date     DATE,
  cust_no       VARCHAR2(10),
  accno         VARCHAR2(32),
  sbuno         VARCHAR2(32),
  init_balance  NUMBER(16,2),
  accacmvalue   NUMBER(16,2),
  sbuacmvalue   NUMBER(16,2),
  accpartval    NUMBER(16,2),
  sbupartval    NUMBER(16,2),
  agsbunitquota NUMBER(16,2),
  bookbalance   NUMBER(16,2),
  cur_code      VARCHAR2(10),
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
comment on table BLSCDW.DWD_ACNT_201101BAL
  is '内部账户余额';
comment on column BLSCDW.DWD_ACNT_201101BAL is book_date
  is 'date';
comment on column BLSCDW.DWD_ACNT_201101BAL is cust_no
  is 'client';
comment on column BLSCDW.DWD_ACNT_201101BAL is accno
  is '活期账号';
comment on column BLSCDW.DWD_ACNT_201101BAL is sbuno
  is '协定账号';
comment on column BLSCDW.DWD_ACNT_201101BAL is init_balance
  is '初始余额';
comment on column BLSCDW.DWD_ACNT_201101BAL is accacmvalue
  is '活期部分基数';
comment on column BLSCDW.DWD_ACNT_201101BAL is sbuacmvalue
  is '协定部分基数';
comment on column BLSCDW.DWD_ACNT_201101BAL is accpartval
  is '活期部分余额';
comment on column BLSCDW.DWD_ACNT_201101BAL is sbupartval
  is '协定部分余额';
comment on column BLSCDW.DWD_ACNT_201101BAL is agsbunitquota
  is '协定额度';
comment on column BLSCDW.DWD_ACNT_201101BAL is bookbalance
  is '活期账户余额';
comment on column BLSCDW.DWD_ACNT_201101BAL is cur_code
  is '币种';
