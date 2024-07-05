create table BLSCDW.DWS_CLMS_SXXX
(
  cltno          VARCHAR2(32),
  sx_contract_no VARCHAR2(64),
  amount         NUMBER(18,2),
  use_amount     NUMBER(18,2),
  balance        NUMBER(18,2),
  currecny_no    VARCHAR2(6),
  start_date     DATE,
  end_date       DATE,
  state          VARCHAR2(20),
  finc           VARCHAR2(64),
  flag           VARCHAR2(3),
  sjrq           DATE,
  sxpz           VARCHAR2(64),
  cltname        VARCHAR2(164),
  applyunitno    VARCHAR2(32),
  applyunitname  VARCHAR2(164)
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
comment on table BLSCDW.DWS_CLMS_SXXX
  is '授信信息表';
comment on column BLSCDW.DWS_CLMS_SXXX is cltno
  is '单位code';
comment on column BLSCDW.DWS_CLMS_SXXX is sx_contract_no
  is '授信合同号';
comment on column BLSCDW.DWS_CLMS_SXXX is amount
  is '授信金额';
comment on column BLSCDW.DWS_CLMS_SXXX is use_amount
  is '占用金额';
comment on column BLSCDW.DWS_CLMS_SXXX is balance
  is '余额';
comment on column BLSCDW.DWS_CLMS_SXXX is currecny_no
  is '币种';
comment on column BLSCDW.DWS_CLMS_SXXX is start_date
  is '开始date';
comment on column BLSCDW.DWS_CLMS_SXXX is end_date
  is '结束date';
comment on column BLSCDW.DWS_CLMS_SXXX is state
  is '状态(0：未生效;
comment on column BLSCDW.DWS_CLMS_SXXX is finc
  is '金融机构';
comment on column BLSCDW.DWS_CLMS_SXXX is flag
  is '内外部flag:0-内1-外';
comment on column BLSCDW.DWS_CLMS_SXXX is sjrq
  is '数据date';
comment on column BLSCDW.DWS_CLMS_SXXX is sxpz
  is '授信品种';
comment on column BLSCDW.DWS_CLMS_SXXX is cltname
  is '用信单位name';
comment on column BLSCDW.DWS_CLMS_SXXX is applyunitno
  is '申请单位';
comment on column BLSCDW.DWS_CLMS_SXXX is applyunitname
  is '申请单位name';
