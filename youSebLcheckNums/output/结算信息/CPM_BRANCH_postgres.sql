
  CREATE TABLE "YSKY_SMS"."CPM_BRANCH" 
   (	"BRANCH_NO" VARCHAR2(6) NOT NULL ENABLE, 
	"BRANCH_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"LEVEL_CODE" VARCHAR2(12) NOT NULL ENABLE, 
	"BRANCH_TYPE" NUMERIC(*,0), 
	"SINGLE_BOOK" NUMERIC(*,0), 
	"BRANCH_CUST_ID" NUMERIC(*,0), 
	 CONSTRAINT "PK_CPM_BRANCH" PRIMARY KEY ("BRANCH_NO")
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
