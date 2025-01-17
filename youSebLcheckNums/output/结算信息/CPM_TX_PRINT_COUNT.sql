
  CREATE TABLE "YSKY_SMS"."CPM_TX_PRINT_COUNT" 
   (	"PRINT_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"TX_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"PRINT_CHANNEL_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"VOUCHER_TYPE_FLAG" NUMBER(*,0), 
	"PRINT_COUNT" NUMBER(*,0), 
	 CONSTRAINT "PK_CPM_TX_PRINT_COUNT" PRIMARY KEY ("PRINT_ID")
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
