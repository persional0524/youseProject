
  CREATE TABLE "YSKY_SMS"."BCS_TALLY_CHECK" 
   (	"TALLY_CHECK_ID" NUMERIC(6,0) NOT NULL ENABLE, 
	"BANK_CODE" VARCHAR2(4), 
	"TALLY_CHECK_NO" VARCHAR2(16), 
	"CREATE_TIME" DATE, 
	"BANK_ACC_NO" VARCHAR2(32), 
	"CHECK_ACC_NO" VARCHAR2(32), 
	"TALLY_CHECK_DATE" DATE, 
	"BANK_COMI_STATUS" NUMERIC(*,0), 
	"EXCH_SEQ" VARCHAR2(32), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"BRANCH_NO" VARCHAR2(6), 
	 CONSTRAINT "PK_BCS_TALLY_CHECK" PRIMARY KEY ("TALLY_CHECK_ID")
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
