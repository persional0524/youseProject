
  CREATE TABLE "YSKY_SMS"."FBCM_CEDIT_APP" 
   (	"ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"TYPE" NUMERIC(*,0), 
	"CLTNO" VARCHAR2(30), 
	"CLTTYPE" NUMERIC(*,0), 
	"SUPERCLT" VARCHAR2(30), 
	"ISPROJECT" NUMERIC(*,0), 
	"LOADADJRATE" NUMERIC(4,2), 
	"CRERETIME" NUMERIC(*,0), 
	"BEGINDATE" DATE, 
	"ENDDATE" DATE, 
	"AMT" NUMERIC(14,2), 
	"USEDAMT" NUMERIC(14,2), 
	"STATUS" NUMERIC(*,0), 
	"OLDID" NUMERIC(*,0), 
	"CREATOR" VARCHAR2(24), 
	"CREATETIME" DATE, 
	"REPORTOR" VARCHAR2(24), 
	"REPORTTIME" DATE, 
	"LASTUPDATTIME" DATE, 
	"PATCHFLG" NUMERIC(*,0), 
	"CRTCONTROL" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"DATE_MODE" NUMERIC(*,0) DEFAULT 1 NOT NULL ENABLE, 
	"CONTRACTNO" VARCHAR2(36), 
	 CONSTRAINT "PK_FBCM_CEDIT_APP" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
