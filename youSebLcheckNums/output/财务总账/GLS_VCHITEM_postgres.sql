
  CREATE TABLE "YSKY_SMS"."GLS_VCHITEM" 
   (	"VIID" NUMERIC(*,0) NOT NULL ENABLE, 
	"YR" NUMERIC(*,0), 
	"KM" VARCHAR2(16), 
	"VID" NUMERIC(*,0), 
	"UUID" VARCHAR2(36), 
	"DIR" NUMERIC(*,0) NOT NULL ENABLE, 
	"EXPLAIN" VARCHAR2(255), 
	"VAL" NUMERIC(16,2), 
	"LOCALRATE" NUMERIC(10,6), 
	"ORIGINALVAL" NUMERIC(16,2) NOT NULL ENABLE, 
	"PRICE" NUMERIC(16,6), 
	"QTY" NUMERIC(16,4), 
	"UNIT" VARCHAR2(10), 
	"AUXCODE" VARCHAR2(12), 
	"OPTAG" NUMERIC(*,0), 
	"OPKM" VARCHAR2(1024), 
	"OPKMNAME" VARCHAR2(1024), 
	"TXID" NUMERIC(*,0), 
	"VCH_ID" NUMERIC(*,0), 
	"CUST_NO" VARCHAR2(32), 
	"TAIL_DIFFERENCE" NUMERIC(16,4), 
	"SYS_CASHFLOW" VARCHAR2(120), 
	"SYS_DEPTCONTACT" VARCHAR2(18), 
	"SYS_PERSONALCONTACT" VARCHAR2(18), 
	"USER_DEF1" VARCHAR2(30), 
	"USER_DEF2" VARCHAR2(30), 
	"USER_DEF3" VARCHAR2(30), 
	"USER_DEF4" VARCHAR2(30), 
	"USER_DEF5" VARCHAR2(30), 
	"USER_DEF6" VARCHAR2(30), 
	"USER_DEF7" VARCHAR2(30), 
	"USER_DEF8" VARCHAR2(30), 
	"USER_DEF9" VARCHAR2(30), 
	"USER_DEF10" VARCHAR2(30), 
	"USER_DEF11" VARCHAR2(30), 
	"USER_DEF12" VARCHAR2(30), 
	"USER_DEF13" VARCHAR2(30), 
	"USER_DEF14" VARCHAR2(30), 
	"USER_DEF15" VARCHAR2(30), 
	"ASSISTDESC" VARCHAR2(254), 
	"ASSIST" VARCHAR2(254), 
	"FINGERPRINT" VARCHAR2(254), 
	 CONSTRAINT "CKC_GLS_VCHITEM_YR" CHECK (YR between 1900 and 2999) ENABLE, 
	 CONSTRAINT "PK_GLS_VCHITEM" PRIMARY KEY ("VIID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE, 
	 CONSTRAINT "CKC_GLS_VCHITEM_DIR" CHECK (DIR=1 OR DIR=2) ENABLE, 
	 CONSTRAINT "FK_GLS_KM_2_GLS_VCHITEM" FOREIGN KEY ("YR", "KM")
	  REFERENCES "YSKY_SMS"."GLS_KM" ("YR", "KM") ENABLE, 
	 CONSTRAINT "FK_GLS_VOUCHER_2_GLS_VCHITEM" FOREIGN KEY ("VID")
	  REFERENCES "YSKY_SMS"."GLS_VOUCHER" ("VID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
