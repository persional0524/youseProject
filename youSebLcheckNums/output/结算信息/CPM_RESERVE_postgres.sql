
  CREATE TABLE "YSKY_SMS"."CPM_RESERVE" 
   (	"RVE_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TICKET_ID" NUMERIC(*,0), 
	"RVE_ACCOUNT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TX_ID" NUMERIC(*,0), 
	"RVE_AMOUNT" NUMERIC(16,2), 
	"RVE_ACTIVE_DATE" DATE, 
	"RVE_END_DATE" DATE, 
	"RVE_PURPOSE" VARCHAR2(100), 
	"RVE_BANK_NAME" VARCHAR2(80), 
	"RVE_BANK_NO" VARCHAR2(4), 
	"RVE_STATE" NUMERIC(*,0), 
	"RVE_SOURCE" NUMERIC(*,0), 
	"RVE_BANK_BR_ID" NUMERIC(*,0), 
	 CONSTRAINT "PK_CPM_RESERVE" PRIMARY KEY ("RVE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
