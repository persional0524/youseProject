
  CREATE TABLE "YSKY_SMS"."BCS_BANK_CHANNEL" 
   (	"BANK_CHANNEL_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"CLEAR_BANK_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"TX_TYPE_CODE" VARCHAR2(4), 
	"CHANNEL_CODE" VARCHAR2(4), 
	"AUTH_TYPE" NUMBER(*,0), 
	"OVER_QUOTA" NUMBER(16,2), 
	"APPROVAL_LIMIT" NUMBER(16,2), 
	 CONSTRAINT "PK_BCS_BANK_CHANNEL" PRIMARY KEY ("BANK_CHANNEL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_BCS_BANK_TX_TYPE_CODE" FOREIGN KEY ("TX_TYPE_CODE")
	  REFERENCES "YSKY_SMS"."BCS_TX_TYPE" ("TX_TYPE_CODE") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "FK_BCS_BANK_BCS_BANK__BCS_CHAN" FOREIGN KEY ("CHANNEL_CODE")
	  REFERENCES "YSKY_SMS"."BCS_CHANNEL" ("CHANNEL_CODE") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "FK_BCS_BANK_CLEAR_BANK_ID" FOREIGN KEY ("CLEAR_BANK_ID")
	  REFERENCES "YSKY_SMS"."BCS_CLEAR_BANK" ("CLEAR_BANK_ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
