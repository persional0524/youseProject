
  CREATE TABLE "YSKY_SMS"."FB_DISCOUNT_NOTES" 
   (	"NOTE_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"BID" NUMBER(*,0) NOT NULL ENABLE, 
	"NOTE_NO" VARCHAR2(64) NOT NULL ENABLE, 
	"PAR_VALUE" NUMBER(15,2) NOT NULL ENABLE, 
	"ISSUE_DATE" DATE NOT NULL ENABLE, 
	"MATURITY" DATE NOT NULL ENABLE, 
	"DAY_IN_WAY" NUMBER(*,0) NOT NULL ENABLE, 
	"INTREST" NUMBER(15,2) NOT NULL ENABLE, 
	"ISSUER_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"ISSUER" VARCHAR2(128) NOT NULL ENABLE, 
	"ISSUE_BANK" VARCHAR2(128) NOT NULL ENABLE, 
	"BILL_KIND" VARCHAR2(32), 
	"NOTE_STATE" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"CORRECT_DAYS" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"REDISCOUNT_DATE" DATE, 
	"ACCEPTOR" VARCHAR2(128), 
	"CASH_DATE" DATE, 
	"PAYINTREST" NUMBER(15,2), 
	"BUYINTREST" NUMBER(15,2), 
	"RETURN_INTREST" NUMBER(15,2), 
	"FACT_INTREST" NUMBER(15,2), 
	"NOTE_MODE" NUMBER(*,0), 
	"REDEEM_DATE" DATE, 
	"REDEEM_START_DATE" DATE, 
	"REDEEM_END_DATE" DATE, 
	"BMS_BILLID" NUMBER(*,0), 
	"SURETY" VARCHAR2(12), 
	"DISCOUNTOR_FACTOR" NUMBER(15,2), 
	"ISSUER_BANK_FACTOR" NUMBER(15,2), 
	"TAX_RATE" NUMBER(15,2), 
	"TAX_AMOUNT" NUMBER(15,2), 
	"EXCLUDE_TAX_AMOUNT" NUMBER(15,2), 
	 CONSTRAINT "PK_FB_DISCOUNT_NOTES" PRIMARY KEY ("NOTE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_FB_DISCO_RELATIONS_FB_CONTR" FOREIGN KEY ("BID")
	  REFERENCES "YSKY_SMS"."FB_CONTRACTS" ("BID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
