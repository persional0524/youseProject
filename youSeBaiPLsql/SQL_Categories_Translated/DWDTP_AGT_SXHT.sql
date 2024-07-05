create table BLSCDW.DWDTP_AGT_SXHT
(
  contract_id       INTEGER not null,
  contract_no       VARCHAR2(128),
  cltno             VARCHAR2(32) not null,
  clt_name          VARCHAR2(60),
  credit_quota      NUMBER(15,2),
  is_subdivided     INTEGER,
  lock_amount       NUMBER(15,2),
  balance           NUMBER(15,2),
  start_date        DATE,
  end_date          DATE,
  termday_type      INTEGER,
  term_day          INTEGER,
  cl_level          VARCHAR2(240),
  credit_mode       INTEGER,
  quota_control     INTEGER,
  is_take_guarantee INTEGER,
  allocation_mode   INTEGER,
  credit_class      INTEGER,
  bondproportion    NUMBER(15,2),
  create_time       DATE,
  effective_date    DATE,
  branch_bank_no    VARCHAR2(72),
  currecny_no       VARCHAR2(32),
  state             VARCHAR2(32)
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
comment on table BLSCDW.DWDTP_AGT_SXHT
  is '授信合同';
comment on column BLSCDW.DWDTP_AGT_SXHT is contract_id
  is '合同ID';
comment on column BLSCDW.DWDTP_AGT_SXHT is contract_no
  is '合同号';
comment on column BLSCDW.DWDTP_AGT_SXHT is cltno
  is '分配单位';
comment on column BLSCDW.DWDTP_AGT_SXHT is clt_name
  is '分配单位name';
comment on column BLSCDW.DWDTP_AGT_SXHT is credit_quota
  is '分配额度';
comment on column BLSCDW.DWDTP_AGT_SXHT is is_subdivided
  is '是否细分品种额度。0，否;
comment on column BLSCDW.DWDTP_AGT_SXHT is lock_amount
  is '占用未生效额度';
comment on column BLSCDW.DWDTP_AGT_SXHT is balance
  is '剩余额度';
comment on column BLSCDW.DWDTP_AGT_SXHT is start_date
  is '开始date';
comment on column BLSCDW.DWDTP_AGT_SXHT is end_date
  is '结束date';
comment on column BLSCDW.DWDTP_AGT_SXHT is termday_type
  is '期限类型 3，年;
comment on column BLSCDW.DWDTP_AGT_SXHT is term_day
  is '期限';
comment on column BLSCDW.DWDTP_AGT_SXHT is cl_level
  is '授信评级';
comment on column BLSCDW.DWDTP_AGT_SXHT is credit_mode
  is '授信方式.0,单一法人授信;
comment on column BLSCDW.DWDTP_AGT_SXHT is quota_control
  is '额度控制。0,总额控制;
comment on column BLSCDW.DWDTP_AGT_SXHT is is_take_guarantee
  is '是否占用担保。0,否;
comment on column BLSCDW.DWDTP_AGT_SXHT is allocation_mode
  is '分配方式.0,授信额度分配;
comment on column BLSCDW.DWDTP_AGT_SXHT is credit_class
  is '授信分类：0-直接，1-综合';
comment on column BLSCDW.DWDTP_AGT_SXHT is bondproportion
  is '保证金比例';
comment on column BLSCDW.DWDTP_AGT_SXHT is create_time
  is '合同生效时间';
comment on column BLSCDW.DWDTP_AGT_SXHT is effective_date
  is '真实合同生效date';
comment on column BLSCDW.DWDTP_AGT_SXHT is branch_bank_no
  is '支行code';
comment on column BLSCDW.DWDTP_AGT_SXHT is currecny_no
  is '币种';
comment on column BLSCDW.DWDTP_AGT_SXHT is state
  is '状态';
