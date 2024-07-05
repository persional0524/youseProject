create table BLSCDW.DWD_LOG
(
  describe    VARCHAR2(500),
  create_time DATE
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
comment on table BLSCDW.DWD_LOG
  is '日志表';
comment on column BLSCDW.DWD_LOG is describe
  is '描述';
comment on column BLSCDW.DWD_LOG is create_time
  is 'created时间';
