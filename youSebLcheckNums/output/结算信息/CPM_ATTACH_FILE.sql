
  CREATE TABLE "YSKY_SMS"."CPM_ATTACH_FILE" 
   (	"FILE_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"BUSI_ID" NUMBER(*,0), 
	"FILE_NAME" VARCHAR2(256), 
	"NEW_NAME" VARCHAR2(32), 
	"FILE_TYPE" VARCHAR2(32), 
	"UPLOAD_TIME" DATE, 
	 CONSTRAINT "PK_CPM_ATTACH_FILE" PRIMARY KEY ("FILE_ID")
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
