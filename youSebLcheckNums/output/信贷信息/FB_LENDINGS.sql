
  CREATE TABLE "YSKY_SMS"."FB_LENDINGS" 
   (	"LENDING_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"BID" NUMBER(*,0) NOT NULL ENABLE, 
	"LENDING_INDEX" NUMBER(*,0) NOT NULL ENABLE, 
	"AMOUNT" NUMBER(15,2) NOT NULL ENABLE, 
	"START_DATE" DATE NOT NULL ENABLE, 
	"MATURITY" DATE NOT NULL ENABLE, 
	"STATE" NUMBER(*,0) NOT NULL ENABLE, 
	"APPLY_ID" NUMBER(*,0), 
	"FIVE_LEVEL" NUMBER(*,0), 
	"SHEET_NO" VARCHAR2(70), 
	"CREATOR" VARCHAR2(100), 
	"CREATE_TIME" DATE, 
	"REJECT_REASON" VARCHAR2(256), 
	"PAY_METHOD" NUMBER(38,0), 
	"OPP_BANK_NUMBER" VARCHAR2(256), 
	"OPP_ACCOUNT_NUMBER" VARCHAR2(80), 
	"OPP_ACCOUNT_NAME" VARCHAR2(256), 
	"INITIA_MATURITY" DATE, 
	 CONSTRAINT "PK_FB_LENDINGS" PRIMARY KEY ("LENDING_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_FB_LENDI_RELATIONS_FB_CONTR" FOREIGN KEY ("BID")
	  REFERENCES "YSKY_SMS"."FB_CONTRACTS" ("BID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
