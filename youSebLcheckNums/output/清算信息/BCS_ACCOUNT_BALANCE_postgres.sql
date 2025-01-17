
  CREATE TABLE "YSKY_SMS"."BCS_ACCOUNT_BALANCE" 
   (	"BALANCE_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"BANK_ACCOUNT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"ACCOUNT_DATE" DATE NOT NULL ENABLE, 
	"ACCOUNT_BALANCE" NUMERIC(16,2), 
	"CANUSE_BALANCE" NUMERIC(16,2), 
	"UPDATE_TIME" DATE, 
	"YESTERDAY_BALANCE" NUMERIC(16,2), 
	 CONSTRAINT "PK_BCS_ACCOUNT_BALANCE" PRIMARY KEY ("BALANCE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "UK_BCS_ACCOUNT_BALANCE" UNIQUE ("BANK_ACCOUNT_ID", "ACCOUNT_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_BCS_ACCO_REL_BALAN_BCS_BANK" FOREIGN KEY ("BANK_ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."BCS_BANK_ACCOUNT" ("BANK_ACCOUNT_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
