create table BLSCDW.DWD_ACNT_YHZHMX
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
  ht_s_dt             DATE,
  ht_e_dt             DATE,
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
comment on table BLSCDW.DWD_ACNT_YHZHMX
  is 'bank账户明细';
comment on column BLSCDW.DWD_ACNT_YHZHMX is accountid
  is '账户id';
comment on column BLSCDW.DWD_ACNT_YHZHMX is cltno
  is '单位code';
comment on column BLSCDW.DWD_ACNT_YHZHMX is branch_bank_no
  is '合作金融网点code(支行号)';
comment on column BLSCDW.DWD_ACNT_YHZHMX is bankno
  is '所属金融机构';
comment on column BLSCDW.DWD_ACNT_YHZHMX is isabroad
  is '境内外 1：境内;
comment on column BLSCDW.DWD_ACNT_YHZHMX is regno
  is '地区编码';
comment on column BLSCDW.DWD_ACNT_YHZHMX is areaid
  is 'region编码';
comment on column BLSCDW.DWD_ACNT_YHZHMX is openaccountdate
  is '开户date';
comment on column BLSCDW.DWD_ACNT_YHZHMX is accountno
  is '账号';
comment on column BLSCDW.DWD_ACNT_YHZHMX is accountname
  is '户名';
comment on column BLSCDW.DWD_ACNT_YHZHMX is currencyno
  is '币种';
comment on column BLSCDW.DWD_ACNT_YHZHMX is usage
  is '账户用途';
comment on column BLSCDW.DWD_ACNT_YHZHMX is ctype
  is '账户性质';
comment on column BLSCDW.DWD_ACNT_YHZHMX is vaildstartdate
  is '有效date开始';
comment on column BLSCDW.DWD_ACNT_YHZHMX is vaildenddate
  is '有效date结束';
comment on column BLSCDW.DWD_ACNT_YHZHMX is associateflag
  is '联网方式 0：非直连;
comment on column BLSCDW.DWD_ACNT_YHZHMX is acntstate
  is '账户状态 0：正常;
comment on column BLSCDW.DWD_ACNT_YHZHMX is canceldate
  is '销户date';
comment on column BLSCDW.DWD_ACNT_YHZHMX is available_balance
  is '可用余额';
comment on column BLSCDW.DWD_ACNT_YHZHMX is account_balance
  is '账户余额';
comment on column BLSCDW.DWD_ACNT_YHZHMX is out_flag
  is '外部flag';
comment on column BLSCDW.DWD_ACNT_YHZHMX is cash_manage_type
  is '1:二级户2:三级户3:普通户4:联动户5:代理行账户6:虚拟户7:头寸户8:investment户9:代理investment户10:国内资金主账户11:国际资金主账户12:保证金账户13:多币种账户';
comment on column BLSCDW.DWD_ACNT_YHZHMX is bank_account_nature
  is 'bank账户性质';
comment on column BLSCDW.DWD_ACNT_YHZHMX is account_type
  is '账户类型';
comment on column BLSCDW.DWD_ACNT_YHZHMX is account_type_name
  is '账户类型name';
comment on column BLSCDW.DWD_ACNT_YHZHMX is ht_s_dt
  is '开始date';
comment on column BLSCDW.DWD_ACNT_YHZHMX is ht_e_dt
  is '到期date';
comment on column BLSCDW.DWD_ACNT_YHZHMX is account_rate
  is '账户利率';
comment on column BLSCDW.DWD_ACNT_YHZHMX is cs_account_flag
  is '是否N9挂接账户：0否1是';
comment on column BLSCDW.DWD_ACNT_YHZHMX is cleaning_state
  is '清理状态';
comment on column BLSCDW.DWD_ACNT_YHZHMX is cleaning_type
  is '清理账户类型';
