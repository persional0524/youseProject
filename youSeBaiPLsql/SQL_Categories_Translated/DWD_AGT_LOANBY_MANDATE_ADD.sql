create table BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD
(
  contract_id      VARCHAR2(30),
  consigner        VARCHAR2(50),
  consigner_inacct VARCHAR2(60),
  consigner_no     VARCHAR2(40),
  loan_acct        VARCHAR2(60),
  loan_biz_type    VARCHAR2(20),
  loan_inacct      VARCHAR2(60),
  loan_type        VARCHAR2(20),
  term             VARCHAR2(60),
  proportion       NUMBER(5,2),
  ht_s_dt          DATE,
  ht_e_dt          DATE
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
comment on table BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD
  is '委托贷款补充信息表';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is consigner
  is '委托人code';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is consigner_inacct
  is '委托方收入账户';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is consigner_no
  is '委托方支出账户';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is loan_acct
  is '借款人支出账户';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is loan_biz_type
  is '委托贷款品种';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is loan_inacct
  is '借款人收入账户';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is loan_type
  is '贷款类型';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is term
  is '期限';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is proportion
  is '委托资金比例';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_AGT_LOANBY_MANDATE_ADD is ht_e_dt
  is '拉链结束';
