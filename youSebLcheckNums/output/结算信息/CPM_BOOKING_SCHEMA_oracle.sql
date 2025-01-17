
  CREATE TABLE "YSKY_SMS"."CPM_BOOKING_SCHEMA" 
   (	"SCHEMA_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"TX_TYPE_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"SCHEMA_NAME" VARCHAR2(30), 
	"BOOKING_STEREO" VARCHAR2(32), 
	"SB_DIR_DB" NUMBER(*,0), 
	"SB_DIR_CR" NUMBER(*,0), 
	 CONSTRAINT "PK_CPM_BOOKING_SCHEMA" PRIMARY KEY ("SCHEMA_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_BOOK_REL_TXVCH_CPM_TX_T" FOREIGN KEY ("TX_TYPE_ID")
	  REFERENCES "YSKY_SMS"."CPM_TX_TYPE" ("TX_TYPE_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
