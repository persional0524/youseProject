create table BLSCDW.DWD_BNS_RZFHKJL
(
  contexec_id         INTEGER,
  amount_id           INTEGER,
  contract_id         INTEGER,
  contract_no         VARCHAR2(200),
  buss_date           DATE,
  contexec_type       INTEGER,
  amount              NUMBER(15,2),
  fetch_no            VARCHAR2(64),
  sum_rate_start_date DATE,
  sum_rate_end_date   DATE,
  associate_no        VARCHAR2(64)
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
comment on table BLSCDW.DWD_BNS_RZFHKJL
  is '融资合同放还款表';
comment on column BLSCDW.DWD_BNS_RZFHKJL is contexec_id
  is '合同放款ID';
comment on column BLSCDW.DWD_BNS_RZFHKJL is amount_id
  is '合同金额ID';
comment on column BLSCDW.DWD_BNS_RZFHKJL is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_BNS_RZFHKJL is contract_no
  is '合同号';
comment on column BLSCDW.DWD_BNS_RZFHKJL is buss_date
  is '业务发生date';
comment on column BLSCDW.DWD_BNS_RZFHKJL is contexec_type
  is '业务发生方向:0-融入,1-还款,2-付息,3-费用';
comment on column BLSCDW.DWD_BNS_RZFHKJL is amount
  is '发生金额';
comment on column BLSCDW.DWD_BNS_RZFHKJL is fetch_no
  is '放款号';
comment on column BLSCDW.DWD_BNS_RZFHKJL is sum_rate_start_date
  is '计息开始日';
comment on column BLSCDW.DWD_BNS_RZFHKJL is sum_rate_end_date
  is '计息结束日';
comment on column BLSCDW.DWD_BNS_RZFHKJL is associate_no
  is '关联计划code';
