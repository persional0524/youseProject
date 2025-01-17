
  CREATE TABLE "YSKY_SMS"."CPM_TXTYPE_TICKET" 
   (	"TT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TX_TYPE_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"DOC_TYPE" NUMERIC(*,0) NOT NULL ENABLE, 
	"ACC_KEY" VARCHAR2(32), 
	"NEED_EBILL" NUMERIC(*,0), 
	"BILL_OWNER" NUMERIC(*,0), 
	"BILL_CHANNEL" NUMERIC(*,0), 
	"DEF_BILL" NUMERIC(*,0), 
	"BILL_DRAFT_NO" VARCHAR2(32), 
	 CONSTRAINT "PK_CPM_TXTYPE_TICKET" PRIMARY KEY ("TT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_TXTY_CPM_TXTYP_CPM_DOC_" FOREIGN KEY ("DOC_TYPE")
	  REFERENCES "YSKY_SMS"."CPM_DOC_TYPE" ("DOC_TYPE") ENABLE, 
	 CONSTRAINT "FK_TXTY_CPM_TXTYP_CPM_TX_T8" FOREIGN KEY ("TX_TYPE_ID")
	  REFERENCES "YSKY_SMS"."CPM_TX_TYPE" ("TX_TYPE_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
