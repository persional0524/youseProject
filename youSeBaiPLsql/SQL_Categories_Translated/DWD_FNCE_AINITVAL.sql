create table BLSCDW.DWD_FNCE_AINITVAL
(
  year     NUMBER not null,
  cur_code VARCHAR2(32),
  akm_code VARCHAR2(32),
  pmonth   NUMBER,
  org_code VARCHAR2(32),
  jamount  NUMBER(16,2),
  damount  NUMBER(16,2)
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
comment on table BLSCDW.DWD_FNCE_AINITVAL
  is '年初科目余额';
comment on column BLSCDW.DWD_FNCE_AINITVAL is year
  is '会计年度';
comment on column BLSCDW.DWD_FNCE_AINITVAL is cur_code
  is '币种';
comment on column BLSCDW.DWD_FNCE_AINITVAL is akm_code
  is '科目号';
comment on column BLSCDW.DWD_FNCE_AINITVAL is pmonth
  is '凭证制作月份';
comment on column BLSCDW.DWD_FNCE_AINITVAL is org_code
  is '机构号';
comment on column BLSCDW.DWD_FNCE_AINITVAL is jamount
  is '借方发生额';
comment on column BLSCDW.DWD_FNCE_AINITVAL is damount
  is '贷方发生额';
