
  CREATE TABLE "YSKY_SMS"."CPM_BOOKING_ITEM" 
   (	"BOOKING_ITEM_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"SCHEMA_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TX_ELEMENT" VARCHAR2(32) NOT NULL ENABLE, 
	"EXPRESSION" VARCHAR2(256), 
	 CONSTRAINT "PK_CPM_BOOKING_ITEM" PRIMARY KEY ("BOOKING_ITEM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_BOOK_REL_PROP__CPM_BOOK" FOREIGN KEY ("SCHEMA_ID")
	  REFERENCES "YSKY_SMS"."CPM_BOOKING_SCHEMA" ("SCHEMA_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
