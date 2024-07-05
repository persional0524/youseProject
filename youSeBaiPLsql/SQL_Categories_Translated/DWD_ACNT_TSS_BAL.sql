create table BLSCDW.DWD_ACNT_TSS_BAL
(
  balance_id             INTEGER not null,
  no                     VARCHAR2(128) not null,
  rdate                  DATE not null,
  rval                   NUMBER(18,2) default 0 not null,
  ramass                 NUMBER(18,2) default 0 not null,
  vamass                 NUMBER(18,2) default 0 not null,
  tamass                 NUMBER(18,2) default 0 not null,
  available_balance      NUMBER(18,2),
  aims_available_balance NUMBER(18,2)
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
comment on table BLSCDW.DWD_ACNT_TSS_BAL
  is '结息明细记录表';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is balance_id
  is '主键';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is no
  is '账号';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is rdate
  is '计息日';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is rval
  is '余额';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is ramass
  is '余额积数';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is vamass
  is '起息日调整';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is tamass
  is '积数调整数';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is available_balance
  is '可用余额';
comment on column BLSCDW.DWD_ACNT_TSS_BAL is aims_available_balance
  is 'bank可用余额';
