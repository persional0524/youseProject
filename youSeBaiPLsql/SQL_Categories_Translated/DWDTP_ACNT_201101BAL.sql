create table BLSCDW.DWDTP_ACNT_201101BAL
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
  cur_code      VARCHAR2(10)
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
