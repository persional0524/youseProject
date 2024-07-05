create table BLSCDW.DWD_AGT_MERGER_LOAN_ADD
(
  contract_id          VARCHAR2(128),
  loan_id              VARCHAR2(128),
  merger_amount        NUMBER(15,2),
  merger_opponent_name VARCHAR2(120),
  merger_opponent_num  VARCHAR2(18),
  ht_s_dt              DATE,
  ht_e_dt              DATE
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
comment on table BLSCDW.DWD_AGT_MERGER_LOAN_ADD
  is '并购贷款补充信息表';
comment on column BLSCDW.DWD_AGT_MERGER_LOAN_ADD is contract_id
  is '合同ID';
comment on column BLSCDW.DWD_AGT_MERGER_LOAN_ADD is loan_id
  is '借据id';
comment on column BLSCDW.DWD_AGT_MERGER_LOAN_ADD is merger_amount
  is '并购交易总金额';
comment on column BLSCDW.DWD_AGT_MERGER_LOAN_ADD is merger_opponent_name
  is '并购交易对手name';
comment on column BLSCDW.DWD_AGT_MERGER_LOAN_ADD is merger_opponent_num
  is '并购交易对手代码';
comment on column BLSCDW.DWD_AGT_MERGER_LOAN_ADD is ht_s_dt
  is '拉链开始日';
comment on column BLSCDW.DWD_AGT_MERGER_LOAN_ADD is ht_e_dt
  is '拉链结束日';
