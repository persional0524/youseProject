
  CREATE TABLE "YSKY_SMS"."CLT_INFO_FIELD" 
   (	"FIELD_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"FIELD_NAME" VARCHAR2(64) NOT NULL ENABLE, 
	"FIELD_TYPE" VARCHAR2(16) NOT NULL ENABLE, 
	"MAX_LENGTH" NUMERIC(*,0) NOT NULL ENABLE, 
	"CAN_EMPTY" NUMERIC(*,0) NOT NULL ENABLE, 
	"KEY_INFO" NUMERIC(*,0) NOT NULL ENABLE, 
	"SHOW_ORDER" NUMERIC(*,0) NOT NULL ENABLE, 
	"VALUE_SOURCE" VARCHAR2(256), 
	"TAB_CODE" VARCHAR2(16) NOT NULL ENABLE, 
	"TAB_FIELD" VARCHAR2(32) NOT NULL ENABLE, 
	"PERMISSION" VARCHAR2(32), 
	 CONSTRAINT "PK_CLT_INFO_FIELD" PRIMARY KEY ("FIELD_ID")
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
