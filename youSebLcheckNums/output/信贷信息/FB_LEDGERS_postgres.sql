
  CREATE TABLE "YSKY_SMS"."FB_LEDGERS" 
   (	"LEDGER_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"BID" NUMERIC(*,0) NOT NULL ENABLE, 
	"LENDING_ID" NUMERIC(*,0), 
	"LEDGER_TYPE" VARCHAR2(4) NOT NULL ENABLE, 
	"ACT_DATE" DATE NOT NULL ENABLE, 
	"INTR_DATE" DATE NOT NULL ENABLE, 
	"DIR_FLAG" CHAR(1) DEFAULT '+' NOT NULL ENABLE, 
	"AMOUNT" NUMERIC(15,2) NOT NULL ENABLE, 
	"REPAY_ID" NUMERIC(*,0), 
	"TALLY_FLAG" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"TALLY_ID" NUMERIC(*,0), 
	"ERROR_MSG" VARCHAR2(1024), 
	"CREATE_TIME" DATE NOT NULL ENABLE, 
	"LAST_UPDATE_TIME" DATE, 
	"FREE" NUMERIC(*,0), 
	"SHEET_DATE" DATE, 
	"SOURCE_ID" NUMERIC(*,0), 
	 CONSTRAINT "CKC_DIR_FLAG_FB_LEDGE" CHECK (Dir_Flag in ('+','-')) ENABLE, 
	 CONSTRAINT "PK_FB_LEDGERS" PRIMARY KEY ("LEDGER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_FB_LEDGERS_01" FOREIGN KEY ("LENDING_ID")
	  REFERENCES "YSKY_SMS"."FB_LENDINGS" ("LENDING_ID") ENABLE, 
	 CONSTRAINT "FK_FB_LEDGE_RELATIONS_FB_REPAY" FOREIGN KEY ("REPAY_ID")
	  REFERENCES "YSKY_SMS"."FB_REPAYMENTS" ("REPAY_ID") ENABLE, 
	 CONSTRAINT "FK_FB_LEDGE_REFERENCE_FB_CONTR" FOREIGN KEY ("BID")
	  REFERENCES "YSKY_SMS"."FB_CONTRACTS" ("BID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
