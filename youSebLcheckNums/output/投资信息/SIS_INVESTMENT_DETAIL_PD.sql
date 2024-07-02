
  CREATE TABLE "YSKY_SMS"."SIS_INVESTMENT_DETAIL_PD" 
   (	"ID" NUMBER(*,0) NOT NULL ENABLE, 
	"FLOW_NO" VARCHAR2(60) NOT NULL ENABLE, 
	"PROD_ID" VARCHAR2(60), 
	"TRANS_DATE" DATE NOT NULL ENABLE, 
	"TRANS_NUM" NUMBER(20,2) NOT NULL ENABLE, 
	"TRANS_AMOUNT" NUMBER(20,2) NOT NULL ENABLE, 
	"STOCK_NUM" NUMBER(20,2), 
	"QUOTA_AMOUNT" NUMBER(20,2), 
	"CREATE_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	"STATUS" VARCHAR2(2), 
	"BONDS_NUM" NUMBER(*,0), 
	"USEABLE_NUM" NUMBER(*,0), 
	 CONSTRAINT "SIS_INVESTMENT_DETAIL_PD" PRIMARY KEY ("ID")
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
