create table BLSCDW.DWS_FUND_CONCENTRATION_DETAIL
(
  vdate    DATE,
  cltno    VARCHAR2(64),
  cltname  VARCHAR2(300),
  forshort VARCHAR2(500),
  bz       CHAR(10),
  ygjzz    NUMBER,
  hbzj     NUMBER,
  zjzzd    NUMBER,
  hzlx     CHAR(4)
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
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is vdate
  is 'date';
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is cltno
  is '单位code';
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is cltname
  is '单位name';
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is forshort
  is '单位简称';
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is bz
  is '币种';
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is ygjzz
  is '已归集资金';
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is hbzj
  is '货币资金';
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is zjzzd
  is '资金集中度';
comment on column BLSCDW.DWS_FUND_CONCENTRATION_DETAIL is hzlx
  is '汇总类型 本部，合并';
