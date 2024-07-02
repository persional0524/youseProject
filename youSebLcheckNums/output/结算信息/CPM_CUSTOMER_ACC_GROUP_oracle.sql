
  CREATE TABLE "YSKY_SMS"."CPM_CUSTOMER_ACC_GROUP" 
   (	"CAG_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"CR_AG_ID" NUMBER(*,0), 
	"DE_AG_ID" NUMBER(*,0), 
	"CUST_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"SCALE" NUMBER(6,2), 
	"BRANCH_NO" VARCHAR2(6), 
	"CUR_CODE" VARCHAR2(8), 
	"CPM_BRANCH_NO" VARCHAR2(6), 
	 CONSTRAINT "PK_CPM_CUSTOMER_ACC_GROUP" PRIMARY KEY ("CAG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_CUST_RELATIONS_CPM_ACCR" FOREIGN KEY ("CR_AG_ID")
	  REFERENCES "YSKY_SMS"."CPM_ACCOUNT_GROUP" ("AG_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_CUST_RELATIONS_CPM_ACCO" FOREIGN KEY ("DE_AG_ID")
	  REFERENCES "YSKY_SMS"."CPM_ACCOUNT_GROUP" ("AG_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
