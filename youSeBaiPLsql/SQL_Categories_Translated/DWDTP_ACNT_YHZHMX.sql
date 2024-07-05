create table BLSCDW.DWDTP_ACNT_YHZHMX
(
  accountid           INTEGER not null,
  cltno               VARCHAR2(32),
  branch_bank_no      VARCHAR2(64),
  bankno              VARCHAR2(6) not null,
  isabroad            VARCHAR2(2),
  regno               VARCHAR2(12),
  areaid              INTEGER,
  openaccountdate     DATE not null,
  accountno           VARCHAR2(32) not null,
  accountname         VARCHAR2(128) not null,
  currencyno          VARCHAR2(3),
  usage               VARCHAR2(100),
  ctype               VARCHAR2(64),
  vaildstartdate      DATE,
  vaildenddate        DATE,
  associateflag       VARCHAR2(2),
  acntstate           INTEGER,
  canceldate          DATE,
  available_balance   NUMBER(15,2),
  account_balance     NUMBER(15,2),
  out_flag            INTEGER not null,
  cash_manage_type    INTEGER,
  bank_account_nature INTEGER,
  account_type        VARCHAR2(128),
  account_type_name   VARCHAR2(128),
  account_rate        NUMBER(15,6),
  cs_account_flag     NUMBER(1),
  cleaning_state      INTEGER,
  cleaning_type       INTEGER
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
comment on column BLSCDW.DWDTP_ACNT_YHZHMX is cs_account_flag
  is '是否N9挂接账户：0否1是';
