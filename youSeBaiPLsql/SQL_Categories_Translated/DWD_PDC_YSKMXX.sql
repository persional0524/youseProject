create table BLSCDW.DWD_PDC_YSKMXX
(
  budget_account_code    VARCHAR2(32),
  budget_account_name    VARCHAR2(80),
  budget_account_tree_no VARCHAR2(256),
  budget_account_type    INTEGER,
  report_way             VARCHAR2(8),
  create_time            DATE,
  enabled                INTEGER,
  pay_flag               INTEGER,
  relate_term_start_code VARCHAR2(32),
  ht_s_dt                DATE,
  ht_e_dt                DATE
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
comment on table BLSCDW.DWD_PDC_YSKMXX
  is 'budget科目信息';
comment on column BLSCDW.DWD_PDC_YSKMXX is budget_account_code
  is 'budget科目号';
comment on column BLSCDW.DWD_PDC_YSKMXX is budget_account_name
  is 'budget科目name';
comment on column BLSCDW.DWD_PDC_YSKMXX is budget_account_tree_no
  is '科目层级code';
comment on column BLSCDW.DWD_PDC_YSKMXX is budget_account_type
  is '科目类型';
comment on column BLSCDW.DWD_PDC_YSKMXX is report_way
  is '填报方式';
comment on column BLSCDW.DWD_PDC_YSKMXX is create_time
  is 'created时间';
comment on column BLSCDW.DWD_PDC_YSKMXX is enabled
  is '是否启用';
comment on column BLSCDW.DWD_PDC_YSKMXX is pay_flag
  is '是否支付控制';
comment on column BLSCDW.DWD_PDC_YSKMXX is relate_term_start_code
  is '关联期初科目';
comment on column BLSCDW.DWD_PDC_YSKMXX is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_PDC_YSKMXX is ht_e_dt
  is '拉链结束date';
