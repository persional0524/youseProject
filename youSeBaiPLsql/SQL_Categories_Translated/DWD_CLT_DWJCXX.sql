create table BLSCDW.DWD_CLT_DWJCXX
(
  bank_account                VARCHAR2(64),
  is_domestic                 INTEGER,
  address                     VARCHAR2(500),
  registered_address          VARCHAR2(500),
  business_scope              VARCHAR2(2000),
  cltname                     VARCHAR2(300),
  city                        VARCHAR2(64),
  cltno                       VARCHAR2(64) not null,
  cltstate                    VARCHAR2(64),
  nstype                      VARCHAR2(64),
  country                     VARCHAR2(64),
  social_credit_code          VARCHAR2(100),
  registered_capital_currency VARCHAR2(6),
  approval_date               DATE,
  admin_division              VARCHAR2(64),
  business_due_date           DATE,
  customer_scale              VARCHAR2(64),
  financial_contact           VARCHAR2(64),
  ht_e_dt                     DATE,
  ht_s_dt                     DATE,
  type_name                   VARCHAR2(64),
  legalidtype                 VARCHAR2(64),
  legalper                    VARCHAR2(64),
  certificate_number          VARCHAR2(64),
  license_number              VARCHAR2(50),
  listing_status              VARCHAR2(6),
  english_name                VARCHAR2(150),
  bank_no                     VARCHAR2(64),
  organization_category       VARCHAR2(64),
  orgcode                     VARCHAR2(18),
  linkman_phone               VARCHAR2(100),
  province                    VARCHAR2(64),
  registered_capital          NUMBER(16,2),
  registration_type           VARCHAR2(64),
  parentno                    VARCHAR2(64),
  forshort                    VARCHAR2(500),
  secondary_id                VARCHAR2(64),
  treeno                      VARCHAR2(32),
  secondary_id_ht             VARCHAR2(64)
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
comment on table BLSCDW.DWD_CLT_DWJCXX
  is '单位表';
comment on column BLSCDW.DWD_CLT_DWJCXX is bank_account
  is '账号';
comment on column BLSCDW.DWD_CLT_DWJCXX is is_domestic
  is '境内外';
comment on column BLSCDW.DWD_CLT_DWJCXX is address
  is '通讯地址';
comment on column BLSCDW.DWD_CLT_DWJCXX is registered_address
  is '注册登记地址';
comment on column BLSCDW.DWD_CLT_DWJCXX is business_scope
  is '经营范围';
comment on column BLSCDW.DWD_CLT_DWJCXX is cltname
  is 'client中文name ';
comment on column BLSCDW.DWD_CLT_DWJCXX is city
  is '市';
comment on column BLSCDW.DWD_CLT_DWJCXX is cltno
  is '单位code';
comment on column BLSCDW.DWD_CLT_DWJCXX is cltstate
  is '单位状态';
comment on column BLSCDW.DWD_CLT_DWJCXX is nstype
  is 'client类型';
comment on column BLSCDW.DWD_CLT_DWJCXX is country
  is '国家代码';
comment on column BLSCDW.DWD_CLT_DWJCXX is social_credit_code
  is '统一社会信用代码';
comment on column BLSCDW.DWD_CLT_DWJCXX is registered_capital_currency
  is '注册资本币种';
comment on column BLSCDW.DWD_CLT_DWJCXX is approval_date
  is '成立时间';
comment on column BLSCDW.DWD_CLT_DWJCXX is admin_division
  is '区';
comment on column BLSCDW.DWD_CLT_DWJCXX is business_due_date
  is '营业许可证到期日';
comment on column BLSCDW.DWD_CLT_DWJCXX is customer_scale
  is '企业规模';
comment on column BLSCDW.DWD_CLT_DWJCXX is financial_contact
  is 'finance联系方式';
comment on column BLSCDW.DWD_CLT_DWJCXX is ht_e_dt
  is '拉链结束date';
comment on column BLSCDW.DWD_CLT_DWJCXX is ht_s_dt
  is '拉链开始date';
comment on column BLSCDW.DWD_CLT_DWJCXX is type_name
  is '行业分类';
comment on column BLSCDW.DWD_CLT_DWJCXX is legalidtype
  is '法人代表证件类型';
comment on column BLSCDW.DWD_CLT_DWJCXX is legalper
  is '法定代表人(公司负责人';
comment on column BLSCDW.DWD_CLT_DWJCXX is certificate_number
  is '法定代表人(公司负责人)证件号';
comment on column BLSCDW.DWD_CLT_DWJCXX is license_number
  is '金融许可证代码';
comment on column BLSCDW.DWD_CLT_DWJCXX is listing_status
  is '是否上市';
comment on column BLSCDW.DWD_CLT_DWJCXX is english_name
  is 'client英文name';
comment on column BLSCDW.DWD_CLT_DWJCXX is bank_no
  is '基本账户开户行';
comment on column BLSCDW.DWD_CLT_DWJCXX is organization_category
  is '组织机构类型';
comment on column BLSCDW.DWD_CLT_DWJCXX is orgcode
  is '组织机构代码';
comment on column BLSCDW.DWD_CLT_DWJCXX is linkman_phone
  is '联系电话';
comment on column BLSCDW.DWD_CLT_DWJCXX is province
  is '省';
comment on column BLSCDW.DWD_CLT_DWJCXX is registered_capital
  is '注册资金';
comment on column BLSCDW.DWD_CLT_DWJCXX is registration_type
  is '登记注册类型';
comment on column BLSCDW.DWD_CLT_DWJCXX is parentno
  is '父级dtNO';
comment on column BLSCDW.DWD_CLT_DWJCXX is forshort
  is '简称';
comment on column BLSCDW.DWD_CLT_DWJCXX is secondary_id
  is '二级单位代码';
comment on column BLSCDW.DWD_CLT_DWJCXX is secondary_id_ht
  is '二级单位代码(按合并口径)';
