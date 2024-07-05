create table BLSCDW.DWD_BNS_HISTORY_SAVING
(
  scn_date      DATE not null,
  bizid         VARCHAR2(36) not null,
  balance       NUMBER(16,2),
  rate          NUMBER(10,4),
  amassbalance  NUMBER(16,2),
  amassrate     NUMBER(10,4),
  scale         NUMBER(16,2),
  sbuno         VARCHAR2(32),
  accacmvalue   NUMBER(16,2),
  sbuacmvalue   NUMBER(16,2),
  accpartval    NUMBER(16,2),
  agsbunitquota NUMBER(16,2),
  atype         VARCHAR2(36),
  g21           INTEGER
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
comment on table BLSCDW.DWD_BNS_HISTORY_SAVING
  is '存款余额history';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is scn_date
  is 'date';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is bizid
  is 'BIZID';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is balance
  is '余额';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is rate
  is '利率';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is amassbalance
  is '协定余额';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is amassrate
  is '协定利率';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is scale
  is '规模';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is sbuno
  is '协定账号';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is accacmvalue
  is '活期部分积数';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is sbuacmvalue
  is '协定部分积数';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is accpartval
  is '活期部分余额';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is agsbunitquota
  is '协定额度';
comment on column BLSCDW.DWD_BNS_HISTORY_SAVING is g21
  is '1(次日),2(2日至7日),3(8日至30日),4(31日至90日),5(91日至1年),6(1年至5年),7(5年至10年),8(10年以上)';
