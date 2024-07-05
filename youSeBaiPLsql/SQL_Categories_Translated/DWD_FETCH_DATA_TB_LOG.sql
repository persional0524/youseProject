create table BLSCDW.DWD_FETCH_DATA_TB_LOG
(
  table_name VARCHAR2(100),
  sjrq       VARCHAR2(10),
  start_date DATE,
  end_date   DATE,
  run_flag   VARCHAR2(2000)
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
comment on table BLSCDW.DWD_FETCH_DATA_TB_LOG
  is 'DWD拉链执行记录表';
