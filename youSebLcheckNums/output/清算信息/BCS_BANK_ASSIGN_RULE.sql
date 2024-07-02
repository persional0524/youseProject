
  CREATE TABLE "YSKY_SMS"."BCS_BANK_ASSIGN_RULE" 
   (	"RULE_ID" NUMBER(*,0), 
	"TX_TYPE_CODE" VARCHAR2(4), 
	"SAME_BANK_FIRST" NUMBER(*,0), 
	"ASSIGN_RULE" VARCHAR2(200), 
	 CONSTRAINT "PK_BCS_BANK_ASSIGN_RULE" PRIMARY KEY ("RULE_ID")
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
