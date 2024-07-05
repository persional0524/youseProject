create table BLSCDW.DWD_ACNT_CMS_NEW
(
  account_id     INTEGER not null,
  group_id       INTEGER,
  account_type   INTEGER,
  account_no     VARCHAR2(50),
  account_name   VARCHAR2(80),
  cur_code       VARCHAR2(3),
  cust_no        VARCHAR2(50),
  cust_name      VARCHAR2(80),
  par_account_id INTEGER,
  if_leaf        INTEGER,
  acc_level      INTEGER,
  max_amount     NUMBER(16,2),
  min_amount     NUMBER(16,2),
  unit_amount    NUMBER(16,2),
  min_exc_amount NUMBER(16,2),
  up_order       INTEGER,
  fixd_amount    NUMBER(16,2),
  check_method   INTEGER,
  fixd_rate      NUMBER(16,2),
  ht_s_dt        DATE,
  ht_e_dt        DATE
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
comment on table BLSCDW.DWD_ACNT_CMS_NEW
  is '现金管理账户';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is account_id
  is '账户ID';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is group_id
  is '账户组ID';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is account_type
  is '账户类型';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is account_no
  is '账号';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is account_name
  is '账户名';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is cur_code
  is '币种';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is cust_no
  is '所属clientcode';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is cust_name
  is '所属clientname';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is par_account_id
  is '上级账户';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is if_leaf
  is '是否叶子节点';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is acc_level
  is '层级';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is max_amount
  is '留存上限';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is min_amount
  is '留存下限';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is unit_amount
  is '取整金额';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is min_exc_amount
  is '最小执行金额';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is up_order
  is '上收次序';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is fixd_amount
  is '金额设定value';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is check_method
  is '核算方法';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_ACNT_CMS_NEW is ht_e_dt
  is '拉链结束date';
