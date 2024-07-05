create table BLSCDW.DWD_FNCE_YR
(
  yr        INTEGER not null,
  startflag INTEGER default 0 not null,
  startdate DATE not null,
  closetag  INTEGER default 0 not null,
  turnflag  INTEGER not null
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
comment on table BLSCDW.DWD_FNCE_YR
  is '会计年度';
comment on column BLSCDW.DWD_FNCE_YR is yr
  is '年度';
comment on column BLSCDW.DWD_FNCE_YR is startflag
  is '启用标记 1启用;
comment on column BLSCDW.DWD_FNCE_YR is startdate
  is '启用date';
comment on column BLSCDW.DWD_FNCE_YR is closetag
  is '年度结帐标记';
comment on column BLSCDW.DWD_FNCE_YR is turnflag
  is '年度结转标记';
