
  CREATE TABLE "YSKY_SMS"."BCS_CLEAR_BANK_BRANCH" 
   (	"CLEAR_BANK_BRANCH_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"CLEAR_BANK_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"DEFAULT_FLAG" NUMERIC(*,0), 
	"BRANCH_NO" VARCHAR2(50), 
	 CONSTRAINT "PK_BCS_CLEAR_BANK_BRANCH" PRIMARY KEY ("CLEAR_BANK_BRANCH_ID")
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
