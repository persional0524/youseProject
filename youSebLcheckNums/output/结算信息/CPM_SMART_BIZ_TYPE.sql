
  CREATE TABLE "YSKY_SMS"."CPM_SMART_BIZ_TYPE" 
   (	"SMART_BTY_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"BTY_CODE" VARCHAR2(30), 
	"BTY_NAME" VARCHAR2(30), 
	"TYPE_FLAG" NUMBER(*,0), 
	"ALL_CUST_USE_FLAG" NUMBER(*,0), 
	"INIT_MONEY" NUMBER(16,2), 
	"DRAW_MONEY" NUMBER(16,2), 
	"FEE_RATE_VALUE" NUMBER(10,6), 
	"LEFT_DAY_MODE" NUMBER(*,0), 
	"OVER_DUE_MODE" NUMBER(*,0), 
	"DRAW_BEFORE_TIMES" NUMBER(*,0), 
	"CUR_CODE" VARCHAR2(8), 
	"BRANCH_NO" VARCHAR2(6), 
	 CONSTRAINT "PK_CPM_SMART_BIZ_TYPE" PRIMARY KEY ("SMART_BTY_ID")
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
