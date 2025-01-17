
  CREATE TABLE "YSKY_SMS"."CPM_AUTH_CODE" 
   (	"AUTH_CODE_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"AUTH_CODE" VARCHAR2(20) NOT NULL ENABLE, 
	"CREATETIME" DATE NOT NULL ENABLE, 
	"LASTUPDATETIME" DATE NOT NULL ENABLE, 
	"CPM_USER_NO" VARCHAR2(64) NOT NULL ENABLE, 
	 CONSTRAINT "PK_AUTH_CODE" PRIMARY KEY ("AUTH_CODE_ID")
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
