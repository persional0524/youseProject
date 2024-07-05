create table BLSCDW.DWD_AGT_SXHTHZMX
(
  contractid           INTEGER,
  contractno           VARCHAR2(128),
  applyid              INTEGER,
  applyunitno          VARCHAR2(32),
  applyunitname        VARCHAR2(300),
  contractdate         DATE,
  assbankid            INTEGER,
  branchbankno         VARCHAR2(72),
  branchbankname       VARCHAR2(256),
  currencyno           VARCHAR2(6),
  startdate            DATE,
  enddate              DATE,
  termday              INTEGER,
  termdaytype          INTEGER,
  purposeno            VARCHAR2(32),
  cllevel              VARCHAR2(240),
  bondproportion       NUMBER(15,2),
  state                VARCHAR2(32),
  memo                 VARCHAR2(800),
  finishdate           DATE,
  finishtype           INTEGER,
  finishmemo           VARCHAR2(800),
  creator              VARCHAR2(64),
  createtime           TIMESTAMP(6),
  creditclass          VARCHAR2(4),
  applyamount          NUMBER(15,2),
  porpusename          VARCHAR2(128),
  lockamount           NUMBER(15,2),
  balance              NUMBER,
  useamount            NUMBER,
  creditmode           INTEGER,
  creditmanagementmode INTEGER,
  quotacontrol         INTEGER,
  istakeguarantee      INTEGER,
  allocationmode       INTEGER,
  fmid                 INTEGER,
  cltname              VARCHAR2(60),
  cltno                VARCHAR2(32),
  clientquotaid        INTEGER,
  creditquota          NUMBER(15,2),
  effectivedate        DATE,
  guaranteemethod      VARCHAR2(12),
  varietynos           VARCHAR2(500),
  varietynames         VARCHAR2(500),
  v_date               DATE
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
comment on column BLSCDW.DWD_AGT_SXHTHZMX is contractid
  is '合同id';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is contractno
  is '合同号';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is applyid
  is '申请id';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is applyunitno
  is '申请单位';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is applyunitname
  is '申请单位name';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is contractdate
  is '签约date';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is assbankid
  is '授信bank';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is branchbankno
  is '支行code';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is branchbankname
  is '支行name';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is currencyno
  is '币种';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is startdate
  is '开始date';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is enddate
  is '结束date';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is termday
  is '期限';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is termdaytype
  is '期限类型';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is purposeno
  is '用途code';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is cllevel
  is '授信评级';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is bondproportion
  is '保证金比例';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is state
  is '合同状态';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is memo
  is '备注';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is finishdate
  is '结项date';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is finishtype
  is '结项方式，0:正常结项，1:异常结项';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is finishmemo
  is '结项说明';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is creator
  is '录入人名册';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is createtime
  is '合同生效时间';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is creditclass
  is '授信分类：0-直接，1-综合';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is applyamount
  is '合同金额';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is porpusename
  is '授信用途';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is lockamount
  is '合同锁定金额';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is balance
  is '授信余额';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is useamount
  is '授信使用金额';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is creditmode
  is '授信方式.0,单一法人授信;
comment on column BLSCDW.DWD_AGT_SXHTHZMX is creditmanagementmode
  is '单位额度控制。0，不控制。1：分单位控制;
comment on column BLSCDW.DWD_AGT_SXHTHZMX is quotacontrol
  is '额度控制。0,总额控制;
comment on column BLSCDW.DWD_AGT_SXHTHZMX is istakeguarantee
  is '是否占用担保。0,否;
comment on column BLSCDW.DWD_AGT_SXHTHZMX is allocationmode
  is '分配方式.0,授信额度分配;
comment on column BLSCDW.DWD_AGT_SXHTHZMX is fmid
  is '初始合同工单id';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is cltname
  is '分配单位name';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is cltno
  is '分配单位';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is clientquotaid
  is '分配流水号';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is creditquota
  is '分配额度';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is effectivedate
  is '真实合同生效date';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is guaranteemethod
  is '担保方式';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is varietynos
  is '授信品种code';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is varietynames
  is '授信品种name';
comment on column BLSCDW.DWD_AGT_SXHTHZMX is v_date
  is '数据date';
