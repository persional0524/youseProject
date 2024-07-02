
  CREATE TABLE "YSKY_SMS"."CPM_TX" 
   (	"TX_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TX_TYPE_ID" NUMERIC(*,0), 
	"CHANNEL_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TX_BIZ_TYPE" NUMERIC(*,0), 
	"TX_ABSTRACT" VARCHAR2(255), 
	"TX_COMMENT" VARCHAR2(256), 
	"BRANCH_NO" VARCHAR2(6), 
	"SOURCE_ID" VARCHAR2(64), 
	"TX_DATE" DATE NOT NULL ENABLE, 
	"PRIOR_TXID" NUMERIC(*,0), 
	"VCH_UDC" VARCHAR2(32), 
	"TX_FINGER_PRINT" VARCHAR2(254), 
	"TX_STATE" NUMERIC(*,0) NOT NULL ENABLE, 
	"EXECUTE_FLAG" NUMERIC(*,0), 
	"EXEC_RESULT" NUMERIC(*,0), 
	"ERROR_CODE" VARCHAR2(16), 
	"ERROR_TEXT" VARCHAR2(512), 
	"SUCC_BIZ_CODE" VARCHAR2(64), 
	"TX_REFCODE" VARCHAR2(10), 
	"TX_CLASS" VARCHAR2(50), 
	"CUR_CODE" VARCHAR2(8), 
	"TX_CLEAR_STATE" NUMERIC(*,0), 
	"TX_CLEAR_RESULT" NUMERIC(*,0), 
	"INPUTER" VARCHAR2(20), 
	"INPUTER_NAME" VARCHAR2(128), 
	"CHECKER" VARCHAR2(20), 
	"CHECKER_NAME" VARCHAR2(128), 
	"RATIFIER" VARCHAR2(20), 
	"RATIFIER_NAME" VARCHAR2(128), 
	"INPUT_TIME" DATE, 
	"CHECK_TIME" DATE, 
	"RATIFY_TIME" DATE, 
	"CREATE_BR_NO" VARCHAR2(8), 
	"SPECIAL_TX_FLAG" NUMERIC(*,0) DEFAULT 0, 
	"PRINT_COUNT" NUMERIC(*,0), 
	"SOURCE_PROMOTER" VARCHAR2(64), 
	"BTX_ID" NUMERIC(*,0), 
	"BIZ_FLOW_CASE_ID" NUMERIC(*,0), 
	"VERSION_COLUMN" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "UK_CPM_TX_TX_FINGER_PRINT" UNIQUE ("TX_FINGER_PRINT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_TX_REL_TX_CH_CPM_CHAN" FOREIGN KEY ("CHANNEL_ID")
	  REFERENCES "YSKY_SMS"."CPM_CHANNEL" ("CHANNEL_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_TX_RELATIONS_CPM_BRAN" FOREIGN KEY ("CREATE_BR_NO")
	  REFERENCES "YSKY_SMS"."CPM_BRANCH" ("BRANCH_NO") ENABLE, 
	 CONSTRAINT "FK_CPM_TX_REL_TX_TX_CPM_TX_T" FOREIGN KEY ("TX_TYPE_ID")
	  REFERENCES "YSKY_SMS"."CPM_TX_TYPE" ("TX_TYPE_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  CREATE INDEX "YSKY_SMS"."IDX_TX_ID_DATE" ON "YSKY_SMS"."CPM_TX" ("TX_ID", "TX_DATE", "CHANNEL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
ALTER TABLE "YSKY_SMS"."CPM_TX" ADD CONSTRAINT "PK_CPM_TX" PRIMARY KEY ("TX_ID")
  USING INDEX "YSKY_SMS"."IDX_TX_ID_DATE"  ENABLE;
