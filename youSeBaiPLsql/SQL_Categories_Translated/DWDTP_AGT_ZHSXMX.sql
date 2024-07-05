create table BLSCDW.DWDTP_AGT_ZHSXMX
(
  balance        NUMBER(20,2),
  biz_maxval     NUMBER(20,2),
  biz_type       VARCHAR2(10),
  credit_id      INTEGER,
  ctrl_method    VARCHAR2(2),
  detail_id      INTEGER not null,
  remark         VARCHAR2(500),
  status         VARCHAR2(2),
  sx_contract_no VARCHAR2(64),
  usedamount     NUMBER(20,2)
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
comment on table BLSCDW.DWDTP_AGT_ZHSXMX
  is '综合授信明细表';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is balance
  is '剩余额度';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is biz_maxval
  is '业务品种最高额度';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is biz_type
  is '业务品种code';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is credit_id
  is '授信唯一标识';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is ctrl_method
  is '控制方式：0 余额 1 发生额';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is detail_id
  is '主键ID';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is remark
  is '备注';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is status
  is '状态';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is sx_contract_no
  is '授信合同号';
comment on column BLSCDW.DWDTP_AGT_ZHSXMX is usedamount
  is '已占用额度';
