
  CREATE TABLE "YSKY_SMS"."CPM_ACC_INTR" 
   (	"AIT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"PEG_RATE_CODE" VARCHAR2(32), 
	"INTR_BEAR_MODE" NUMERIC(*,0), 
	"RATE_SET_MODE" NUMERIC(*,0), 
	"OPEN_RATE" NUMERIC(12,6), 
	"END_RATE" NUMERIC(12,6), 
	"DEBIT_INTR_RATE" NUMERIC(12,6), 
	"FLOATING_AMOUNT" NUMERIC(12,6), 
	"ISCA_PAY_INTR_ACC_ID" NUMERIC(*,0), 
	"ISCA_OVERDUE_PAY_INTR_ACC_ID" NUMERIC(*,0), 
	"ISCA_REC_INTR_ACC_ID" NUMERIC(*,0), 
	"ISCA_CF_CODE" VARCHAR2(8), 
	"IS_MERGE_INTR" NUMERIC(*,0), 
	"PRO_REC_INTR_ACC_ID" NUMERIC(*,0), 
	"PRO_PAY_INTR_ACC_ID" NUMERIC(*,0), 
	"FLOATING_MODE" NUMERIC(*,0), 
	"IS_INTR_BEAR" NUMERIC(*,0), 
	"ACCOUNT_ID" NUMERIC(*,0), 
	"INTR_CLASS" VARCHAR2(100), 
	"INTR_CODE" VARCHAR2(32), 
	"TRS_ACCOUNT" VARCHAR2(32), 
	"INTR_PERIOD" NUMERIC(*,0), 
	"INTR_MOTH" NUMERIC(*,0), 
	"INTR_DAY" NUMERIC(*,0), 
	"UNREC_INTR_SBUINT" NUMERIC(*,0), 
	"NOACC_INTR_SBUINT" NUMERIC(*,0), 
	"VERSION_COLUMN" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PK_CPM_ACC_INTR" PRIMARY KEY ("AIT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_ACC__RELATIONS_CPM_PEG_" FOREIGN KEY ("PEG_RATE_CODE")
	  REFERENCES "YSKY_SMS"."CPM_PEG_RATE_TYPE" ("PEG_RATE_CODE") ENABLE, 
	 CONSTRAINT "FK_CPM_ACC__REL_ACC_I_CPM_INTR" FOREIGN KEY ("INTR_CODE")
	  REFERENCES "YSKY_SMS"."CPM_INTR_TYPE" ("INTR_CODE") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
