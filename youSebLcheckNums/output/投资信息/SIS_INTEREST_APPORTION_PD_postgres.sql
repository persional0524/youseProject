
  CREATE TABLE "YSKY_SMS"."SIS_INTEREST_APPORTION_PD" 
   (	"APID" NUMERIC(*,0) NOT NULL ENABLE, 
	"FLOW_NO" VARCHAR2(20) NOT NULL ENABLE, 
	"APPORTION_PERIOD" VARCHAR2(10), 
	"APPORTION_DATE" DATE, 
	"BEGIN_APPORTION_COST" NUMERIC(20,2), 
	"ACTUAL_INTEREST" NUMERIC(20,2), 
	"FUND" NUMERIC(20,2), 
	"END_APPORTION_COST" NUMERIC(20,2), 
	"CUR_APPORTION_COST" NUMERIC(20,2), 
	"APPORTION_BALANCE" NUMERIC(20,2), 
	"ACTUAL_RATE" NUMERIC(10,2), 
	"IS_ADJUST" VARCHAR2(2), 
	"CREATE_TIME" DATE, 
	"STATUS" VARCHAR2(2), 
	"TXID" NUMERIC(*,0), 
	"BIZ_CASE_ID" NUMERIC(*,0), 
	"REJECT_MSG" VARCHAR2(256), 
	"ADJ_STARTDATE" DATE, 
	"ADJ_ENDDATE" DATE, 
	"ACT_STATUS" VARCHAR2(2), 
	"ACT_RESULT" VARCHAR2(1000), 
	 CONSTRAINT "PK_SIS_INTEREST_APPORTION_PD" PRIMARY KEY ("APID")
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
