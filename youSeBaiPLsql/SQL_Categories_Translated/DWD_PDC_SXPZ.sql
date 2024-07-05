create table BLSCDW.DWD_PDC_SXPZ
(
  contract_id    INTEGER,
  credit_class   VARCHAR2(4),
  variety_no     VARCHAR2(32),
  variety_name   VARCHAR2(64),
  variety_amount NUMBER(15,2),
  occupy_method  INTEGER,
  balance        NUMBER(15,2),
  ht_s_dt        DATE,
  ht_e_dt        DATE
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
comment on table BLSCDW.DWD_PDC_SXPZ
  is '授信品种表';
comment on column BLSCDW.DWD_PDC_SXPZ is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_PDC_SXPZ is credit_class
  is '授信分类：0-直接，1-综合';
comment on column BLSCDW.DWD_PDC_SXPZ is variety_no
  is '授信品种code';
comment on column BLSCDW.DWD_PDC_SXPZ is variety_name
  is '授信品种name';
comment on column BLSCDW.DWD_PDC_SXPZ is variety_amount
  is '授信品种额度';
comment on column BLSCDW.DWD_PDC_SXPZ is occupy_method
  is '占用方式,0:可循环,1:一次性';
comment on column BLSCDW.DWD_PDC_SXPZ is balance
  is '授信品种余额';
