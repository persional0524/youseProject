
  CREATE TABLE "YSKY_SMS"."CPM_TXTYPE_PERMISSION" 
   (	"POSITION_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TX_ACTION_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "PK_CPM_TXTYPE_PERMISSION" PRIMARY KEY ("TX_ACTION_ID", "POSITION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_TXTY_CPM_TXTYP_CPM_POSI" FOREIGN KEY ("POSITION_ID")
	  REFERENCES "YSKY_SMS"."CPM_POSITION" ("POSITION_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_TXTY_CPM_TXTYP_CPM_TX_A" FOREIGN KEY ("TX_ACTION_ID")
	  REFERENCES "YSKY_SMS"."CPM_TX_ACTIONS" ("TX_ACTION_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
