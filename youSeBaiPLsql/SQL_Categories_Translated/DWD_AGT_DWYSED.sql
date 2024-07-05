create table BLSCDW.DWD_AGT_DWYSED
(
  quota_id             INTEGER not null,
  budget_code          VARCHAR2(128),
  term_id              NUMBER not null,
  sub_unit_id          NUMBER,
  budget_account_code  VARCHAR2(32) not null,
  currency_no          VARCHAR2(32) not null,
  initial_amount       NUMBER(15,2),
  initial_cash_amount  NUMBER(15,2),
  initial_bill_amount  NUMBER(15,2),
  initial_lc_amount    NUMBER(15,2),
  append_amount        NUMBER(15,2),
  append_cash_amount   NUMBER(15,2),
  append_bill_amount   NUMBER(15,2),
  append_lc_amount     NUMBER(15,2),
  used_amount          NUMBER(15,2),
  used_cash_amount     NUMBER(15,2),
  used_bill_amount     NUMBER(15,2),
  used_lc_amount       NUMBER(15,2),
  obsolete_amount      NUMBER(15,2),
  obsolete_cash_amount NUMBER(15,2),
  obsolete_bill_amount NUMBER(15,2),
  obsolete_lc_amount   NUMBER(15,2),
  amount               NUMBER(15,2),
  cash_amount          NUMBER(15,2),
  bill_amount          NUMBER(15,2),
  lc_amount            NUMBER(15,2)
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
comment on table BLSCDW.DWD_AGT_DWYSED
  is '单位budget额度表';
comment on column BLSCDW.DWD_AGT_DWYSED is quota_id
  is '额度ID';
comment on column BLSCDW.DWD_AGT_DWYSED is budget_code
  is 'budget号';
comment on column BLSCDW.DWD_AGT_DWYSED is term_id
  is 'budget期间ID';
comment on column BLSCDW.DWD_AGT_DWYSED is sub_unit_id
  is 'budget体系单位ID';
comment on column BLSCDW.DWD_AGT_DWYSED is budget_account_code
  is 'budget科目';
comment on column BLSCDW.DWD_AGT_DWYSED is currency_no
  is '上报币种code';
comment on column BLSCDW.DWD_AGT_DWYSED is initial_amount
  is '原始上报总额';
comment on column BLSCDW.DWD_AGT_DWYSED is initial_cash_amount
  is '原始上报现金金额';
comment on column BLSCDW.DWD_AGT_DWYSED is initial_bill_amount
  is '原始上报票据金额';
comment on column BLSCDW.DWD_AGT_DWYSED is initial_lc_amount
  is '原始上报信用证金额';
comment on column BLSCDW.DWD_AGT_DWYSED is append_amount
  is '追加上报总额';
comment on column BLSCDW.DWD_AGT_DWYSED is append_cash_amount
  is '追加上报现金金额';
comment on column BLSCDW.DWD_AGT_DWYSED is append_bill_amount
  is '追加上报票据金额';
comment on column BLSCDW.DWD_AGT_DWYSED is append_lc_amount
  is '追加上报信用证金额';
comment on column BLSCDW.DWD_AGT_DWYSED is used_amount
  is '已使用总额';
comment on column BLSCDW.DWD_AGT_DWYSED is used_cash_amount
  is '已使用现金金额';
comment on column BLSCDW.DWD_AGT_DWYSED is used_bill_amount
  is '已使用票据金额';
comment on column BLSCDW.DWD_AGT_DWYSED is used_lc_amount
  is '已使用信用证金额';
comment on column BLSCDW.DWD_AGT_DWYSED is obsolete_amount
  is '废弃总额';
comment on column BLSCDW.DWD_AGT_DWYSED is obsolete_cash_amount
  is '废弃现金金额';
comment on column BLSCDW.DWD_AGT_DWYSED is obsolete_bill_amount
  is '废弃票据金额';
comment on column BLSCDW.DWD_AGT_DWYSED is obsolete_lc_amount
  is '废弃信用证金额';
comment on column BLSCDW.DWD_AGT_DWYSED is amount
  is '总额';
comment on column BLSCDW.DWD_AGT_DWYSED is cash_amount
  is '现金金额';
comment on column BLSCDW.DWD_AGT_DWYSED is bill_amount
  is '票据金额';
comment on column BLSCDW.DWD_AGT_DWYSED is lc_amount
  is '信用证金额';
