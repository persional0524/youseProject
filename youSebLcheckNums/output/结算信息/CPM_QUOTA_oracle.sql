
  CREATE TABLE "YSKY_SMS"."CPM_QUOTA" 
   (	"ACCOUNT_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"QUOTA_TYPE" NUMBER(*,0), 
	"QUOTA_VALUE" NUMBER(16,2), 
	"CMS_GROUP_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
