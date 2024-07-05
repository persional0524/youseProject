create table BLSCDW.DWDTP_AGT_RZHT
(
  amount_id             INTEGER not null,
  contract_id           INTEGER not null,
  cltno                 VARCHAR2(32),
  contract_no           VARCHAR2(200),
  biz_type              VARCHAR2(16),
  biz_type_name         VARCHAR2(32),
  buss_class            VARCHAR2(16),
  amount                NUMBER(15,2),
  contract_date         DATE,
  start_date            DATE,
  end_date              DATE,
  finish_date           DATE,
  finish_type           INTEGER,
  finish_reason         VARCHAR2(1600),
  state                 INTEGER,
  termday_type          INTEGER,
  term_day              INTEGER,
  currency_no           VARCHAR2(8),
  rate_adjust_type      INTEGER,
  rate_adjust_frequency INTEGER,
  repayment_type        INTEGER,
  repayment_frequency   INTEGER,
  pay_back_type         INTEGER,
  float_type            INTEGER,
  float_value           INTEGER,
  islibor               INTEGER,
  bank_name             VARCHAR2(128),
  ass_bankcode          VARCHAR2(32),
  ass_bankname          VARCHAR2(255),
  country_no            VARCHAR2(16),
  delegate_flag         INTEGER,
  circulate_flag        INTEGER,
  unified_flag          INTEGER,
  delegate_cltno        VARCHAR2(32),
  purpose_no            VARCHAR2(512),
  lease_premium         NUMBER(15,2),
  year_return           NUMBER(10,6),
  rent_pay_method       VARCHAR2(128),
  follow_fees           NUMBER(15,2),
  rent_pay_cycle        INTEGER,
  lease_premium_ratio   NUMBER(5,2)
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
comment on table BLSCDW.DWDTP_AGT_RZHT
  is '融资合同表';
comment on column BLSCDW.DWDTP_AGT_RZHT is amount_id
  is '合同金额ID';
comment on column BLSCDW.DWDTP_AGT_RZHT is contract_id
  is '合同ID';
comment on column BLSCDW.DWDTP_AGT_RZHT is cltno
  is 'client号';
comment on column BLSCDW.DWDTP_AGT_RZHT is contract_no
  is '合同号';
comment on column BLSCDW.DWDTP_AGT_RZHT is biz_type
  is '业务分类';
comment on column BLSCDW.DWDTP_AGT_RZHT is biz_type_name
  is '业务分类name';
comment on column BLSCDW.DWDTP_AGT_RZHT is buss_class
  is '业务品种';
comment on column BLSCDW.DWDTP_AGT_RZHT is amount
  is '合同金额';
comment on column BLSCDW.DWDTP_AGT_RZHT is contract_date
  is '合同签约date';
comment on column BLSCDW.DWDTP_AGT_RZHT is start_date
  is '合同开始date';
comment on column BLSCDW.DWDTP_AGT_RZHT is end_date
  is '合同结束date';
comment on column BLSCDW.DWDTP_AGT_RZHT is finish_date
  is '合同实际结束date';
comment on column BLSCDW.DWDTP_AGT_RZHT is finish_type
  is '结项方式0-正常,1异常';
comment on column BLSCDW.DWDTP_AGT_RZHT is finish_reason
  is '结项原因';
comment on column BLSCDW.DWDTP_AGT_RZHT is state
  is '合同状态';
comment on column BLSCDW.DWDTP_AGT_RZHT is termday_type
  is '期限类型 3，年;
comment on column BLSCDW.DWDTP_AGT_RZHT is term_day
  is '合同期限';
comment on column BLSCDW.DWDTP_AGT_RZHT is currency_no
  is '币种';
comment on column BLSCDW.DWDTP_AGT_RZHT is rate_adjust_type
  is '利率调整方式：1,固定利率;
comment on column BLSCDW.DWDTP_AGT_RZHT is rate_adjust_frequency
  is '利率调整频率：1,按月;
comment on column BLSCDW.DWDTP_AGT_RZHT is repayment_type
  is '还本方式：1、到期一次;
comment on column BLSCDW.DWDTP_AGT_RZHT is repayment_frequency
  is '还本频率：1,按月;
comment on column BLSCDW.DWDTP_AGT_RZHT is pay_back_type
  is '还款方式？？？码value待确认含义';
comment on column BLSCDW.DWDTP_AGT_RZHT is float_type
  is '利率浮动方式：上浮%，0;
comment on column BLSCDW.DWDTP_AGT_RZHT is float_value
  is '利率浮动value';
comment on column BLSCDW.DWDTP_AGT_RZHT is islibor
  is '利率类型';
comment on column BLSCDW.DWDTP_AGT_RZHT is bank_name
  is '开户bank';
comment on column BLSCDW.DWDTP_AGT_RZHT is ass_bankcode
  is '联行号';
comment on column BLSCDW.DWDTP_AGT_RZHT is ass_bankname
  is '合作金融网点';
comment on column BLSCDW.DWDTP_AGT_RZHT is country_no
  is '国家地区';
comment on column BLSCDW.DWDTP_AGT_RZHT is delegate_flag
  is '是否委托贷款0否1是';
comment on column BLSCDW.DWDTP_AGT_RZHT is circulate_flag
  is '是否循环贷款0否1是';
comment on column BLSCDW.DWDTP_AGT_RZHT is unified_flag
  is '是否统借贷款0否1是';
comment on column BLSCDW.DWDTP_AGT_RZHT is delegate_cltno
  is '委托单位client号';
comment on column BLSCDW.DWDTP_AGT_RZHT is purpose_no
  is '用途';
comment on column BLSCDW.DWDTP_AGT_RZHT is lease_premium
  is '租赁保证金';
comment on column BLSCDW.DWDTP_AGT_RZHT is year_return
  is '年回报率/年租金率';
comment on column BLSCDW.DWDTP_AGT_RZHT is rent_pay_method
  is '租金支付方式';
comment on column BLSCDW.DWDTP_AGT_RZHT is follow_fees
  is '租赁后续费';
comment on column BLSCDW.DWDTP_AGT_RZHT is rent_pay_cycle
  is '租金支付周期';
comment on column BLSCDW.DWDTP_AGT_RZHT is lease_premium_ratio
  is '租赁保证金比例%';
