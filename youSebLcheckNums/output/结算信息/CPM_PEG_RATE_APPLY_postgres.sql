
  CREATE TABLE "YSKY_SMS"."CPM_PEG_RATE_APPLY" 
   (	"PEG_RATE_APPLY_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"PEG_RATE_CODE" VARCHAR2(32), 
	"PEG_RATE_ID" NUMERIC(*,0), 
	"RATE_VALUE" NUMERIC(12,6), 
	"EFT_DATE" DATE, 
	"SETTING_DATE" DATE, 
	"CURRENT_FLAG" NUMERIC(*,0), 
	"REMARK" VARCHAR2(255), 
	"PEG_RATE_APPLY_STATE" NUMERIC(*,0), 
	"INPUT_NAME" VARCHAR2(128), 
	"INPUT_TIME" DATE, 
	"OPERATE_TYPE" NUMERIC(*,0), 
	 CONSTRAINT "PK_CPM_PEG_RATE_APPLY" PRIMARY KEY ("PEG_RATE_APPLY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_PEG_RATE_APPLY_REL_TYPE" FOREIGN KEY ("PEG_RATE_CODE")
	  REFERENCES "YSKY_SMS"."CPM_PEG_RATE_TYPE" ("PEG_RATE_CODE") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
