create table BLSCDW.DWD_BNS_RELE_REPAY_RECORD
(
  actual_interest     NUMBER(15,2),
  actual_principal    NUMBER(15,2),
  contract_id         VARCHAR2(128),
  currency_no         VARCHAR2(32),
  bjamount            NUMBER(15,2),
  contract_no         VARCHAR2(64),
  data_source         VARCHAR2(30),
  flag                NUMBER,
  flamount            NUMBER(15,2),
  hkfs                INTEGER,
  intr_date           DATE,
  v_dept_id           VARCHAR2(36),
  ledgerid            VARCHAR2(128),
  loan_id             VARCHAR2(128),
  loan_no             VARCHAR2(64),
  lxamount            NUMBER(15,2),
  rate                NUMBER(20,6),
  remark              VARCHAR2(1024),
  repay_form          VARCHAR2(10),
  repayment_type      VARCHAR2(3),
  reserve_entry_type  VARCHAR2(10),
  term_num            NUMBER,
  txdate              DATE,
  penalty_interest    NUMBER(20,2),
  tally_flag          INTEGER,
  compensatory_type   VARCHAR2(10),
  loan_repay_acc      VARCHAR2(256),
  loan_repay_acntname VARCHAR2(512),
  rec_acc             VARCHAR2(256),
  rec_acntname        VARCHAR2(512),
  ht_s_dt             DATE,
  ht_e_dt             DATE
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
comment on table BLSCDW.DWD_BNS_RELE_REPAY_RECORD
  is '融资放还款记录信息表';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is actual_interest
  is '实付利息';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is actual_principal
  is '实付本金';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is contract_id
  is '合同id';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is currency_no
  is '币种';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is bjamount
  is '本金金额';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is contract_no
  is '合同号';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is data_source
  is '数据源';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is flag
  is '放还款flag1.放款 2.还款';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is flamount
  is '复利金额';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is hkfs
  is '还款方式，1. 正常  2.逾期 3.呆滞 4.呆账 5.核销结清 6.委外结清';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is intr_date
  is '起息date';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is v_dept_id
  is '部门code';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is ledgerid
  is '主键';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is loan_id
  is '借据id';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is loan_no
  is '借据号';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is lxamount
  is '利息金额';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is rate
  is '利率';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is remark
  is '备注';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is repay_form
  is '还款形式';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is repayment_type
  is '还款类型 1本金、2利息、3手续费';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is reserve_entry_type
  is '冲补抹flag';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is term_num
  is '期数';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is txdate
  is '记帐date';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is penalty_interest
  is '罚息金额';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is tally_flag
  is '记账标记';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is compensatory_type
  is '代偿类型';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is loan_repay_acc
  is '放还款账号';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is loan_repay_acntname
  is '放还款人户名';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is rec_acc
  is '收款账号';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is rec_acntname
  is '收款户户名';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_BNS_RELE_REPAY_RECORD is ht_e_dt
  is '拉链结束日';
