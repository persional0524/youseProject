
  CREATE TABLE "YSKY_SMS"."CPM_STD_BOOK" 
   (	"BOOK_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"TX_ID" NUMBER(*,0), 
	"DRAFT_ID" NUMBER(*,0), 
	"ACCOUNT_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"BOOK_DIR" CHAR(1) NOT NULL ENABLE, 
	"AMOUNT" NUMBER(16,2) NOT NULL ENABLE, 
	"BEGIN_DATE" DATE, 
	"END_DATE" DATE, 
	"REMARK" VARCHAR2(255), 
	"BOOK_DATE" DATE, 
	"BIZ_CODE" VARCHAR2(70), 
	"IS_INTERESTED" NUMBER(*,0), 
	"BOOK_TYPE" NUMBER(*,0), 
	 CONSTRAINT "PK_CPM_STD_BOOK" PRIMARY KEY ("BOOK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_STD__REL_STD_S_CPM_SB_D" FOREIGN KEY ("DRAFT_ID")
	  REFERENCES "YSKY_SMS"."CPM_SB_DRAFT" ("DRAFT_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_STD__REL_STD_S_CPM_SB_U" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_SB_UNIT" ("ACCOUNT_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_STD__RELATIONS_CPM_TX" FOREIGN KEY ("TX_ID")
	  REFERENCES "YSKY_SMS"."CPM_TX" ("TX_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
