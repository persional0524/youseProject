create table BLSCDW.SSSJ_SKDPJYJK_MXYUE
(
  cltno       VARCHAR2(100),
  amount      NUMBER(16,2),
  balance_dir INTEGER,
  bs          INTEGER,
  sjrq        DATE
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
comment on table BLSCDW.SSSJ_SKDPJYJK_MXYUE
  is '实时数据，司库大屏交易监控-月交易数据';
