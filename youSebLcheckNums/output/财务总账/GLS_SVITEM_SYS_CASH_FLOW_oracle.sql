
  CREATE TABLE "YSKY_SMS"."GLS_SVITEM_SYS_CASH_FLOW" 
   (	"STID" NUMBER(*,0) NOT NULL ENABLE, 
	"MCODE" VARCHAR2(18) NOT NULL ENABLE, 
	"VAL" NUMBER(16,2), 
	"LOCALRATE" NUMBER(10,6), 
	"ORIGINALVAL" NUMBER(16,2), 
	 CONSTRAINT "PK_GLS_SVITEM_SYS_CASH_FLOW" PRIMARY KEY ("STID", "MCODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_GLS_CASH_FLOW_2_GLS_SVITEM" FOREIGN KEY ("STID")
	  REFERENCES "YSKY_SMS"."GLS_SVITEM" ("STID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
