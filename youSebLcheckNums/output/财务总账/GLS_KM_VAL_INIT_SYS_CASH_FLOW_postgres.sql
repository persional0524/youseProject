
  CREATE TABLE "YSKY_SMS"."GLS_KM_VAL_INIT_SYS_CASH_FLOW" 
   (	"ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"DETAIL_ID" NUMERIC(*,0), 
	"MCODE" VARCHAR2(18), 
	"JVAL" NUMERIC(16,2), 
	"DVAL" NUMERIC(16,2), 
	 CONSTRAINT "PK_GLS_KM_INIT_SYS_CASH_FLOW" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_GLS_CASH_FLOW_2_GLS_KM_INIT" FOREIGN KEY ("DETAIL_ID")
	  REFERENCES "YSKY_SMS"."GLS_KM_VAL_INIT_DETAIL" ("DETAIL_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
