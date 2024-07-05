create table BLSCDW.DWD_AGT_NBJKMX
(
  contract_id         NUMBER not null,
  contract_no         VARCHAR2(128) not null,
  apply_id            NUMBER,
  loan_type           VARCHAR2(30) not null,
  lender_unit_no      VARCHAR2(30) not null,
  lender_unit_name    VARCHAR2(200),
  borrower_unit_no    VARCHAR2(30) not null,
  borrower_unit_name  VARCHAR2(200),
  currency_no         VARCHAR2(10) not null,
  amount              NUMBER(15,2) not null,
  account_type        NUMBER not null,
  lender_account      VARCHAR2(50) not null,
  borrower_account    VARCHAR2(50) not null,
  start_date          DATE not null,
  end_date            DATE not null,
  duration_day        INTEGER not null,
  duration_day_unit   INTEGER not null,
  init_end_date       DATE not null,
  is_calc_interest    NUMBER not null,
  interest_type       INTEGER,
  rate                NUMBER(10,6),
  overdue_rate        NUMBER(10,6),
  fund_source         VARCHAR2(30) not null,
  sign_date           DATE not null,
  loan_usage          VARCHAR2(30) not null,
  remark              VARCHAR2(1536),
  state               NUMBER not null,
  finish_date         DATE,
  loan_total_amount   NUMBER(15,2),
  repay_total_amount  NUMBER(15,2),
  loan_remain_amount  NUMBER(15,2),
  repay_remain_amount NUMBER(15,2),
  overdue_amount      NUMBER(15,2),
  extend_amount       NUMBER(15,2),
  creator             VARCHAR2(20) not null,
  creator_name        VARCHAR2(128) not null,
  create_time         DATE not null,
  updater             VARCHAR2(20) not null,
  updater_name        VARCHAR2(128) not null,
  update_time         DATE not null,
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
comment on table BLSCDW.DWD_AGT_NBJKMX
  is '借款合同信息表';
comment on column BLSCDW.DWD_AGT_NBJKMX is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_NBJKMX is contract_no
  is '合同code';
comment on column BLSCDW.DWD_AGT_NBJKMX is apply_id
  is '申请单号';
comment on column BLSCDW.DWD_AGT_NBJKMX is loan_type
  is '借款品种';
comment on column BLSCDW.DWD_AGT_NBJKMX is lender_unit_no
  is '借出方';
comment on column BLSCDW.DWD_AGT_NBJKMX is borrower_unit_no
  is '借入方';
comment on column BLSCDW.DWD_AGT_NBJKMX is currency_no
  is '币种';
comment on column BLSCDW.DWD_AGT_NBJKMX is amount
  is '合同金额';
comment on column BLSCDW.DWD_AGT_NBJKMX is account_type
  is '账户类型，1bank账户，2内部户';
comment on column BLSCDW.DWD_AGT_NBJKMX is lender_account
  is '借出方核算账户';
comment on column BLSCDW.DWD_AGT_NBJKMX is borrower_account
  is '借入方核算账户';
comment on column BLSCDW.DWD_AGT_NBJKMX is start_date
  is '起始date';
comment on column BLSCDW.DWD_AGT_NBJKMX is end_date
  is '终止date';
comment on column BLSCDW.DWD_AGT_NBJKMX is duration_day
  is '借款期限';
comment on column BLSCDW.DWD_AGT_NBJKMX is duration_day_unit
  is '期限单位，0天，1月，2年';
comment on column BLSCDW.DWD_AGT_NBJKMX is init_end_date
  is '初始结束date';
comment on column BLSCDW.DWD_AGT_NBJKMX is is_calc_interest
  is '是否计息 0:不计息,1:计息';
comment on column BLSCDW.DWD_AGT_NBJKMX is interest_type
  is '付息方式：0利随本清，1定期结息';
comment on column BLSCDW.DWD_AGT_NBJKMX is rate
  is '利率';
comment on column BLSCDW.DWD_AGT_NBJKMX is overdue_rate
  is '罚息利率';
comment on column BLSCDW.DWD_AGT_NBJKMX is fund_source
  is '资金来源(数据dictionary)';
comment on column BLSCDW.DWD_AGT_NBJKMX is sign_date
  is '签约date';
comment on column BLSCDW.DWD_AGT_NBJKMX is loan_usage
  is '借款用途';
comment on column BLSCDW.DWD_AGT_NBJKMX is remark
  is '补充说明';
comment on column BLSCDW.DWD_AGT_NBJKMX is state
  is '合同状态 1:正常,2:作废,3:逾期,4:展期;
comment on column BLSCDW.DWD_AGT_NBJKMX is finish_date
  is '结项date';
comment on column BLSCDW.DWD_AGT_NBJKMX is loan_total_amount
  is '放款总额';
comment on column BLSCDW.DWD_AGT_NBJKMX is repay_total_amount
  is '还款总额';
comment on column BLSCDW.DWD_AGT_NBJKMX is loan_remain_amount
  is '未放款金额(合同金额减放款总额)';
comment on column BLSCDW.DWD_AGT_NBJKMX is repay_remain_amount
  is '余额(放款总和减还款总和，实际上就是未还款金额)';
comment on column BLSCDW.DWD_AGT_NBJKMX is overdue_amount
  is '逾期金额，逾期那一天的金额';
comment on column BLSCDW.DWD_AGT_NBJKMX is extend_amount
  is '展期金额，展期那一天的金额';
comment on column BLSCDW.DWD_AGT_NBJKMX is creator
  is 'created人';
comment on column BLSCDW.DWD_AGT_NBJKMX is creator_name
  is 'created人name';
comment on column BLSCDW.DWD_AGT_NBJKMX is create_time
  is 'createddate';
comment on column BLSCDW.DWD_AGT_NBJKMX is updater
  is '更新人';
comment on column BLSCDW.DWD_AGT_NBJKMX is updater_name
  is '更新人name';
comment on column BLSCDW.DWD_AGT_NBJKMX is update_time
  is '更新date';
comment on column BLSCDW.DWD_AGT_NBJKMX is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_AGT_NBJKMX is ht_e_dt
  is '拉链结束date';
