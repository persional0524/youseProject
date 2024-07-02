
  CREATE TABLE "YSKY_SMS"."CPM_BATCH_ATX" 
   (	"BTX_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"OP_TIME" DATE, 
	"CUR_CODE" VARCHAR2(3), 
	"OP_USER_NO" VARCHAR2(24), 
	"OP_USER_NAME" VARCHAR2(32), 
	"BRANCH_NO" VARCHAR2(6), 
	 CONSTRAINT "PK_CPM_BATCH_ATX" PRIMARY KEY ("BTX_ID")
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
