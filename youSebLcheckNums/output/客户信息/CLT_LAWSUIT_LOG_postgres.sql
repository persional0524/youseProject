
  CREATE TABLE "YSKY_SMS"."CLT_LAWSUIT_LOG" 
   (	"ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"LAWSUIT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"CLTNO" VARCHAR2(30), 
	"PLAINNM" VARCHAR2(80), 
	"CURTP" VARCHAR2(3), 
	"JDEXAMT" NUMERIC(16,2), 
	"JDEXECDT" DATE, 
	"EXECRLT" VARCHAR2(100), 
	"IDCTCAU" VARCHAR2(300), 
	"CREATOR" VARCHAR2(24), 
	"CREATETIME" DATE, 
	"OPER_TYPE" NUMERIC(*,0), 
	 CONSTRAINT "PK_CLT_LAWSUIT_LOG" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CLT_LAWS_REFERENCE_CLT_LAWS" FOREIGN KEY ("LAWSUIT_ID")
	  REFERENCES "YSKY_SMS"."CLT_LAWSUIT" ("LAWSUIT_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
