
  CREATE TABLE "YSKY_SMS"."DBMS_TRADER" 
   (	"TRADERID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TRADERNAME" VARCHAR2(128), 
	"TRADERACCOUNTNO" VARCHAR2(32) NOT NULL ENABLE, 
	"TRADERACCOUNTNAME" VARCHAR2(128), 
	"BANKNAME" VARCHAR2(128), 
	"BANKNO" VARCHAR2(12), 
	 CONSTRAINT "PK_TRADERID" PRIMARY KEY ("TRADERID")
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
