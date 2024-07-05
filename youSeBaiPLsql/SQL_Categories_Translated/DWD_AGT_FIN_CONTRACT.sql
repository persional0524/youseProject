create table BLSCDW.DWD_AGT_FIN_CONTRACT
(
  contract_id            VARCHAR2(100) not null,
  buss_variety           VARCHAR2(16),
  buss_name              VARCHAR2(64),
  contract_no            VARCHAR2(32),
  cltno                  VARCHAR2(30),
  corpname               VARCHAR2(200),
  lender_unit_no         VARCHAR2(30),
  lender_unit_name       VARCHAR2(200),
  currency_no            VARCHAR2(4),
  start_date             DATE,
  maturity               DATE,
  init_end_date          DATE,
  contract_period        INTEGER,
  amount                 NUMBER(15,2),
  lending_amount         NUMBER(15,2),
  plan_principal         NUMBER(15,2),
  plan_intrest           NUMBER(15,2),
  exec_principal         NUMBER(15,2),
  exec_intrest           NUMBER(15,2),
  state                  INTEGER,
  close_date             DATE,
  balance                NUMBER,
  five_level             INTEGER,
  next_plan_date         DATE,
  next_amount            NUMBER(15,2),
  overdue_amount         NUMBER(15,2),
  extend_amount          NUMBER(15,2),
  extend_rate            NUMBER(10,6),
  sign_date              DATE,
  remark                 VARCHAR2(1024),
  approve_memo           VARCHAR2(1024),
  create_time            DATE,
  last_update_time       DATE,
  inputor                VARCHAR2(100),
  consigner              VARCHAR2(100),
  multi_lending          INTEGER,
  repay_capital          INTEGER,
  repayment_freq         VARCHAR2(2),
  intrest_period         INTEGER,
  surety_types           VARCHAR2(200),
  interest_type          INTEGER,
  rate                   NUMBER(10,6),
  interest_rate_execute  NUMBER(10,6),
  overdue_rate           NUMBER(10,6),
  loan_usage             VARCHAR2(200),
  invest_direction       VARCHAR2(32),
  invest_region          VARCHAR2(20),
  housepro_loan_type     VARCHAR2(32),
  is_alleviat_loan       INTEGER,
  is_floating_rate       INTEGER,
  is_gover_loan          INTEGER,
  is_green_loan          INTEGER,
  is_housepro_loan       INTEGER,
  is_poor_loan           INTEGER,
  is_restructur_loan     INTEGER,
  is_secure_loan         INTEGER,
  is_significant_risk    INTEGER,
  is_syndicate_loan      INTEGER,
  loan_account           VARCHAR2(64),
  outlay_account         VARCHAR2(32),
  loan_restructur        VARCHAR2(32),
  local_affilia_type     INTEGER,
  local_legal_nature     INTEGER,
  local_source_type      INTEGER,
  lsdktx                 VARCHAR2(20),
  rate_type              VARCHAR2(10),
  secure_loan_type       VARCHAR2(10),
  self_support           NUMBER,
  sfsndk                 VARCHAR2(1),
  significant_risk_type  VARCHAR2(32),
  sndkxz                 VARCHAR2(10),
  writeoff_amt           NUMBER(20,2),
  writeoff_date          DATE,
  writeoff_flag          VARCHAR2(1),
  writeoff_recovery_date DATE,
  zndklx                 VARCHAR2(2),
  base_rate              NUMBER(10,6),
  business_type          VARCHAR2(2),
  cyc_loan               NUMBER,
  dkyt                   VARCHAR2(200),
  expiry_date            VARCHAR2(10),
  ext_flag               NUMBER,
  financial_support      VARCHAR2(32),
  fee_cure_code          VARCHAR2(3),
  fee_amount             NUMBER(16,2),
  fee_credit_code        VARCHAR2(20),
  fee_payer              VARCHAR2(256),
  ht_s_dt                DATE,
  ht_e_dt                DATE
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
comment on table BLSCDW.DWD_AGT_FIN_CONTRACT
  is '融资业务合同信息表';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is contract_id
  is '合同id';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is buss_variety
  is '业务品种代码';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is buss_name
  is '业务品种name';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is contract_no
  is '合同号';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is cltno
  is 'client号';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is corpname
  is 'clientname';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is lender_unit_no
  is '借出方id';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is lender_unit_name
  is '借出方';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is currency_no
  is '币种';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is start_date
  is '开始日';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is maturity
  is '到期日';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is init_end_date
  is '初始结束date';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is contract_period
  is '合同期数';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is amount
  is '合同金额';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is lending_amount
  is '累计放款金额';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is plan_principal
  is '累计应还本金';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is plan_intrest
  is '累计应还利息';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is exec_principal
  is '累计实还本金';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is exec_intrest
  is '累计实还利息';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is state
  is '合同状态';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is close_date
  is '合同结束日';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is balance
  is '余额';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is five_level
  is '五级分类';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is next_plan_date
  is '下一次应还款date';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is next_amount
  is '下一次应还款金额';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is overdue_amount
  is '逾期金额';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is extend_amount
  is '展期金额';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is extend_rate
  is '展期利率';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is sign_date
  is '签约date';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is remark
  is '备注';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is approve_memo
  is '审批意见';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is create_time
  is '记录created时间';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is last_update_time
  is '末次修改时间';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is inputor
  is '录入人';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is consigner
  is '委托人';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is multi_lending
  is '是否多次放款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is repay_capital
  is '还本方式';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is repayment_freq
  is '还款频率';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is intrest_period
  is '计息周期';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is surety_types
  is '担保方式';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is interest_type
  is '付息方式：0利随本清，1定期结息';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is rate
  is '利率';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is interest_rate_execute
  is '执行利率';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is overdue_rate
  is '罚息利率';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is loan_usage
  is '借款用途';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is invest_direction
  is '贷款投向行业';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is invest_region
  is '贷款投向地区';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is housepro_loan_type
  is '保障性安居工程贷款类型';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_alleviat_loan
  is '是否精准扶贫贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_floating_rate
  is '利率是否浮动';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_gover_loan
  is '是否地方政府融资平台贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_green_loan
  is '是否绿色贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_housepro_loan
  is '是否保障性安居工程贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_poor_loan
  is '是否建档立卡贫困人口贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_restructur_loan
  is '是否重组贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_secure_loan
  is '是否创业担保贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_significant_risk
  is '是否重大risk贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is is_syndicate_loan
  is '是否银团贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is loan_account
  is '贷款账户';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is outlay_account
  is '借款人支出账户';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is loan_restructur
  is '重组方式';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is local_affilia_type
  is '地方融资平台按隶属关系分类类型';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is local_legal_nature
  is '地方融资平台按法律性质分类类型';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is local_source_type
  is '地方融资平台偿债资金来源分类';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is lsdktx
  is '绿色贷款投向';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is rate_type
  is '利率类型';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is secure_loan_type
  is '创业担保贷款类型';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is self_support
  is '是否自营';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is sfsndk
  is '是否涉农贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is significant_risk_type
  is '重大risk贷款类别';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is sndkxz
  is '涉农贷款性质';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is writeoff_amt
  is '核销收回本金';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is writeoff_date
  is '核销操作date';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is writeoff_flag
  is '核销收回flag';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is writeoff_recovery_date
  is '核销贷款回收date';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is zndklx
  is '支农贷款类型';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is base_rate
  is '基准利率';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is business_type
  is '业务经营类型';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is cyc_loan
  is '是否为循环贷款';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is dkyt
  is '贷款用途';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is expiry_date
  is '展期后到期日';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is ext_flag
  is '是否展期';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is financial_support
  is '财政扶持方式';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is fee_cure_code
  is '手续费币种';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is fee_amount
  is '手续费金额';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is fee_credit_code
  is '手续费支付方机构代码';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is fee_payer
  is '手续费支付方name';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_AGT_FIN_CONTRACT is ht_e_dt
  is '拉链结束date';
