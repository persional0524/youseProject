create table BLSCDW.DWS_GDT_CONTRACT
(
  contract_id     VARCHAR2(32),
  cltno           VARCHAR2(32),
  contract_no     VARCHAR2(200),
  sheet_no        VARCHAR2(200),
  biz_type        VARCHAR2(16),
  biz_type_name   VARCHAR2(32),
  buss_class      VARCHAR2(16),
  buss_class_name VARCHAR2(32),
  amount          NUMBER(15,2),
  balance         NUMBER(15,2),
  contract_date   DATE,
  start_date      DATE,
  end_date        DATE,
  finish_date     DATE,
  finish_type     INTEGER,
  state           VARCHAR2(12),
  term_day        INTEGER,
  currency_no     VARCHAR2(8),
  bank_name       VARCHAR2(255),
  bank_code       VARCHAR2(16),
  ass_bankcode    VARCHAR2(32),
  ass_bankname    VARCHAR2(255),
  country_no      VARCHAR2(16),
  delegate_flag   INTEGER,
  circulate_flag  INTEGER,
  unified_flag    INTEGER,
  delegate_cltno  VARCHAR2(32),
  purpose_no      VARCHAR2(512),
  base_rate       NUMBER(10,6),
  flag            VARCHAR2(2),
  sjrq            DATE,
  rate            NUMBER(10,6)
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
comment on table BLSCDW.DWS_GDT_CONTRACT
  is '融资合同表';
comment on column BLSCDW.DWS_GDT_CONTRACT is contract_id
  is '合同ID';
comment on column BLSCDW.DWS_GDT_CONTRACT is cltno
  is 'client号';
comment on column BLSCDW.DWS_GDT_CONTRACT is contract_no
  is '合同号';
comment on column BLSCDW.DWS_GDT_CONTRACT is sheet_no
  is '借据号';
comment on column BLSCDW.DWS_GDT_CONTRACT is biz_type
  is '业务分类';
comment on column BLSCDW.DWS_GDT_CONTRACT is biz_type_name
  is '业务分类name';
comment on column BLSCDW.DWS_GDT_CONTRACT is buss_class
  is '业务品种';
comment on column BLSCDW.DWS_GDT_CONTRACT is buss_class_name
  is '业务品种name';
comment on column BLSCDW.DWS_GDT_CONTRACT is amount
  is '合同金额';
comment on column BLSCDW.DWS_GDT_CONTRACT is balance
  is '合同余额';
comment on column BLSCDW.DWS_GDT_CONTRACT is contract_date
  is '合同签约date';
comment on column BLSCDW.DWS_GDT_CONTRACT is start_date
  is '合同开始date';
comment on column BLSCDW.DWS_GDT_CONTRACT is end_date
  is '合同结束date';
comment on column BLSCDW.DWS_GDT_CONTRACT is finish_date
  is '合同实际结束date';
comment on column BLSCDW.DWS_GDT_CONTRACT is finish_type
  is '结项方式0-正常,1异常';
comment on column BLSCDW.DWS_GDT_CONTRACT is state
  is '合同状态';
comment on column BLSCDW.DWS_GDT_CONTRACT is term_day
  is '合同期限-天';
comment on column BLSCDW.DWS_GDT_CONTRACT is currency_no
  is '币种';
comment on column BLSCDW.DWS_GDT_CONTRACT is bank_name
  is '开户bankname';
comment on column BLSCDW.DWS_GDT_CONTRACT is bank_code
  is '开户bank代码';
comment on column BLSCDW.DWS_GDT_CONTRACT is ass_bankcode
  is '联行号';
comment on column BLSCDW.DWS_GDT_CONTRACT is ass_bankname
  is '合作金融网点';
comment on column BLSCDW.DWS_GDT_CONTRACT is country_no
  is '国家地区';
comment on column BLSCDW.DWS_GDT_CONTRACT is delegate_flag
  is '是否委托贷款0否1是';
comment on column BLSCDW.DWS_GDT_CONTRACT is circulate_flag
  is '是否循环贷款0否1是';
comment on column BLSCDW.DWS_GDT_CONTRACT is unified_flag
  is '是否统借贷款0否1是';
comment on column BLSCDW.DWS_GDT_CONTRACT is delegate_cltno
  is '委托单位client号';
comment on column BLSCDW.DWS_GDT_CONTRACT is purpose_no
  is '用途';
comment on column BLSCDW.DWS_GDT_CONTRACT is base_rate
  is '基准利率';
comment on column BLSCDW.DWS_GDT_CONTRACT is flag
  is '内外部标识:0-内、1-外';
comment on column BLSCDW.DWS_GDT_CONTRACT is sjrq
  is '数据date';
comment on column BLSCDW.DWS_GDT_CONTRACT is rate
  is '执行利率';
