
  CREATE TABLE "YSKY_SMS"."CPM_BENCH_RATE" 
   (	"BENCH_RATE_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"B_RATE_TYPE_CODE" VARCHAR2(4) NOT NULL ENABLE, 
	"BENCH_RATE" NUMERIC(10,6), 
	"ACTIVE_DATE" DATE, 
	 CONSTRAINT "PK_CPM_BENCH_RATE" PRIMARY KEY ("BENCH_RATE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_BENC_REL_B_RAT_CPM_BENC" FOREIGN KEY ("B_RATE_TYPE_CODE")
	  REFERENCES "YSKY_SMS"."CPM_BENCHMARK_RATE_TYPE" ("B_RATE_TYPE_CODE") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
