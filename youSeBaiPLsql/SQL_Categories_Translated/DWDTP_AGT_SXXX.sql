create table BLSCDW.DWDTP_AGT_SXXX
(
  credit_id      INTEGER not null,
  last_tx_id     INTEGER,
  cltno          VARCHAR2(32),
  sx_contract_no VARCHAR2(64),
  credit_type    INTEGER,
  rating         VARCHAR2(16),
  cedit_amount   NUMBER(18,2),
  usedamount     NUMBER(18,2),
  wdbsxed        NUMBER(20,2),
  first_date     DATE,
  currecny_no    VARCHAR2(4),
  start_date     DATE,
  end_date       DATE,
  iscycle        INTEGER,
  istemp         INTEGER,
  advice_amount  NUMBER(17,2),
  adjust_ratio   NUMBER(10,6),
  adjust_amount  NUMBER(17,2),
  cal_amount     NUMBER(17,2),
  ctrl_date      INTEGER,
  ctrl_method    INTEGER,
  state          INTEGER,
  status         INTEGER
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
comment on table BLSCDW.DWDTP_AGT_SXXX
  is '授信表';
comment on column BLSCDW.DWDTP_AGT_SXXX is credit_id
  is '授信流水号';
comment on column BLSCDW.DWDTP_AGT_SXXX is last_tx_id
  is '最终交易ID';
comment on column BLSCDW.DWDTP_AGT_SXXX is cltno
  is 'client号';
comment on column BLSCDW.DWDTP_AGT_SXXX is sx_contract_no
  is '授信合同号';
comment on column BLSCDW.DWDTP_AGT_SXXX is credit_type
  is '授信类别(1：client类;
comment on column BLSCDW.DWDTP_AGT_SXXX is rating
  is '授信信用级别';
comment on column BLSCDW.DWDTP_AGT_SXXX is cedit_amount
  is '综合授信额度';
comment on column BLSCDW.DWDTP_AGT_SXXX is usedamount
  is '已占用授信金额';
comment on column BLSCDW.DWDTP_AGT_SXXX is wdbsxed
  is '未动拨授信金额';
comment on column BLSCDW.DWDTP_AGT_SXXX is first_date
  is '首次授信时间';
comment on column BLSCDW.DWDTP_AGT_SXXX is currecny_no
  is '币种';
comment on column BLSCDW.DWDTP_AGT_SXXX is start_date
  is '授信开始date';
comment on column BLSCDW.DWDTP_AGT_SXXX is end_date
  is '授信结束date';
comment on column BLSCDW.DWDTP_AGT_SXXX is iscycle
  is '是否循环额度';
comment on column BLSCDW.DWDTP_AGT_SXXX is istemp
  is '是否临时额度';
comment on column BLSCDW.DWDTP_AGT_SXXX is advice_amount
  is '建议综合授信额度';
comment on column BLSCDW.DWDTP_AGT_SXXX is adjust_ratio
  is '调整系数';
comment on column BLSCDW.DWDTP_AGT_SXXX is adjust_amount
  is '调整频度';
comment on column BLSCDW.DWDTP_AGT_SXXX is cal_amount
  is '调整后综合授信额度';
comment on column BLSCDW.DWDTP_AGT_SXXX is ctrl_date
  is 'date控制(0,开始日;
comment on column BLSCDW.DWDTP_AGT_SXXX is ctrl_method
  is '控制方式(0,余额;
comment on column BLSCDW.DWDTP_AGT_SXXX is state
  is '状态(0：未生效;
comment on column BLSCDW.DWDTP_AGT_SXXX is status
  is '集团授信状态';
