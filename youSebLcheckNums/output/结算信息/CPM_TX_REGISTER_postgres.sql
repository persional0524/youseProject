
  CREATE TABLE "YSKY_SMS"."CPM_TX_REGISTER" 
   (	"REGISTER_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"REGISTER_TYPE_CODE" VARCHAR2(8) NOT NULL ENABLE, 
	"OCCUR_DATE" DATE, 
	"REL_TX_ID" NUMERIC(*,0) NOT NULL ENABLE, 
	"REGISTER_MANAGER" VARCHAR2(50), 
	"REGISTER_DESCRIBE" VARCHAR2(255), 
	"REMARK" VARCHAR2(255), 
	 CONSTRAINT "PK_CPM_TX_REGISTER" PRIMARY KEY ("REGISTER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_CPM_TX_R_REF_CPM_TX_R1" FOREIGN KEY ("REGISTER_TYPE_CODE")
	  REFERENCES "YSKY_SMS"."CPM_TX_REGISTER_TYPE" ("REGISTER_TYPE_CODE") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
