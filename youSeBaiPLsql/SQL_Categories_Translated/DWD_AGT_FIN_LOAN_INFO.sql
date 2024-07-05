create table BLSCDW.DWD_AGT_FIN_LOAN_INFO
(
  amount          NUMBER(15,2),
  balance         NUMBER(20,2),
  cur_code        VARCHAR2(32),
  contract_id     VARCHAR2(128),
  bjll            NUMBER(10,6),
  contract_no     VARCHAR2(32),
  flll            NUMBER(10,6),
  is_advance      VARCHAR2(1),
  lending_index   INTEGER,
  loan_id         VARCHAR2(128),
  loan_no         VARCHAR2(64),
  maturity        DATE,
  nybjll          NUMBER(10,6),
  pay_method      VARCHAR2(10),
  settle_date     DATE,
  settle_flag     VARCHAR2(1),
  start_date      DATE,
  state           NUMBER,
  act_settle_date DATE,
  yqbjll          NUMBER(10,6),
  payee_name      VARCHAR2(128),
  payee_type      VARCHAR2(2),
  acctno          VARCHAR2(64),
  acct_type       VARCHAR2(2),
  payee_bankname  VARCHAR2(128),
  acctname        VARCHAR2(128),
  ht_s_dt         DATE,
  ht_e_dt         DATE
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
comment on table BLSCDW.DWD_AGT_FIN_LOAN_INFO
  is '融资借据信息表';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is amount
  is '金额';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is balance
  is '借据余额';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is cur_code
  is '币种';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is bjll
  is '正常本金利率';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is contract_no
  is '合同号';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is flll
  is '复利利率';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is is_advance
  is '是否垫付';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is lending_index
  is '本金序号';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is loan_id
  is '借据ID';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is loan_no
  is '借据号';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is maturity
  is '到期date';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is nybjll
  is '挪用本金利率';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is pay_method
  is '支付方式';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is settle_date
  is '实际到期date';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is settle_flag
  is '结清flag';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is start_date
  is '开始date';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is state
  is '状态 ';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is act_settle_date
  is '结清date';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is yqbjll
  is '逾期本金利率';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is payee_name
  is '实际收款人name';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is payee_type
  is '实际收款人类型';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is acctno
  is '实际收款人账号';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is acct_type
  is '实际收款人账户类型';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is payee_bankname
  is '实际收款人开户行name';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is acctname
  is '实际收款人户名';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_AGT_FIN_LOAN_INFO is ht_e_dt
  is '拉链结束date';
