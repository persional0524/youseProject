create table BLSCDW.DWDTP_AGT_INTERBANK
(
  order_id           INTEGER not null,
  order_code         VARCHAR2(3),
  order_biz_code     VARCHAR2(50),
  cur_code           VARCHAR2(8),
  bank_account_no    VARCHAR2(50),
  op_bank_account_no VARCHAR2(50),
  bank_short_name    VARCHAR2(20),
  bank_code          VARCHAR2(30),
  biz_type_id        INTEGER,
  biz_type_name      VARCHAR2(255),
  amount             NUMBER(16,2),
  plan_start_date    DATE,
  plan_end_date      DATE,
  start_date         DATE,
  end_date           DATE,
  plan_draw_date     DATE,
  draw_date          DATE,
  intr_rate          NUMBER(12,6),
  name               VARCHAR2(64),
  intr_base_days     INTEGER,
  intr_days          INTEGER,
  intr_overdue_days  INTEGER,
  intr_amount        NUMBER(16,2),
  intr_amount2       NUMBER(16,2),
  intr_amount3       NUMBER(16,2),
  rate1              NUMBER(12,6),
  intr_amount_1      NUMBER(16,2),
  close_date         DATE,
  remark             VARCHAR2(250),
  bank_account_name  VARCHAR2(100),
  account_no         VARCHAR2(50),
  branch_no          VARCHAR2(6),
  state              INTEGER,
  cust_no            VARCHAR2(50),
  input_time         DATE,
  affirm_date        DATE,
  principal          NUMBER(16,2),
  interest           NUMBER(16,2),
  depositcode        VARCHAR2(255),
  deposit_name       VARCHAR2(255)
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
