create table BLSCDW.DWS_NEWBILL_INFO
(
  sjrq                 VARCHAR2(10),
  billid               INTEGER,
  rmbillamount         NUMBER,
  billno               VARCHAR2(32),
  splitflag            INTEGER,
  createtime           TIMESTAMP(6),
  lastupdatetime       TIMESTAMP(6),
  cdsource             VARCHAR2(30),
  billkind             VARCHAR2(24),
  billtype             VARCHAR2(24),
  issuedate            DATE,
  duedate              DATE,
  drawername           VARCHAR2(128),
  draweraccounttype    VARCHAR2(24),
  draweraccountname    VARCHAR2(300),
  draweraccount        VARCHAR2(64),
  drawerbankid         VARCHAR2(9),
  drawerbankname       VARCHAR2(300),
  drawerbankno         VARCHAR2(15),
  drawersoccode        VARCHAR2(20),
  payeename            VARCHAR2(300),
  payeeaccounttype     VARCHAR2(24),
  payeeaccount         VARCHAR2(64),
  payeeaccountname     VARCHAR2(300),
  payeebankid          VARCHAR2(9),
  payeebankname        VARCHAR2(300),
  payeebankno          VARCHAR2(15),
  payeesoccode         VARCHAR2(20),
  acceptorname         VARCHAR2(300),
  acceptoraccounttype  VARCHAR2(24),
  acceptoraccount      VARCHAR2(64),
  acceptoraccountname  VARCHAR2(300),
  acceptorbankid       VARCHAR2(9),
  acceptorbankname     VARCHAR2(300),
  acceptorbankno       VARCHAR2(15),
  acceptorsoccode      VARCHAR2(20),
  margin_amt           NUMBER,
  pledger_amt          NUMBER,
  creidt_amt           NUMBER,
  warrant_amt          NUMBER,
  billchildid          INTEGER,
  cdrange              VARCHAR2(30),
  amount               NUMBER(24,2),
  state                VARCHAR2(18),
  status               VARCHAR2(48),
  transflag            VARCHAR2(48),
  bbsstate             VARCHAR2(24),
  accept_contract_no   VARCHAR2(128),
  discount_contract_no VARCHAR2(128),
  typename             VARCHAR2(17),
  currentholdername    VARCHAR2(300),
  currentholderno      VARCHAR2(18),
  acceptdate           DATE
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
