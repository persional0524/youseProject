
  CREATE TABLE "YSKY_SMS"."CPM_BATCH_TASK_RESULT" 
   (	"ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"USER_ID" VARCHAR2(32), 
	"USER_NAME" VARCHAR2(30), 
	"EXEC_TIME" TIMESTAMP (6), 
	"MSG" VARCHAR2(512), 
	"IS_SUCCESS" NUMERIC(*,0), 
	"BIZ_TYPE" NUMERIC(*,0), 
	"TASK_CODE" VARCHAR2(50), 
	"BRANCH_NO" VARCHAR2(32), 
	"CUR_CODE" VARCHAR2(32), 
	"WORKDAY" DATE, 
	 CONSTRAINT "CPM_BATCH_TASK_RESULT" PRIMARY KEY ("ID")
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
