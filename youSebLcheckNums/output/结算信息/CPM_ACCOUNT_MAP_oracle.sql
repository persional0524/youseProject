
  CREATE TABLE "YSKY_SMS"."CPM_ACCOUNT_MAP" 
   (	"ACC_MAP_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"BST_ACC_ID" NUMBER(*,0), 
	"MAP_CTRL_MODE" NUMBER(*,0) NOT NULL ENABLE, 
	"BIZ_ACCOUNT_ID" NUMBER(*,0), 
	"MAP_TYPE" NUMBER(*,0), 
	 CONSTRAINT "PK_CPM_ACCOUNT_MAP" PRIMARY KEY ("ACC_MAP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_ACCO_RELATIONS_CPM_ACCO" FOREIGN KEY ("BIZ_ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_ACCOUNT" ("ACCOUNT_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
