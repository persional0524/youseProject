
  CREATE TABLE "YSKY_SMS"."SIS_INTEREST_EXPIRECONFIRM" 
   (	"EID" NUMBER(*,0) NOT NULL ENABLE, 
	"FLOW_NO" VARCHAR2(64) NOT NULL ENABLE, 
	"TXID" NUMBER(*,0) NOT NULL ENABLE, 
	"END_DATE" DATE, 
	"INTEREST_AMOUNT" NUMBER, 
	"ACT_INTEREST_AMOUNT" NUMBER, 
	"ACT_INTEREST_DATE" DATE, 
	"BIZ_CASE_ID" NUMBER(*,0), 
	"STATUS" VARCHAR2(2), 
	"REJECT_MSG" VARCHAR2(256), 
	"CREATETIME" DATE, 
	"ACT_RESULT" VARCHAR2(255), 
	"ACT_STATUS" VARCHAR2(2), 
	"START_DATE" DATE, 
	 CONSTRAINT "PK_SIS_INTEREST_EXPIRECONFIRM" PRIMARY KEY ("EID")
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
