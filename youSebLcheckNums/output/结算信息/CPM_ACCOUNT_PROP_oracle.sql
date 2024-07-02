
  CREATE TABLE "YSKY_SMS"."CPM_ACCOUNT_PROP" 
   (	"AP_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"ACCOUNT_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"PROP_KEY" VARCHAR2(32) NOT NULL ENABLE, 
	"PROP_VALUE" VARCHAR2(256), 
	"PROP_TEXT" VARCHAR2(256), 
	 CONSTRAINT "PK_CPM_ACCOUNT_PROP" PRIMARY KEY ("AP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_ACCO_REL_PROP__CPM_BOOK" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_BOOK_UNIT" ("ACCOUNT_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
