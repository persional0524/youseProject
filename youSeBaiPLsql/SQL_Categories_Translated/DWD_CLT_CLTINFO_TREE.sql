create table BLSCDW.DWD_CLT_CLTINFO_TREE
(
  id           NUMBER(6) not null,
  cltno        VARCHAR2(30),
  treeno       VARCHAR2(24),
  chinesename  VARCHAR2(100),
  abbreviation VARCHAR2(100),
  parent_id    NUMBER(6),
  parent_no    VARCHAR2(30),
  secondary_id NUMBER(6)
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
