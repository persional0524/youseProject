
  CREATE TABLE "YSKY_SMS"."CPM_HOTCODES" 
   (	"HOT_KEY" VARCHAR2(4) NOT NULL ENABLE, 
	"HOT_CODE" VARCHAR2(10) NOT NULL ENABLE, 
	"HOT_NAME" VARCHAR2(32) NOT NULL ENABLE, 
	"HOT_MODULE" VARCHAR2(32) NOT NULL ENABLE, 
	"HOT_ENABLE" NUMBER(*,0) NOT NULL ENABLE, 
	"HOT_IN_PAGE" VARCHAR2(100) NOT NULL ENABLE, 
	"HOT_CK_PAGE" VARCHAR2(100), 
	 CONSTRAINT "PK_CPM_HOTCODES" PRIMARY KEY ("HOT_KEY", "HOT_CODE")
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
