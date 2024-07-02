
  CREATE TABLE "YSKY_SMS"."GLS_STDVCH" 
   (	"SVID" NUMERIC(*,0) NOT NULL ENABLE, 
	"YR" NUMERIC(*,0), 
	"VGNO" VARCHAR2(4) DEFAULT 0, 
	"SVNO" VARCHAR2(4) NOT NULL ENABLE, 
	"CUR_CODE" VARCHAR2(8), 
	"SVTYPE" NUMERIC(*,0) DEFAULT 0 NOT NULL ENABLE, 
	"SVSCOPE" NUMERIC(*,0) DEFAULT 0, 
	"SVNAME" VARCHAR2(60) NOT NULL ENABLE, 
	"CREATOR" VARCHAR2(100) NOT NULL ENABLE, 
	"CREATORNAME" VARCHAR2(100) NOT NULL ENABLE, 
	"CREATEDATE" DATE NOT NULL ENABLE, 
	"BRANCH_NO" VARCHAR2(6) NOT NULL ENABLE, 
	 CONSTRAINT "CKC_GLS_STDVCH_YR" CHECK (YR between 1900 and 2999) ENABLE, 
	 CONSTRAINT "PK_GLS_STDVCH" PRIMARY KEY ("SVID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "FK_GLS_YEAR_2_GLS_STDVCH" FOREIGN KEY ("YR")
	  REFERENCES "YSKY_SMS"."GLS_YEAR" ("YR") ENABLE, 
	 CONSTRAINT "FK_GLS_VCHGRP_2_GLS_STDVCH" FOREIGN KEY ("YR", "VGNO")
	  REFERENCES "YSKY_SMS"."GLS_VCHGRP" ("YR", "VGNO") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
