
  CREATE TABLE "YSKY_SMS"."CPM_AUTO_POWER_ON_AND_OFF_LOG" 
   (	"ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"EXEC_FLAG" NUMERIC(*,0) NOT NULL ENABLE, 
	"CUR_CODE" VARCHAR2(3) NOT NULL ENABLE, 
	"EXEC_STATE" NUMERIC(*,0) NOT NULL ENABLE, 
	"EXEC_DATE" DATE NOT NULL ENABLE, 
	"CREATE_TIME" DATE NOT NULL ENABLE, 
	"LASTUPDATE_TIME" DATE NOT NULL ENABLE, 
	"EXPLAIN" VARCHAR2(255), 
	 CONSTRAINT "PK_CPM_AUTOPOWER_LOG" PRIMARY KEY ("ID")
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
