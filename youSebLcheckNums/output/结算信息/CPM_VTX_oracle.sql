
  CREATE TABLE "YSKY_SMS"."CPM_VTX" 
   (	"TX_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"CUST_NO" VARCHAR2(32), 
	"ACC_NO" VARCHAR2(32), 
	"BIZ_ACC_NO" VARCHAR2(32), 
	"OP_CUST_NO" VARCHAR2(32), 
	"OP_ACC_NO" VARCHAR2(32), 
	"OP_BIZ_ACC_NO" VARCHAR2(32), 
	"THRD_CUST_NO" VARCHAR2(32), 
	"THRD_ACC_NO" VARCHAR2(32), 
	"THRD_BIZ_ACC_NO" VARCHAR2(32), 
	"EBK_NO" VARCHAR2(4), 
	"EBK_NAME" VARCHAR2(80), 
	"EBK_BRANCH_NAME" VARCHAR2(80), 
	"EBK_BRANCH_NO" VARCHAR2(32), 
	"EBK_RIGION" VARCHAR2(80), 
	"EBK_CITY" VARCHAR2(80), 
	"EBK_ACC_NO" VARCHAR2(32), 
	"EBK_ACCOUNT_NAME" VARCHAR2(200), 
	"EBK_CNAPS_CODE" VARCHAR2(16), 
	"BC_CHANNEL" VARCHAR2(4), 
	"BC_NAME" VARCHAR2(80), 
	"BC_ACC_INDEX" VARCHAR2(32), 
	"BC_TICKET_TYPE" VARCHAR2(32), 
	"BC_TICKET_NO" VARCHAR2(32), 
	"BC_TICKET_PSWD" VARCHAR2(32), 
	"CR_DB" VARCHAR2(1), 
	"AMOUNT" NUMBER(16,2), 
	"AMOUNT2" NUMBER(16,2), 
	"INTR_AMOUNT" NUMBER(16,2), 
	"CHARGE_AMOUNT" NUMBER(16,2), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"INTR_RATE" NUMBER(12,6), 
	"INTR_RATE2" NUMBER(12,6), 
	"ARTICLE" VARCHAR2(80), 
	"PRICE" NUMBER(12,6), 
	"QUANTITY" NUMBER(16,2), 
	"QUANTITY_UNIT" VARCHAR2(30), 
	"DUE_INTR_RATE" NUMBER(12,6), 
	"INTR_RULE" VARCHAR2(32), 
	"DAY_UP_DOWN" NUMBER(*,0), 
	"CHARGE_RATE" NUMBER(12,6), 
	"BIZ_NUMBER" VARCHAR2(32), 
	"RECONCILE_MARK" VARCHAR2(64), 
	"X_CASE_TYPE" VARCHAR2(32), 
	"X_CASE_ID" VARCHAR2(64), 
	"X_AMOUNT" NUMBER(16,2), 
	"X_START_DATE" DATE, 
	"X_END_DATE" DATE, 
	"INTR_DATE" DATE, 
	"TICKET_TYPE" VARCHAR2(32), 
	"TICKET_NO" VARCHAR2(32), 
	"TICKET_NOE" VARCHAR2(32), 
	"TICKET_PSWD" VARCHAR2(32), 
	"OWNED_BRANCH_NO" VARCHAR2(6), 
	"TICKET_TAKER" VARCHAR2(20), 
	"BC_ACC" VARCHAR2(32), 
	"LBK_NO" VARCHAR2(4), 
	"LBK_NAME" VARCHAR2(80), 
	"LBK_BRANCH_NO" VARCHAR2(32), 
	"LBK_BRANCH_NAME" VARCHAR2(80), 
	"LBK_REGION" VARCHAR2(80), 
	"LBK_CITY" VARCHAR2(80), 
	"LBK_ACC_NO" VARCHAR2(32), 
	"LBK_ACC_NAME" VARCHAR2(80), 
	"IMG_LOC" VARCHAR2(256), 
	"BUSNISS_TYPE" NUMBER(*,0), 
	"TREAT_WAY" NUMBER(*,0), 
	"INTEREST_BEAR_WAY" VARCHAR2(32), 
	"TX_BIZNUMBER" VARCHAR2(100), 
	"SB_UNIT_NO" VARCHAR2(32), 
	"VCH_REF_NO" VARCHAR2(32), 
	"FLOATING_MODE" NUMBER(*,0), 
	"FLOATING_AMOUNT" NUMBER(12,6), 
	"URGENT_LEVEL" NUMBER(*,0), 
	"RESERVE_ID" NUMBER(*,0), 
	"DB_CASH_FLOW" VARCHAR2(32), 
	"CR_CASH_FLOW" VARCHAR2(32), 
	"STD_BOOK_TYPE" NUMBER(*,0), 
	"BRANCH_SORT" NUMBER(*,0), 
	"ISCA_PAY_INTR_ACC_NO" VARCHAR2(32), 
	"ISCA_REC_INTR_ACC_NO" VARCHAR2(32), 
	"PRO_PAY_INTR_ACC_NO" VARCHAR2(32), 
	"PRO_REC_INTR_ACC_NO" VARCHAR2(32), 
	"SMART_BTY_ID" NUMBER(*,0), 
	"OP_ACCOUNT_NAME" VARCHAR2(200), 
	"ACCOUNT_NAME" VARCHAR2(200), 
	"USE_OF_FUNDS" VARCHAR2(5), 
	 CONSTRAINT "PK_CPM_VTX" PRIMARY KEY ("TX_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_VTX_INHERITAN_CPM_TX" FOREIGN KEY ("TX_ID")
	  REFERENCES "YSKY_SMS"."CPM_TX" ("TX_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 8192 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
