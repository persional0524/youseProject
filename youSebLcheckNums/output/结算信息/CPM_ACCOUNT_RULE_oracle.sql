
  CREATE TABLE "YSKY_SMS"."CPM_ACCOUNT_RULE" 
   (	"RID" NUMBER(*,0) NOT NULL ENABLE, 
	"CUR_CODE" VARCHAR2(8), 
	"BRANCH_NO" VARCHAR2(8), 
	"ACC_BIZ_TYPE" NUMBER(*,0), 
	"RULE_NO" VARCHAR2(10) NOT NULL ENABLE, 
	"RULE_NAME" VARCHAR2(40), 
	"RULE_VALUE" VARCHAR2(60), 
	"RULE_ACTIVE_MODE" NUMBER(*,0), 
	"RULE_USE_MODE" NUMBER(*,0), 
	"RULE_EDITOR" VARCHAR2(80), 
	"RULE_SEQ" VARCHAR2(40), 
	 CONSTRAINT "PK_CPM_ACCOUNT_RULE" PRIMARY KEY ("RID", "RULE_NO")
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
