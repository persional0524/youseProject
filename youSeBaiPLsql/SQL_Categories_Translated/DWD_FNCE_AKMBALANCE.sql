create table BLSCDW.DWD_FNCE_AKMBALANCE
(
  vdate         DATE not null,
  akm_code      VARCHAR2(32) not null,
  cur_code      VARCHAR2(32) not null,
  branch_code   VARCHAR2(32) not null,
  s_balance     NUMBER(16,2),
  jamount       NUMBER(16,2),
  damount       NUMBER(16,2),
  balance       NUMBER(16,2),
  total_jamount NUMBER(16,2),
  total_damount NUMBER(16,2),
  year_jamount  NUMBER(16,2),
  year_damount  NUMBER(16,2),
  mon_jamount   NUMBER(16,2),
  mon_damount   NUMBER(16,2)
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
comment on table BLSCDW.DWD_FNCE_AKMBALANCE
  is '科目余额';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is vdate
  is '统计date';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is akm_code
  is '科目号';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is cur_code
  is '币种';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is branch_code
  is '机构号';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is s_balance
  is '期初余额';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is jamount
  is '借方发生额';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is damount
  is '贷方发生额';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is balance
  is '账户余额';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is total_jamount
  is '累计借';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is total_damount
  is '累计贷';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is year_jamount
  is '年累计借';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is year_damount
  is '年累计贷';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is mon_jamount
  is '月累计借';
comment on column BLSCDW.DWD_FNCE_AKMBALANCE is mon_damount
  is '月累计贷';
