
  CREATE TABLE "YSKY_SMS"."GLS_KMCLASS" 
   (	"YR" NUMBER(*,0) NOT NULL ENABLE, 
	"KM" VARCHAR2(16) NOT NULL ENABLE, 
	"MGNO" VARCHAR2(30) NOT NULL ENABLE, 
	"FILLSTYLE" NUMBER(*,0) DEFAULT 1 NOT NULL ENABLE, 
	"SPLITVAL" NUMBER(*,0) DEFAULT 0, 
	"SHOWORD" NUMBER(*,0) DEFAULT 0, 
	"BRANCH_NO" VARCHAR2(6) NOT NULL ENABLE, 
	 CONSTRAINT "CKC_GLS_KMCLASS_FILLSTYLE" CHECK (FILLSTYLE=0 OR FILLSTYLE=1) ENABLE, 
	 CONSTRAINT "PK_GLS_KMCLASS" PRIMARY KEY ("YR", "KM", "MGNO", "BRANCH_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "CKC_GLS_KMCLASS_YR" CHECK (YR between 1900 and 2999) ENABLE, 
	 CONSTRAINT "CKC_GLS_KMCLASS_SPLITVAL" CHECK (SPLITVAL=0 OR SPLITVAL=1) ENABLE, 
	 CONSTRAINT "FK_GLS_KM_2_GLS_KMCLASS" FOREIGN KEY ("YR", "KM")
	  REFERENCES "YSKY_SMS"."GLS_KM" ("YR", "KM") ENABLE, 
	 CONSTRAINT "FK_GLS_MGRP_2_GLS_KMCLASS" FOREIGN KEY ("YR", "MGNO")
	  REFERENCES "YSKY_SMS"."GLS_MGRP" ("YR", "MGNO") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
