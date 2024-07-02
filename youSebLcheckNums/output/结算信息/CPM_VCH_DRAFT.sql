
  CREATE TABLE "YSKY_SMS"."CPM_VCH_DRAFT" 
   (	"VD_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"TICKET_ID" NUMBER(*,0), 
	"CPM_TICKET_ID" NUMBER(*,0), 
	"CUR_CODE" VARCHAR2(8), 
	"SCHEMA_ID" NUMBER(*,0), 
	"BRANCH_NO" VARCHAR2(8), 
	"TX_ID" NUMBER(*,0), 
	"BOOKING_STATE" NUMBER(*,0), 
	"BOOKING_RESULT" VARCHAR2(512), 
	"INTR_BOOK_TYPE" NUMBER(*,0), 
	"AMOUNT" NUMBER(16,2), 
	"INTR_DATE" DATE, 
	"DB_SUBJECT_NO" VARCHAR2(16), 
	"DB_ACCOUNT" VARCHAR2(32), 
	"CF_CODE_DB" VARCHAR2(8), 
	"DB_MCODE" VARCHAR2(32), 
	"CR_SUBJECT_NO" VARCHAR2(18), 
	"CR_ACCOUNT" VARCHAR2(32), 
	"CF_CODE_CR" VARCHAR2(8), 
	"CR_MCODE" VARCHAR2(32), 
	"EBK_NO" VARCHAR2(4), 
	"EBK_NAME" VARCHAR2(80), 
	"EBK_RIGION" VARCHAR2(80), 
	"EBK_CITY" VARCHAR2(80), 
	"EBK_ACCOUNT_NAME" VARCHAR2(180), 
	"EBK_ACC_NO" VARCHAR2(32), 
	"EBK_TICKET_NO" VARCHAR2(32), 
	"RECONCILE_MARK" VARCHAR2(64), 
	"REMARK" VARCHAR2(255), 
	"TX_FINGER_PRINT" VARCHAR2(254), 
	"VCH_UDC" VARCHAR2(32), 
	"EBK_CNAPS_CODE" VARCHAR2(16), 
	"END_DATE" DATE, 
	"BIZ_NUMBER" VARCHAR2(100), 
	"VCH_INPUTOR" VARCHAR2(30), 
	"VCH_CHECKER" VARCHAR2(30), 
	"VCH_RATIFIER" VARCHAR2(30), 
	"MCTYPE_NAME" VARCHAR2(30), 
	"INPUT_TIME" DATE, 
	"CHECK_TIME" DATE, 
	"RATIFY_TIME" DATE, 
	"FILL_SINGLE_MODE" NUMBER(*,0), 
	"USER_NO" VARCHAR2(64), 
	"CREATE_BR_NO" VARCHAR2(8), 
	"BOOK_TIME" DATE, 
	"VCH_BOOKER" VARCHAR2(30), 
	"DRAFT_TYPE" NUMBER(*,0), 
	 CONSTRAINT "PK_CPM_VCH_DRAFT" PRIMARY KEY ("VD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_VCH__RELATIONS_CPM_VTX" FOREIGN KEY ("TX_ID")
	  REFERENCES "YSKY_SMS"."CPM_VTX" ("TX_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_VCH_DRAFT_REF_TICKET" FOREIGN KEY ("TICKET_ID")
	  REFERENCES "YSKY_SMS"."CPM_TICKET" ("TICKET_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_VCH__RELATIONS_CPM_BRAN" FOREIGN KEY ("CREATE_BR_NO")
	  REFERENCES "YSKY_SMS"."CPM_BRANCH" ("BRANCH_NO") ENABLE, 
	 CONSTRAINT "FK_CPM_VCH__REL_VCHD__CPM_BOOK" FOREIGN KEY ("SCHEMA_ID")
	  REFERENCES "YSKY_SMS"."CPM_BOOKING_SCHEMA" ("SCHEMA_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
