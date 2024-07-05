create table BLSCDW.DWDTP_CLT_INFO
(
  acnt_no               VARCHAR2(32),
  admin_division        VARCHAR2(10),
  area                  NUMBER,
  bcommadd              VARCHAR2(80),
  borr_nature           NUMBER,
  business_no           VARCHAR2(64),
  buss_addr             VARCHAR2(1000),
  buss_scope            VARCHAR2(2000),
  chinese_name          VARCHAR2(100),
  city                  VARCHAR2(50),
  cltno                 VARCHAR2(30) not null,
  cltstate              NUMBER,
  clt_info_type         NUMBER,
  controller            VARCHAR2(50),
  controller_id         VARCHAR2(50),
  controller_type       VARCHAR2(50),
  country_code          VARCHAR2(3),
  credit_code           VARCHAR2(20),
  cur_code              VARCHAR2(8),
  customs_registid      VARCHAR2(20),
  customs_relation      VARCHAR2(10),
  data_source           VARCHAR2(10),
  dayofestb             DATE,
  declaration_method    VARCHAR2(10),
  district              VARCHAR2(50),
  economic_sector       VARCHAR2(32),
  employees_num         NUMBER,
  end_date              DATE,
  enterprise_scale      NUMBER,
  financial_contact     VARCHAR2(50),
  finan_type            NUMBER,
  industry              VARCHAR2(20),
  is_special_economic   VARCHAR2(10),
  legalidtype           VARCHAR2(4),
  legalper              VARCHAR2(50),
  legalperid            VARCHAR2(18),
  lei_code              VARCHAR2(30),
  license_code          VARCHAR2(30),
  listed_flag           NUMBER,
  name                  VARCHAR2(100),
  nature                NUMBER,
  nccsbz                VARCHAR2(6),
  operat_income         NUMBER(20,2),
  op_bank               VARCHAR2(80),
  orgtype               VARCHAR2(20),
  org_code              VARCHAR2(30),
  org_code_enddate      DATE,
  paidin_capital        NUMBER(20,2),
  phone                 VARCHAR2(60),
  province              VARCHAR2(50),
  qykglx                VARCHAR2(4),
  regcapital            NUMBER(16,2),
  regcode               VARCHAR2(20),
  related_party         NUMBER,
  safe_email            VARCHAR2(128),
  special_economic_type VARCHAR2(10),
  special_org_code      VARCHAR2(64),
  total_assets          NUMBER(20,2)
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
comment on table BLSCDW.DWDTP_CLT_INFO
  is '单位信息表';
comment on column BLSCDW.DWDTP_CLT_INFO is acnt_no
  is '账号';
comment on column BLSCDW.DWDTP_CLT_INFO is admin_division
  is '行政区划';
comment on column BLSCDW.DWDTP_CLT_INFO is area
  is '境内外：1-境内，2-境外';
comment on column BLSCDW.DWDTP_CLT_INFO is bcommadd
  is '通讯地址';
comment on column BLSCDW.DWDTP_CLT_INFO is borr_nature
  is '借款人性质：1-企业法人，2-企业非法人，3-个体工商户，4-事业单位，5-广义政府，6-金融机构，7-企业及各类组织，8-境外，99-其他';
comment on column BLSCDW.DWDTP_CLT_INFO is business_no
  is '外汇局批件号';
comment on column BLSCDW.DWDTP_CLT_INFO is buss_addr
  is '注册登记地址';
comment on column BLSCDW.DWDTP_CLT_INFO is buss_scope
  is '经营范围';
comment on column BLSCDW.DWDTP_CLT_INFO is chinese_name
  is 'client中文name';
comment on column BLSCDW.DWDTP_CLT_INFO is city
  is '市';
comment on column BLSCDW.DWDTP_CLT_INFO is cltno
  is 'clientcode';
comment on column BLSCDW.DWDTP_CLT_INFO is cltstate
  is '单位状态：0-正常，1-注销，2-停用，3-关停，98-其他，99-未知';
comment on column BLSCDW.DWDTP_CLT_INFO is clt_info_type
  is 'client类型：0-finance公司，1-成员单位，3-合作伙伴，4-集团公司，5-结算中心，6-分支机构，8-金融机构，99-其他';
comment on column BLSCDW.DWDTP_CLT_INFO is controller
  is '实际控制人';
comment on column BLSCDW.DWDTP_CLT_INFO is controller_id
  is '实际控制人证件号';
comment on column BLSCDW.DWDTP_CLT_INFO is controller_type
  is '实际控制人证件类型';
comment on column BLSCDW.DWDTP_CLT_INFO is country_code
  is '国家代码';
comment on column BLSCDW.DWDTP_CLT_INFO is credit_code
  is '统一社会信用代码';
comment on column BLSCDW.DWDTP_CLT_INFO is cur_code
  is '注册资本币种';
comment on column BLSCDW.DWDTP_CLT_INFO is customs_registid
  is '海关注册号';
comment on column BLSCDW.DWDTP_CLT_INFO is customs_relation
  is 'client关系';
comment on column BLSCDW.DWDTP_CLT_INFO is dayofestb
  is '成立时间';
comment on column BLSCDW.DWDTP_CLT_INFO is declaration_method
  is '申报方式';
comment on column BLSCDW.DWDTP_CLT_INFO is district
  is '区';
comment on column BLSCDW.DWDTP_CLT_INFO is economic_sector
  is '国民经济部门';
comment on column BLSCDW.DWDTP_CLT_INFO is employees_num
  is '从业人数';
comment on column BLSCDW.DWDTP_CLT_INFO is end_date
  is '营业执照到期date';
comment on column BLSCDW.DWDTP_CLT_INFO is enterprise_scale
  is '企业规模：0-大型企业，1-中型企业，2-小型企业，3-微型企业，98-其他，99-未知';
comment on column BLSCDW.DWDTP_CLT_INFO is financial_contact
  is 'finance联系方式';
comment on column BLSCDW.DWDTP_CLT_INFO is finan_type
  is '经济类型:100-内资,110-国有全资,120-集体全资,130-股份合作,140-联营,150-有限责任公司,160-股份有限公司,170-私有
  190-其他内资,200-港澳台investment,210-内地和港澳台investment,220-内地和港澳台合作,230-港澳台独资,240-港澳台investment股份有限公司,290-其他港澳台investment,300-国外investment,310-中外合资,320-中外合作,330-外资,340-国外investment股份有限公司
  390-其他国外investment,900-其他';
comment on column BLSCDW.DWDTP_CLT_INFO is industry
  is '行业分类';
comment on column BLSCDW.DWDTP_CLT_INFO is is_special_economic
  is '是否特殊经济区内企业';
comment on column BLSCDW.DWDTP_CLT_INFO is legalidtype
  is '法人代表证件类型：0-身份证，1-户口簿，2-护照，X-其他证件，3-军官证，4-士兵证，5-港澳居民来往内地通行证，6-台湾同胞来往内地通行证
时身份证，8-外国人居留证，9-警官证，A-香港身份证，B-澳门身份证，C-台湾身份证,X-其他证件';
comment on column BLSCDW.DWDTP_CLT_INFO is legalper
  is '法定代表人(公司负责人)';
comment on column BLSCDW.DWDTP_CLT_INFO is legalperid
  is '法定代表人(公司负责人)证件号';
comment on column BLSCDW.DWDTP_CLT_INFO is lei_code
  is '全球法人识别编码';
comment on column BLSCDW.DWDTP_CLT_INFO is license_code
  is '金融许可证代码';
comment on column BLSCDW.DWDTP_CLT_INFO is listed_flag
  is '是否上市 1-上市， 2-非上市';
comment on column BLSCDW.DWDTP_CLT_INFO is name
  is 'client英文name';
comment on column BLSCDW.DWDTP_CLT_INFO is nature
  is '性质：1-中央bank，2-政策性bank，3-金融资产管理公司，4-商业bank，5-证券公司，6-公用事业企业，7-普通企业，8-自然人';
comment on column BLSCDW.DWDTP_CLT_INFO is nccsbz
  is '农村城市flag';
comment on column BLSCDW.DWDTP_CLT_INFO is operat_income
  is '营业收入';
comment on column BLSCDW.DWDTP_CLT_INFO is op_bank
  is '基本账户开户行';
comment on column BLSCDW.DWDTP_CLT_INFO is orgtype
  is '组织结构类别:1-企业,2-事业单位,3-机关,4-社会团体,7-个体工商户,9-其他';
comment on column BLSCDW.DWDTP_CLT_INFO is org_code
  is '组织机构代码';
comment on column BLSCDW.DWDTP_CLT_INFO is org_code_enddate
  is '统一社会信用代码(组织机构代码)到期date';
comment on column BLSCDW.DWDTP_CLT_INFO is paidin_capital
  is '实收资本';
comment on column BLSCDW.DWDTP_CLT_INFO is phone
  is '联系电话';
comment on column BLSCDW.DWDTP_CLT_INFO is province
  is '省';
comment on column BLSCDW.DWDTP_CLT_INFO is qykglx
  is '企业控股类型';
comment on column BLSCDW.DWDTP_CLT_INFO is regcapital
  is '注册资金';
comment on column BLSCDW.DWDTP_CLT_INFO is regcode
  is '登记注册类型：100-内资企业，110-国有企业，120-集体企业，130-股份合作企业，140-股份合作企业，150-有限责任公司
160-股份有限公司，170-私营企业';
comment on column BLSCDW.DWDTP_CLT_INFO is related_party
  is '是否关联方';
comment on column BLSCDW.DWDTP_CLT_INFO is safe_email
  is '外汇局联系用EMail';
comment on column BLSCDW.DWDTP_CLT_INFO is special_economic_type
  is '特殊经济区内企业类型';
comment on column BLSCDW.DWDTP_CLT_INFO is special_org_code
  is '特殊机构代码';
comment on column BLSCDW.DWDTP_CLT_INFO is total_assets
  is '总资产';
