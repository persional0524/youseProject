create table BLSCDW.DW_ETL_DEL_PARA
(
  v_table_name VARCHAR2(100),
  v_day        INTEGER,
  v_type       VARCHAR2(100),
  v_table_type INTEGER
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
comment on column BLSCDW.DW_ETL_DEL_PARA is v_table_name
  is 'DW表name';
comment on column BLSCDW.DW_ETL_DEL_PARA is v_day
  is 'delete减天数';
comment on column BLSCDW.DW_ETL_DEL_PARA is v_type
  is '类型1全局参数，2个性化参数';
comment on column BLSCDW.DW_ETL_DEL_PARA is v_table_type
  is '是否拉链表，1是，2否';
