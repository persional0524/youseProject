
  CREATE TABLE "YSKY_SMS"."SIS_ACCOUNT_SET_PD" 
   (	"FID" NUMBER(*,0) NOT NULL ENABLE, 
	"CLTNO" VARCHAR2(60) NOT NULL ENABLE, 
	"ACCTNO" VARCHAR2(60), 
	"IS_BANK" VARCHAR2(2), 
	"ACCTNAME" VARCHAR2(60), 
	"CREATE_TIME" DATE, 
	"IS_FUNDACCT" VARCHAR2(2) NOT NULL ENABLE, 
	"PROVINCE" VARCHAR2(10), 
	"CITY" VARCHAR2(10), 
	"OWN_BANK" VARCHAR2(64), 
	"OPEN_BANK" VARCHAR2(60), 
	"CLTNAME" VARCHAR2(60), 
	"CHECKACCTNO" VARCHAR2(60), 
	"ACCTID" NUMBER(*,0), 
	"CHECK_ACCT_KM" VARCHAR2(60), 
	 CONSTRAINT "SIS_ACCOUNT_SET_PD" PRIMARY KEY ("FID")
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
