create table BLSCDW.DWDTP_AGT_XDJJ
(
  loan_id     VARCHAR2(64) not null,
  loan_no     VARCHAR2(128),
  bid         VARCHAR2(64),
  contract_no VARCHAR2(128),
  amount      NUMBER(15,2),
  balance     NUMBER(15,2),
  start_date  DATE,
  maturity    DATE,
  state       VARCHAR2(5),
  settle_flag VARCHAR2(5),
  settle_date DATE,
  bjll        NUMBER(10,6),
  jzll        NUMBER(10,6),
  yqbjll      NUMBER(10,6),
  flll        NUMBER(10,6),
  nybjll      NUMBER(10,6)
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
comment on table BLSCDW.DWDTP_AGT_XDJJ
  is '信贷借据';
comment on column BLSCDW.DWDTP_AGT_XDJJ is loan_id
  is '借据ID';
comment on column BLSCDW.DWDTP_AGT_XDJJ is loan_no
  is '借据号';
comment on column BLSCDW.DWDTP_AGT_XDJJ is bid
  is '合同ID';
comment on column BLSCDW.DWDTP_AGT_XDJJ is contract_no
  is '合同号';
comment on column BLSCDW.DWDTP_AGT_XDJJ is amount
  is '金额';
comment on column BLSCDW.DWDTP_AGT_XDJJ is balance
  is '余额';
comment on column BLSCDW.DWDTP_AGT_XDJJ is start_date
  is '开始date';
comment on column BLSCDW.DWDTP_AGT_XDJJ is maturity
  is '到期date';
comment on column BLSCDW.DWDTP_AGT_XDJJ is state
  is '状态：0-未放款、1-已放款、2-已执行、5-逾期、6-非应计、7-已核销、9-已结束';
comment on column BLSCDW.DWDTP_AGT_XDJJ is settle_flag
  is '结清flag：0-结清、1-未结清';
comment on column BLSCDW.DWDTP_AGT_XDJJ is settle_date
  is '结清date';
comment on column BLSCDW.DWDTP_AGT_XDJJ is bjll
  is '本金利率';
comment on column BLSCDW.DWDTP_AGT_XDJJ is jzll
  is '基准利率';
comment on column BLSCDW.DWDTP_AGT_XDJJ is yqbjll
  is '逾期本金利率';
comment on column BLSCDW.DWDTP_AGT_XDJJ is flll
  is '复利利率';
comment on column BLSCDW.DWDTP_AGT_XDJJ is nybjll
  is '挪用本金利率';
