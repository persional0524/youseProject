create table BLSCDW.DWD_FNCE_VOUCHER
(
  voucher_code     VARCHAR2(32) not null,
  year             NUMBER,
  pmonth           NUMBER,
  vdate            DATE,
  akm_code         VARCHAR2(32),
  opkm             VARCHAR2(255),
  outflag          VARCHAR2(32),
  kmdir            VARCHAR2(32),
  org_code         VARCHAR2(32),
  dir              VARCHAR2(32),
  amount           NUMBER(16,2),
  cur_code         VARCHAR2(32),
  last_update_time DATE,
  explain          VARCHAR2(255),
  originalval      NUMBER(16,2)
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
comment on table BLSCDW.DWD_FNCE_VOUCHER
  is '记账凭证';
comment on column BLSCDW.DWD_FNCE_VOUCHER is voucher_code
  is '凭证号';
comment on column BLSCDW.DWD_FNCE_VOUCHER is year
  is '会计年度';
comment on column BLSCDW.DWD_FNCE_VOUCHER is pmonth
  is '凭证制作月份';
comment on column BLSCDW.DWD_FNCE_VOUCHER is vdate
  is '制单date';
comment on column BLSCDW.DWD_FNCE_VOUCHER is akm_code
  is '科目号';
comment on column BLSCDW.DWD_FNCE_VOUCHER is opkm
  is '对方科目号';
comment on column BLSCDW.DWD_FNCE_VOUCHER is outflag
  is '账外可用否';
comment on column BLSCDW.DWD_FNCE_VOUCHER is kmdir
  is '科目方向';
comment on column BLSCDW.DWD_FNCE_VOUCHER is org_code
  is '机构号';
comment on column BLSCDW.DWD_FNCE_VOUCHER is dir
  is '余额方向';
comment on column BLSCDW.DWD_FNCE_VOUCHER is amount
  is '金额';
comment on column BLSCDW.DWD_FNCE_VOUCHER is cur_code
  is '币种';
comment on column BLSCDW.DWD_FNCE_VOUCHER is last_update_time
  is '时间戳';
comment on column BLSCDW.DWD_FNCE_VOUCHER is explain
  is '摘要';
