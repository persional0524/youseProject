create table BLSCDW.DW_FXQ_BCS_TX
(
  txid                INTEGER,
  txtypecode          VARCHAR2(4),
  hosttypecodestr     VARCHAR2(42),
  clearbankname       VARCHAR2(32),
  txtypename          VARCHAR2(80),
  bankaccountid       INTEGER,
  txamount            NUMBER(16,2),
  purpose             VARCHAR2(100),
  balancedir          VARCHAR2(4),
  paybankname         VARCHAR2(80),
  paybankcode         VARCHAR2(4),
  payaccno            VARCHAR2(64),
  payaccname          VARCHAR2(80),
  payaccbankname      VARCHAR2(80),
  receivebankname     VARCHAR2(80),
  receivebankcode     VARCHAR2(4),
  receiveaccno        VARCHAR2(64),
  receiveaccname      VARCHAR2(128),
  receiveaccbankname  VARCHAR2(80),
  receiveaccbankcnaps VARCHAR2(16),
  sourceaccno         VARCHAR2(64),
  sourceaccname       VARCHAR2(128),
  curcode             VARCHAR2(6),
  exchseryear         VARCHAR2(16),
  tallydate           VARCHAR2(10),
  txdate              VARCHAR2(10),
  lastupdatetime      VARCHAR2(29),
  clearbankaccno      VARCHAR2(64),
  clearbankaccname    VARCHAR2(80),
  customerno          VARCHAR2(32),
  customername        VARCHAR2(80),
  txstatusstr         VARCHAR2(100),
  tallyflagstr        VARCHAR2(60),
  account_no          VARCHAR2(200)
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
comment on column BLSCDW.DW_FXQ_BCS_TX is txid
  is '交易id';
comment on column BLSCDW.DW_FXQ_BCS_TX is txtypecode
  is '交易code';
comment on column BLSCDW.DW_FXQ_BCS_TX is hosttypecodestr
  is '交易类型';
comment on column BLSCDW.DW_FXQ_BCS_TX is clearbankname
  is '付款行';
comment on column BLSCDW.DW_FXQ_BCS_TX is txtypename
  is '交易codename';
comment on column BLSCDW.DW_FXQ_BCS_TX is bankaccountid
  is '交易bank账号id';
comment on column BLSCDW.DW_FXQ_BCS_TX is txamount
  is '交易金额';
comment on column BLSCDW.DW_FXQ_BCS_TX is purpose
  is '备注';
comment on column BLSCDW.DW_FXQ_BCS_TX is balancedir
  is '借贷方向';
comment on column BLSCDW.DW_FXQ_BCS_TX is paybankname
  is '付方所属bankname';
comment on column BLSCDW.DW_FXQ_BCS_TX is paybankcode
  is '付方bankcode';
comment on column BLSCDW.DW_FXQ_BCS_TX is payaccno
  is '付方账号';
comment on column BLSCDW.DW_FXQ_BCS_TX is payaccname
  is '付方账户name';
comment on column BLSCDW.DW_FXQ_BCS_TX is payaccbankname
  is '付方开户行名';
comment on column BLSCDW.DW_FXQ_BCS_TX is receivebankname
  is '收方bank名';
comment on column BLSCDW.DW_FXQ_BCS_TX is receivebankcode
  is '收方bankcode';
comment on column BLSCDW.DW_FXQ_BCS_TX is receiveaccno
  is '收方账号';
comment on column BLSCDW.DW_FXQ_BCS_TX is receiveaccname
  is '收方户名';
comment on column BLSCDW.DW_FXQ_BCS_TX is receiveaccbankname
  is '收方开户行name';
comment on column BLSCDW.DW_FXQ_BCS_TX is receiveaccbankcnaps
  is '收方开户行CNAPS号';
comment on column BLSCDW.DW_FXQ_BCS_TX is curcode
  is '币种';
comment on column BLSCDW.DW_FXQ_BCS_TX is exchseryear
  is '年份';
comment on column BLSCDW.DW_FXQ_BCS_TX is tallydate
  is '提交date';
comment on column BLSCDW.DW_FXQ_BCS_TX is txdate
  is '交易date';
comment on column BLSCDW.DW_FXQ_BCS_TX is lastupdatetime
  is '最后更新时间';
comment on column BLSCDW.DW_FXQ_BCS_TX is account_no
  is '账号';
