create table BLSCDW.DWS_SAVING_BALANCE
(
  vdate           DATE not null,
  cltno           VARCHAR2(32),
  accountno       VARCHAR2(32) not null,
  currency_code   VARCHAR2(16),
  associateflag   VARCHAR2(3),
  bank_short_name VARCHAR2(128),
  atype           VARCHAR2(36),
  is_inner        VARCHAR2(2),
  balance         NUMBER(16,2),
  secondary_id    VARCHAR2(64),
  is_inner_name   VARCHAR2(200),
  atype_name      VARCHAR2(200),
  forshort        VARCHAR2(500),
  ll              NUMBER(16,6),
  pdc_type        VARCHAR2(36),
  start_date      DATE,
  end_date        DATE,
  bank_name       VARCHAR2(200)
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
comment on table BLSCDW.DWS_SAVING_BALANCE
  is '内外部存款余额汇总表';
comment on column BLSCDW.DWS_SAVING_BALANCE is vdate
  is '余额date';
comment on column BLSCDW.DWS_SAVING_BALANCE is cltno
  is '单位';
comment on column BLSCDW.DWS_SAVING_BALANCE is accountno
  is '账号';
comment on column BLSCDW.DWS_SAVING_BALANCE is currency_code
  is '币种';
comment on column BLSCDW.DWS_SAVING_BALANCE is associateflag
  is '联网方式 0：非直连;
comment on column BLSCDW.DWS_SAVING_BALANCE is bank_short_name
  is 'bank简称';
comment on column BLSCDW.DWS_SAVING_BALANCE is atype
  is '存款类别代码';
comment on column BLSCDW.DWS_SAVING_BALANCE is is_inner
  is '内外部代码';
comment on column BLSCDW.DWS_SAVING_BALANCE is balance
  is '账户余额';
comment on column BLSCDW.DWS_SAVING_BALANCE is secondary_id
  is '二级单位代码';
comment on column BLSCDW.DWS_SAVING_BALANCE is is_inner_name
  is '内外部name';
comment on column BLSCDW.DWS_SAVING_BALANCE is atype_name
  is '存款类别名';
comment on column BLSCDW.DWS_SAVING_BALANCE is forshort
  is '单位简称';
comment on column BLSCDW.DWS_SAVING_BALANCE is ll
  is '利率';
comment on column BLSCDW.DWS_SAVING_BALANCE is pdc_type
  is '存款类别';
comment on column BLSCDW.DWS_SAVING_BALANCE is start_date
  is '开始date';
comment on column BLSCDW.DWS_SAVING_BALANCE is end_date
  is '结束date';
comment on column BLSCDW.DWS_SAVING_BALANCE is bank_name
  is 'bankname';
