
  CREATE TABLE "YSKY_SMS"."CPM_TXTYPE_PROCESS" 
   (	"TX_PRO_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"REMARK" VARCHAR2(255), 
	"CHANNEL_ID" NUMBER(*,0), 
	"TX_TYPE_ID" NUMBER(*,0), 
	"BIZ_FLOW_KEY" VARCHAR2(256), 
	 CONSTRAINT "PK_CPM_TXTYPE_PROCESS" PRIMARY KEY ("TX_PRO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_TXTY_RELATIONS_CPM_CHAN" FOREIGN KEY ("CHANNEL_ID")
	  REFERENCES "YSKY_SMS"."CPM_CHANNEL" ("CHANNEL_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_TXTY_RELATIONS_CPM_TX_T" FOREIGN KEY ("TX_TYPE_ID")
	  REFERENCES "YSKY_SMS"."CPM_TX_TYPE" ("TX_TYPE_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
