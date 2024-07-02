
  CREATE TABLE "YSKY_SMS"."GLS_PERIOD" 
   (	"YR" NUMBER(*,0) NOT NULL ENABLE, 
	"PRD" VARCHAR2(6) NOT NULL ENABLE, 
	"PRDNAME" VARCHAR2(10) NOT NULL ENABLE, 
	"APATTR" NUMBER(*,0) DEFAULT 1 NOT NULL ENABLE, 
	"PSDATE" DATE, 
	"PEDATE" DATE, 
	 CONSTRAINT "CKC_GLS_PERIOD_APATTR" CHECK (APATTR=0 OR APATTR=1 OR APATTR=2) ENABLE, 
	 CONSTRAINT "PK_GLS_PERIOD" PRIMARY KEY ("YR", "PRD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "CKC_GLS_PERIOD_YR" CHECK (YR between 1900 and 2999) ENABLE, 
	 CONSTRAINT "FK_GLS_YEAR_2_GLS_PERIOD" FOREIGN KEY ("YR")
	  REFERENCES "YSKY_SMS"."GLS_YEAR" ("YR") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
