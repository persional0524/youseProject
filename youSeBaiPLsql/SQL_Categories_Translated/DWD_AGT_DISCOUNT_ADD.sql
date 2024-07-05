create table BLSCDW.DWD_AGT_DISCOUNT_ADD
(
  acct_amount   NUMBER(20,2),
  bid           VARCHAR2(64),
  contract_no   VARCHAR2(32),
  discount_type VARCHAR2(10),
  pay_method    VARCHAR2(10),
  pay_type      VARCHAR2(10),
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
comment on table BLSCDW.DWD_AGT_DISCOUNT_ADD
  is '贴现补充信息表';
comment on column BLSCDW.DWD_AGT_DISCOUNT_ADD is acct_amount
  is '实付金额';
comment on column BLSCDW.DWD_AGT_DISCOUNT_ADD is bid
  is '合同ID';
comment on column BLSCDW.DWD_AGT_DISCOUNT_ADD is contract_no
  is '合同号';
comment on column BLSCDW.DWD_AGT_DISCOUNT_ADD is discount_type
  is '贴现类型';
comment on column BLSCDW.DWD_AGT_DISCOUNT_ADD is pay_method
  is '支付方式';
comment on column BLSCDW.DWD_AGT_DISCOUNT_ADD is pay_type
  is '付息类型';
comment on column BLSCDW.DWD_AGT_DISCOUNT_ADD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_AGT_DISCOUNT_ADD is ht_e_dt
  is '拉链结束';
