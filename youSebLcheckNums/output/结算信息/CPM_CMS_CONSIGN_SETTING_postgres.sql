
  CREATE TABLE "YSKY_SMS"."CPM_CMS_CONSIGN_SETTING" 
   (	"ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"ACCOUNT_ID" NUMERIC(*,0), 
	"CONSIGN_ACCOUNT_ID" NUMERIC(*,0), 
	"GROUP_NO" VARCHAR2(50), 
	"CONSIGN_CLASS" VARCHAR2(100), 
	"LOAN_SORT_PROPERTIES" VARCHAR2(200), 
	"UNLOAN_SORT_PROPERTIES" VARCHAR2(200), 
	"TX_CODE_LOAN" VARCHAR2(10), 
	"TX_CODE_UNLOAN" VARCHAR2(10), 
	"TX_CODE_DEPOSIT" VARCHAR2(10), 
	"TX_CODE_DOWN" VARCHAR2(10), 
	"PAR_CMS_CONSIGN_ID" NUMERIC(*,0), 
	"DEPOSIT_RATE_VALUE" NUMERIC(10,6), 
	"DEPOSIT_ORDER" NUMERIC(*,0), 
	"DOWN_ORDER" NUMERIC(*,0), 
	 CONSTRAINT "PK_CPM_CMS_CONSIGN_SETTING" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_CMS_CONSIGN_REL_3" FOREIGN KEY ("PAR_CMS_CONSIGN_ID")
	  REFERENCES "YSKY_SMS"."CPM_CMS_CONSIGN_SETTING" ("ID") ENABLE, 
	 CONSTRAINT "FK_CPM_CMS_CONSIGN_REL_2" FOREIGN KEY ("CONSIGN_ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_ACCOUNT" ("ACCOUNT_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_CMS_CONSIGN_REL_1" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_ACCOUNT" ("ACCOUNT_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
