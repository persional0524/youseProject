
  CREATE TABLE "YSKY_SMS"."CPM_BATCHING_TRACK" 
   (	"BATCH_TRACK_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TASK_CODE" VARCHAR2(10) NOT NULL ENABLE, 
	"BLG_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"FINISH_DATE" DATE NOT NULL ENABLE, 
	 CONSTRAINT "PK_CPM_BATCHING_TRACK" PRIMARY KEY ("BATCH_TRACK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_BATC_RELATIONS_CPM_BATC" FOREIGN KEY ("BLG_ID")
	  REFERENCES "YSKY_SMS"."CPM_BATCHING_TASK_LOG" ("BLG_ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
