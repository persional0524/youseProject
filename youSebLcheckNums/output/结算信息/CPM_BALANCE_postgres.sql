
  CREATE TABLE "YSKY_SMS"."CPM_BALANCE" 
   (	"BR_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"ACCOUNT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"BOOK_DATE" DATE NOT NULL ENABLE, 
	"BOOK_BALANCE" NUMERIC(16,2) NOT NULL ENABLE, 
	"AVAILABLE_BALANCE" NUMERIC(16,2), 
	"LAST_NIGHT_BALANCE" NUMERIC(16,2), 
	"ACM_BALANCE" NUMERIC(16,2), 
	"FREEZED" NUMERIC(16,2), 
	"BALANCE_VERSION" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_CPM_BALANCE" PRIMARY KEY ("BR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_CPM_BALA_REL_BALAN_CPM_BOOK" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_BOOK_UNIT" ("ACCOUNT_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
