create table BLSCDW.DWD_BNS_YHZHJYMX
(
  record_id            INTEGER not null,
  accountid            INTEGER,
  bp_id                INTEGER,
  accountcode          VARCHAR2(32),
  record_date          DATE not null,
  bankno               VARCHAR2(64) not null,
  accountno            VARCHAR2(32) not null,
  account_inner_number VARCHAR2(32),
  account_inner_name   VARCHAR2(100),
  balance_dir          INTEGER not null,
  amount               NUMBER(15,2) not null,
  balance              NUMBER(15,2),
  currency_code        VARCHAR2(3),
  op_account_no        VARCHAR2(200),
  op_account_name      VARCHAR2(200),
  op_branch_name       VARCHAR2(100),
  summary              VARCHAR2(1736),
  remark               VARCHAR2(512),
  post_script          VARCHAR2(512),
  ticket_type          VARCHAR2(64),
  ticket_number        VARCHAR2(64),
  host_time            DATE,
  recerived_time       DATE,
  trans_type           VARCHAR2(40),
  data_type            VARCHAR2(2),
  create_time          DATE default sysdate,
  cfb_memberno         VARCHAR2(36),
  cfb_kmcode           VARCHAR2(36),
  budget_code          VARCHAR2(64),
  day_record_id        INTEGER,
  refill_result        INTEGER default 0,
  service_charge       NUMBER(15,2),
  is_sheet             INTEGER,
  voucher_id           VARCHAR2(500),
  filter_flag          INTEGER,
  filter_type          VARCHAR2(10),
  voucher_type         VARCHAR2(100),
  op_record_id         INTEGER,
  frmcod               VARCHAR2(500),
  dgdslx               INTEGER
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
comment on table BLSCDW.DWD_BNS_YHZHJYMX
  is '账户明细记录表';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is record_id
  is '明细记录ID';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is accountid
  is '账户流水号';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is bp_id
  is '银企互联系统明细唯一标识字段';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is accountcode
  is '账户代码';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is record_date
  is '明细date';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is bankno
  is '本方bankcode-大行';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is accountno
  is '本方账号';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is account_inner_number
  is '本方内部账号';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is account_inner_name
  is '本方内部户名';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is balance_dir
  is '收支方向 1：支出;
comment on column BLSCDW.DWD_BNS_YHZHJYMX is amount
  is '金额';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is balance
  is '余额';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is currency_code
  is '币种';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is op_account_no
  is '对方账号';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is op_account_name
  is '对方户名';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is op_branch_name
  is '对方开户行名';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is summary
  is '摘要';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is remark
  is '备注';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is post_script
  is '附言';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is ticket_type
  is '单据类型';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is ticket_number
  is '单据code';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is host_time
  is 'bank记账时间';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is recerived_time
  is '记录收到时间';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is trans_type
  is '交易类型';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is data_type
  is '数据源类型，01：BP通知;
comment on column BLSCDW.DWD_BNS_YHZHJYMX is create_time
  is 'created时间';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is cfb_memberno
  is 'budget单元code';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is cfb_kmcode
  is 'budget科目code';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is budget_code
  is 'budget号';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is day_record_id
  is '账户明细顺序(按天排序)';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is refill_result
  is '补填结果0未补填1已补填';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is service_charge
  is '服务费';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is is_sheet
  is '是否做账 0未做账 1已做账 2已冲账';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is voucher_id
  is '凭证id(一个明细对应多个做账记录,用逗号拼接)';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is filter_flag
  is '过滤flag(0未处理 1无需过滤 2已过滤)';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is filter_type
  is '过滤类型(取过滤规则表中规则code)';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is voucher_type
  is '凭证类型(取过滤规则表中凭证分类)';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is op_record_id
  is '同户名划转对应明细ID';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is frmcod
  is '备用字段3';
comment on column BLSCDW.DWD_BNS_YHZHJYMX is dgdslx
  is '0-对公，1-对私';
