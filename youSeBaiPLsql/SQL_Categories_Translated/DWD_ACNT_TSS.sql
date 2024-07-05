create table BLSCDW.DWD_ACNT_TSS
(
  account_id          INTEGER not null,
  branch_no           VARCHAR2(32),
  cur_no              VARCHAR2(8) not null,
  acnt_type_no        VARCHAR2(32) not null,
  account_no          VARCHAR2(128) not null,
  account_name        VARCHAR2(256) not null,
  unit_no             VARCHAR2(32) not null,
  unit_name           VARCHAR2(120),
  subject_no          VARCHAR2(32) not null,
  account_state       INTEGER not null,
  bal_dir             INTEGER,
  open_date           DATE not null,
  maturity_date       DATE,
  close_date          DATE,
  limit_type          INTEGER,
  limit_amount        NUMBER(18,2),
  balance             NUMBER(18,2) default 0 not null,
  remark              VARCHAR2(2048),
  check_num           VARCHAR2(64),
  create_time         DATE not null,
  last_chg_time       DATE,
  calcintr            INTEGER,
  freezedate          DATE,
  frozen_amount       NUMBER(18,2),
  is_overdraft        INTEGER,
  overdraft_amount    NUMBER(18,2),
  account_used_amount NUMBER(18,2),
  ht_s_dt             DATE,
  ht_e_dt             DATE
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
comment on table BLSCDW.DWD_ACNT_TSS
  is '结算账户';
comment on column BLSCDW.DWD_ACNT_TSS is account_id
  is '账户ID';
comment on column BLSCDW.DWD_ACNT_TSS is branch_no
  is '分支机构code';
comment on column BLSCDW.DWD_ACNT_TSS is cur_no
  is '币种代码';
comment on column BLSCDW.DWD_ACNT_TSS is acnt_type_no
  is '账户分类code(ZHLX01:定期账户,ZHLX02:通知账户,ZHLX03:应付账户,ZHLX04:应收账户,ZHLX05:协定账户,ZHLX06:活期账户等,取value数据dictionary)';
comment on column BLSCDW.DWD_ACNT_TSS is account_no
  is '账号';
comment on column BLSCDW.DWD_ACNT_TSS is account_name
  is '户名';
comment on column BLSCDW.DWD_ACNT_TSS is unit_no
  is '开户单位code';
comment on column BLSCDW.DWD_ACNT_TSS is unit_name
  is '开户单位name';
comment on column BLSCDW.DWD_ACNT_TSS is subject_no
  is '会计科目号';
comment on column BLSCDW.DWD_ACNT_TSS is account_state
  is '账户状态;
comment on column BLSCDW.DWD_ACNT_TSS is bal_dir
  is '余额方向 1表示借，2表示贷';
comment on column BLSCDW.DWD_ACNT_TSS is open_date
  is '开户date';
comment on column BLSCDW.DWD_ACNT_TSS is maturity_date
  is '到期date';
comment on column BLSCDW.DWD_ACNT_TSS is close_date
  is '清户date';
comment on column BLSCDW.DWD_ACNT_TSS is limit_type
  is '限额方式(1:限余额)';
comment on column BLSCDW.DWD_ACNT_TSS is limit_amount
  is '限额';
comment on column BLSCDW.DWD_ACNT_TSS is balance
  is '当前余额';
comment on column BLSCDW.DWD_ACNT_TSS is remark
  is '备注';
comment on column BLSCDW.DWD_ACNT_TSS is check_num
  is '数据校验码';
comment on column BLSCDW.DWD_ACNT_TSS is create_time
  is '记录created时间';
comment on column BLSCDW.DWD_ACNT_TSS is last_chg_time
  is '末次修改时间';
comment on column BLSCDW.DWD_ACNT_TSS is calcintr
  is '是否利息计算 0:否，1:是，如果是，则动态显示cntintrkm表内容';
comment on column BLSCDW.DWD_ACNT_TSS is freezedate
  is '冻结date';
comment on column BLSCDW.DWD_ACNT_TSS is frozen_amount
  is '冻结金额';
comment on column BLSCDW.DWD_ACNT_TSS is is_overdraft
  is '是否透支 0不透支;
comment on column BLSCDW.DWD_ACNT_TSS is overdraft_amount
  is '透支金额';
comment on column BLSCDW.DWD_ACNT_TSS is account_used_amount
  is '在途金额';
