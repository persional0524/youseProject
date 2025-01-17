
  CREATE TABLE "YSKY_SMS"."BCS_ORDER_TRACE" 
   (	"TRACE_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"ORDER_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"OPERATE_TIME" DATE, 
	"TRACE_STATUS" NUMBER(*,0), 
	"ERR_CODE" VARCHAR2(16), 
	"ERR_DESC" VARCHAR2(512), 
	 CONSTRAINT "PK_BCS_ORDER_TRACE" PRIMARY KEY ("TRACE_ID")
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
