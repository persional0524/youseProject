
  CREATE TABLE "YSKY_SMS"."SIS_INVEST_RULE_PD" 
   (	"RULEID" NUMERIC(*,0) NOT NULL ENABLE, 
	"PROD_CLASS_ID" NUMERIC(*,0), 
	"IS_OCCUPY_BALT" VARCHAR2(2), 
	"BAL_LIMIT_TYPE" VARCHAR2(2), 
	"ACCOUNTING_TYPE" VARCHAR2(2), 
	"CREATE_TIME" DATE, 
	"UPDATE_TIME" DATE, 
	"IS_REGISTER_SG" VARCHAR2(2), 
	"IS_REGISTER_SH" VARCHAR2(2), 
	 CONSTRAINT "PK_SIS_INVEST_RULE_PD" PRIMARY KEY ("RULEID")
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
