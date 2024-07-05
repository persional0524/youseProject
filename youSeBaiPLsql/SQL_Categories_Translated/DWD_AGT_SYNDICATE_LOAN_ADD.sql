create table BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD
(
  amount        NUMBER(20,2),
  balance       NUMBER(20,2),
  bank_cnaps_no VARCHAR2(16),
  bank_name     VARCHAR2(512),
  contract_id   VARCHAR2(128),
  contract_no   VARCHAR2(64),
  last_rate     NUMBER(20,6),
  protocol_type VARCHAR2(60),
  state         VARCHAR2(10),
  ytdkjs        VARCHAR2(40),
  sqdkze        NUMBER(20,2),
  cddkje        NUMBER(20,2),
  yffdkje       NUMBER(20,2),
  yffcddkje     NUMBER(20,2),
  ht_s_dt       DATE,
  ht_e_dt       DATE
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
comment on table BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD
  is '银团贷款补充信息表';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is amount
  is '合同金额';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is balance
  is '贷款余额';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is bank_cnaps_no
  is '合作金融网点';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is bank_name
  is '合作金融机构';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is contract_no
  is '合同号';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is last_rate
  is '执行利率';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is protocol_type
  is '协议类型';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is state
  is '状态';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is ytdkjs
  is '银团贷款角色';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is sqdkze
  is '申请贷款总额';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is cddkje
  is '承担贷款金额';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is yffdkje
  is '已发放贷款金额';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is yffcddkje
  is '已发放承担贷款金额';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_AGT_SYNDICATE_LOAN_ADD is ht_e_dt
  is '拉链结束日 ';
