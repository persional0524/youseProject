create table BLSCDW.DWD_AGT_RZHTLV
(
  amount_id   INTEGER,
  contract_id INTEGER,
  amount      NUMBER(15,2),
  start_date  DATE,
  end_date    DATE,
  base_rate   NUMBER(10,6),
  rate        NUMBER(10,6),
  effect_date DATE,
  ht_s_dt     DATE,
  ht_e_dt     DATE
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
comment on table BLSCDW.DWD_AGT_RZHTLV
  is '融资合同利率表';
comment on column BLSCDW.DWD_AGT_RZHTLV is amount_id
  is '合同金额ID';
comment on column BLSCDW.DWD_AGT_RZHTLV is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_RZHTLV is amount
  is '合同金额';
comment on column BLSCDW.DWD_AGT_RZHTLV is start_date
  is '合同开始日';
comment on column BLSCDW.DWD_AGT_RZHTLV is end_date
  is '合同结束日';
comment on column BLSCDW.DWD_AGT_RZHTLV is base_rate
  is '基准利率';
comment on column BLSCDW.DWD_AGT_RZHTLV is rate
  is '执行利率';
comment on column BLSCDW.DWD_AGT_RZHTLV is effect_date
  is '利率生效日';
comment on column BLSCDW.DWD_AGT_RZHTLV is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_AGT_RZHTLV is ht_e_dt
  is '拉链结束date';
