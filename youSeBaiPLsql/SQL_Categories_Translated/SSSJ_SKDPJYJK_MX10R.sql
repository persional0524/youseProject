create table BLSCDW.SSSJ_SKDPJYJK_MX10R
(
  cltno           VARCHAR2(100),
  accountname     VARCHAR2(300),
  op_account_name VARCHAR2(300),
  count_          INTEGER,
  amount          NUMBER(16,2)
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
comment on table BLSCDW.SSSJ_SKDPJYJK_MX10R
  is '实时数据-司库大屏交易监控-10日交易数据';
