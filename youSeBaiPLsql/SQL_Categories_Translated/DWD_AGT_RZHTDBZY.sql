create table BLSCDW.DWD_AGT_RZHTDBZY
(
  occupy_id           INTEGER not null,
  contract_id         INTEGER,
  guarantee_id        INTEGER,
  guarantee_no        VARCHAR2(64),
  contract_no         VARCHAR2(64),
  use_amount          NUMBER(18,2),
  pledge_id           INTEGER,
  pledge_no           VARCHAR2(64),
  pledge_type         VARCHAR2(16),
  pledge_eval         NUMBER(18,2),
  guarantee_balance   NUMBER(18,2),
  guarantee_amount    NUMBER(18,2),
  guarantee_type      VARCHAR2(16),
  guarantee_type_name VARCHAR2(32),
  currency_no         VARCHAR2(6),
  proportion          NUMBER(6,2),
  guarantee_reg_id    INTEGER,
  guarantee_apply_id  INTEGER,
  start_date          DATE,
  end_date            DATE,
  initial_use_amount  NUMBER(18,2),
  initial_gdt_amount  NUMBER(18,2),
  biz_no              VARCHAR2(255),
  gdt_rate            NUMBER(15,4),
  gdt_amount          NUMBER(18,2),
  guarantee_nature    INTEGER,
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
comment on table BLSCDW.DWD_AGT_RZHTDBZY
  is '担保占用表';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is occupy_id
  is '担保占用ID';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_id
  is '担保合同ID';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_no
  is '担保合同code';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is contract_no
  is '融资合同code';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is use_amount
  is '占用金额';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is pledge_id
  is '抵质押物ID';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is pledge_no
  is '抵质押物code';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is pledge_type
  is '抵质押类型';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is pledge_eval
  is '抵质押价value';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_balance
  is '担保合同余额(该余额只用于合同详情页面显示，修改，修正须查询实时余额)';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_amount
  is '担保合同金额';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_type
  is '担保方式：G01，保证金担保;
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_type_name
  is '担保方式name';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is currency_no
  is '币种';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is proportion
  is '担保责任比例';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_reg_id
  is '担保登记id';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_apply_id
  is '担保申请id';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is start_date
  is '担保开始date';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is end_date
  is '担保到期date';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is initial_use_amount
  is '初始占用金额';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is initial_gdt_amount
  is '占用金额(融资币种)';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is biz_no
  is '占用业务code';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is gdt_rate
  is '汇率';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is gdt_amount
  is '占用金额(融资币种)';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is guarantee_nature
  is '担保性质 1,一般担保,2,最高额担保';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_AGT_RZHTDBZY is ht_e_dt
  is '拉链结束date';
