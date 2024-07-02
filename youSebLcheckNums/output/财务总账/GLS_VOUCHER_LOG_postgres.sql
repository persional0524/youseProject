
  CREATE TABLE "YSKY_SMS"."GLS_VOUCHER_LOG" 
   (	"LOGID" NUMERIC(*,0) NOT NULL ENABLE, 
	"VID" NUMERIC(*,0), 
	"ACTION" NUMERIC(*,0), 
	"MEMO" VARCHAR2(254), 
	"OPERATOR" VARCHAR2(100), 
	"OPERATORNAME" VARCHAR2(100), 
	"CREATETIME" TIMESTAMP (6), 
	 CONSTRAINT "PK_GLS_VOUCHER_LOG" PRIMARY KEY ("LOGID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
