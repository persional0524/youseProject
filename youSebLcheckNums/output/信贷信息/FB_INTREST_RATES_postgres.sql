
  CREATE TABLE "YSKY_SMS"."FB_INTREST_RATES" 
   (	"RATE_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"BID" NUMERIC(*,0) NOT NULL ENABLE, 
	"RATE_TYPE" VARCHAR2(4) NOT NULL ENABLE, 
	"EFT_DATE" DATE NOT NULL ENABLE, 
	"RATE" NUMERIC(10,6) NOT NULL ENABLE, 
	"RELATIVE_FLAG" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"LAST_FLAG" NUMERIC(*,0) NOT NULL ENABLE, 
	"FIRST_FLAG" NUMERIC(*,0) NOT NULL ENABLE, 
	"TYPESOFRATE" NUMERIC(*,0), 
	"OP_TIME" DATE, 
	"OP_NAME" VARCHAR2(100), 
	"REMARK" VARCHAR2(1024), 
	"RMS_FLAG" NUMERIC(10,6), 
	"RMS_METHOD" NUMERIC(*,0), 
	"RMS_VALUE" NUMERIC(10,6), 
	"RMS_RATE_ID" NUMERIC(*,0), 
	"RMS_TYPE" NUMERIC(*,0), 
	"LAST_VALUE" NUMERIC(10,6) DEFAULT 0, 
	 CONSTRAINT "PK_FB_INTREST_RATES" PRIMARY KEY ("RATE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
