
  CREATE TABLE "YSKY_SMS"."SIS_PROD_ATTR_DEFINE_PD" 
   (	"DEFID" NUMBER(*,0) NOT NULL ENABLE, 
	"DIM_DETAIL_CODE" VARCHAR2(10) NOT NULL ENABLE, 
	"ATTR_CODE" VARCHAR2(60) NOT NULL ENABLE, 
	"IS_NULL" VARCHAR2(2) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0) NOT NULL ENABLE, 
	"CREATE_TIME" DATE, 
	 CONSTRAINT "PK_SIS_PROD_ATTR_DEFINE_PD" PRIMARY KEY ("DEFID")
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
