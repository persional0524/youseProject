
  CREATE TABLE "YSKY_SMS"."BCS_BDEX_MSG" 
   (	"BDEX_MSG_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"BDEX_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"BDEX_MSG_TYPE" VARCHAR2(16), 
	"OPERATE_TIME" DATE, 
	"SHORT_DESC" VARCHAR2(240), 
	"MSG_DETAIL" CLOB, 
	 CONSTRAINT "PK_BCS_BDEX_MSG" PRIMARY KEY ("BDEX_MSG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_BCS_BDEX_REL_MSG_B_BCS_BDEX" FOREIGN KEY ("BDEX_ID")
	  REFERENCES "YSKY_SMS"."BCS_BDEX" ("BDEX_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("MSG_DETAIL") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
