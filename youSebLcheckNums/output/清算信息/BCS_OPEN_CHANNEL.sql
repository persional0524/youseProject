
  CREATE TABLE "YSKY_SMS"."BCS_OPEN_CHANNEL" 
   (	"OPEN_CHANNEL_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"CLEAR_BANK_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"CHANNEL_CODE" VARCHAR2(4) NOT NULL ENABLE, 
	 CONSTRAINT "PK_BCS_OPEN_CHANNEL" PRIMARY KEY ("OPEN_CHANNEL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CHANNEL_CODE" FOREIGN KEY ("CHANNEL_CODE")
	  REFERENCES "YSKY_SMS"."BCS_CHANNEL" ("CHANNEL_CODE") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "FK_CLEAR_BANK_ID" FOREIGN KEY ("CLEAR_BANK_ID")
	  REFERENCES "YSKY_SMS"."BCS_CLEAR_BANK" ("CLEAR_BANK_ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
