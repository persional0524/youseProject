
  CREATE TABLE "YSKY_SMS"."BCS_RX_ORDER" 
   (	"ORDER_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"RX_TYPE_CODE" VARCHAR2(8), 
	"PROCESS_STATUS" NUMERIC(*,0), 
	"PRETREAT_TYPE" VARCHAR2(8), 
	"TALLY_FLAG" NUMERIC(*,0), 
	"TALLY_TX_ID" NUMERIC(*,0), 
	"TALLY_TX_RESULT" NUMERIC(*,0), 
	"TALLY_FAIL_REASON" VARCHAR2(512), 
	"OUT_BANK_CODE" VARCHAR2(8), 
	"OUT_BANK_NAME" VARCHAR2(80), 
	"IN_BANK_CODE" VARCHAR2(8), 
	"IN_BANK_NAME" VARCHAR2(80), 
	"INTERFACE_CODE" VARCHAR2(8), 
	"PAY_PASSWORD" VARCHAR2(80), 
	"HOST_TELLER" VARCHAR2(16), 
	"BANK_TELLER" VARCHAR2(16), 
	"PAY_FLAG" NUMERIC(*,0), 
	"RX_ORDER_ID" NUMERIC(*,0), 
	"MANUAL_TALLY_FLAG" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"CLEAR_USER_NO" VARCHAR2(32), 
	"CLEAR_USER_NAME" VARCHAR2(32), 
	 CONSTRAINT "PK_BCS_RX_ORDER" PRIMARY KEY ("ORDER_ID")
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
