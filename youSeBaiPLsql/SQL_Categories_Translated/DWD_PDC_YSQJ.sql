create table BLSCDW.DWD_PDC_YSQJ
(
  term_id      INTEGER,
  type_set_id  INTEGER,
  term_no      VARCHAR2(50),
  term_name    VARCHAR2(100),
  start_date   DATE,
  end_date     DATE,
  term_state   INTEGER,
  making_state INTEGER
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
comment on table BLSCDW.DWD_PDC_YSQJ
  is 'budget期间';
comment on column BLSCDW.DWD_PDC_YSQJ is term_id
  is 'budget期间ID';
comment on column BLSCDW.DWD_PDC_YSQJ is type_set_id
  is 'budget体系ID';
comment on column BLSCDW.DWD_PDC_YSQJ is term_no
  is 'budget期间code';
comment on column BLSCDW.DWD_PDC_YSQJ is term_name
  is 'budget期间name';
comment on column BLSCDW.DWD_PDC_YSQJ is start_date
  is 'budget期间开始时间';
comment on column BLSCDW.DWD_PDC_YSQJ is end_date
  is 'budget期间结束时间';
comment on column BLSCDW.DWD_PDC_YSQJ is term_state
  is '期间状态：启用、未启用';
comment on column BLSCDW.DWD_PDC_YSQJ is making_state
  is '上报状态：上报、追报、停报';
