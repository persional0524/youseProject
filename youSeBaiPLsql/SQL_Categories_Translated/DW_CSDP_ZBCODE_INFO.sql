create table BLSCDW.DW_CSDP_ZBCODE_INFO
(
  v_code       VARCHAR2(100),
  v_code_name  VARCHAR2(200),
  v_csdp_code  VARCHAR2(100),
  v_csdp_name  VARCHAR2(200),
  v_state      INTEGER,
  mapping_code VARCHAR2(100),
  v_zblx       INTEGER
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
comment on table BLSCDW.DW_CSDP_ZBCODE_INFO
  is 'finance公司大屏indicator信息';
comment on column BLSCDW.DW_CSDP_ZBCODE_INFO is v_code
  is 'indicatorcode';
comment on column BLSCDW.DW_CSDP_ZBCODE_INFO is v_code_name
  is 'indicatorname';
comment on column BLSCDW.DW_CSDP_ZBCODE_INFO is v_csdp_code
  is '大屏code';
comment on column BLSCDW.DW_CSDP_ZBCODE_INFO is v_csdp_name
  is '大屏name';
comment on column BLSCDW.DW_CSDP_ZBCODE_INFO is v_state
  is 'indicator状态1-正常，2-失效';
comment on column BLSCDW.DW_CSDP_ZBCODE_INFO is mapping_code
  is '映射code  gp_indicator_value';
comment on column BLSCDW.DW_CSDP_ZBCODE_INFO is v_zblx
  is 'indicator类型 1-监控indicator，2-检测indicator';
