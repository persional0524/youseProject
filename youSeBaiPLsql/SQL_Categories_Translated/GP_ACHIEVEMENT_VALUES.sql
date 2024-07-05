create table BLSCDW.GP_ACHIEVEMENT_VALUES
(
  id             VARCHAR2(36) not null,
  achievement_id VARCHAR2(36),
  uplimit        NUMBER(36,4),
  downlimit      NUMBER(36,4),
  enable_date    DATE,
  disable_date   DATE,
  flag           CHAR(1)
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
comment on table BLSCDW.GP_ACHIEVEMENT_VALUES
  is '管理indicator阀value';
comment on column BLSCDW.GP_ACHIEVEMENT_VALUES is id
  is 'ID';
comment on column BLSCDW.GP_ACHIEVEMENT_VALUES is achievement_id
  is '管理indicatorid';
comment on column BLSCDW.GP_ACHIEVEMENT_VALUES is uplimit
  is '考核上限';
comment on column BLSCDW.GP_ACHIEVEMENT_VALUES is downlimit
  is '考核下线';
comment on column BLSCDW.GP_ACHIEVEMENT_VALUES is enable_date
  is '启用date';
comment on column BLSCDW.GP_ACHIEVEMENT_VALUES is disable_date
  is '停用date';
comment on column BLSCDW.GP_ACHIEVEMENT_VALUES is flag
  is '表示启用/停用';
