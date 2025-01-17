
  CREATE TABLE "YSKY_SMS"."BCS_CLEAR_BANK" 
   (	"CLEAR_BANK_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"BANK_CODE" VARCHAR2(4), 
	"CLEAR_BANK_NO" VARCHAR2(8) NOT NULL ENABLE, 
	"CLEAR_BANK_NAME" VARCHAR2(32), 
	"SIGN_STATUS" NUMERIC(*,0), 
	"DEFAULT_FLAG" NUMERIC(*,0), 
	"DEFAULT_QUOTA" NUMERIC(16,2), 
	"AGENCYPAY" NUMERIC(*,0), 
	 CONSTRAINT "PK_BCS_CLEAR_BANK" PRIMARY KEY ("CLEAR_BANK_ID")
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
