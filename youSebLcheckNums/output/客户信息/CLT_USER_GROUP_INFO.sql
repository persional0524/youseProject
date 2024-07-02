
  CREATE TABLE "YSKY_SMS"."CLT_USER_GROUP_INFO" 
   (	"USER_GROUP_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"GROUP_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"USER_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"USER_CODE" VARCHAR2(30) NOT NULL ENABLE, 
	"CREATOR" VARCHAR2(60), 
	"CREATE_TIME" DATE, 
	 CONSTRAINT "PK_CLT_USER_GROUP_INFO" PRIMARY KEY ("USER_GROUP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CLT_004" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "YSKY_SMS"."CLT_CLT_USERGROUP" ("GROUP_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
