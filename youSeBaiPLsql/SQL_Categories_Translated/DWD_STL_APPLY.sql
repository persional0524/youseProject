create table BLSCDW.DWD_STL_APPLY
(
  stlid           INTEGER not null,
  customid        VARCHAR2(8) not null,
  acntno          VARCHAR2(128),
  speed           VARCHAR2(32),
  amount          NUMBER(15,2),
  interestrate    NUMBER(10,4),
  shibor_rate     NUMBER(10,4),
  wai_rate        NUMBER(10,4),
  reference_rate  NUMBER(10,4),
  mean_ratio      NUMBER(10,4),
  stltype         INTEGER not null,
  startdate       TIMESTAMP(6),
  duedate         TIMESTAMP(6),
  term            INTEGER,
  payrate         NUMBER(17,2),
  bankno          VARCHAR2(32),
  recno           VARCHAR2(32),
  memo            VARCHAR2(255),
  reason          VARCHAR2(255),
  iotype          INTEGER,
  state           INTEGER,
  ratifyno        INTEGER,
  noticeno        VARCHAR2(32),
  recdate         TIMESTAMP(6),
  recreason       VARCHAR2(255),
  applydate       TIMESTAMP(6) default (SYSDATE),
  cltno           VARCHAR2(18),
  userid          INTEGER,
  ar_id           INTEGER,
  interbankflag   VARCHAR2(8),
  cca_id          INTEGER,
  temp_credit_id  INTEGER,
  approval_remark VARCHAR2(255),
  transfer_reason VARCHAR2(255),
  transfer_memo   VARCHAR2(255),
  message         VARCHAR2(256),
  finger_print    VARCHAR2(100),
  revoktor        NUMBER,
  revoktorname    VARCHAR2(32),
  revokmemo       VARCHAR2(256),
  need_credit     INTEGER default (0),
  create_date     TIMESTAMP(6),
  busi_amount     NUMBER(15,2),
  appendix        INTEGER,
  checkername     VARCHAR2(32),
  creatorname     VARCHAR2(32),
  trade_no        VARCHAR2(255)
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
comment on table BLSCDW.DWD_STL_APPLY
  is '拆借信息表';
comment on column BLSCDW.DWD_STL_APPLY is trade_no
  is '交易号';
