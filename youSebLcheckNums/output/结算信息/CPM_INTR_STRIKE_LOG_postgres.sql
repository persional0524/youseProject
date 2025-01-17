
  CREATE TABLE "YSKY_SMS"."CPM_INTR_STRIKE_LOG" 
   (	"ISL_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"IL_ID" NUMERIC(*,0), 
	"TX_ID" NUMERIC(*,0), 
	"STRIKE_AMOUNT" NUMERIC(16,2), 
	"STRIKE_ACM_VALUE" NUMERIC(20,2) DEFAULT 0.00, 
	"UN_STRIKE_FLAG" NUMERIC(*,0), 
	"CREATE_TIME" DATE, 
	"LAST_UPDATE_TIME" DATE, 
	"VERSION_COLUMN" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_CPM_INTR_STRIKE_LOG" PRIMARY KEY ("ISL_ID")
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
