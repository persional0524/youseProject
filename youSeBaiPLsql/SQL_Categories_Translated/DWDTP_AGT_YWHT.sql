create table BLSCDW.DWDTP_AGT_YWHT
(
  cltno                  VARCHAR2(32),
  bid                    VARCHAR2(128) not null,
  contract_no            VARCHAR2(64),
  biz_type               VARCHAR2(12),
  amount                 NUMBER(15,2),
  base_rate              NUMBER(10,6),
  last_rate              NUMBER(10,6),
  sign_date              DATE,
  start_date             DATE,
  maturity               DATE,
  actual_enddate         DATE,
  guarantee_type         VARCHAR2(12),
  state                  VARCHAR2(5),
  self_support           VARCHAR2(5),
  loan_type              VARCHAR2(5),
  cdj_date               DATE,
  dkyt                   VARCHAR2(200),
  five_level             VARCHAR2(5),
  five_level_date        DATE,
  currency_no            VARCHAR2(4),
  ext_flag               VARCHAR2(5),
  financeterm            VARCHAR2(5),
  invest_direction       VARCHAR2(32),
  invest_region          VARCHAR2(20),
  is_floating_rate       VARCHAR2(5),
  multi_lending          VARCHAR2(5),
  rate_type              VARCHAR2(10),
  rate_float_code        VARCHAR2(5),
  intrest_period         VARCHAR2(5),
  expiry_date            DATE,
  charge_amt             NUMBER(20,2),
  cure_code              VARCHAR2(3),
  fee_credit_code        VARCHAR2(20),
  fee_payer              VARCHAR2(256),
  finance_collect_acct   VARCHAR2(32),
  loan_account           VARCHAR2(64),
  income_account         VARCHAR2(32),
  outlay_account         VARCHAR2(32),
  repay_capital          VARCHAR2(5),
  sfsndk                 VARCHAR2(1),
  sndkxz                 VARCHAR2(10),
  is_secure_loan         VARCHAR2(5),
  secure_loan_type       VARCHAR2(10),
  financial_support      VARCHAR2(32),
  is_housepro_loan       VARCHAR2(5),
  housepro_loan_type     VARCHAR2(32),
  is_gover_loan          VARCHAR2(5),
  local_affilia_type     VARCHAR2(5),
  local_legal_nature     VARCHAR2(5),
  local_source_type      VARCHAR2(5),
  loan_restructur        VARCHAR2(32),
  is_green_loan          VARCHAR2(1),
  lsdktx                 VARCHAR2(20),
  overdue_date           DATE,
  overdue_type           VARCHAR2(10),
  writeoff_amt           NUMBER(20,2),
  writeoff_date          DATE,
  writeoff_flag          VARCHAR2(1),
  writeoff_recovery_date DATE,
  zndklx                 VARCHAR2(2),
  balance                NUMBER(20,2)
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
comment on table BLSCDW.DWDTP_AGT_YWHT
  is '信贷合同';
comment on column BLSCDW.DWDTP_AGT_YWHT is cltno
  is '借款人code';
comment on column BLSCDW.DWDTP_AGT_YWHT is bid
  is '合同ID';
comment on column BLSCDW.DWDTP_AGT_YWHT is contract_no
  is '合同号';
comment on column BLSCDW.DWDTP_AGT_YWHT is biz_type
  is '贷款业务品种';
comment on column BLSCDW.DWDTP_AGT_YWHT is amount
  is '金额';
comment on column BLSCDW.DWDTP_AGT_YWHT is base_rate
  is '基准利率';
comment on column BLSCDW.DWDTP_AGT_YWHT is last_rate
  is '执行利率';
comment on column BLSCDW.DWDTP_AGT_YWHT is sign_date
  is '签约date';
comment on column BLSCDW.DWDTP_AGT_YWHT is start_date
  is '开始date';
comment on column BLSCDW.DWDTP_AGT_YWHT is maturity
  is '到期date';
comment on column BLSCDW.DWDTP_AGT_YWHT is actual_enddate
  is '实际终止日';
comment on column BLSCDW.DWDTP_AGT_YWHT is guarantee_type
  is '担保类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is state
  is '状态';
comment on column BLSCDW.DWDTP_AGT_YWHT is self_support
  is '是否自营';
comment on column BLSCDW.DWDTP_AGT_YWHT is loan_type
  is '贷款类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is cdj_date
  is '重定价日';
comment on column BLSCDW.DWDTP_AGT_YWHT is dkyt
  is '贷款用途';
comment on column BLSCDW.DWDTP_AGT_YWHT is five_level
  is '五级分类';
comment on column BLSCDW.DWDTP_AGT_YWHT is five_level_date
  is '五级分类date';
comment on column BLSCDW.DWDTP_AGT_YWHT is currency_no
  is '币种';
comment on column BLSCDW.DWDTP_AGT_YWHT is ext_flag
  is '是否展期';
comment on column BLSCDW.DWDTP_AGT_YWHT is financeterm
  is '贷款期限';
comment on column BLSCDW.DWDTP_AGT_YWHT is invest_direction
  is '贷款投向行业';
comment on column BLSCDW.DWDTP_AGT_YWHT is invest_region
  is '贷款投向地区';
comment on column BLSCDW.DWDTP_AGT_YWHT is is_floating_rate
  is '利率是否浮动';
comment on column BLSCDW.DWDTP_AGT_YWHT is multi_lending
  is '是否多次放款';
comment on column BLSCDW.DWDTP_AGT_YWHT is rate_type
  is '利率类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is rate_float_code
  is '利率浮动频率';
comment on column BLSCDW.DWDTP_AGT_YWHT is intrest_period
  is '计息周期';
comment on column BLSCDW.DWDTP_AGT_YWHT is expiry_date
  is '展期后到期日';
comment on column BLSCDW.DWDTP_AGT_YWHT is charge_amt
  is '手续费金额';
comment on column BLSCDW.DWDTP_AGT_YWHT is cure_code
  is '手续费币种';
comment on column BLSCDW.DWDTP_AGT_YWHT is fee_credit_code
  is '手续费支付方机构代码';
comment on column BLSCDW.DWDTP_AGT_YWHT is fee_payer
  is '手续费支付方name';
comment on column BLSCDW.DWDTP_AGT_YWHT is finance_collect_acct
  is 'finance公司收款账户';
comment on column BLSCDW.DWDTP_AGT_YWHT is loan_account
  is '贷款账户';
comment on column BLSCDW.DWDTP_AGT_YWHT is income_account
  is '借款人收入账户';
comment on column BLSCDW.DWDTP_AGT_YWHT is outlay_account
  is '借款人支出账户';
comment on column BLSCDW.DWDTP_AGT_YWHT is repay_capital
  is '还本方式';
comment on column BLSCDW.DWDTP_AGT_YWHT is sfsndk
  is '是否涉农贷款';
comment on column BLSCDW.DWDTP_AGT_YWHT is sndkxz
  is '涉农贷款性质';
comment on column BLSCDW.DWDTP_AGT_YWHT is is_secure_loan
  is '是否创业担保贷款';
comment on column BLSCDW.DWDTP_AGT_YWHT is secure_loan_type
  is '创业担保贷款类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is financial_support
  is '财政扶持方式';
comment on column BLSCDW.DWDTP_AGT_YWHT is is_housepro_loan
  is '是否保障性安居工程贷款';
comment on column BLSCDW.DWDTP_AGT_YWHT is housepro_loan_type
  is '保障性安居工程贷款类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is is_gover_loan
  is '是否地方政府融资平台贷款';
comment on column BLSCDW.DWDTP_AGT_YWHT is local_affilia_type
  is '地方融资平台按隶属关系分类类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is local_legal_nature
  is '地方融资平台按法律性质分类类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is local_source_type
  is '地方融资平台偿债资金来源分类';
comment on column BLSCDW.DWDTP_AGT_YWHT is loan_restructur
  is '重组方式';
comment on column BLSCDW.DWDTP_AGT_YWHT is is_green_loan
  is '是否绿色贷款';
comment on column BLSCDW.DWDTP_AGT_YWHT is lsdktx
  is '绿色贷款投向';
comment on column BLSCDW.DWDTP_AGT_YWHT is overdue_date
  is '逾期date';
comment on column BLSCDW.DWDTP_AGT_YWHT is overdue_type
  is '逾期类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is writeoff_amt
  is '核销收回本金';
comment on column BLSCDW.DWDTP_AGT_YWHT is writeoff_date
  is '核销操作date';
comment on column BLSCDW.DWDTP_AGT_YWHT is writeoff_flag
  is '核销收回flag';
comment on column BLSCDW.DWDTP_AGT_YWHT is writeoff_recovery_date
  is '核销贷款回收date';
comment on column BLSCDW.DWDTP_AGT_YWHT is zndklx
  is '支农贷款类型';
comment on column BLSCDW.DWDTP_AGT_YWHT is balance
  is '余额';
