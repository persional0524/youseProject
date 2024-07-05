create table BLSCDW.DIM_DATE_TABLE
(
  id                    NUMBER,
  fdate                 DATE,
  year_quarter          VARCHAR2(7),
  year_month            VARCHAR2(7),
  year_day              VARCHAR2(8),
  year_month_day        VARCHAR2(10),
  year                  NUMBER,
  quarter_of_year       NUMBER,
  month_of_year         NUMBER,
  month_of_quarter      NUMBER,
  week_of_year          NUMBER,
  week_of_quarter       NUMBER,
  week_of_month         NUMBER,
  day_of_year           NUMBER,
  day_of_quarter        NUMBER,
  day_of_month          NUMBER,
  day_of_week           NUMBER,
  week                  VARCHAR2(9),
  is_f_quarter_of_year  NUMBER,
  is_l_quarter_of_year  NUMBER,
  is_f_month_of_year    NUMBER,
  is_l_month_of_year    NUMBER,
  is_f_month_of_quarter NUMBER,
  is_l_month_of_quarter NUMBER,
  is_f_week_of_year     NUMBER,
  is_l_week_of_year     NUMBER,
  is_f_week_of_quarter  NUMBER,
  is_l_week_of_quarter  NUMBER,
  is_f_week_of_month    NUMBER,
  is_l_week_of_month    NUMBER,
  is_f_day_of_year      NUMBER,
  is_l_day_of_year      NUMBER,
  is_f_day_of_quarter   NUMBER,
  is_l_day_of_quarter   NUMBER,
  is_f_day_of_month     NUMBER,
  is_l_day_of_month     NUMBER,
  is_f_day_of_week      NUMBER,
  is_l_day_of_week      NUMBER,
  is_leap               NUMBER
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
comment on column BLSCDW.DIM_DATE_TABLE is id
  is 'ID';
comment on column BLSCDW.DIM_DATE_TABLE is fdate
  is 'date';
comment on column BLSCDW.DIM_DATE_TABLE is year_quarter
  is '年季度';
comment on column BLSCDW.DIM_DATE_TABLE is year_month
  is '年月';
comment on column BLSCDW.DIM_DATE_TABLE is year_day
  is '年天';
comment on column BLSCDW.DIM_DATE_TABLE is year_month_day
  is '年月日';
comment on column BLSCDW.DIM_DATE_TABLE is year
  is '年份';
comment on column BLSCDW.DIM_DATE_TABLE is quarter_of_year
  is '当年季度';
comment on column BLSCDW.DIM_DATE_TABLE is month_of_year
  is '当年月份';
comment on column BLSCDW.DIM_DATE_TABLE is month_of_quarter
  is '当季度月份';
comment on column BLSCDW.DIM_DATE_TABLE is week_of_year
  is '当年周';
comment on column BLSCDW.DIM_DATE_TABLE is week_of_quarter
  is '当季度周';
comment on column BLSCDW.DIM_DATE_TABLE is week_of_month
  is '当月周';
comment on column BLSCDW.DIM_DATE_TABLE is day_of_year
  is '当年天';
comment on column BLSCDW.DIM_DATE_TABLE is day_of_quarter
  is '当季度天';
comment on column BLSCDW.DIM_DATE_TABLE is day_of_month
  is '当月天';
comment on column BLSCDW.DIM_DATE_TABLE is day_of_week
  is '当周天';
comment on column BLSCDW.DIM_DATE_TABLE is week
  is '星期';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_quarter_of_year
  is '是否当年第一季度';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_quarter_of_year
  is '是否当年最后一季度';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_month_of_year
  is '是否当年第一月';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_month_of_year
  is '是否当年最后一月';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_month_of_quarter
  is '是否当季第一月';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_month_of_quarter
  is '是否当季最后一月';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_week_of_year
  is '是否当年第一周';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_week_of_year
  is '是否当年最后一周';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_week_of_quarter
  is '是否当季第一周';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_week_of_quarter
  is '是否当季最后一周';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_week_of_month
  is '是否当月第一周';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_week_of_month
  is '是否当月最后一周';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_day_of_year
  is '是否当年第一天';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_day_of_year
  is '是否当年最后一天';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_day_of_quarter
  is '是否当季第一天';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_day_of_quarter
  is '是否当季最后一天';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_day_of_month
  is '是否当月第一天';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_day_of_month
  is '是否当月最后一天';
comment on column BLSCDW.DIM_DATE_TABLE is is_f_day_of_week
  is '是否当周第一天';
comment on column BLSCDW.DIM_DATE_TABLE is is_l_day_of_week
  is '是否当周最后一天';
comment on column BLSCDW.DIM_DATE_TABLE is is_leap
  is '是否闰年';
