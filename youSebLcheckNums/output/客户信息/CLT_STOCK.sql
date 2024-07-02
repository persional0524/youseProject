
  CREATE TABLE "YSKY_SMS"."CLT_STOCK" 
   (	"ID" NUMBER(6,0) NOT NULL ENABLE, 
	"CLTNO" VARCHAR2(30), 
	"STOCKCODE" VARCHAR2(20), 
	"STOCKNAME" VARCHAR2(40), 
	"LISTINGDATE" DATE, 
	"LISTINGPLACE" VARCHAR2(40), 
	"STATUS" NUMBER(*,0), 
	"TYPE" VARCHAR2(20), 
	"TOTALSHARE" NUMBER(*,0), 
	"CIRCULSHARE" NUMBER(*,0), 
	"CREATOR" VARCHAR2(24), 
	"CREATETIME" DATE, 
	"MODIFIER" VARCHAR2(24), 
	"MODIFYTIME" DATE, 
	"DELETEFLAG" NUMBER(*,0), 
	 CONSTRAINT "PK_CLT_STOCK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "T003"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
