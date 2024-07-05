create table BLSCDW.DWD_FNCE_AKMAVG
(
  curr_code  VARCHAR2(3),
  nrjckye    NUMBER(20,2),
  nrjdkye    NUMBER(20,2),
  nrjtxtxje  NUMBER(20,2),
  subject_no VARCHAR2(30),
  yrjckye    NUMBER(20,2),
  yrjdkye    NUMBER(20,2),
  yrjtxtxje  NUMBER(20,2),
  vdate      DATE
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
comment on table BLSCDW.DWD_FNCE_AKMAVG
  is '科目平均数';
comment on column BLSCDW.DWD_FNCE_AKMAVG is curr_code
  is '币种';
comment on column BLSCDW.DWD_FNCE_AKMAVG is nrjckye
  is '年日均存款余额';
comment on column BLSCDW.DWD_FNCE_AKMAVG is nrjdkye
  is '年日均贷款余额';
comment on column BLSCDW.DWD_FNCE_AKMAVG is nrjtxtxje
  is '年日均摊销贴现金额';
comment on column BLSCDW.DWD_FNCE_AKMAVG is subject_no
  is '科目号';
comment on column BLSCDW.DWD_FNCE_AKMAVG is yrjckye
  is '月日均存款余额';
comment on column BLSCDW.DWD_FNCE_AKMAVG is yrjdkye
  is '月日均贷款余额';
comment on column BLSCDW.DWD_FNCE_AKMAVG is yrjtxtxje
  is '月日均摊销贴现金额';
comment on column BLSCDW.DWD_FNCE_AKMAVG is vdate
  is '统计date';
