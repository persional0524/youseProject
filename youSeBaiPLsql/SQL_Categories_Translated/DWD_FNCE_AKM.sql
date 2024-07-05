create table BLSCDW.DWD_FNCE_AKM
(
  id          VARCHAR2(32),
  org_code    VARCHAR2(32),
  akm_code    VARCHAR2(32),
  akm_name    VARCHAR2(128),
  kmgrp       VARCHAR2(32),
  dir         VARCHAR2(32),
  kmlevel     VARCHAR2(32),
  isdetailakm VARCHAR2(32),
  cash_type   VARCHAR2(32),
  qtyflag     VARCHAR2(32),
  qtyunit     VARCHAR2(32),
  business    VARCHAR2(32),
  outflag     VARCHAR2(32),
  limitmode   VARCHAR2(32),
  quoto       NUMBER(16,2),
  usestate    VARCHAR2(32),
  akmpath     VARCHAR2(256),
  year        INTEGER
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
comment on table BLSCDW.DWD_FNCE_AKM
  is '科目';
comment on column BLSCDW.DWD_FNCE_AKM is id
  is '科目主键';
comment on column BLSCDW.DWD_FNCE_AKM is org_code
  is '机构号';
comment on column BLSCDW.DWD_FNCE_AKM is akm_code
  is '科目编码';
comment on column BLSCDW.DWD_FNCE_AKM is akm_name
  is '科目name';
comment on column BLSCDW.DWD_FNCE_AKM is kmgrp
  is '1：资产类，2：负债类，3：所有权类，5：损益类';
comment on column BLSCDW.DWD_FNCE_AKM is dir
  is 'J表示借，D表示贷';
comment on column BLSCDW.DWD_FNCE_AKM is kmlevel
  is '科目级别';
comment on column BLSCDW.DWD_FNCE_AKM is isdetailakm
  is 'Y：明细;
comment on column BLSCDW.DWD_FNCE_AKM is cash_type
  is '是否现金类型';
comment on column BLSCDW.DWD_FNCE_AKM is qtyflag
  is '是否数量类型';
comment on column BLSCDW.DWD_FNCE_AKM is qtyunit
  is '数量单位';
comment on column BLSCDW.DWD_FNCE_AKM is business
  is '是否结算专用、可用';
comment on column BLSCDW.DWD_FNCE_AKM is outflag
  is '账外可用否';
comment on column BLSCDW.DWD_FNCE_AKM is limitmode
  is '限额否';
comment on column BLSCDW.DWD_FNCE_AKM is quoto
  is '限额金额';
comment on column BLSCDW.DWD_FNCE_AKM is usestate
  is '使用状态';
comment on column BLSCDW.DWD_FNCE_AKM is akmpath
  is '科目路径';
comment on column BLSCDW.DWD_FNCE_AKM is year
  is '账套';
