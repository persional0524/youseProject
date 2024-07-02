
  CREATE TABLE "YSKY_SMS"."IDS_BANK_SB_UNIT" 
   (	"SB_UNIT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"ACCOUNT_NO" VARCHAR2(50), 
	"NAME" VARCHAR2(100), 
	"STATE" NUMERIC(*,0), 
	"OPEN_DATE" DATE, 
	"INIT_DATE" DATE, 
	"END_DATE" DATE, 
	"CLEAR_DATE" DATE, 
	"INTR_DAYS" NUMERIC(*,0), 
	"INIT_BALANCE" NUMERIC(16,2), 
	"ACCOUNT_TYPE_NO" VARCHAR2(50), 
	"CUR_CODE" VARCHAR2(8), 
	"REMARK" VARCHAR2(255), 
	"BIZ_ID" NUMERIC(*,0), 
	"BANK_ACCOUNT_ID" NUMERIC(*,0), 
	"IDSID" NUMERIC(*,0), 
	 CONSTRAINT "PK_IDS_BANK_SB_UNIT" PRIMARY KEY ("SB_UNIT_ID")
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
