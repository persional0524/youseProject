create table BLSCDW.DWS_CLIENT_SAVING
(
  vdate          DATE,
  atype          VARCHAR2(36),
  memberno       VARCHAR2(32),
  account_no     VARCHAR2(32),
  biz_code       VARCHAR2(60),
  currency       VARCHAR2(8),
  pdc_type       VARCHAR2(32),
  rate           NUMBER(10,4),
  balance        NUMBER(16,2),
  g21            INTEGER,
  start_date     DATE,
  end_date       DATE,
  atype1         VARCHAR2(8),
  maxaccount_no  VARCHAR2(100),
  inflow         NUMBER(16,2),
  outflow        NUMBER(16,2),
  sbuno          VARCHAR2(60),
  amassbalance   NUMBER(16,2),
  amassrate      NUMBER(10,4),
  scale          NUMBER(16,2),
  accacmvalue    NUMBER(16,2),
  sbuacmvalue    NUMBER(16,2),
  accpartval     NUMBER(16,2),
  agsbunitquota  NUMBER(16,2),
  master_account VARCHAR2(32)
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
comment on table BLSCDW.DWS_CLIENT_SAVING
  is 'finance公司吸收存款余额表';
comment on column BLSCDW.DWS_CLIENT_SAVING is vdate
  is '统计date';
comment on column BLSCDW.DWS_CLIENT_SAVING is atype
  is '存款类型S1-活期，S2-协定，S3-定期，S4-通知，S6-保证金';
comment on column BLSCDW.DWS_CLIENT_SAVING is memberno
  is 'clientcode';
comment on column BLSCDW.DWS_CLIENT_SAVING is account_no
  is '账号';
comment on column BLSCDW.DWS_CLIENT_SAVING is biz_code
  is '存单号';
comment on column BLSCDW.DWS_CLIENT_SAVING is currency
  is '币种';
comment on column BLSCDW.DWS_CLIENT_SAVING is pdc_type
  is '产品类型';
comment on column BLSCDW.DWS_CLIENT_SAVING is rate
  is '利率';
comment on column BLSCDW.DWS_CLIENT_SAVING is balance
  is '余额';
comment on column BLSCDW.DWS_CLIENT_SAVING is g21
  is '1(次日),2(2日至7日),3(8日至30日),4(31日至90日),5(91日至1年),6(1年至5年),7(5年至10年),8(10年以上)';
comment on column BLSCDW.DWS_CLIENT_SAVING is start_date
  is '开始date';
comment on column BLSCDW.DWS_CLIENT_SAVING is end_date
  is '到期date';
comment on column BLSCDW.DWS_CLIENT_SAVING is atype1
  is '存款产品明细类别S1-活期，S201-结算户存款，S202-协定户存款，S3-定期，S4-通知，S6-保证金';
comment on column BLSCDW.DWS_CLIENT_SAVING is maxaccount_no
  is '资金池总账户';
comment on column BLSCDW.DWS_CLIENT_SAVING is inflow
  is '日累计流入';
comment on column BLSCDW.DWS_CLIENT_SAVING is outflow
  is '日累计流出';
comment on column BLSCDW.DWS_CLIENT_SAVING is sbuno
  is '协定账号';
comment on column BLSCDW.DWS_CLIENT_SAVING is amassbalance
  is '协定余额';
comment on column BLSCDW.DWS_CLIENT_SAVING is amassrate
  is '协定利率';
comment on column BLSCDW.DWS_CLIENT_SAVING is scale
  is '规模';
comment on column BLSCDW.DWS_CLIENT_SAVING is accacmvalue
  is '活期部分积数';
comment on column BLSCDW.DWS_CLIENT_SAVING is sbuacmvalue
  is '协定部分积数';
comment on column BLSCDW.DWS_CLIENT_SAVING is accpartval
  is '活期部分余额';
comment on column BLSCDW.DWS_CLIENT_SAVING is agsbunitquota
  is '协定额度';
comment on column BLSCDW.DWS_CLIENT_SAVING is master_account
  is '总账户';
