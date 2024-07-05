create table BLSCDW.DWD_AGT_PROJECT_LOAN_ADD
(
  approval_number   VARCHAR2(100),
  contract_id       VARCHAR2(128),
  loan_id           VARCHAR2(128),
  build_land_lince  VARCHAR2(60),
  construct_lince   VARCHAR2(60),
  eia_report_number VARCHAR2(60),
  entry_amount      NUMBER(15,2),
  entry_name        VARCHAR2(120),
  entry_type        VARCHAR2(60),
  is_ytdk           VARCHAR2(1),
  other_lince       VARCHAR2(60),
  plan_lince        VARCHAR2(60),
  project_approval  VARCHAR2(255),
  project_capital   NUMBER(20,2),
  start_date        DATE,
  ht_s_dt           DATE,
  ht_e_dt           DATE
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
comment on table BLSCDW.DWD_AGT_PROJECT_LOAN_ADD
  is '项目贷款补充信息表';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is approval_number
  is '批文文号';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is loan_id
  is '借据id';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is build_land_lince
  is '建设用地许可证';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is construct_lince
  is '施工许可证';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is eia_report_number
  is '环评报告code';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is entry_amount
  is '项目总investment金额';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is entry_name
  is '项目name';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is entry_type
  is '项目类型';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is is_ytdk
  is '是否银团';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is other_lince
  is '其他许可证';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is plan_lince
  is '规划许可证';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is project_approval
  is '项目批文';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is project_capital
  is '项目资本金';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is start_date
  is '开工date';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_AGT_PROJECT_LOAN_ADD is ht_e_dt
  is '拉链结束日 ';
