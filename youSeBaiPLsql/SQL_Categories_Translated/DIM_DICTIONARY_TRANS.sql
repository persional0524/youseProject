create table BLSCDW.DIM_DICTIONARY_TRANS
(
  trans_id       INTEGER,
  type_id        VARCHAR2(50),
  type_name      VARCHAR2(200),
  new_code       VARCHAR2(100),
  new_code_name  VARCHAR2(200),
  old_code       VARCHAR2(100),
  old_code_name  VARCHAR2(200),
  effective_flag INTEGER default 0,
  create_time    DATE default SYSDATE,
  create_user    VARCHAR2(50),
  update_time    DATE
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
comment on column BLSCDW.DIM_DICTIONARY_TRANS is effective_flag
  is '是否有效 0 有效，1无效';
