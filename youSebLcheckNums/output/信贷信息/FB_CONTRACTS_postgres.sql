
  CREATE TABLE "YSKY_SMS"."FB_CONTRACTS" 
   (	"BID" NUMERIC(*,0) NOT NULL ENABLE, 
	"CONSIGNER" NUMERIC(*,0), 
	"BENEFICIARY" VARCHAR2(32), 
	"WARRANTEE" NUMERIC(*,0), 
	"BROKER" NUMERIC(*,0), 
	"MULTI_LENDING" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"REPAY_CHANNEL" VARCHAR2(2), 
	"IN_SUIT" NUMERIC(*,0) NOT NULL ENABLE, 
	"FIVE_LEVEL" NUMERIC(*,0), 
	"REPAY_CAPITAL" NUMERIC(*,0) NOT NULL ENABLE, 
	"INTREST_PERIOD" NUMERIC(*,0) NOT NULL ENABLE, 
	"PERIOD_BASE" NUMERIC(*,0) NOT NULL ENABLE, 
	"INTREST_DAY" NUMERIC(*,0), 
	"IS_FLOATING_RATE" NUMERIC(*,0) NOT NULL ENABLE, 
	"FLOATING_METHOD" VARCHAR2(1) DEFAULT '+', 
	"FLOATING_FREQ" NUMERIC(*,0), 
	"PERIOD_FREEDAY" VARCHAR2(4), 
	"ENTIRE_FREEDAY" VARCHAR2(4), 
	"OLD_CONTARCT_NO" VARCHAR2(32), 
	"CORRELATION_NUM1" VARCHAR2(32), 
	"CORRELATION_NUM2" VARCHAR2(32), 
	"DISCOUNT_MODE" NUMERIC(*,0), 
	"HANDLE_METHOD" NUMERIC(*,0), 
	"SURETY_RATE" NUMERIC(8,4), 
	"RECTIFY_RATE" NUMERIC(8,4), 
	"EX_RATE" NUMERIC(12,6), 
	"NOT_WITHHOLDING" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"CYC_LOAN" NUMERIC(*,0) DEFAULT (0) NOT NULL ENABLE, 
	"PAGENUM" NUMERIC(*,0), 
	"NORMRATEID" NUMERIC(*,0), 
	"NORMRATE_METHOD" NUMERIC(*,0), 
	"NORMRATE_FALG" NUMERIC(10,6), 
	"ISSPLIT" NUMERIC(*,0), 
	"FINANCETERM" NUMERIC(*,0), 
	"GROUPBANK" VARCHAR2(50), 
	"SELLMODE" NUMERIC(*,0) DEFAULT '0', 
	"SELF_SUPPORT" NUMERIC(*,0) DEFAULT (0), 
	"PERIOD_TYPE" VARCHAR2(32), 
	"FIX_PLAN" NUMERIC(*,0) DEFAULT (0), 
	"RMSRATETYPE" NUMERIC(*,0), 
	"BUYOUT" NUMERIC(*,0) DEFAULT (0), 
	"MAIN_CONTRACT_AMOUNT" NUMERIC(15,2), 
	"MAIN_CURRENCY" VARCHAR2(32), 
	"PROPORTION" NUMERIC(15,2), 
	"DESCRIPTION" VARCHAR2(2000), 
	"GUARANTEE_TYPE" NUMERIC(*,0), 
	"GUARANTEE_USE" VARCHAR2(2000), 
	"PAYMENT_TERM" VARCHAR2(2000), 
	"NORMRATE_RULE" NUMERIC(*,0), 
	"NORMRATE_RULE_MONTH" NUMERIC(*,0), 
	"NORMRATE_RULE_DAY" NUMERIC(*,0), 
	"SUPPLY_BANK_NAME" VARCHAR2(64), 
	"LOAN_TYPE" NUMERIC(*,0), 
	"LOAN_INVEST_DIRECTION" VARCHAR2(32), 
	"SURETY_TYPES" VARCHAR2(200), 
	"BILLNO" VARCHAR2(32), 
	"REPAYMENT_INT_UNIT" VARCHAR2(20), 
	"LENDING_INT_UNIT" VARCHAR2(20), 
	"PAYSOURCE" VARCHAR2(128), 
	"ACTIVE_DATE" DATE, 
	"DISCOUNT_OPENDATE" DATE, 
	"DISCOUNT_DUEDATE" DATE, 
	"BORROWEROPBANKNAME" VARCHAR2(80), 
	"BORROWEROPBANKNO" VARCHAR2(16), 
	"BORROWERACNTNO" VARCHAR2(64), 
	"RECOPBANKNAME" VARCHAR2(80), 
	"RECOPBANKNO" VARCHAR2(32), 
	"RECACNTNO" VARCHAR2(64), 
	"BNFTNAME" VARCHAR2(80), 
	"BILLTYPE" VARCHAR2(8), 
	"PAYRATETYPE" NUMERIC(*,0), 
	"RENT_MODEL" NUMERIC(*,0), 
	"PAYRATEPROPORTION" NUMERIC(6,2), 
	"PAYRATETOTAL" NUMERIC(15,2), 
	"BUYER_PAY" NUMERIC(*,0) DEFAULT 0, 
	"CONTRACTUSE" VARCHAR2(200), 
	"OP_SURETY_REMARK" VARCHAR2(1000), 
	"RISK_EXPOSURE" VARCHAR2(1000), 
	"OP_SURETY_TYPES" VARCHAR2(200), 
	"CONSIGN" NUMERIC(*,0), 
	"FROM_DBMS" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"ASTR_FLAG" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"FACTORING_TYPE" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"SUM_AMOUNT" NUMERIC(15,2), 
	"RATIO" NUMERIC(15,6), 
	"SURTY_AMOUNT" NUMERIC(15,2), 
	"DAMAGES_AMOUNT" NUMERIC(15,2), 
	"DRAW_INTREST_TYPE" NUMERIC(*,0), 
	"FACTORING_CLT_KIND" NUMERIC(*,0) DEFAULT 1, 
	"ISCHANGEBYFLOAT" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"BIZ_TYPE_FACTOR" NUMERIC(15,2), 
	"TERM_FACTOR" NUMERIC(15,2), 
	"APPLY_ID" NUMERIC(*,0), 
	"CONTROL_MODEL" NUMERIC(*,0), 
	"DUE_CONFIRM" VARCHAR2(1), 
	"GREENCREDIT" NUMERIC(*,0) DEFAULT 0, 
	"RATE_TYPE" VARCHAR2(10), 
	"FINANCIAL_SUPPORT" VARCHAR2(10), 
	"RESTRUCTURING_METHOD" VARCHAR2(10), 
	"SECUTITIZATION_CODE" VARCHAR2(200), 
	"RATE_TERM" VARCHAR2(30), 
	"PAY_METHOD" NUMERIC(38,0), 
	"OPP_BANK_NUMERIC" VARCHAR2(256), 
	"OPP_ACCOUNT_NUMERIC" VARCHAR2(80), 
	"OPP_ACCOUNT_NAME" VARCHAR2(256), 
	"IF_DOMESTIC" NUMERIC(38,0), 
	"TARGET_AREA" VARCHAR2(80), 
	"PROVINCE" VARCHAR2(6), 
	"CITY" VARCHAR2(6), 
	"DISTRICT" VARCHAR2(6), 
	"COUNTRY_ID" NUMERIC(38,0), 
	"CONTRACT_AWARDED" NUMERIC(15,2), 
	"LOAN_TYPE_NEW" VARCHAR2(10), 
	"PROJECT_NAME" VARCHAR2(80), 
	"PROJECT_TYPE" VARCHAR2(80), 
	"PROJECT_INVEST" NUMERIC(15,2), 
	"PROJECT_APPROVAL" VARCHAR2(80), 
	"PROJECT_LICENCE" VARCHAR2(80), 
	"CONSTRUCTION_LICENCE" VARCHAR2(80), 
	"ENV_LICENCE" VARCHAR2(80), 
	"BUILD_LICENCE" VARCHAR2(80), 
	"OTHER_LICENCE" VARCHAR2(80), 
	"BUILD_DATE" DATE, 
	"PROJECT_CAPITAL" NUMERIC(15,2), 
	"GROUP_NUM" NUMERIC(*,0), 
	"IS_CHENDUISHOUXIN" NUMERIC(*,0), 
	"IS_TIEXIANSHOUXIN" VARCHAR2(16), 
	"GROUP_NUM2" NUMERIC(*,0), 
	"USERS" VARCHAR2(128), 
	"MONEYS" VARCHAR2(128), 
	"GROUP_NUMS" VARCHAR2(128), 
	"TRADER_AMOUNTS" VARCHAR2(128), 
	"TRADER_IDS" VARCHAR2(128), 
	 CONSTRAINT "PK_FB_CONTRACTS" PRIMARY KEY ("BID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_CONTRACTS_REFERENCE_CODES" FOREIGN KEY ("BENEFICIARY")
	  REFERENCES "YSKY_SMS"."CODES" ("CODENO") ENABLE, 
	 CONSTRAINT "FK_FB_CONTR_INHERITAN_FB_BUSIN" FOREIGN KEY ("BID")
	  REFERENCES "YSKY_SMS"."FB_BUSINESS" ("BID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
