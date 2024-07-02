
  CREATE TABLE "YSKY_SMS"."CLT_CLT_TYPE" 
   (	"TYPE_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TYPE_NAME" VARCHAR2(64) NOT NULL ENABLE, 
	"CAN_USE" NUMERIC(*,0) NOT NULL ENABLE, 
	"SHOW_ORDER" NUMERIC(*,0) NOT NULL ENABLE, 
	 CONSTRAINT "PK_CLT_CLT_TYPE" PRIMARY KEY ("TYPE_ID")
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
