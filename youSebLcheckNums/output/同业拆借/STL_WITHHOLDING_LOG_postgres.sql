
  CREATE TABLE "YSKY_SMS"."STL_WITHHOLDING_LOG" 
   (	"WL_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"STLID" NUMERIC(*,0), 
	"RATE" NUMERIC(10,4), 
	"INTEREST_AMOUNT" NUMERIC(15,2), 
	"WITHHOLDING_DATE" TIMESTAMP (6), 
	"INTEREST_DAYS" NUMERIC(*,0), 
	"CREATE_DATE" TIMESTAMP (6), 
	 CONSTRAINT "PK_STL_WITHHOLDING_LOG" PRIMARY KEY ("WL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_STL_WITH_REFERENCE_STL_APPL" FOREIGN KEY ("STLID")
	  REFERENCES "YSKY_SMS"."STL_APPLY" ("STLID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
