
  CREATE TABLE "YSKY_SMS"."CPM_SB_UNIT" 
   (	"ACCOUNT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"CPM_ACCOUNT_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"PRIOR_UNIT_ID" NUMERIC(*,0), 
	"ACC_CLASS" VARCHAR2(50), 
	"SB_UNIT_TYPE" VARCHAR2(4), 
	"OVER_DATE" DATE, 
	"BIZ_COMMON" VARCHAR2(100), 
	"TREAT_WAY" NUMERIC(*,0), 
	"ATTEND_ACCOUNT_ID" NUMERIC(*,0), 
	"EXTEND_FLAG" NUMERIC(*,0), 
	 CONSTRAINT "PK_CPM_SB_UNIT" PRIMARY KEY ("ACCOUNT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_SB_U_REL_SBU_A_CPM_ACCO" FOREIGN KEY ("CPM_ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_ACCOUNT" ("ACCOUNT_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_SB_U_INHERITAN_CPM_BOOK" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "YSKY_SMS"."CPM_BOOK_UNIT" ("ACCOUNT_ID") ENABLE, 
	 CONSTRAINT "FK_CPM_SB_U_REFERENCE_CPM_SB_U" FOREIGN KEY ("PRIOR_UNIT_ID")
	  REFERENCES "YSKY_SMS"."CPM_SB_UNIT" ("ACCOUNT_ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
