create table BLSCDW.DWD_AGT_PJXX
(
  bill_id         INTEGER not null,
  bank_no         VARCHAR2(4),
  bank_name       VARCHAR2(64),
  bill_no         VARCHAR2(64),
  amount          NUMBER(15,2) not null,
  start_date      DATE,
  due_date        DATE,
  currency_no     VARCHAR2(8) default 'CNY' not null,
  draft_no        VARCHAR2(8) not null,
  draft_type      VARCHAR2(8) not null,
  pay_name        VARCHAR2(128),
  pay_no          VARCHAR2(32),
  open_bankname   VARCHAR2(128),
  open_bankno     VARCHAR2(18),
  pay_bankname    VARCHAR2(128),
  pay_bankno      VARCHAR2(18),
  rec_name        VARCHAR2(128),
  rec_no          VARCHAR2(32),
  rec_bankname    VARCHAR2(128),
  rec_bankno      VARCHAR2(18),
  accptr_name     VARCHAR2(128),
  accptr_no       VARCHAR2(32),
  accptr_bankname VARCHAR2(128),
  accptr_bankno   VARCHAR2(18),
  accptr_date     DATE,
  ht_s_dt         DATE,
  ht_e_dt         DATE
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
comment on table BLSCDW.DWD_AGT_PJXX
  is '票据基本信息表';
comment on column BLSCDW.DWD_AGT_PJXX is bill_id
  is '票证ID';
comment on column BLSCDW.DWD_AGT_PJXX is bank_no
  is 'bank代码';
comment on column BLSCDW.DWD_AGT_PJXX is bank_name
  is 'bankname';
comment on column BLSCDW.DWD_AGT_PJXX is bill_no
  is '票据code';
comment on column BLSCDW.DWD_AGT_PJXX is amount
  is '票面金额';
comment on column BLSCDW.DWD_AGT_PJXX is start_date
  is '出票date';
comment on column BLSCDW.DWD_AGT_PJXX is due_date
  is '到期date';
comment on column BLSCDW.DWD_AGT_PJXX is currency_no
  is '币种';
comment on column BLSCDW.DWD_AGT_PJXX is draft_no
  is '电票纸票 0 纸票1电票 ';
comment on column BLSCDW.DWD_AGT_PJXX is draft_type
  is '00银票 01商票  ';
comment on column BLSCDW.DWD_AGT_PJXX is pay_name
  is '出票人全称';
comment on column BLSCDW.DWD_AGT_PJXX is pay_no
  is '出票人账号';
comment on column BLSCDW.DWD_AGT_PJXX is open_bankname
  is '出票人开户行name';
comment on column BLSCDW.DWD_AGT_PJXX is open_bankno
  is '出票人开户行行号';
comment on column BLSCDW.DWD_AGT_PJXX is pay_bankname
  is '付款行name';
comment on column BLSCDW.DWD_AGT_PJXX is pay_bankno
  is '付款行行号';
comment on column BLSCDW.DWD_AGT_PJXX is rec_name
  is '收款人全称';
comment on column BLSCDW.DWD_AGT_PJXX is rec_no
  is '收款人账号';
comment on column BLSCDW.DWD_AGT_PJXX is rec_bankname
  is '收款人开户行name';
comment on column BLSCDW.DWD_AGT_PJXX is rec_bankno
  is '收款人开户行行号';
comment on column BLSCDW.DWD_AGT_PJXX is accptr_name
  is '承兑人name';
comment on column BLSCDW.DWD_AGT_PJXX is accptr_no
  is '承兑人账号';
comment on column BLSCDW.DWD_AGT_PJXX is accptr_bankname
  is '承兑人开户行name';
comment on column BLSCDW.DWD_AGT_PJXX is accptr_bankno
  is '承兑人开户行行号';
comment on column BLSCDW.DWD_AGT_PJXX is accptr_date
  is '承兑date';
comment on column BLSCDW.DWD_AGT_PJXX is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_AGT_PJXX is ht_e_dt
  is '拉链结束date';
