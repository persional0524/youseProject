
  CREATE TABLE "YSKY_SMS"."CPM_TICKET" 
   (	"TICKET_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TKT_CODE" VARCHAR2(4), 
	"CUST_ID" NUMERIC(*,0), 
	"ACCOUNT_ID" NUMERIC(*,0), 
	"BRANCH_NO" VARCHAR2(8), 
	"TICKET_CODE" VARCHAR2(32), 
	"TICKET_STATE" NUMERIC(*,0), 
	"TICKET_PSWD" VARCHAR2(32), 
	"AMOUNT" NUMERIC(16,2), 
	"BOOK_DATE" DATE, 
	"BEGIN_DATE" DATE, 
	"END_DATE" DATE, 
	"RATE_VALUE" NUMERIC(10,6), 
	"REMARK" VARCHAR2(255), 
	"BANK_CODE" VARCHAR2(4), 
	"BANK_NAME" VARCHAR2(80), 
	"RELEASE_STATE" NUMERIC(*,0), 
	"PURCHASE_DATE" DATE, 
	"REL_TX_ID" NUMERIC(*,0), 
	"TICKET_TAKER" VARCHAR2(20), 
	"TAKE_DATE" DATE, 
	"VERSION_COLUMN" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_CPM_TICKET" PRIMARY KEY ("TICKET_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_TICK_RELATIONS_CPM_BOOK" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_BOOK_UNIT" ("ACCOUNT_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_TICK_RELATIONS_CPM_CUST" FOREIGN KEY ("CUST_ID")
	  REFERENCES "YSKY_SMS"."CPM_CUSTOMER" ("CUST_ID") ENABLE, 
	 CONSTRAINT "FK_TICK_RELATIONS_CPM_TICK1" FOREIGN KEY ("TKT_CODE")
	  REFERENCES "YSKY_SMS"."CPM_TICKET_TYPE" ("TKT_CODE") ENABLE, 
	 CONSTRAINT "FK_CPM_TICK_REF_CPM_BRANCH" FOREIGN KEY ("BRANCH_NO")
	  REFERENCES "YSKY_SMS"."CPM_BRANCH" ("BRANCH_NO") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
