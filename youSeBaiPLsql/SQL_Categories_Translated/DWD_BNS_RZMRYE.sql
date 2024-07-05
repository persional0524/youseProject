create table BLSCDW.DWD_BNS_RZMRYE
(
  contract_id  INTEGER,
  cltno        VARCHAR2(32),
  contract_no  VARCHAR2(200),
  amount       NUMBER(15,2),
  balance      NUMBER(15,2),
  balance_date DATE,
  currency_no  VARCHAR2(8),
  start_date   DATE,
  end_date     DATE,
  finish_date  DATE,
  state        INTEGER
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
comment on table BLSCDW.DWD_BNS_RZMRYE
  is '融资合同每日余额表';
comment on column BLSCDW.DWD_BNS_RZMRYE is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_BNS_RZMRYE is cltno
  is 'client号';
comment on column BLSCDW.DWD_BNS_RZMRYE is contract_no
  is '合同号';
comment on column BLSCDW.DWD_BNS_RZMRYE is amount
  is '合同金额';
comment on column BLSCDW.DWD_BNS_RZMRYE is balance
  is '合同余额';
comment on column BLSCDW.DWD_BNS_RZMRYE is balance_date
  is '余额date';
comment on column BLSCDW.DWD_BNS_RZMRYE is currency_no
  is '币种';
comment on column BLSCDW.DWD_BNS_RZMRYE is start_date
  is '合同开始日';
comment on column BLSCDW.DWD_BNS_RZMRYE is end_date
  is '合同结束日';
comment on column BLSCDW.DWD_BNS_RZMRYE is finish_date
  is '合同实际结束日';
comment on column BLSCDW.DWD_BNS_RZMRYE is state
  is '合同状态';
