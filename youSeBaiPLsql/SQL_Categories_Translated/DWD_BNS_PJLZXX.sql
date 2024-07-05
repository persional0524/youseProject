create table BLSCDW.DWD_BNS_PJLZXX
(
  wb_id              INTEGER,
  bill_id            INTEGER,
  cltno              VARCHAR2(32),
  begin_date         DATE,
  end_date           DATE,
  end_flag           INTEGER,
  end_type           VARCHAR2(32),
  bill_status        VARCHAR2(12),
  holder_bankno      VARCHAR2(12),
  holder_bankaccount VARCHAR2(32),
  owner_bankno       VARCHAR2(12),
  owner_bankaccount  VARCHAR2(32),
  rec_pay            VARCHAR2(4),
  create_time        DATE
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
comment on table BLSCDW.DWD_BNS_PJLZXX
  is '票据流转信息';
comment on column BLSCDW.DWD_BNS_PJLZXX is wb_id
  is '流转ID';
comment on column BLSCDW.DWD_BNS_PJLZXX is bill_id
  is '持有单位';
comment on column BLSCDW.DWD_BNS_PJLZXX is begin_date
  is '持有开始date';
comment on column BLSCDW.DWD_BNS_PJLZXX is end_date
  is '持有到期date';
comment on column BLSCDW.DWD_BNS_PJLZXX is end_flag
  is '是否在库，0是1否';
comment on column BLSCDW.DWD_BNS_PJLZXX is end_type
  is 'R01 背书转让
R02 托收
R03 贴现
P01 解付';
comment on column BLSCDW.DWD_BNS_PJLZXX is bill_status
  is '票证状态';
comment on column BLSCDW.DWD_BNS_PJLZXX is holder_bankno
  is '持有人开户行行号';
comment on column BLSCDW.DWD_BNS_PJLZXX is holder_bankaccount
  is '持有人账号';
comment on column BLSCDW.DWD_BNS_PJLZXX is owner_bankno
  is '权利人开户行行号';
comment on column BLSCDW.DWD_BNS_PJLZXX is owner_bankaccount
  is '权利人账号';
comment on column BLSCDW.DWD_BNS_PJLZXX is rec_pay
  is '应收应付';
comment on column BLSCDW.DWD_BNS_PJLZXX is create_time
  is 'created时间';
