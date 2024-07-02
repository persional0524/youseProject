
  CREATE TABLE "YSKY_SMS"."CPM_LINK_ACCOUNT" 
   (	"LINK_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"ACCOUNT_NO" VARCHAR2(32), 
	"LINK_NO" VARCHAR2(32), 
	"LINK_TYPE" NUMERIC(*,0), 
	"CMS_GROUP_ID" NUMERIC(*,0), 
	 CONSTRAINT "PK_CPM_LINK_ACCOUNT" PRIMARY KEY ("LINK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003" ;
