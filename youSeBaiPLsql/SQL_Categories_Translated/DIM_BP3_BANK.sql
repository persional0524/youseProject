create table BLSCDW.DIM_BP3_BANK
(
  bank_code             VARCHAR2(6) not null,
  bank_name             VARCHAR2(80) not null,
  bank_key              VARCHAR2(10) not null,
  bank_short_name       VARCHAR2(80) not null,
  bank_routing_strategy VARCHAR2(20) default 'ACCOUNT' not null,
  connect_flag          INTEGER default 0 not null
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
comment on table BLSCDW.DIM_BP3_BANK
  is 'bank';
comment on column BLSCDW.DIM_BP3_BANK is bank_code
  is 'bankcode';
comment on column BLSCDW.DIM_BP3_BANK is bank_name
  is 'bankname';
comment on column BLSCDW.DIM_BP3_BANK is bank_key
  is '英文缩写代码';
comment on column BLSCDW.DIM_BP3_BANK is bank_short_name
  is 'bank简称';
comment on column BLSCDW.DIM_BP3_BANK is bank_routing_strategy
  is '路由strategy(ACCOUNT：账户路由规则;
comment on column BLSCDW.DIM_BP3_BANK is connect_flag
  is '是否直连bank(1：是，2：否)';
