
  CREATE TABLE "YSKY_SMS"."IDS_FILE" 
   (	"FILE_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"FILE_TYPE_NO" VARCHAR2(32), 
	"FILE_NAME" VARCHAR2(250), 
	"FILE_DIR" VARCHAR2(250), 
	"INPUT_TIME" DATE, 
	"REL_ID" NUMBER(*,0), 
	 CONSTRAINT "PK_IDS_FILE" PRIMARY KEY ("FILE_ID")
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
