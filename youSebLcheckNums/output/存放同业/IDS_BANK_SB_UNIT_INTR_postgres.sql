
  CREATE TABLE "YSKY_SMS"."IDS_BANK_SB_UNIT_INTR" 
   (	"AIT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"SB_UNIT_ID" NUMERIC(*,0), 
	"OPEN_RATE" NUMERIC(12,6), 
	"INTR_CLASS" VARCHAR2(32), 
	"INTR_BASE_DAYS" NUMERIC(*,0), 
	"ROUNDING_UNIT_ID" NUMERIC(*,0), 
	 CONSTRAINT "PK_IDS_BANK_SB_UNIT_INTR" PRIMARY KEY ("AIT_ID")
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
