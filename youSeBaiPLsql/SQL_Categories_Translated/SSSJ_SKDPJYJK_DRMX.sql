create table BLSCDW.SSSJ_SKDPJYJK_DRMX
(
  bank_name        VARCHAR2(200),
  bankno           VARCHAR2(50),
  cltno            VARCHAR2(50),
  accountname      VARCHAR2(200),
  pay_account_no   VARCHAR2(100),
  pay_account_name VARCHAR2(200),
  amount           NUMBER(15,2),
  associateflag    INTEGER,
  balance_dir      INTEGER,
  op_account_no    VARCHAR2(100),
  op_account_name  VARCHAR2(200),
  op_branch_name   VARCHAR2(200),
  host_time        DATE,
  regno            VARCHAR2(12),
  region_name      VARCHAR2(91),
  rec_reg_no       VARCHAR2(24),
  rec_reg_name     VARCHAR2(91),
  pay_order_state  VARCHAR2(64),
  de_flag          INTEGER,
  yscf_flag        INTEGER,
  ycsb_flag        INTEGER,
  summary          VARCHAR2(1736),
  act_date         DATE
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
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is bank_name
  is 'bankname';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is bankno
  is 'bank代码';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is cltno
  is '单位号码';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is accountname
  is '单位name';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is pay_account_no
  is '本方账号';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is pay_account_name
  is '本方账号name';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is amount
  is '金额';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is associateflag
  is '是否直连 0：非直联;
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is balance_dir
  is '收支方向 1：支出;
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is op_account_no
  is '对方账号';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is op_account_name
  is '对方账号name';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is op_branch_name
  is '对方bankname';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is host_time
  is '交易date';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is regno
  is '本方地区编码';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is region_name
  is '本方地区name';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is rec_reg_no
  is '对方地区编码';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is rec_reg_name
  is '对方地区name';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is pay_order_state
  is '付款状态';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is de_flag
  is '是否大额  0否，1 是';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is yscf_flag
  is '是否疑似重复   0否，1 是';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is ycsb_flag
  is '异常失败标value    0否，1 是';
comment on column BLSCDW.SSSJ_SKDPJYJK_DRMX is summary
  is '摘要';
