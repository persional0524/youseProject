create table BLSCDW.DWD_BNS_CPM_VOUCHER
(
  book_date         DATE,
  serialno          INTEGER,
  currency_code     VARCHAR2(3),
  amount            NUMBER(16,2),
  tx_type           VARCHAR2(6),
  biz_type_name     VARCHAR2(40),
  tx_dir            INTEGER,
  cltno             VARCHAR2(32),
  open_bank_name    VARCHAR2(4),
  account_no        VARCHAR2(32),
  subject_no        VARCHAR2(16),
  op_account_no     VARCHAR2(32),
  op_subject_no     VARCHAR2(16),
  op_account_name   VARCHAR2(128),
  op_open_bank_name VARCHAR2(80),
  remark            VARCHAR2(255),
  creator           VARCHAR2(128),
  voucherid         INTEGER,
  biz_code          VARCHAR2(60),
  j_amount          NUMBER(16,2),
  d_amount          NUMBER(16,2),
  reserved_field    VARCHAR2(2000),
  input_time        DATE,
  book_time         DATE,
  booking_state     INTEGER,
  accbalance        NUMBER(16,2),
  cnaps_code        VARCHAR2(80)
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
comment on table BLSCDW.DWD_BNS_CPM_VOUCHER
  is '结算凭证记录';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is book_date
  is '交易date';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is serialno
  is '结算id';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is currency_code
  is '币种';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is amount
  is '交易金额';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is tx_type
  is '交易类型';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is biz_type_name
  is '交易类型name';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is tx_dir
  is '1为借，2为贷  ';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is cltno
  is 'client号';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is open_bank_name
  is '本方开户行';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is account_no
  is '本方账号';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is subject_no
  is '本方科目';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is op_account_no
  is '对方账号';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is op_subject_no
  is '对方科目';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is op_account_name
  is '他行户名';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is op_open_bank_name
  is '他行行名';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is remark
  is '备注';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is creator
  is '经办人';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is voucherid
  is '记账流水号';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is biz_code
  is '合同号/借据号/存单号';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is j_amount
  is '借';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is d_amount
  is '贷';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is reserved_field
  is '备用1';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is input_time
  is '录入date';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is book_time
  is '记账date';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is booking_state
  is '记账状态1为已入账，0为未入账';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is accbalance
  is '余额';
comment on column BLSCDW.DWD_BNS_CPM_VOUCHER is cnaps_code
  is '清算行号';
