create table BLSCDW.DWDTP_AGT_XDHTHKJH
(
  plan_id       VARCHAR2(128) not null,
  loan_id       VARCHAR2(128),
  loan_no       VARCHAR2(64),
  bid           VARCHAR2(128),
  contract_no   VARCHAR2(64),
  adv_flag      INTEGER,
  exec_flag     INTEGER,
  principal     NUMBER(15,2),
  intrest       NUMBER(15,2),
  overdue_flag  INTEGER,
  overdueamount NUMBER(15,2),
  term_num      NUMBER,
  remark        VARCHAR2(1024),
  plan_date     DATE,
  end_date      DATE
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
comment on table BLSCDW.DWDTP_AGT_XDHTHKJH
  is '合同还款计划';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is plan_id
  is '计划ID';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is loan_id
  is '借据ID';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is loan_no
  is '借据号';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is bid
  is '合同ID';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is contract_no
  is '合同号';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is adv_flag
  is '是否提前还款';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is exec_flag
  is '执行情况(0:未执行，1:执行)';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is principal
  is '本金';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is intrest
  is '利息金额';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is overdue_flag
  is '逾期标记(1:转逾期，0:未转逾期)';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is overdueamount
  is '逾期金额';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is term_num
  is '期数';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is remark
  is '备注';
comment on column BLSCDW.DWDTP_AGT_XDHTHKJH is plan_date
  is 'date';
