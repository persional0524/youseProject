create table BLSCDW.DWD_BNS_XDFHKJL
(
  ledgerid         VARCHAR2(128) not null,
  bid              VARCHAR2(128),
  contract_no      VARCHAR2(64),
  loan_id          VARCHAR2(128),
  loan_no          VARCHAR2(64),
  flag             NUMBER,
  hkfs             INTEGER,
  repayment_type   VARCHAR2(3),
  bjamount         NUMBER(15,2),
  flamount         NUMBER(15,2),
  actual_principal NUMBER(15,2),
  actual_interest  NUMBER(15,2),
  intr_date        DATE,
  lxamount         NUMBER(15,2),
  rate             NUMBER(20,6),
  tx_date          DATE
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
comment on table BLSCDW.DWD_BNS_XDFHKJL
  is '合同放还款记录';
comment on column BLSCDW.DWD_BNS_XDFHKJL is ledgerid
  is '主键';
comment on column BLSCDW.DWD_BNS_XDFHKJL is bid
  is '合同ID';
comment on column BLSCDW.DWD_BNS_XDFHKJL is contract_no
  is '合同号';
comment on column BLSCDW.DWD_BNS_XDFHKJL is loan_id
  is '借据ID';
comment on column BLSCDW.DWD_BNS_XDFHKJL is loan_no
  is '借据号';
comment on column BLSCDW.DWD_BNS_XDFHKJL is flag
  is '放还款flag1.放款 2.还款';
comment on column BLSCDW.DWD_BNS_XDFHKJL is hkfs
  is '还款方式，1. 正常  2.逾期 3.呆滞 4.呆账';
comment on column BLSCDW.DWD_BNS_XDFHKJL is repayment_type
  is '还款类型';
comment on column BLSCDW.DWD_BNS_XDFHKJL is bjamount
  is '本金金额';
comment on column BLSCDW.DWD_BNS_XDFHKJL is flamount
  is '复利金额';
comment on column BLSCDW.DWD_BNS_XDFHKJL is actual_principal
  is '实付本金';
comment on column BLSCDW.DWD_BNS_XDFHKJL is actual_interest
  is '实付利息';
comment on column BLSCDW.DWD_BNS_XDFHKJL is intr_date
  is '起息date';
comment on column BLSCDW.DWD_BNS_XDFHKJL is lxamount
  is '利息金额';
comment on column BLSCDW.DWD_BNS_XDFHKJL is rate
  is '利率';
comment on column BLSCDW.DWD_BNS_XDFHKJL is tx_date
  is '记帐date';
