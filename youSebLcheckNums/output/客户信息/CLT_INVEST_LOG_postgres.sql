
  CREATE TABLE "YSKY_SMS"."CLT_INVEST_LOG" 
   (	"ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"INVEST_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"CLTNO" VARCHAR2(30), 
	"INVESTNM" VARCHAR2(80), 
	"BYLNCARDNO" VARCHAR2(16), 
	"ORGNO" VARCHAR2(10), 
	"CURTP1" VARCHAR2(3), 
	"INVAMT1" NUMERIC(8,0), 
	"CURTP2" VARCHAR2(3), 
	"INVAMT2" NUMERIC(8,0), 
	"CURTP3" VARCHAR2(3), 
	"INVAMT3" NUMERIC(8,0), 
	"CREATOR" VARCHAR2(24), 
	"CREATETIME" DATE, 
	"OPER_TYPE" NUMERIC(*,0), 
	 CONSTRAINT "PK_CLT_INVEST_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CLT_INVE_REFERENCE_CLT_INVE" FOREIGN KEY ("INVEST_ID")
	  REFERENCES "YSKY_SMS"."CLT_INVEST" ("INVEST_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
