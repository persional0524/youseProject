
  CREATE TABLE "YSKY_SMS"."CPM_INTR_FILL_LOG" 
   (	"IFL_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"IL_ID" NUMBER(*,0), 
	"TX_ID" NUMBER(*,0), 
	"FILL_AMOUNT" NUMBER(16,2), 
	"FILL_AMOUNT_NONACCRUAL" NUMBER(16,2), 
	"UN_FILL_FLAG" NUMBER(*,0), 
	"CREATE_TIME" DATE, 
	"LAST_UPDATE_TIME" DATE, 
	"VERSION_COLUMN" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_CPM_INTR_FILL_LOG" PRIMARY KEY ("IFL_ID")
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
