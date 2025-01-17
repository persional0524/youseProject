
  CREATE TABLE "YSKY_SMS"."CPM_TX_ATTACHMENT" 
   (	"TA_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TX_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"ATC_INDEX" NUMERIC(*,0) NOT NULL ENABLE, 
	"ATC_TITLE" VARCHAR2(80) NOT NULL ENABLE, 
	"ATC_COMMENT" VARCHAR2(256) NOT NULL ENABLE, 
	"ATC_SOURCE_CODE" VARCHAR2(32), 
	"ATC_CLASS" VARCHAR2(32), 
	"ATTA_DISP_TEXT" CLOB, 
	"OBJ_CONTENT" BLOB, 
	 CONSTRAINT "PK_CPM_TX_ATTACHMENT" PRIMARY KEY ("TA_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_TX_A_REL_ATTA__CPM_TX" FOREIGN KEY ("TX_ID")
	  REFERENCES "YSKY_SMS"."CPM_TX" ("TX_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("ATTA_DISP_TEXT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("OBJ_CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
