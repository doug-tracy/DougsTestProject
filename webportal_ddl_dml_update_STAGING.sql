spool webportal_staging.log
-- connect SYSTEM/SYSTEM_PASSWORD@staging_sa 
--this is SYSTEM IN Staging SA  
set def off        
          
alter tablespace platform_common_data rename to access_canoe_data;     
alter tablespace platform_common_index rename to access_canoe_indx;     

/*  Hand coded by doug tracy since "liquibase" is not currently run on staging-->prod */

--------------------------------------------------------
--  DDL for Table DATABASECHANGELOGLOCK
--------------------------------------------------------

  CREATE TABLE "WEB_PORTAL"."DATABASECHANGELOGLOCK" 
   (	"ID" NUMBER(*,0), 
	"LOCKED" NUMBER(1,0), 
	"LOCKGRANTED" TIMESTAMP (6), 
	"LOCKEDBY" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "ACCESS_CANOE__DATA" ;
--------------------------------------------------------
--  DDL for Index PK_DATABASECHANGELOGLOCK
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB_PORTAL"."PK_DATABASECHANGELOGLOCK" ON "WEB_PORTAL"."DATABASECHANGELOGLOCK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "ACCESS_CANOE_INDX" ;
--------------------------------------------------------
--  Constraints for Table DATABASECHANGELOGLOCK
--------------------------------------------------------

  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOGLOCK" ADD CONSTRAINT "PK_DATABASECHANGELOGLOCK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;
 
  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOGLOCK" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOGLOCK" MODIFY ("LOCKED" NOT NULL ENABLE);


--------------------------------------------------------
--  DDL for Table DATABASECHANGELOG
--------------------------------------------------------

  CREATE TABLE "WEB_PORTAL"."DATABASECHANGELOG" 
   (	"ID" VARCHAR2(63 BYTE), 
	"AUTHOR" VARCHAR2(63 BYTE), 
	"FILENAME" VARCHAR2(200 BYTE), 
	"DATEEXECUTED" TIMESTAMP (6), 
	"ORDEREXECUTED" NUMBER(*,0), 
	"EXECTYPE" VARCHAR2(10 BYTE), 
	"MD5SUM" VARCHAR2(35 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"COMMENTS" VARCHAR2(255 BYTE), 
	"TAG" VARCHAR2(255 BYTE), 
	"LIQUIBASE" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "ACCESS_CANOE_DATA" ;
--------------------------------------------------------
--  DDL for Index PK_DATABASECHANGELOG
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB_PORTAL"."PK_DATABASECHANGELOG" ON "WEB_PORTAL"."DATABASECHANGELOG" ("ID", "AUTHOR", "FILENAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "ACCESS_CANOE_INDX" ;
--------------------------------------------------------
--  Constraints for Table DATABASECHANGELOG
--------------------------------------------------------

  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOG" ADD CONSTRAINT "PK_DATABASECHANGELOG" PRIMARY KEY ("ID", "AUTHOR", "FILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;
 
  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOG" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOG" MODIFY ("AUTHOR" NOT NULL ENABLE);
 
  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOG" MODIFY ("FILENAME" NOT NULL ENABLE);
 
  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOG" MODIFY ("DATEEXECUTED" NOT NULL ENABLE);
 
  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOG" MODIFY ("ORDEREXECUTED" NOT NULL ENABLE);
 
  ALTER TABLE "WEB_PORTAL"."DATABASECHANGELOG" MODIFY ("EXECTYPE" NOT NULL ENABLE);

/*  End of hand coding by doug tracy since liquibase is not currently in staging-->prod */          

drop table web_portal.security_question cascade constraints purge;     
  CREATE TABLE "WEB_PORTAL"."SECURITY_QUESTION"           
   (	"SECURITY_QUESTION_SID" NUMBER(38,0),   
	"QUESTION" VARCHAR2(255 CHAR), 
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0',      
	"VERSION" NUMBER(22,0)         
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into web_portal.security_question values ('1',     
'What is the name of the High School you graduated from?','System',    
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('2',     
'What is the name of your hometown newspaper?','System',  
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('3',     
'What year did you graduate from High School?','System',  
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('4',     
'What was the name of your first pet?','System',          
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('5',     
'What city were you born in?','System',      
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('6',     
'What was your high school mascot?','System',
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('7',     
'What was your favorite team sport you played as a child?','System',   
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('8',     
'What was your favorite childhood television show?','System',          
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('9',     
'What is your spouse/significant others father''s first name?','System',            
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('10',    
'What was your major in college?','System',  
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('11',    
'In what town was your first job?','System', 
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('12',    
'What was the name/location of your childhood vacation spot?','System',
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('13',    
'What was the make of your family car growing up? (e.g., Dodge)','System',          
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('14',    
'What color was your first vehicle?','System',            
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('15',    
'What is the name of the establishment where your wedding reception was held?','System',         
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
insert into web_portal.security_question values ('16',    
'What is the first name of the maid of honor or best man from your wedding?','System',           
to_timestamp('05-MAY-11 04.07.50.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),           
'0','');           
      
commit;            
drop table web_portal.users cascade constraints purge;    
  CREATE TABLE "WEB_PORTAL"."USERS"          
   (	"USER_SID" NUMBER(38,0),   
	"USER_NAME" VARCHAR2(255 CHAR),
	"SECURITY_ANSWER" VARCHAR2(255 CHAR),       
	"SECURITY_QUESTION_SID" NUMBER(38,0),       
	"VERSION" NUMBER(22,0),        
	"BADATTEMPTS" NUMBER DEFAULT 0,
	"CONTACT_URI" VARCHAR2(255 CHAR),           
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0'       
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into web_portal.users values ('100034',            
'susan307','','','0',           
'0','/sysdata/api/v1/canoe-contact/70034',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100035',            
'Test306a','Denver','1','0',    
'0','/sysdata/api/v1/canoe-contact/70035',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100031',            
'cpizzurro','','','0',          
'0','/sysdata/api/v1/canoe-contact/70031',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100020',            
'reedyb','Rossville','1','0',   
'0','/sysdata/api/v1/canoe-contact/70020',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100027',            
'nctakiosk','Cherry Creek','1','0',          
'0','/sysdata/api/v1/canoe-contact/70027',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100029',            
'Susieq','Denver','1','0',      
'0','/sysdata/api/v1/canoe-contact/70029',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100018',            
'hblack','1976','3','0',        
'0','/sysdata/api/v1/canoe-contact/70018',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100019',            
'tjmoretto','Cherry Creek','1','0',          
'0','/sysdata/api/v1/canoe-contact/70019',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100030',            
'jmunoz','Coronado','1','0',    
'0','/sysdata/api/v1/canoe-contact/70030',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100036',            
'AdOps1','Denver','1','0',      
'0','/sysdata/api/v1/canoe-contact/70036',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100028',            
'dsweeney','','','0',           
'0','/sysdata/api/v1/canoe-contact/70028',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('6000', 
'canoeadmin','Denver','1','0',  
'0','/sysdata/api/v1/canoe-contact/24000',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100025',            
'jdonnenfeld','red','14','0',   
'0','/sysdata/api/v1/canoe-contact/70025',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100026',            
'aorduna','Manila','5','0',     
'0','/sysdata/api/v1/canoe-contact/70026',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100037',            
'Qatester8','','','0',          
'0','/sysdata/api/v1/canoe-contact/70037',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100032',            
'stagetst1','Denver','1','0',   
'0','/sysdata/api/v1/canoe-contact/70032',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
insert into web_portal.users values ('100033',            
'SusanM','Denver','1','0',      
'0','/sysdata/api/v1/canoe-contact/70033',   
'','','access_canoe',to_timestamp('01-FEB-12 02.05.44.911898 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'0'); 
      
commit;            
drop table web_portal.display_group cascade constraints purge;         
  CREATE TABLE "WEB_PORTAL"."DISPLAY_GROUP"  
   (	"DISPLAY_GROUP_SID" NUMBER(38,0),       
	"DISPLAY_ORDER_NUMBER" NUMBER(*,0),         
	"DESCRIPTION" VARCHAR2(512 CHAR),           
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0',      
	"VERSION" NUMBER(22,0),        
	"NETWORK_URI" VARCHAR2(255 CHAR),           
	"IMAGE_URI" VARCHAR2(255 CHAR) 
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into web_portal.display_group values ('100013',    
'-3','Products & Services','hblack',         
to_timestamp('09-JUN-11 10.21.53.803000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 03.38.54.732000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','4',           
'/sysdata/api/v1/network/21001','');         
      
insert into web_portal.display_group values ('100015',    
'-1','Products & Services','hblack',         
to_timestamp('09-JUN-11 10.35.27.220000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.40.15.444000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','6',           
'/sysdata/api/v1/network/21000','');         
      
insert into web_portal.display_group values ('100016',    
'-2','Sales Tools & Materials ','hblack',    
to_timestamp('10-JUN-11 10.25.48.722000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.39.26.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','2',           
'/sysdata/api/v1/network/21001','');         
      
insert into web_portal.display_group values ('100017',    
'2','Sales Tools & Materials ','hblack',     
to_timestamp('10-JUN-11 10.39.46.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.39.47.754000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','7',           
'/sysdata/api/v1/network/21000','');         
      
insert into web_portal.display_group values ('100009',    
'3','Sales Operations','tjmoretto',          
to_timestamp('08-JUN-11 04.45.46.633000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.39.39.907000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','3',           
'/sysdata/api/v1/network/21002','');         
      
insert into web_portal.display_group values ('100012',    
'-1','Products & Services','hblack',         
to_timestamp('09-JUN-11 10.14.35.672000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.38.38.603000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','5',           
'/sysdata/api/v1/network/21002','');         
      
insert into web_portal.display_group values ('100018',    
'3','Sales Tools & Materials ','hblack',     
to_timestamp('10-JUN-11 11.58.14.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.39.39.921000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','6',           
'/sysdata/api/v1/network/21002','');         
      
insert into web_portal.display_group values ('100019',    
'0','Products & Services','tjmoretto',       
to_timestamp('13-JUN-11 03.37.17.360000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.40.15.449000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','4',           
'/sysdata/api/v1/network/21003','');         
      
insert into web_portal.display_group values ('100020',    
'2','Sales Operations','tjmoretto',          
to_timestamp('13-JUN-11 03.38.21.054000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.40.00.408000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','4',           
'/sysdata/api/v1/network/21003','');         
      
insert into web_portal.display_group values ('100021',    
'1','Sales Tools & Materials','tjmoretto',   
to_timestamp('13-JUN-11 03.40.12.781000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.40.15.428000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1',           
'/sysdata/api/v1/network/21003','');         
      
insert into web_portal.display_group values ('100022',    
'0','Products & Services','tjmoretto',       
to_timestamp('04-AUG-11 01.27.57.042000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('04-AUG-11 01.27.57.042000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0',           
'/sysdata/api/v1/network/21006','');         
      
insert into web_portal.display_group values ('100010',    
'3','Sales Operations','tjmoretto',          
to_timestamp('08-JUN-11 04.49.26.542000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 03.39.39.969000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','5',           
'/sysdata/api/v1/network/21001','');         
      
insert into web_portal.display_group values ('100011',    
'3','Sales Operations','tjmoretto',          
to_timestamp('08-JUN-11 04.50.03.157000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.39.39.979000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','3',           
'/sysdata/api/v1/network/21000','');         
      
insert into web_portal.display_group values ('100023',    
'0','Susan''s Icon Test','tjmoretto',        
to_timestamp('23-JAN-12 11.27.43.497000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('23-JAN-12 11.27.43.497000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0',           
'/sysdata/api/v1/network/21005','');         
      
commit;            
drop table web_portal.email_job cascade constraints purge;
  CREATE TABLE "WEB_PORTAL"."EMAIL_JOB"      
   (	"EMAIL_JOB_SID" NUMBER(38,0),           
	"RESOURCE_DISPLAY_SID" NUMBER(38,0),        
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0',      
	"VERSION" NUMBER(22,0),        
	"NETWORK_URI" VARCHAR2(255 CHAR)            
   )  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING   
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
drop table web_portal.fulfillment_calc_plan cascade constraints purge; 
  CREATE TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN"       
   (	"FC_PLAN_SID" NUMBER(38,0),
	"USER_SID" NUMBER(38,0),       
	"PLAN_NAME" VARCHAR2(255 CHAR),
	"IS_PRIVATE" CHAR(1 BYTE),     
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 BYTE) DEFAULT '0',      
	"VERSION" NUMBER(22,0),        
	"NETWORK_URI" VARCHAR2(255 CHAR)            
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100015',         
'100027','Coke 2011','0','TJ Moretto',       
to_timestamp('16-NOV-11 08.30.31.115000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.115000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100004',         
'100025','test','0','Jamie Donnenfeld',      
to_timestamp('09-JUN-11 01.27.18.147000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'jdonnenfeld',to_timestamp('13-JUN-11 10.01.49.490000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'1','1','/sysdata/api/v1/network/21002');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100003',         
'100019','Gillette Spring 2011','0','TJ Moretto',         
to_timestamp('09-JUN-11 10.41.17.326000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('09-JUN-11 11.55.36.651000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'1','1','/sysdata/api/v1/network/21002');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100009',         
'100018','Summer 2011 brochure','0','Harold Black',       
to_timestamp('13-JUN-11 08.26.41.887000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 04.26.33.905000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','/sysdata/api/v1/network/21000');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100010',         
'100018','Summer 2011 Brochure','0','Harold Black',       
to_timestamp('13-JUN-11 08.31.05.751000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.751000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100011',         
'100018','Summer 2011 Sample','0','Harold Black',         
to_timestamp('13-JUN-11 08.36.00.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100012',         
'100018','Summer 2011 brochure','0','Harold Black',       
to_timestamp('13-JUN-11 04.03.24.824000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 04.25.56.502000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','/sysdata/api/v1/network/21003');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100013',         
'100018','Summer 2011 sample','0','Harold Black',         
to_timestamp('13-JUN-11 04.06.07.743000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 04.26.05.689000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','/sysdata/api/v1/network/21003');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100007',         
'100018','Summer 2011 sample','0','Harold Black',         
to_timestamp('10-JUN-11 03.03.12.906000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 04.26.19.188000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','/sysdata/api/v1/network/21001');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100005',         
'100018','Summer 2011 sample','0','Harold Black',         
to_timestamp('10-JUN-11 02.54.57.304000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.09.21.915000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'1','1','/sysdata/api/v1/network/21002');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100006',         
'100018','Summer 2011 Brochure','0','Harold Black',       
to_timestamp('10-JUN-11 02.58.28.116000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 03.59.21.239000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2','/sysdata/api/v1/network/21002');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100008',         
'100018','Summer 2011 sample','0','Harold Black',         
to_timestamp('10-JUN-11 03.08.53.873000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.28.01.194000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','/sysdata/api/v1/network/21000');    
      
insert into WEB_PORTAL.fulfillment_calc_plan values ('100014',         
'100027','Gillette Summer 2011','1','TJ Moretto',         
to_timestamp('02-AUG-11 07.11.59.729000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.729000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003');    
      
commit;            
drop table web_portal.key_value_pair cascade constraints purge;        
  CREATE TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" 
   (	"FC_PLAN_SID" NUMBER(38,0),
	"KEY_NAME" VARCHAR2(255 CHAR), 
	"VALUE_STORED" VARCHAR2(4000 CHAR),         
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0',      
	"VERSION" NUMBER(22,0)         
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into web_portal.key_value_pair values ('100013',   
'budgetQty','25000','hblack',   
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100013',   
'numWeeks','8','hblack',        
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.889000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100013',   
'leadFee','0','hblack',         
to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.40.19.032000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','3');          
      
insert into web_portal.key_value_pair values ('100013',   
'responseRate','0.95','hblack', 
to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100013',   
'rowRating','{"WK8":"0.5","WK4":"0.5","WK5":"0.5","Totals":"","WK6":"0.5","WK7":"0.5","WK3":"0.5","WK2":"0.5","WK1":"0.5","firstCol":"Rating"}','hblack',         
to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.895000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100013',   
'enablementFee','0','hblack',   
to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.40.19.039000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','2');          
      
insert into web_portal.key_value_pair values ('100013',   
'households','19100000','hblack',            
to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100013',   
'totalEnablements','24','hblack',            
to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.752000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'rowResponseRate','{"WK8":"0.5","WK4":"0.5","WK5":"0.5","Totals":"","WK6":"0.5","WK7":"0.5","WK3":"0.5","WK2":"0.5","WK1":"0.5","firstCol":"Response Rate"}','nctakiosk',      
to_timestamp('02-AUG-11 07.11.59.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'budgetQty','20000','nctakiosk',
to_timestamp('02-AUG-11 07.11.59.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'rowLead','{"WK8":"7354","WK4":"7354","WK5":"19100","Totals":"70578","WK6":"7354","WK7":"7354","WK3":"7354","WK2":"7354","WK1":"7354","firstCol":"Leads"}','nctakiosk',        
to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'rowDisplay','{"WK8":"1470700","WK4":"1470700","WK5":"3820000","Totals":"14114900","WK6":"1470700","WK7":"1470700","WK3":"1470700","WK2":"1470700","WK1":"1470700","firstCol":"Displays"}','nctakiosk',  
to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'totalEnablements','80','nctakiosk',         
to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'enablementFee','125','nctakiosk',           
to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'weeklyRating','0.77','nctakiosk',           
to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'offerType','Coupon','nctakiosk',            
to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'households','19100000','nctakiosk',         
to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'rowEnablement','{"WK8":"10","WK4":"10","WK5":"10","Totals":"80","WK6":"10","WK7":"10","WK3":"10","WK2":"10","WK1":"10","firstCol":"Enablements"}','nctakiosk',   
to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'rowRating','{"WK8":"0.77","WK4":"0.77","WK5":"2","Totals":"","WK6":"0.77","WK7":"0.77","WK3":"0.77","WK2":"0.77","WK1":"0.77","firstCol":"Rating"}','nctakiosk', 
to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'responseRate','0.5','nctakiosk',            
to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'advertiser','Proctor & Gamble','nctakiosk', 
to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'budgetType','Dollars','nctakiosk',          
to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'leadFee','0.15','nctakiosk',   
to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'rowLeadFee','{"WK8":"$2353","WK4":"$2353","WK5":"$4115","Totals":"$20586","WK6":"$2353","WK7":"$2353","WK3":"$2353","WK2":"$2353","WK1":"$2353","firstCol":"Cost"}','nctakiosk',           
to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'totalDollars','20586','nctakiosk',          
to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'rowHousehold','{"WK8":"19.1","WK4":"19.1","WK5":"19.1","Totals":"153","WK6":"19.1","WK7":"19.1","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','nctakiosk', 
to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'numWeeks','8','nctakiosk',     
to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'startDate','08/05/2011','nctakiosk',        
to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100014',   
'totalLeads','70578','nctakiosk',            
to_timestamp('02-AUG-11 07.11.59.827000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('02-AUG-11 07.11.59.827000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'totalDollars','8441','nctakiosk',           
to_timestamp('16-NOV-11 08.30.31.161000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.161000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'totalEnablements','72','nctakiosk',         
to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'rowHousehold','{"WK8":"12","WK4":"12","WK5":"12","Totals":"96","WK6":"12","WK7":"12","WK3":"12","WK2":"12","WK1":"12","firstCol":"Households"}','nctakiosk',     
to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'offerType','Coupon','nctakiosk',            
to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'numWeeks','8','nctakiosk',     
to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'rowRating','{"WK8":".75","WK4":".75","WK5":".75","Totals":"","WK6":".75","WK7":".75","WK3":".75","WK2":".2","WK1":".75","firstCol":"Rating"}','nctakiosk',       
to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'totalLeads','14715','nctakiosk',            
to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.162000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'advertiser','Coke','nctakiosk',
to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'rowEnablement','{"WK8":"9","WK4":"9","WK5":"9","Totals":"72","WK6":"9","WK7":"9","WK3":"9","WK2":"9","WK1":"9","firstCol":"Enablements"}','nctakiosk',           
to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'budgetType','Dollars','nctakiosk',          
to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'budgetQty','10000','nctakiosk',
to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'households','12000000','nctakiosk',         
to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'startDate','11/16/2011','nctakiosk',        
to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'rowDisplay','{"WK8":"810000","WK4":"810000","WK5":"810000","Totals":"5886000","WK6":"810000","WK7":"810000","WK3":"810000","WK2":"216000","WK1":"810000","firstCol":"Displays"}','nctakiosk',           
to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'responseRate','0.25','nctakiosk',           
to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'weeklyRating','.75','nctakiosk',            
to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'rowLeadFee','{"WK8":"$1148","WK4":"$1148","WK5":"$1148","Totals":"$8441","WK6":"$1148","WK7":"$1148","WK3":"$1148","WK2":"$405","WK1":"$1148","firstCol":"Cost"}','nctakiosk',
to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'rowResponseRate','{"WK8":"0.25","WK4":"0.25","WK5":"0.25","Totals":"","WK6":"0.25","WK7":"0.25","WK3":"0.25","WK2":"0.25","WK1":"0.25","firstCol":"Final Response Rate"}','nctakiosk',     
to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'rowLead','{"WK8":"2025","WK4":"2025","WK5":"2025","Totals":"14715","WK6":"2025","WK7":"2025","WK3":"2025","WK2":"540","WK1":"2025","firstCol":"Final Responses"}','nctakiosk',
to_timestamp('16-NOV-11 08.30.31.165000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.165000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'enablementFee','15','nctakiosk',            
to_timestamp('16-NOV-11 08.30.31.165000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.165000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100015',   
'leadFee','0.5','nctakiosk',    
to_timestamp('16-NOV-11 08.30.31.165000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('16-NOV-11 08.30.31.165000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'rowRating','{"Totals":"","WK2":"0.77","WK1":"0.77","firstCol":"Rating"}','jdonnenfeld',         
to_timestamp('09-JUN-11 01.27.18.258000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.258000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'startDate','06/27/2011','jdonnenfeld',      
to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'rowLeadFee','{"Totals":"$0","WK2":"$0.00","WK1":"$0.00","firstCol":"Cost"}','jdonnenfeld',      
to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'enablementFee','0','jdonnenfeld',           
to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'offerType','Brochure','jdonnenfeld',        
to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'responseRate','0.1','jdonnenfeld',          
to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'rowEnablement','{"Totals":"60","WK2":"0","WK1":"60","firstCol":"Enablements"}','jdonnenfeld',   
to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'totalEnablements','60','jdonnenfeld',       
to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'leadFee','0','jdonnenfeld',    
to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.259000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'rowHousehold','{"Totals":"16","WK2":"8","WK1":"8","firstCol":"Households"}','jdonnenfeld',      
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'totalLeads','3720','jdonnenfeld',           
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'weeklyRating','0.77','jdonnenfeld',         
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'households','8000000','jdonnenfeld',        
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'totalDollars','0','jdonnenfeld',            
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'numWeeks','2','jdonnenfeld',   
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'budgetQty','0','jdonnenfeld',  
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'rowLead','{"Totals":"3720","WK2":"0","WK1":"3720","firstCol":"Leads"}','jdonnenfeld',           
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'rowResponseRate','{"Totals":"","WK2":"0.1","WK1":"0.1","firstCol":"Response Rate"}','jdonnenfeld',           
to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'budgetType','Leads','jdonnenfeld',          
to_timestamp('09-JUN-11 01.27.18.261000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.261000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'rowDisplay','{"Totals":"3696000","WK2":"0","WK1":"3696000","firstCol":"Displays"}','jdonnenfeld',            
to_timestamp('09-JUN-11 01.27.18.261000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.261000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100004',   
'advertiser','test','jdonnenfeld',           
to_timestamp('09-JUN-11 01.27.18.261000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 01.27.18.261000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'rowLead','{"WK8":"3082","WK4":"3082","WK5":"3082","Totals":"24656","WK6":"3082","WK7":"3082","WK3":"3082","WK2":"3082","WK1":"3082","firstCol":"Leads"}','tjmoretto',         
to_timestamp('09-JUN-11 10.41.17.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'advertiser','Proctor and Gamble','tjmoretto',            
to_timestamp('09-JUN-11 10.41.17.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'rowRating','{"WK8":"3.5","WK4":"3.5","WK5":"3.5","Totals":"","WK6":"3.5","WK7":"3.5","WK3":"3.5","WK2":"3.5","WK1":"3.5","firstCol":"Rating"}','tjmoretto',      
to_timestamp('09-JUN-11 10.41.17.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'rowDisplay','{"WK8":"15375500","WK4":"15375500","WK5":"15375500","Totals":"123004000","WK6":"15375500","WK7":"15375500","WK3":"15375500","WK2":"15375500","WK1":"15375500","firstCol":"Displays"}','tjmoretto',      
to_timestamp('09-JUN-11 10.41.17.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'totalEnablements','184','tjmoretto',        
to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'totalLeads','24656','tjmoretto',            
to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'rowResponseRate','{"WK8":"0.02","WK4":"0.02","WK5":"0.02","Totals":"","WK6":"0.02","WK7":"0.02","WK3":"0.02","WK2":"0.02","WK1":"0.02","firstCol":"Response Rate"}','tjmoretto',           
to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'rowEnablement','{"WK8":"23","WK4":"23","WK5":"23","Totals":"184","WK6":"23","WK7":"23","WK3":"23","WK2":"23","WK1":"23","firstCol":"Enablements"}','tjmoretto',  
to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'enablementFee','125','tjmoretto',           
to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'weeklyRating','3.5','tjmoretto',            
to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'rowHousehold','{"WK8":"19.1","WK4":"19.1","WK5":"19.1","Totals":"153","WK6":"19.1","WK7":"19.1","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','tjmoretto', 
to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'households','19100000','tjmoretto',         
to_timestamp('09-JUN-11 10.41.17.340000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.340000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'rowLeadFee','{"WK8":"$3645.50","WK4":"$3645.50","WK5":"$3645.50","Totals":"$29164.00","WK6":"$3645.50","WK7":"$3645.50","WK3":"$3645.50","WK2":"$3645.50","WK1":"$3645.50","firstCol":"Cost"}','tjmoretto',          
to_timestamp('09-JUN-11 10.41.17.340000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.340000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'responseRate','0.02','tjmoretto',           
to_timestamp('09-JUN-11 10.41.17.340000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.340000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'startDate','06/08/2011','tjmoretto',        
to_timestamp('09-JUN-11 10.41.17.340000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.340000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'numWeeks','8','tjmoretto',     
to_timestamp('09-JUN-11 10.41.17.341000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.341000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'offerType','Brochure','tjmoretto',          
to_timestamp('09-JUN-11 10.41.17.342000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.342000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'budgetType','Dollars','tjmoretto',          
to_timestamp('09-JUN-11 10.41.17.342000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.342000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'totalDollars','29164.00','tjmoretto',       
to_timestamp('09-JUN-11 10.41.17.342000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.342000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'budgetQty','30000','tjmoretto',
to_timestamp('09-JUN-11 10.41.17.343000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.343000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100003',   
'leadFee','0.01','tjmoretto',   
to_timestamp('09-JUN-11 10.41.17.343000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 10.41.17.343000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'startDate','06/27/2011','hblack',           
to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'leadFee','1.00','hblack',      
to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'weeklyRating','0.65','hblack', 
to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'budgetQty','7500','hblack',    
to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'totalDollars','7440.00','hblack',           
to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'offerType','Brochure','hblack',
to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'rowResponseRate','{"WK4":"0.25","WK5":"0.25","Totals":"","WK6":"0.25","WK3":"0.25","WK2":"0.25","WK1":"0.25","firstCol":"Response Rate"}','hblack', 
to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'responseRate','0.25','hblack', 
to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'rowHousehold','{"WK4":"19.1","WK5":"19.1","Totals":"115","WK6":"19.1","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',    
to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'rowLead','{"WK4":"1240","WK5":"1240","Totals":"7440","WK6":"1240","WK3":"1240","WK2":"1240","WK1":"1240","firstCol":"Leads"}','hblack',
to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'rowEnablement','{"WK4":"4","WK5":"4","Totals":"24","WK6":"4","WK3":"4","WK2":"4","WK1":"4","firstCol":"Enablements"}','hblack',        
to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'rowRating','{"WK4":"0.65","WK5":"0.65","Totals":"","WK6":"0.65","WK3":"0.65","WK2":"0.65","WK1":"0.65","firstCol":"Rating"}','hblack', 
to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'enablementFee','0','hblack',   
to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'rowDisplay','{"WK4":"496600","WK5":"496600","Totals":"2979600","WK6":"496600","WK3":"496600","WK2":"496600","WK1":"496600","firstCol":"Displays"}','hblack',     
to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'totalEnablements','24','hblack',            
to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'totalLeads','7440','hblack',   
to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'households','19100000','hblack',            
to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'rowLeadFee','{"WK4":"$1240.00","WK5":"$1240.00","Totals":"$7440.00","WK6":"$1240.00","WK3":"$1240.00","WK2":"$1240.00","WK1":"$1240.00","firstCol":"Cost"}','hblack',         
to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'advertiser','Advertiser B','hblack',        
to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'budgetType','Dollars','hblack',
to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100009',   
'numWeeks','6','hblack',        
to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.26.41.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'offerType','Brochure','hblack',
to_timestamp('13-JUN-11 08.31.05.754000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.754000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'rowRating','{"WK4":"0.65","Totals":"","WK3":"0.65","WK2":"0.65","WK1":"0.65","firstCol":"Rating"}','hblack', 
to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'leadFee','1.00','hblack',      
to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'rowResponseRate','{"WK4":"0.25","Totals":"","WK3":"0.25","WK2":"0.25","WK1":"0.25","firstCol":"Response Rate"}','hblack', 
to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'totalLeads','7440','hblack',   
to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'rowEnablement','{"WK4":"6","Totals":"24","WK3":"6","WK2":"6","WK1":"6","firstCol":"Enablements"}','hblack',  
to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'rowDisplay','{"WK4":"744900","Totals":"2979600","WK3":"744900","WK2":"744900","WK1":"744900","firstCol":"Displays"}','hblack',         
to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'totalDollars','7440.00','hblack',           
to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'rowLead','{"WK4":"1550","WK5":"1550","Totals":"9300","WK6":"1550","WK3":"1550","WK2":"1550","WK1":"1550","firstCol":"Leads"}','hblack',
to_timestamp('10-JUN-11 02.58.28.119000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.12.48.145000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100006',   
'totalEnablements','30','hblack',            
to_timestamp('10-JUN-11 02.58.28.119000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.12.48.152000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100006',   
'advertiser','Advertiser A','hblack',        
to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.38.30.372000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100006',   
'weeklyRating','0.65','hblack', 
to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'totalDollars','9300.00','hblack',           
to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.12.48.150000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100006',   
'rowDisplay','{"WK4":"620750","WK5":"620750","Totals":"3724500","WK6":"620750","WK3":"620750","WK2":"620750","WK1":"620750","firstCol":"Displays"}','hblack',     
to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.12.48.140000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100006',   
'leadFee','1.00','hblack',      
to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('10-JUN-11 03.07.00.689000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100006',   
'rowHousehold','{"WK4":"19.1","WK5":"19.1","Totals":"115","WK6":"19.1","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',    
to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'households','19100000','hblack',            
to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'rowRating','{"WK4":"0.65","WK5":"0.65","Totals":"","WK6":"0.65","WK3":"0.65","WK2":"0.65","WK1":"0.65","firstCol":"Rating"}','hblack', 
to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'rowResponseRate','{"WK4":"0.25","WK5":"0.25","Totals":"","WK6":"0.25","WK3":"0.25","WK2":"0.25","WK1":"0.25","firstCol":"Response Rate"}','hblack', 
to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'startDate','06/20/2011','hblack',           
to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'enablementFee','0','hblack',   
to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'budgetType','Dollars','hblack',
to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'responseRate','0.25','hblack', 
to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'numWeeks','6','hblack',        
to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'budgetQty','10000','hblack',   
to_timestamp('10-JUN-11 02.58.28.122000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.12.48.136000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100006',   
'rowLeadFee','{"WK4":"$1550.00","WK5":"$1550.00","Totals":"$9300.00","WK6":"$1550.00","WK3":"$1550.00","WK2":"$1550.00","WK1":"$1550.00","firstCol":"Cost"}','hblack',         
to_timestamp('10-JUN-11 02.58.28.122000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.12.48.147000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100006',   
'offerType','Brochure','hblack',
to_timestamp('10-JUN-11 02.58.28.122000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.58.28.122000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100006',   
'totalLeads','9300','hblack',   
to_timestamp('10-JUN-11 02.58.28.122000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.12.48.155000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100006',   
'rowEnablement','{"WK4":"5","WK5":"5","Totals":"30","WK6":"5","WK3":"5","WK2":"5","WK1":"5","firstCol":"Enablements"}','hblack',        
to_timestamp('10-JUN-11 02.58.28.122000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.12.48.142000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100005',   
'rowRating','{"WK4":"0.5","Totals":"","WK3":"0.5","WK2":"0.5","WK1":"0.5","firstCol":"Rating"}','hblack',     
to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'households','19100000','hblack',            
to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'budgetQty','4000','hblack',    
to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'offerType','Product Sample','hblack',       
to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'totalEnablements','4','hblack',
to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'rowLeadFee','{"WK4":"$0.00","Totals":"$0.00","WK3":"$0.00","WK2":"$0.00","WK1":"$0.00","firstCol":"Cost"}','hblack',      
to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'rowResponseRate','{"WK4":"0.95","Totals":"","WK3":"0.95","WK2":"0.95","WK1":"0.95","firstCol":"Response Rate"}','hblack', 
to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'weeklyRating','0.5','hblack',  
to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'rowDisplay','{"WK4":"95500","Totals":"382000","WK3":"95500","WK2":"95500","WK1":"95500","firstCol":"Displays"}','hblack', 
to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'rowHousehold','{"WK4":"19.1","Totals":"76","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',     
to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'enablementFee','0','hblack',   
to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'rowLead','{"WK4":"907","Totals":"3628","WK3":"907","WK2":"907","WK1":"907","firstCol":"Leads"}','hblack',    
to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'advertiser','Advertiser A','hblack',        
to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'responseRate','0.95','hblack', 
to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'budgetType','Leads','hblack',  
to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'rowEnablement','{"WK4":"1","Totals":"4","WK3":"1","WK2":"1","WK1":"1","firstCol":"Enablements"}','hblack',   
to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'totalDollars','0.00','hblack', 
to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'startDate','07/01/2011','hblack',           
to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'numWeeks','4','hblack',        
to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'totalLeads','3628','hblack',   
to_timestamp('10-JUN-11 02.54.57.315000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.315000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100005',   
'leadFee','0','hblack',         
to_timestamp('10-JUN-11 02.54.57.315000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 02.54.57.315000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'households','19100000','hblack',            
to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'rowLeadFee','{"WK4":"$0.00","Totals":"$0.00","WK3":"$0.00","WK2":"$0.00","WK1":"$0.00","firstCol":"Cost"}','hblack',      
to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'advertiser','Advertiser A','hblack',        
to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'budgetType','Leads','hblack',  
to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'totalLeads','21768','hblack',  
to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.19.21.450000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100007',   
'offerType','Product Sample','hblack',       
to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.909000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'rowResponseRate','{"WK4":"0.95","Totals":"","WK3":"0.95","WK2":"0.95","WK1":"0.95","firstCol":"Response Rate"}','hblack', 
to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'numWeeks','4','hblack',        
to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'rowHousehold','{"WK4":"19.1","Totals":"76","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',     
to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'responseRate','0.95','hblack', 
to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'enablementFee','0','hblack',   
to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'rowLead','{"WK4":"5442","Totals":"21768","WK3":"5442","WK2":"5442","WK1":"5442","firstCol":"Leads"}','hblack',            
to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.19.21.437000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100007',   
'totalEnablements','24','hblack',            
to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.19.21.443000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100007',   
'leadFee','0','hblack',         
to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'budgetQty','25000','hblack',   
to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.19.21.416000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100007',   
'rowDisplay','{"WK4":"573000","Totals":"2292000","WK3":"573000","WK2":"573000","WK1":"573000","firstCol":"Displays"}','hblack',         
to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.19.21.423000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100007',   
'rowEnablement','{"WK4":"6","Totals":"24","WK3":"6","WK2":"6","WK1":"6","firstCol":"Enablements"}','hblack',  
to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.19.21.428000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100007',   
'rowRating','{"WK4":"0.5","Totals":"","WK3":"0.5","WK2":"0.5","WK1":"0.5","firstCol":"Rating"}','hblack',     
to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'weeklyRating','0.5','hblack',  
to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'totalDollars','0.00','hblack', 
to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100007',   
'startDate','06/20/2011','hblack',           
to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.03.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'households','19100000','hblack',            
to_timestamp('10-JUN-11 03.08.53.880000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.880000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'totalLeads','21768','hblack',  
to_timestamp('10-JUN-11 03.08.53.880000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.21.13.715000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100008',   
'startDate','06/27/2011','hblack',           
to_timestamp('10-JUN-11 03.08.53.880000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.880000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'rowHousehold','{"WK4":"19.1","Totals":"76","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',     
to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'offerType','Product Sample','hblack',       
to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'responseRate','0.95','hblack', 
to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'enablementFee','0','hblack',   
to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'budgetQty','25000','hblack',   
to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.21.13.699000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100008',   
'totalDollars','0.00','hblack', 
to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'rowEnablement','{"WK4":"6","Totals":"24","WK3":"6","WK2":"6","WK1":"6","firstCol":"Enablements"}','hblack',  
to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.21.13.704000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100008',   
'rowResponseRate','{"WK4":"0.95","Totals":"","WK3":"0.95","WK2":"0.95","WK1":"0.95","firstCol":"Response Rate"}','hblack', 
to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.881000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'weeklyRating','0.5','hblack',  
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'rowDisplay','{"WK4":"573000","Totals":"2292000","WK3":"573000","WK2":"573000","WK1":"573000","firstCol":"Displays"}','hblack',         
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.21.13.702000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100010',   
'rowLead','{"WK4":"1860","Totals":"7440","WK3":"1860","WK2":"1860","WK1":"1860","firstCol":"Leads"}','hblack',
to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'totalEnablements','24','hblack',            
to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'advertiser','Advertiser B','hblack',        
to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'enablementFee','0','hblack',   
to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'budgetQty','7500','hblack',    
to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'weeklyRating','0.65','hblack', 
to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'rowLeadFee','{"WK4":"$1860.00","Totals":"$7440.00","WK3":"$1860.00","WK2":"$1860.00","WK1":"$1860.00","firstCol":"Cost"}','hblack',    
to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'households','19100000','hblack',            
to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'numWeeks','4','hblack',        
to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'budgetType','Dollars','hblack',
to_timestamp('13-JUN-11 08.31.05.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'rowHousehold','{"WK4":"19.1","Totals":"76","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',     
to_timestamp('13-JUN-11 08.31.05.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'responseRate','0.25','hblack', 
to_timestamp('13-JUN-11 08.31.05.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100010',   
'startDate','06/20/2011','hblack',           
to_timestamp('13-JUN-11 08.31.05.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.31.05.757000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'rowHousehold','{"WK4":"19.1","Totals":"76","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',     
to_timestamp('13-JUN-11 08.36.00.822000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.822000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'weeklyRating','0.5','hblack',  
to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'households','19100000','hblack',            
to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'budgetType','Leads','hblack',  
to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'rowRating','{"WK4":"0.5","Totals":"","WK3":"0.5","WK2":"0.5","WK1":"0.5","firstCol":"Rating"}','hblack',     
to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'leadFee','0','hblack',         
to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'rowLead','{"WK4":"5442","Totals":"21768","WK3":"5442","WK2":"5442","WK1":"5442","firstCol":"Leads"}','hblack',            
to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'rowResponseRate','{"WK4":"0.95","Totals":"","WK3":"0.95","WK2":"0.95","WK1":"0.95","firstCol":"Response Rate"}','hblack', 
to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'rowRating','{"WK4":"0.5","Totals":"","WK3":"0.5","WK2":"0.5","WK1":"0.5","firstCol":"Rating"}','hblack',     
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'advertiser','Advertiser A','hblack',        
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'rowLeadFee','{"WK4":"$0.00","Totals":"$0.00","WK3":"$0.00","WK2":"$0.00","WK1":"$0.00","firstCol":"Cost"}','hblack',      
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'budgetType','Leads','hblack',  
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'numWeeks','4','hblack',        
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100008',   
'rowLead','{"WK4":"5442","Totals":"21768","WK3":"5442","WK2":"5442","WK1":"5442","firstCol":"Leads"}','hblack',            
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.21.13.710000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100008',   
'totalEnablements','24','hblack',            
to_timestamp('10-JUN-11 03.08.53.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 08.21.13.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100008',   
'leadFee','0','hblack',         
to_timestamp('10-JUN-11 03.08.53.883000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('10-JUN-11 03.08.53.883000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'numWeeks','4','hblack',        
to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'rowLeadFee','{"WK4":"$0.00","Totals":"$0.00","WK3":"$0.00","WK2":"$0.00","WK1":"$0.00","firstCol":"Cost"}','hblack',      
to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'rowDisplay','{"WK4":"573000","Totals":"2292000","WK3":"573000","WK2":"573000","WK1":"573000","firstCol":"Displays"}','hblack',         
to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'advertiser','Advertiser B','hblack',        
to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'totalDollars','0.00','hblack', 
to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'startDate','06/27/2011','hblack',           
to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'budgetQty','25000','hblack',   
to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'rowEnablement','{"WK4":"6","Totals":"24","WK3":"6","WK2":"6","WK1":"6","firstCol":"Enablements"}','hblack',  
to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'offerType','Product Sample','hblack',       
to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'enablementFee','0','hblack',   
to_timestamp('13-JUN-11 08.36.00.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'responseRate','0.95','hblack', 
to_timestamp('13-JUN-11 08.36.00.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'totalEnablements','24','hblack',            
to_timestamp('13-JUN-11 08.36.00.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100011',   
'totalLeads','21768','hblack',  
to_timestamp('13-JUN-11 08.36.00.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 08.36.00.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'rowLead','{"WK8":"1242","WK4":"1242","WK5":"1242","Totals":"9936","WK6":"1242","WK7":"1242","WK3":"1242","WK2":"1242","WK1":"1242","firstCol":"Leads"}','hblack',
to_timestamp('13-JUN-11 04.03.24.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.38.04.648000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100012',   
'rowDisplay','{"WK8":"496600","WK4":"496600","WK5":"496600","Totals":"3972800","WK6":"496600","WK7":"496600","WK3":"496600","WK2":"496600","WK1":"496600","firstCol":"Displays"}','hblack', 
to_timestamp('13-JUN-11 04.03.24.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.38.04.679000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100012',   
'advertiser','Advertiser A','hblack',        
to_timestamp('13-JUN-11 04.03.24.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.03.24.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'budgetQty','10000','hblack',   
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'totalLeads','9936','hblack',   
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.38.04.701000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100012',   
'startDate','06/27/2011','hblack',           
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'totalDollars','9936','hblack', 
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.38.04.707000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100012',   
'offerType','Brochure','hblack',
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'rowLeadFee','{"WK8":"$1242","WK4":"$1242","WK5":"$1242","Totals":"$9936","WK6":"$1242","WK7":"$1242","WK3":"$1242","WK2":"$1242","WK1":"$1242","firstCol":"Cost"}','hblack',  
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.38.04.721000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100012',   
'rowResponseRate','{"WK8":"0.25","WK4":"0.25","WK5":"0.25","Totals":"","WK6":"0.25","WK7":"0.25","WK3":"0.25","WK2":"0.25","WK1":"0.25","firstCol":"Response Rate"}','hblack', 
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.38.04.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100012',   
'households','19100000','hblack',            
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'rowRating','{"WK8":"0.65","WK4":"0.65","WK5":"0.65","Totals":"","WK6":"0.65","WK7":"0.65","WK3":"0.65","WK2":"0.65","WK1":"0.65","firstCol":"Rating"}','hblack', 
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.38.04.749000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100012',   
'responseRate','0.25','hblack', 
to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.03.24.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'weeklyRating','0.65','hblack', 
to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'totalEnablements','32','hblack',            
to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.38.04.755000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100012',   
'enablementFee','175','hblack', 
to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.38.31.409000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100012',   
'leadFee','1.00','hblack',      
to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('13-JUN-11 04.07.03.980000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1');          
      
insert into web_portal.key_value_pair values ('100012',   
'budgetType','Dollars','hblack',
to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100012',   
'rowEnablement','{"WK8":"4","WK4":"4","WK5":"4","Totals":"32","WK6":"4","WK7":"4","WK3":"4","WK2":"4","WK1":"4","firstCol":"Enablements"}','hblack', 
to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.38.04.760000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2');          
      
insert into web_portal.key_value_pair values ('100012',   
'numWeeks','8','hblack',        
to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.38.04.765000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100012',   
'rowHousehold','{"WK8":"19.1","WK4":"19.1","WK5":"19.1","Totals":"153","WK6":"19.1","WK7":"19.1","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',    
to_timestamp('13-JUN-11 04.03.24.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.38.04.770000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100013',   
'rowDisplay','{"WK8":"286500","WK4":"286500","WK5":"286500","Totals":"2292000","WK6":"286500","WK7":"286500","WK3":"286500","WK2":"286500","WK1":"286500","firstCol":"Displays"}','hblack', 
to_timestamp('13-JUN-11 04.06.07.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.901000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100013',   
'weeklyRating','0.5','hblack',  
to_timestamp('13-JUN-11 04.06.07.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100013',   
'rowLead','{"WK8":"2722","WK4":"2722","WK5":"2722","Totals":"21776","WK6":"2722","WK7":"2722","WK3":"2722","WK2":"2722","WK1":"2722","firstCol":"Leads"}','hblack',            
to_timestamp('13-JUN-11 04.06.07.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.907000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100013',   
'startDate','06/27/2011','hblack',           
to_timestamp('13-JUN-11 04.06.07.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100013',   
'rowLeadFee','{"WK8":"$0","WK4":"$0","WK5":"$0","Totals":"$0","WK6":"$0","WK7":"$0","WK3":"$0","WK2":"$0","WK1":"$0","firstCol":"Cost"}','hblack',   
to_timestamp('13-JUN-11 04.06.07.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.40.29.812000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','4');          
      
insert into web_portal.key_value_pair values ('100013',   
'rowResponseRate','{"WK8":"0.95","WK4":"0.95","WK5":"0.95","Totals":"","WK6":"0.95","WK7":"0.95","WK3":"0.95","WK2":"0.95","WK1":"0.95","firstCol":"Response Rate"}','hblack', 
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.918000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100013',   
'offerType','Product Sample','hblack',       
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100013',   
'rowHousehold','{"WK8":"19.1","WK4":"19.1","WK5":"19.1","Totals":"153","WK6":"19.1","WK7":"19.1","WK3":"19.1","WK2":"19.1","WK1":"19.1","firstCol":"Households"}','hblack',    
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.924000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100013',   
'budgetType','Leads','hblack',  
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100013',   
'advertiser','Advertiser B','hblack',        
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0');          
      
insert into web_portal.key_value_pair values ('100013',   
'totalLeads','21776','hblack',  
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.929000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
insert into web_portal.key_value_pair values ('100013',   
'totalDollars','0','hblack',    
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('01-AUG-11 04.40.29.818000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','4');          
      
insert into web_portal.key_value_pair values ('100013',   
'rowEnablement','{"WK8":"3","WK4":"3","WK5":"3","Totals":"24","WK6":"3","WK7":"3","WK3":"3","WK2":"3","WK1":"3","firstCol":"Enablements"}','hblack', 
to_timestamp('13-JUN-11 04.06.07.751000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.941000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1');          
      
commit;            
drop table web_portal.resources cascade constraints purge;
  CREATE TABLE "WEB_PORTAL"."RESOURCES"      
   (	"RESOURCE_SID" NUMBER(38,0),            
	"RESOURCE_TITLE" VARCHAR2(255 CHAR),        
	"SUMMARY_DESCRIPTION" VARCHAR2(1024 CHAR),  
	"FULL_SYSTEM_PATH" VARCHAR2(1024 CHAR),     
	"MIME_TYPE" VARCHAR2(255 CHAR),
	"FILE_SIZE" NUMBER(38,0),      
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0',      
	"VERSION" NUMBER(22,0),        
	"TO_BE_WATERMARKED" CHAR(1 CHAR) DEFAULT '0'
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into web_portal.resources values ('100007',        
'RFI Proof of Performance Report Sample','The Proof of Performance Report summarizes performance for an order. The report shows Overlay Displays, Initial Interactions, Pre-Processed Responses and Final Responses.  It is sent 48 hrs after each airing and with the monthly invoice.','2011061012102497_RFI Proof of Performance Sample.pdf',        
'application/pdf',to_number('17047'),'tjmoretto',         
to_timestamp('08-JUN-11 04.40.50.874000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('10-JUN-11 12.10.24.100000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','0');      
      
insert into web_portal.resources values ('100009',        
' Canoe Ventures Overview Sheet',' Learn how Canoe Ventures brings ease, relevance, engagement and value to Advanced TV.','2011060909142281_BusinessOfBetterTelevision_OneSheet_2.pdf',     
'application/pdf',to_number('183207'),'hblack',           
to_timestamp('09-JUN-11 09.14.22.095000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('23-JAN-12 11.28.25.893000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1','1');      
      
insert into web_portal.resources values ('100005',        
'RFI Creative Form','The RFI Creative Form captures the creative aspects of an RFI Order.  Email the completed form <a href="mailTo:creativeproduction@canoe-ventures.com">here</a> and Canoe will work closely with the Agency/Advertiser on the design of the overlay.','20110608162623863_RFI Canoe Interactive CREATIVE Form 042011.xlsx',          
'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',to_number('72576'),'tjmoretto',           
to_timestamp('08-JUN-11 04.26.23.896000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('08-JUN-11 04.29.29.244000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','3','0');      
      
insert into web_portal.resources values ('100010',        
'Request for Information (RFI) Overview Sheet','Learn how Canoe''s Interactive RFI product adds value by enhancing TV spots and engaging consumers.','20110609092055511_RFI_OneSheet_alt_3.pdf',         
'application/pdf',to_number('195716'),'hblack',           
to_timestamp('09-JUN-11 09.20.55.514000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 09.20.55.514000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','0');      
      
insert into web_portal.resources values ('100011',        
'Polling Overview Sheet','Learn how Canoe''s Interactive Polling product adds value by enhancing TV spots and engaging consumers.','20110609092259150_Polling_OneSheet_2.pdf', 
'application/pdf',to_number('226267'),'hblack',           
to_timestamp('09-JUN-11 09.22.59.153000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('09-JUN-11 09.35.32.367000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','0');      
      
insert into web_portal.resources values ('100012',        
'Canoe Enabled Networks Sheet','Detailed information on networks enabled by Canoe.','20110609093346190_Canoe Programming partners.pdf', 
'application/pdf',to_number('238729'),'hblack',           
to_timestamp('09-JUN-11 09.33.46.209000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('12-JUN-11 12.29.08.213000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2','0');      
      
insert into web_portal.resources values ('100013',        
'Trivia Overview Sheet','Learn how Canoe''s Interactive Trivia product adds value by enhancing TV spots and engaging consumers.','20110609093944548_Trivia_OneSheet_2.pdf',    
'application/pdf',to_number('212823'),'hblack',           
to_timestamp('09-JUN-11 09.39.44.551000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('12-JUN-11 12.31.32.506000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1','0');      
      
insert into web_portal.resources values ('100014',        
'On Demand Dynamic Ad Insertion Overview Sheet','Learn how Canoe''s Dynamic Ad Insertion product adds value by enhancing the relevance of your TV spots within On Demand programming.','20110609094942123_DAI_OneSheet.pdf',       
'application/pdf',to_number('220182'),'hblack',           
to_timestamp('09-JUN-11 09.49.42.126000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('09-JUN-11 09.49.42.126000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','0');      
      
insert into web_portal.resources values ('100015',        
'Canoe ITV Footprint Overview','Valuable information regarding the market coverage of the Canoe Interactive TV footprint. ','20110609095953372_Canoe ITV Footprint.pdf',       
'application/pdf',to_number('91272'),'hblack',            
to_timestamp('09-JUN-11 09.59.53.375000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('12-JUN-11 12.29.32.643000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1','0');      
      
insert into web_portal.resources values ('100016',        
'Innovation Lab Overview','Learn about Canoe?s Innovation lab - created to explore the growing opportunities afforded by the connected digital TV ecosystem.','20110609101238871_Innovation Lab_OneSheet.pdf',        
'application/pdf',to_number('173254'),'hblack',           
to_timestamp('09-JUN-11 10.12.38.875000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('12-JUN-11 12.33.23.003000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1','0');      
      
insert into web_portal.resources values ('100017',        
'E! June, 2011 Estimated RFI Households','A report detailing the number of E! ITV households.','20110610103652357_E! June2011 Est Deployment of Enabled Households for RFI_June8 2011.pdf', 
'application/pdf',to_number('93816'),'hblack',            
to_timestamp('10-JUN-11 10.36.52.385000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('10-JUN-11 10.45.47.786000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','0');      
      
insert into web_portal.resources values ('100018',        
'Style June, 2011 Estimated RFI Households','A report detailing the number of [Network Name] ITV households.','20110610103851832_Style June2011 Est Deployment of Enabled Households for RFI_June8 2011.pdf',         
'application/pdf',to_number('94212'),'hblack',            
to_timestamp('10-JUN-11 10.38.51.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('12-JUN-11 12.31.12.643000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','2','0');      
      
insert into web_portal.resources values ('100019',        
'AMC June, 2011 Estimated RFI Households','A report detailing the number of AMC ITV households.','20110610104456190_AMC June2011 Est Deployment of Enabled Households for RFI_June 8 2011.pdf',          
'application/pdf',to_number('50773'),'hblack',            
to_timestamp('10-JUN-11 10.44.56.194000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('12-JUN-11 12.32.08.626000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','3','0');      
      
insert into web_portal.resources values ('100021',        
'Canoe Ventures Advanced TV Platform Sheet','Information about the Canoe Advanced TV Platform & its multi-product structure.','20110612123944529_Marketecture_10.8-2.pdf',     
'application/pdf',to_number('237711'),'tjmoretto',        
to_timestamp('12-JUN-11 12.39.44.534000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('12-JUN-11 12.39.44.534000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','0');      
      
insert into web_portal.resources values ('100022',        
'Interactive Sales Presentation','A set of slides to aid national ad sales in selling in interactive capabilities.  Incorporate complete pages or assets into your presentations.  Soon Available via CustomShow!','20110612125706312_Canoe Ventures - Sales Presentation - 2011-06.pptx',          
'application/vnd.openxmlformats-officedocument.presentationml.presentation',to_number('12021197'),'tjmoretto',
to_timestamp('12-JUN-11 12.57.06.347000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('12-JUN-11 12.57.06.347000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','0');      
      
insert into web_portal.resources values ('100025',        
'RFI Consumer Video','Consumer-facing Video:  What is RFI and How does i','20110722110905161_20110720091115837_Canoe-Education-Video-h264.mp4',      
'video/mp4',to_number('4006860'),'tjmoretto',
to_timestamp('22-JUL-11 11.09.05.180000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'SusanM',to_timestamp('01-AUG-11 04.32.19.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','3','0');      
      
insert into web_portal.resources values ('100004',        
'RFI Overlay Specifications and Recommendations','The RFI Overlay Specifications and Recommendations provides advertising specifications on the design of the overlay, including the necessary graphic and text needed in order to create the overlay.','20110609114721287_RFI_SpecificationsRecommendations060311.pdf',      
'application/pdf',to_number('331636'),'tjmoretto',        
to_timestamp('08-JUN-11 04.19.34.174000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('09-JUN-11 11.47.21.297000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','0');      
      
insert into web_portal.resources values ('100006',        
'RFI Order Form','The RFI Order Form is used to initiate a Canoe Order.  Once a deal has been completed, the Network should email the completed order form <a href="mailTo:canoeorders@canoe-ventures.com">here</a>.','20110608163125653_RFI Canoe Interactive Order Form 042711.xls', 
'application/vnd.ms-excel',to_number('103936'),'tjmoretto',            
to_timestamp('08-JUN-11 04.31.25.656000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('08-JUN-11 04.31.37.067000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','1','0');      
      
insert into web_portal.resources values ('100008',        
'RFI Flight Activity Performance Report Sample','The Flight Activity Performance Report summarizes performance across multiple orders.  The report shows Overlay Displays, Initial Interactions, Offer Prompt Positive Interactions, Pre-Processed Responses and Final Responses.  It is sent upon request.','20110610120651659_RFI Flight Activity Sample.pdf',     
'application/pdf',to_number('19016'),'tjmoretto',         
to_timestamp('08-JUN-11 04.45.04.823000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'hblack',to_timestamp('10-JUN-11 12.06.51.665000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'0','1','0');      
      
insert into web_portal.resources values ('100023',        
'Network Ad Sales Toolkit','A comprehensive reference guide providing tools that help HISTORY sales teams effectively target and plan client/agency meetings, to communicate and sell the benefits of ITV solutions and to operationally execute a Canoe-enabled campaign.','20110613154355790_Canoe Ventures - NAS Toolkit - HISTORY - 2011-04-19.pdf',
'application/pdf',to_number('8287996'),'tjmoretto',       
to_timestamp('13-JUN-11 03.43.55.822000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'tjmoretto',to_timestamp('13-JUN-11 03.46.03.636000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'0','2','0');      
      
insert into web_portal.resources values ('100024',        
'Canoe 101','An overview of Canoe, our Solutions and how with HISTORY they benefit the ecosystem - networks, agencies, advertisers and consumers.','20110613154542751_History Training 1 April 2011 v2 NOBEL.pdf',    
'application/pdf',to_number('4780648'),'tjmoretto',       
to_timestamp('13-JUN-11 03.45.42.948000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 03.45.42.948000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','0');      
      
commit;            
drop table web_portal.resource_company_list cascade constraints purge; 
  CREATE TABLE "WEB_PORTAL"."RESOURCE_COMPANY_LIST"       
   (	"RESOURCE_COMPANY_LIST_SID" NUMBER(38,0),            
	"RESOURCE_SID" NUMBER(38,0),   
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0',      
	"VERSION" NUMBER(22,0),        
	"COMPANY_URI" VARCHAR2(255 CHAR)            
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into WEB_PORTAL.resource_company_list values ('100149',         
'100008','tjmoretto',to_timestamp('13-JUN-11 03.42.08.980000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.08.980000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100150',         
'100008','tjmoretto',to_timestamp('13-JUN-11 03.42.08.987000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.08.987000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100117',         
'100021','tjmoretto',to_timestamp('13-JUN-11 03.41.00.240000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.00.240000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100118',         
'100021','tjmoretto',to_timestamp('13-JUN-11 03.41.00.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.00.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100145',         
'100006','tjmoretto',to_timestamp('13-JUN-11 03.41.59.212000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.59.212000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100125',         
'100022','tjmoretto',to_timestamp('13-JUN-11 03.41.15.544000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.15.544000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100133',         
'100011','tjmoretto',to_timestamp('13-JUN-11 03.41.32.134000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.32.134000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100134',         
'100011','tjmoretto',to_timestamp('13-JUN-11 03.41.32.150000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.32.150000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100146',         
'100006','tjmoretto',to_timestamp('13-JUN-11 03.41.59.218000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.59.218000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100137',         
'100010','tjmoretto',to_timestamp('13-JUN-11 03.41.40.289000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.40.289000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100138',         
'100010','tjmoretto',to_timestamp('13-JUN-11 03.41.40.301000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.40.301000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100094',         
'100019','tjmoretto',to_timestamp('12-JUN-11 12.32.08.822000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('12-JUN-11 12.32.08.822000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100095',         
'100017','tjmoretto',to_timestamp('12-JUN-11 12.32.13.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('12-JUN-11 12.32.13.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100139',         
'100010','tjmoretto',to_timestamp('13-JUN-11 03.41.40.391000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.40.391000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100126',         
'100022','tjmoretto',to_timestamp('13-JUN-11 03.41.15.552000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.15.552000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100089',         
'100018','tjmoretto',to_timestamp('12-JUN-11 12.31.12.887000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('12-JUN-11 12.31.12.887000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100121',         
'100016','tjmoretto',to_timestamp('13-JUN-11 03.41.07.548000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.07.548000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100122',         
'100016','tjmoretto',to_timestamp('13-JUN-11 03.41.07.560000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.07.560000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100127',         
'100022','tjmoretto',to_timestamp('13-JUN-11 03.41.15.560000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.15.560000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100129',         
'100014','tjmoretto',to_timestamp('13-JUN-11 03.41.24.092000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.24.092000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100147',         
'100006','tjmoretto',to_timestamp('13-JUN-11 03.41.59.224000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.59.224000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100151',         
'100008','tjmoretto',to_timestamp('13-JUN-11 03.42.08.993000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.08.993000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100119',         
'100021','tjmoretto',to_timestamp('13-JUN-11 03.41.00.257000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.00.257000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100123',         
'100016','tjmoretto',to_timestamp('13-JUN-11 03.41.07.572000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.07.572000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100130',         
'100014','tjmoretto',to_timestamp('13-JUN-11 03.41.24.098000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.24.098000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100131',         
'100014','tjmoretto',to_timestamp('13-JUN-11 03.41.24.104000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.24.104000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100135',         
'100011','tjmoretto',to_timestamp('13-JUN-11 03.41.32.161000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.32.161000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100120',         
'100021','tjmoretto',to_timestamp('13-JUN-11 03.41.00.267000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.00.267000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100124',         
'100016','tjmoretto',to_timestamp('13-JUN-11 03.41.07.695000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.07.695000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100128',         
'100022','tjmoretto',to_timestamp('13-JUN-11 03.41.15.577000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.15.577000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100132',         
'100014','tjmoretto',to_timestamp('13-JUN-11 03.41.24.111000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.24.111000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100136',         
'100011','tjmoretto',to_timestamp('13-JUN-11 03.41.32.178000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.32.178000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100140',         
'100010','tjmoretto',to_timestamp('13-JUN-11 03.41.40.403000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.40.403000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100148',         
'100006','tjmoretto',to_timestamp('13-JUN-11 03.41.59.231000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.41.59.231000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100152',         
'100008','tjmoretto',to_timestamp('13-JUN-11 03.42.09.000000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.09.000000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100153',         
'100013','tjmoretto',to_timestamp('13-JUN-11 03.42.21.666000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.21.666000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100154',         
'100013','tjmoretto',to_timestamp('13-JUN-11 03.42.21.816000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.21.816000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100155',         
'100013','tjmoretto',to_timestamp('13-JUN-11 03.42.21.823000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.21.823000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100156',         
'100013','tjmoretto',to_timestamp('13-JUN-11 03.42.21.831000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.21.831000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100157',         
'100007','tjmoretto',to_timestamp('13-JUN-11 03.42.27.777000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.27.777000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100158',         
'100007','tjmoretto',to_timestamp('13-JUN-11 03.42.27.789000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.27.789000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100168',         
'100023','tjmoretto',to_timestamp('13-JUN-11 03.46.03.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.46.03.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100159',         
'100007','tjmoretto',to_timestamp('13-JUN-11 03.42.27.804000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.27.804000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100160',         
'100007','tjmoretto',to_timestamp('13-JUN-11 03.42.27.815000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.27.815000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100161',         
'100004','tjmoretto',to_timestamp('13-JUN-11 03.42.33.719000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.33.719000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100192',         
'100025','tjmoretto',to_timestamp('01-AUG-11 04.32.19.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('01-AUG-11 04.32.19.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100167',         
'100024','tjmoretto',to_timestamp('13-JUN-11 03.45.42.987000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.45.42.987000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100162',         
'100004','tjmoretto',to_timestamp('13-JUN-11 03.42.33.730000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.33.730000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100163',         
'100004','tjmoretto',to_timestamp('13-JUN-11 03.42.33.740000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.33.740000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100164',         
'100004','tjmoretto',to_timestamp('13-JUN-11 03.42.33.755000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.42.33.755000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100169',         
'100005','tjmoretto',to_timestamp('13-JUN-11 03.49.40.289000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.49.40.289000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100170',         
'100005','tjmoretto',to_timestamp('13-JUN-11 03.49.40.328000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.49.40.328000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100171',         
'100005','tjmoretto',to_timestamp('13-JUN-11 03.49.40.367000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.49.40.367000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100172',         
'100005','tjmoretto',to_timestamp('13-JUN-11 03.49.40.408000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('13-JUN-11 03.49.40.408000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100206',         
'100015','tjmoretto',to_timestamp('04-AUG-11 01.28.47.589000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.47.589000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100193',         
'100025','tjmoretto',to_timestamp('01-AUG-11 04.32.19.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('01-AUG-11 04.32.19.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100194',         
'100025','tjmoretto',to_timestamp('01-AUG-11 04.32.19.839000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('01-AUG-11 04.32.19.839000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100195',         
'100025','tjmoretto',to_timestamp('01-AUG-11 04.32.19.847000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('01-AUG-11 04.32.19.847000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100201',         
'100012','tjmoretto',to_timestamp('04-AUG-11 01.28.35.906000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.35.906000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100202',         
'100012','tjmoretto',to_timestamp('04-AUG-11 01.28.35.912000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.35.912000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100203',         
'100012','tjmoretto',to_timestamp('04-AUG-11 01.28.35.918000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.35.918000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100204',         
'100012','tjmoretto',to_timestamp('04-AUG-11 01.28.35.929000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.35.929000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100205',         
'100012','tjmoretto',to_timestamp('04-AUG-11 01.28.35.940000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.35.940000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21006' );   
      
insert into WEB_PORTAL.resource_company_list values ('100207',         
'100015','tjmoretto',to_timestamp('04-AUG-11 01.28.47.596000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.47.596000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100208',         
'100015','tjmoretto',to_timestamp('04-AUG-11 01.28.47.603000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.47.603000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100209',         
'100015','tjmoretto',to_timestamp('04-AUG-11 01.28.47.660000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.47.660000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100210',         
'100015','tjmoretto',to_timestamp('04-AUG-11 01.28.47.669000 PM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('04-AUG-11 01.28.47.669000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21006' );   
      
insert into WEB_PORTAL.resource_company_list values ('100218',         
'100009','tjmoretto',to_timestamp('23-JAN-12 11.28.26.125000 AM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('23-JAN-12 11.28.26.125000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21001' );   
      
insert into WEB_PORTAL.resource_company_list values ('100219',         
'100009','tjmoretto',to_timestamp('23-JAN-12 11.28.26.241000 AM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('23-JAN-12 11.28.26.241000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21002' );   
      
insert into WEB_PORTAL.resource_company_list values ('100220',         
'100009','tjmoretto',to_timestamp('23-JAN-12 11.28.26.249000 AM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('23-JAN-12 11.28.26.249000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21000' );   
      
insert into WEB_PORTAL.resource_company_list values ('100221',         
'100009','tjmoretto',to_timestamp('23-JAN-12 11.28.26.256000 AM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('23-JAN-12 11.28.26.256000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21003' );   
      
insert into WEB_PORTAL.resource_company_list values ('100222',         
'100009','tjmoretto',to_timestamp('23-JAN-12 11.28.26.266000 AM','DD-MON-YY HH.MI.SS.FF AM'),    
'',to_timestamp('23-JAN-12 11.28.26.266000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0','0','/sysdata/api/v1/network/21006' );   
      
commit;            
drop table web_portal.resource_display_list cascade constraints purge; 
  CREATE TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST"       
   (	"RESOURCE_DISPLAY_SID" NUMBER(38,0),    
	"DISPLAY_GROUP_SID" NUMBER(38,0),           
	"RESOURCE_SID" NUMBER(38,0),   
	"DISPLAY_ORDER_NUMBER" NUMBER(*,0),         
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0',      
	"VERSION" NUMBER(22,0)         
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into web_portal.resource_display_list values ('100127',         
'100012','100004','-13','tjmoretto',         
to_timestamp('29-AUG-11 11.14.07.568000 AM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('29-AUG-11 11.14.07.568000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100129',         
'100009','100019','-6','tjmoretto',          
to_timestamp('29-AUG-11 11.21.44.639000 AM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('29-AUG-11 11.21.44.639000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100007',         
'100009','100008','-1','tjmoretto',          
to_timestamp('08-JUN-11 04.48.35.708000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.22.48.552000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'10');
      
insert into web_portal.resource_display_list values ('100006',         
'100009','100007','-2','tjmoretto',          
to_timestamp('08-JUN-11 04.48.27.842000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.22.48.575000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'11');
      
insert into web_portal.resource_display_list values ('100021',         
'100012','100010','-6','hblack',
to_timestamp('09-JUN-11 10.18.01.546000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('29-AUG-11 11.23.10.071000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'5'); 
      
insert into web_portal.resource_display_list values ('100022',         
'100012','100013','-3','hblack',
to_timestamp('09-JUN-11 10.18.13.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('29-AUG-11 11.23.10.078000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'5'); 
      
insert into web_portal.resource_display_list values ('100020',         
'100012','100009','-10','hblack',            
to_timestamp('09-JUN-11 10.17.10.443000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('29-AUG-11 11.23.10.160000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100023',         
'100012','100014','-2','hblack',
to_timestamp('09-JUN-11 10.18.39.816000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('29-AUG-11 11.23.10.171000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'7'); 
      
insert into web_portal.resource_display_list values ('100024',         
'100012','100011','-4','hblack',
to_timestamp('09-JUN-11 10.18.50.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('29-AUG-11 11.23.10.181000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'8'); 
      
insert into web_portal.resource_display_list values ('100025',         
'100012','100015','-7','hblack',
to_timestamp('09-JUN-11 10.19.02.876000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('29-AUG-11 11.23.10.193000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'6'); 
      
insert into web_portal.resource_display_list values ('100026',         
'100012','100012','-8','hblack',
to_timestamp('09-JUN-11 10.19.31.568000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('29-AUG-11 11.23.10.205000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100027',         
'100012','100016','-1','hblack',
to_timestamp('09-JUN-11 10.20.03.138000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('29-AUG-11 11.23.10.220000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'3'); 
      
insert into web_portal.resource_display_list values ('100028',         
'100013','100009','-10','hblack',            
to_timestamp('09-JUN-11 10.22.04.759000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.01.214000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100029',         
'100013','100010','-6','hblack',
to_timestamp('09-JUN-11 10.22.18.270000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.09.444000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'5'); 
      
insert into web_portal.resource_display_list values ('100030',         
'100013','100014','-2','hblack',
to_timestamp('09-JUN-11 10.22.23.207000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.14.127000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'8'); 
      
insert into web_portal.resource_display_list values ('100032',         
'100013','100012','-9','hblack',
to_timestamp('09-JUN-11 10.22.54.214000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.01.223000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'6'); 
      
insert into web_portal.resource_display_list values ('100033',         
'100013','100011','-4','hblack',
to_timestamp('09-JUN-11 10.23.16.385000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.12.532000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'7'); 
      
insert into web_portal.resource_display_list values ('100034',         
'100013','100013','-3','hblack',
to_timestamp('09-JUN-11 10.23.32.845000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.14.117000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'7'); 
      
insert into web_portal.resource_display_list values ('100035',         
'100013','100015','-7','hblack',
to_timestamp('09-JUN-11 10.23.43.212000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.05.663000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100036',         
'100013','100016','-1','hblack',
to_timestamp('09-JUN-11 10.24.06.984000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('09-JUN-11 11.11.13.071000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'2'); 
      
insert into web_portal.resource_display_list values ('100045',         
'100015','100009','-9','hblack',
to_timestamp('09-JUN-11 10.35.50.386000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.49.951000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100046',         
'100015','100010','-5','hblack',
to_timestamp('09-JUN-11 10.35.57.584000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.58.656000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100047',         
'100015','100012','-7','hblack',
to_timestamp('09-JUN-11 10.36.03.141000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.49.955000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100048',         
'100015','100011','-3','hblack',
to_timestamp('09-JUN-11 10.36.10.918000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.02.02.518000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'6'); 
      
insert into web_portal.resource_display_list values ('100049',         
'100015','100013','-2','hblack',
to_timestamp('09-JUN-11 10.36.18.455000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.02.03.919000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'6'); 
      
insert into web_portal.resource_display_list values ('100050',         
'100015','100014','-1','hblack',
to_timestamp('09-JUN-11 10.36.25.357000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.02.03.930000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'6'); 
      
insert into web_portal.resource_display_list values ('100051',         
'100015','100015','-6','hblack',
to_timestamp('09-JUN-11 10.36.33.413000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('12-JUN-11 01.01.55.266000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100052',         
'100015','100016','0','hblack', 
to_timestamp('09-JUN-11 10.36.41.102000 AM','DD-MON-YY HH.MI.SS.FF AM'),'hblack',   
to_timestamp('09-JUN-11 11.12.53.283000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100053',         
'100016','100017','0','hblack', 
to_timestamp('10-JUN-11 10.37.14.432000 AM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('10-JUN-11 10.37.14.432000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100054',         
'100017','100018','0','hblack', 
to_timestamp('10-JUN-11 10.40.08.634000 AM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('10-JUN-11 10.40.08.634000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100058',         
'100018','100019','0','hblack', 
to_timestamp('10-JUN-11 11.59.31.133000 AM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('11-JUL-11 08.56.09.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'2'); 
      
insert into web_portal.resource_display_list values ('100003',         
'100009','100006','-5','tjmoretto',          
to_timestamp('08-JUN-11 04.45.57.273000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.22.48.589000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'5'); 
      
insert into web_portal.resource_display_list values ('100004',         
'100009','100005','-4','tjmoretto',          
to_timestamp('08-JUN-11 04.46.02.678000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.22.48.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'7'); 
      
insert into web_portal.resource_display_list values ('100005',         
'100009','100004','-3','tjmoretto',          
to_timestamp('08-JUN-11 04.46.12.158000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.22.48.618000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'8'); 
      
insert into web_portal.resource_display_list values ('100008',         
'100010','100008','0','tjmoretto',           
to_timestamp('08-JUN-11 04.49.33.443000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('08-JUN-11 04.49.33.443000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100009',         
'100010','100007','-1','tjmoretto',          
to_timestamp('08-JUN-11 04.49.36.317000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('08-JUN-11 04.49.36.317000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100010',         
'100010','100004','-2','tjmoretto',          
to_timestamp('08-JUN-11 04.49.39.230000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('08-JUN-11 04.49.39.230000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100011',         
'100010','100006','-4','tjmoretto',          
to_timestamp('08-JUN-11 04.49.41.711000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('13-JUN-11 03.50.17.540000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100012',         
'100010','100005','-3','tjmoretto',          
to_timestamp('08-JUN-11 04.49.43.981000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('13-JUN-11 03.50.17.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100013',         
'100011','100008','0','tjmoretto',           
to_timestamp('08-JUN-11 04.50.11.842000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('08-JUN-11 04.50.11.842000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100014',         
'100011','100007','-1','tjmoretto',          
to_timestamp('08-JUN-11 04.50.14.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('08-JUN-11 04.50.14.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100015',         
'100011','100004','-2','tjmoretto',          
to_timestamp('08-JUN-11 04.50.16.767000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('08-JUN-11 04.50.16.767000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100016',         
'100011','100005','-4','tjmoretto',          
to_timestamp('08-JUN-11 04.50.22.433000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('13-JUN-11 03.50.26.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100017',         
'100011','100006','-3','tjmoretto',          
to_timestamp('08-JUN-11 04.50.32.482000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('13-JUN-11 03.50.26.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100059',         
'100018','100022','-1','tjmoretto',          
to_timestamp('12-JUN-11 12.57.34.009000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('11-JUL-11 08.56.09.459000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'2'); 
      
insert into web_portal.resource_display_list values ('100060',         
'100012','100021','-9','tjmoretto',          
to_timestamp('12-JUN-11 01.00.30.057000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.23.10.248000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'2'); 
      
insert into web_portal.resource_display_list values ('100061',         
'100013','100021','-8','tjmoretto',          
to_timestamp('12-JUN-11 01.00.57.288000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('12-JUN-11 01.01.01.204000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100062',         
'100016','100022','-1','tjmoretto',          
to_timestamp('12-JUN-11 01.01.24.425000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('12-JUN-11 01.01.24.425000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100063',         
'100015','100021','-8','tjmoretto',          
to_timestamp('12-JUN-11 01.01.41.560000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('12-JUN-11 01.01.49.960000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'2'); 
      
insert into web_portal.resource_display_list values ('100064',         
'100017','100022','-1','tjmoretto',          
to_timestamp('12-JUN-11 01.02.12.455000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('12-JUN-11 01.02.12.455000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100068',         
'100019','100013','-6','tjmoretto',          
to_timestamp('13-JUN-11 03.47.02.057000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.33.27.462000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100066',         
'100019','100016','-4','tjmoretto',          
to_timestamp('13-JUN-11 03.46.46.668000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.33.27.472000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100067',         
'100019','100014','-5','tjmoretto',          
to_timestamp('13-JUN-11 03.46.55.608000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.33.27.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100069',         
'100019','100011','-7','tjmoretto',          
to_timestamp('13-JUN-11 03.47.08.838000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.33.27.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100106',         
'100019','100025','-8','tjmoretto',          
to_timestamp('01-AUG-11 04.33.55.854000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.34.02.604000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100071',         
'100019','100010','-9','tjmoretto',          
to_timestamp('13-JUN-11 03.47.33.068000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.34.02.614000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100072',         
'100019','100015','-10','tjmoretto',         
to_timestamp('13-JUN-11 03.47.45.647000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.34.02.624000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100073',         
'100019','100012','-11','tjmoretto',         
to_timestamp('13-JUN-11 03.47.51.749000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.34.02.634000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'4'); 
      
insert into web_portal.resource_display_list values ('100074',         
'100019','100021','-12','tjmoretto',         
to_timestamp('13-JUN-11 03.48.01.010000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.34.02.654000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'6'); 
      
insert into web_portal.resource_display_list values ('100075',         
'100019','100009','-13','tjmoretto',         
to_timestamp('13-JUN-11 03.48.08.470000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('01-AUG-11 04.34.02.692000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'6'); 
      
insert into web_portal.resource_display_list values ('100076',         
'100021','100022','0','tjmoretto',           
to_timestamp('13-JUN-11 03.48.19.687000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('13-JUN-11 03.48.19.687000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100077',         
'100021','100024','-2','tjmoretto',          
to_timestamp('13-JUN-11 03.48.25.432000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('13-JUN-11 03.48.34.742000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100078',         
'100021','100023','-1','tjmoretto',          
to_timestamp('13-JUN-11 03.48.30.969000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('13-JUN-11 03.48.34.763000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100079',         
'100020','100008','0','tjmoretto',           
to_timestamp('13-JUN-11 03.48.49.041000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('13-JUN-11 03.48.49.041000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100080',         
'100020','100007','-1','tjmoretto',          
to_timestamp('13-JUN-11 03.48.53.299000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('13-JUN-11 03.48.53.299000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100081',         
'100020','100004','-2','tjmoretto',          
to_timestamp('13-JUN-11 03.49.06.141000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('13-JUN-11 03.49.06.141000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'0'); 
      
insert into web_portal.resource_display_list values ('100082',         
'100020','100006','-4','tjmoretto',          
to_timestamp('13-JUN-11 03.49.26.986000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('13-JUN-11 03.49.54.184000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100083',         
'100020','100005','-3','tjmoretto',          
to_timestamp('13-JUN-11 03.49.51.533000 PM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('13-JUN-11 03.49.54.050000 PM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100123',         
'100012','100022','-11','tjmoretto',         
to_timestamp('29-AUG-11 10.52.32.835000 AM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.23.10.258000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
insert into web_portal.resource_display_list values ('100124',         
'100012','100019','-12','tjmoretto',         
to_timestamp('29-AUG-11 10.52.33.108000 AM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.23.10.269000 AM','DD-MON-YY HH.MI.SS.FF AM'),'0',        
'1'); 
      
commit;            
drop table web_portal.resource_usage;        
  CREATE TABLE "WEB_PORTAL"."RESOURCE_USAGE" 
   (	"USAGE_SID" NUMBER(38,0),  
	"USER_SID" NUMBER(38,0),       
	"SOURCE" VARCHAR2(255 CHAR),   
	"RESOURCE_USED" VARCHAR2(255 CHAR),         
	"LOGGED_ACTION" VARCHAR2(255 CHAR),         
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"VERSION" NUMBER(22,0)         
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into web_portal.resource_usage values ('101540',   
'100018','network','','editresource',        
'hblack',to_timestamp('10-JUN-11 10.55.12.414000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.55.12.414000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101541',   
'100018','network','','saveresource',        
'hblack',to_timestamp('10-JUN-11 10.59.24.771000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.59.24.771000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101542',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.59.25.099000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.59.25.099000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101543',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.59.32.801000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.59.32.801000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101544',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.59.33.049000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.59.33.049000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101545',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 10.59.36.744000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.59.36.744000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101546',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('10-JUN-11 10.59.40.081000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.59.40.081000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101547',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('10-JUN-11 10.59.56.148000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.59.56.148000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101548',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 11.00.00.734000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.00.734000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101549',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 11.00.00.955000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.00.955000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101550',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 11.00.03.907000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.03.907000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101551',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 11.00.05.857000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.05.857000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101552',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('10-JUN-11 11.00.17.818000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.17.818000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101553',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('10-JUN-11 11.00.23.877000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.23.877000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101554',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 11.00.34.538000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.34.538000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101555',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 11.00.34.882000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.34.882000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101556',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 11.00.37.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.37.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101557',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 11.00.39.296000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.00.39.296000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101558',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('10-JUN-11 11.01.04.209000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.01.04.209000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101559',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('10-JUN-11 11.01.12.492000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.01.12.492000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101560',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 11.06.15.397000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.06.15.397000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101561',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 11.06.15.602000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.06.15.602000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101562',   
'100018','network','','calculator',          
'hblack',to_timestamp('10-JUN-11 11.06.18.088000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.06.18.088000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101563',   
'100027','network','','index',  
'nctakiosk',to_timestamp('10-JUN-11 11.20.51.688000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.20.51.688000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101564',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('10-JUN-11 11.21.15.510000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.21.15.510000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101565',   
'100027','network','','downloadResource',    
'nctakiosk',to_timestamp('10-JUN-11 11.21.39.307000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.21.39.307000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101566',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.21.52.016000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.21.52.016000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101567',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.22.11.932000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.22.11.932000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101568',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.22.31.725000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.22.31.725000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101569',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.22.48.110000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.22.48.110000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101570',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.23.00.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.23.00.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101571',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.23.12.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.23.12.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101572',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.23.38.975000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.23.38.975000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101573',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.23.54.808000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.23.54.808000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101574',   
'100027','network','','downloadResource',    
'nctakiosk',to_timestamp('10-JUN-11 11.24.52.408000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.24.52.408000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101575',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.24.59.029000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.24.59.029000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101576',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.25.19.371000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.25.19.371000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101577',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.25.24.982000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.25.24.982000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101578',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.25.30.298000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.25.30.298000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101579',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.25.37.385000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.25.37.385000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101580',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.25.42.595000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.25.42.595000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101581',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.25.48.405000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.25.48.405000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101582',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 11.25.54.350000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.25.54.350000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101583',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('10-JUN-11 11.26.12.253000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.26.12.253000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101584',   
'100027','network','','contacts',            
'nctakiosk',to_timestamp('10-JUN-11 11.26.16.547000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.26.16.547000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101585',   
'100027','network','','index',  
'nctakiosk',to_timestamp('10-JUN-11 11.26.47.379000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.26.47.379000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101586',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('10-JUN-11 11.27.09.048000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.27.09.048000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101587',   
'100019','network','','index',  
'tjmoretto',to_timestamp('10-JUN-11 11.33.14.600000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.33.14.600000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101588',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('10-JUN-11 11.33.14.686000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.33.14.686000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101668',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.16.35.745000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.16.35.745000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101669',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.17.24.365000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.17.24.365000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101677',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.19.46.247000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.19.46.247000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101678',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.19.49.432000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.19.49.432000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101679',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 12.19.55.942000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.19.55.942000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101680',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.20.05.741000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.20.05.741000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101681',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.20.20.572000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.20.20.572000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101682',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.20.37.284000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.20.37.284000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101683',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.20.48.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.20.48.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101684',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.21.19.055000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.21.19.055000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101685',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.21.19.366000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.21.19.366000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101686',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.21.21.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.21.21.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101687',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 12.21.24.164000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.21.24.164000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101688',   
'100018','network','','index',  
'hblack',to_timestamp('10-JUN-11 12.34.27.090000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.34.27.090000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101689',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.34.27.144000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.34.27.144000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101698',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('10-JUN-11 12.35.17.392000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.35.17.392000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101699',   
'100018','logout','','index',   
'hblack',to_timestamp('10-JUN-11 12.35.27.519000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.35.27.519000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101700',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('10-JUN-11 01.07.11.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 01.07.11.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101701',   
'100019','network','','index',  
'tjmoretto',to_timestamp('10-JUN-11 02.13.21.709000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 02.13.21.709000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101702',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('10-JUN-11 02.13.21.832000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 02.13.21.832000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101703',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('10-JUN-11 02.13.22.473000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 02.13.22.473000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101704',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('10-JUN-11 02.13.39.159000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 02.13.39.159000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101705',   
'100018','network','','index',  
'hblack',to_timestamp('10-JUN-11 02.16.45.426000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.16.45.426000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101706',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 02.16.45.537000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.16.45.537000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101717',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.36.45.408000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.36.45.408000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101718',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.36.50.015000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.36.50.015000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101719',   
'100018','network','','calculator',          
'hblack',to_timestamp('10-JUN-11 02.43.34.507000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.43.34.507000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101720',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 02.53.36.649000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.53.36.649000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101721',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 02.53.37.177000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.53.37.177000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101722',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('10-JUN-11 02.54.57.326000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.54.57.326000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101723',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('10-JUN-11 02.55.26.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.55.26.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101724',   
'100018','network','','calculator',          
'hblack',to_timestamp('10-JUN-11 02.55.36.722000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.55.36.722000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101725',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 02.57.31.550000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.57.31.550000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101726',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 02.57.31.790000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.57.31.790000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101727',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('10-JUN-11 02.58.28.130000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.58.28.130000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101728',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('10-JUN-11 02.59.00.249000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.59.00.249000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101729',   
'100018','network','100005','editcampaign',  
'hblack',to_timestamp('10-JUN-11 02.59.04.006000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.59.04.006000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101730',   
'100018','network','100005','editcampaign',  
'hblack',to_timestamp('10-JUN-11 02.59.04.294000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.59.04.294000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101731',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 02.59.34.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.59.34.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101732',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.59.34.587000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.59.34.587000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101733',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.59.37.068000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.59.37.068000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101734',   
'100018','network','','calculator',          
'hblack',to_timestamp('10-JUN-11 02.59.39.566000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.59.39.566000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101735',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 03.02.28.635000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.02.28.635000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101736',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 03.02.28.946000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.02.28.946000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101737',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('10-JUN-11 03.03.12.919000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.03.12.919000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101738',   
'100018','network','100007','savecampaign',  
'hblack',to_timestamp('10-JUN-11 03.03.28.037000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.03.28.037000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101739',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('10-JUN-11 03.03.44.307000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.03.44.307000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101740',   
'100018','network','','calculator',          
'hblack',to_timestamp('10-JUN-11 03.03.46.298000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.03.46.298000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101741',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 03.05.56.171000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.05.56.171000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101742',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 03.05.56.481000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.05.56.481000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100742',   
'6000','network','','index',    
'canoeadmin',to_timestamp('08-JUN-11 01.24.18.756000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('08-JUN-11 01.24.18.756000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100743',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('08-JUN-11 01.24.18.869000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('08-JUN-11 01.24.18.869000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100744',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('08-JUN-11 01.35.50.556000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('08-JUN-11 01.35.50.556000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100745',   
'100019','network','','index',  
'tjmoretto',to_timestamp('08-JUN-11 01.39.04.015000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.39.04.015000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100746',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 01.39.04.098000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.39.04.098000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100770',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 01.54.17.233000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.54.17.233000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100774',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.10.08.546000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.10.08.546000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100784',   
'100020','network','','rendercampaign',      
'reedyb',to_timestamp('08-JUN-11 04.16.18.548000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.16.18.548000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100785',   
'100020','network','','rendercampaign',      
'reedyb',to_timestamp('08-JUN-11 04.16.21.513000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.16.21.513000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100786',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.18.26.538000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.18.26.538000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100790',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.26.24.031000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.26.24.031000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100791',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.26.24.111000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.26.24.111000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100793',   
'100019','network','100005','saveresource',  
'tjmoretto',to_timestamp('08-JUN-11 04.26.50.218000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.26.50.218000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100794',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.26.50.303000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.26.50.303000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100795',   
'100019','network','100005','editresource',  
'tjmoretto',to_timestamp('08-JUN-11 04.27.36.159000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.27.36.159000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100804',   
'100019','network','100005','saveresource',  
'tjmoretto',to_timestamp('08-JUN-11 04.29.29.348000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.29.29.348000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100805',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.29.29.428000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.29.29.428000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100806',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.30.23.199000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.30.23.199000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100810',   
'100019','network','100006','saveresource',  
'tjmoretto',to_timestamp('08-JUN-11 04.31.37.686000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.31.37.686000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100811',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.31.37.768000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.31.37.768000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100814',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.33.04.233000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.33.04.233000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100816',   
'100018','network','','savecontact',         
'hblack',to_timestamp('08-JUN-11 04.36.01.656000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.36.01.656000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100817',   
'100018','network','','admincontacts',       
'hblack',to_timestamp('08-JUN-11 04.36.01.745000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.36.01.745000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100821',   
'100018','network','','editcontact',         
'hblack',to_timestamp('08-JUN-11 04.40.07.075000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.40.07.075000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100825',   
'100018','network','','savecontact',         
'hblack',to_timestamp('08-JUN-11 04.41.48.796000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.41.48.796000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100826',   
'100018','network','','admincontacts',       
'hblack',to_timestamp('08-JUN-11 04.41.48.874000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.41.48.874000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100830',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.45.09.481000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.09.481000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100831',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.45.11.600000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.11.600000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100832',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('08-JUN-11 04.45.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.12.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100833',   
'100019','network','100008','removeresourcesection',      
'tjmoretto',to_timestamp('08-JUN-11 04.45.22.288000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.22.288000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100834',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 04.45.24.174000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.24.174000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100835',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.45.24.403000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.24.403000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100836',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('08-JUN-11 04.45.25.243000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.25.243000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100837',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('08-JUN-11 04.45.46.649000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.46.649000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100838',   
'100019','network','100009','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.45.48.643000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.48.643000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100839',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 04.45.56.373000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.45.56.373000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101033',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 08.21.48.477000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 08.21.48.477000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101034',   
'100018','network','','index',  
'hblack',to_timestamp('09-JUN-11 09.06.33.774000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.06.33.774000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101035',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 09.06.33.857000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.06.33.857000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101041',   
'100018','network','','editresource',        
'hblack',to_timestamp('09-JUN-11 09.18.19.829000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.18.19.829000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101044',   
'100018','network','','editresource',        
'hblack',to_timestamp('09-JUN-11 09.20.58.077000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.20.58.077000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101054',   
'100018','network','','editresource',        
'hblack',to_timestamp('09-JUN-11 09.35.44.373000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.35.44.373000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101057',   
'100018','network','','editresource',        
'hblack',to_timestamp('09-JUN-11 09.40.27.618000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.40.27.618000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101060',   
'100018','network','','editresource',        
'hblack',to_timestamp('09-JUN-11 09.49.54.973000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.49.54.973000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101063',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 09.51.07.687000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 09.51.07.687000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101064',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('09-JUN-11 09.51.09.696000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 09.51.09.696000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101066',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('09-JUN-11 09.51.48.971000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 09.51.48.971000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101068',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('09-JUN-11 09.52.17.646000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 09.52.17.646000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101077',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.12.54.656000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.12.54.656000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101078',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.12.57.249000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.12.57.249000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101079',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.13.00.659000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.13.00.659000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101080',   
'100018','network','','saveresourcesection', 
'hblack',to_timestamp('09-JUN-11 10.14.35.710000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.14.35.710000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101081',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.16.38.241000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.16.38.241000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101082',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.16.42.573000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.16.42.573000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101083',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.16.44.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.16.44.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101084',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.16.46.298000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.16.46.298000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101085',   
'100018','network','100018','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.16.55.109000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.16.55.109000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101086',   
'100018','network','100019','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.16.57.018000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.16.57.018000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101087',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.17.00.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.17.00.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101088',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.17.10.453000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.17.10.453000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101089',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.17.54.834000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.17.54.834000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101090',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.18.01.560000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.18.01.560000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101091',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.18.11.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.18.11.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101092',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.18.13.365000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.18.13.365000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101093',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.18.17.657000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.18.17.657000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101094',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.18.39.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.18.39.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101095',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.18.44.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.18.44.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101096',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.18.50.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.18.50.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101097',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.18.54.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.18.54.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101098',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.19.02.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.19.02.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101099',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.19.06.613000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.19.06.613000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101100',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.19.31.581000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.19.31.581000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101101',   
'100018','network','100012','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.19.41.640000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.19.41.640000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101102',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.20.03.153000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.20.03.153000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101103',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.21.01.245000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.21.01.245000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101104',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.21.01.531000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.21.01.531000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101105',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.21.04.469000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.21.04.469000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101106',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.21.10.582000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.21.10.582000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101107',   
'100018','network','','saveresourcesection', 
'hblack',to_timestamp('09-JUN-11 10.21.53.821000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.21.53.821000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101108',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.22.01.183000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.01.183000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101109',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.22.04.773000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.04.773000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101110',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.22.09.108000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.09.108000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101111',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.22.18.281000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.18.281000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101112',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.22.20.251000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.20.251000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101113',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.22.23.221000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.23.221000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101114',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.22.27.817000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.27.817000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101115',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.22.37.424000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.37.424000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101116',   
'100018','network','100031','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.22.48.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.48.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101117',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.22.51.552000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.51.552000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101118',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.22.54.227000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.54.227000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101119',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.22.56.714000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.22.56.714000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101120',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.23.16.399000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.23.16.399000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101121',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.23.23.346000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.23.23.346000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101122',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.23.32.861000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.23.32.861000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101123',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.23.36.304000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.23.36.304000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101124',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.23.43.288000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.23.43.288000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101125',   
'100018','network','100013','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.23.47.528000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.23.47.528000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101126',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.24.06.997000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.24.06.997000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101127',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.25.49.972000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.25.49.972000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101128',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.25.50.140000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.25.50.140000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101129',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.25.53.669000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.25.53.669000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101130',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.26.08.084000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.26.08.084000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101131',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.30.46.020000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.30.46.020000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101132',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.30.46.181000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.30.46.181000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101133',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.30.53.389000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.30.53.389000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101134',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.30.56.689000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.30.56.689000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101135',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 10.31.18.478000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.31.18.478000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101136',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 10.31.18.806000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.31.18.806000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101243',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.06.33.702000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.06.33.702000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101244',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.06.39.897000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.06.39.897000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101245',   
'100025','network','','resources',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.06.40.438000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.06.40.438000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101246',   
'100025','network','','downloadResource',    
'jdonnenfeld',to_timestamp('09-JUN-11 11.07.01.238000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.07.01.238000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101247',   
'100025','network','','downloadResource',    
'jdonnenfeld',to_timestamp('09-JUN-11 11.07.07.463000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.07.07.463000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101248',   
'100025','network','','downloadResource',    
'jdonnenfeld',to_timestamp('09-JUN-11 11.07.12.497000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.07.12.497000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101249',   
'100025','network','','downloadResource',    
'jdonnenfeld',to_timestamp('09-JUN-11 11.07.31.123000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.07.31.123000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101250',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.09.16.210000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.09.16.210000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101251',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.09.25.292000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.09.25.292000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101252',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.09.45.534000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.09.45.534000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101253',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.09.53.790000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.09.53.790000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101254',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.10.06.629000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.10.06.629000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101255',   
'100025','network','','downloadResource',    
'jdonnenfeld',to_timestamp('09-JUN-11 11.10.15.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.10.15.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101256',   
'100025','network','','downloadResource',    
'jdonnenfeld',to_timestamp('09-JUN-11 11.10.32.617000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.10.32.617000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101257',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.10.44.737000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.10.44.737000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101258',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.10.45.003000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.10.45.003000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101259',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.10.48.002000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.10.48.002000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101260',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.10.50.518000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.10.50.518000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101261',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.11.03.829000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.11.03.829000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101262',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.11.13.051000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.11.13.051000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101263',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.11.37.762000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.11.37.762000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101264',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.11.53.549000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.11.53.549000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101265',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.12.02.678000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.12.02.678000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101266',   
'100025','network','','contacts',            
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.13.423000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.13.423000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101267',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.12.28.463000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.12.28.463000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101268',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.12.36.235000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.12.36.235000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101269',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.36.533000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.36.533000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101418',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 03.22.09.769000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 03.22.09.769000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101419',   
'100019','network','','index',  
'tjmoretto',to_timestamp('10-JUN-11 08.28.39.586000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.28.39.586000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101420',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('10-JUN-11 08.28.39.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.28.39.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101486',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.24.22.653000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.24.22.653000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101487',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.24.30.029000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.24.30.029000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101589',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('10-JUN-11 11.33.15.120000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.33.15.120000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101590',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('10-JUN-11 11.33.53.480000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.33.53.480000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101591',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('10-JUN-11 11.34.09.758000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.34.09.758000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101592',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('10-JUN-11 11.35.23.226000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.35.23.226000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101593',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('10-JUN-11 11.36.06.794000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.06.794000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101594',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('10-JUN-11 11.36.15.655000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.15.655000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101595',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('10-JUN-11 11.36.19.813000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.19.813000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101596',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('10-JUN-11 11.36.20.964000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.20.964000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101597',   
'100019','network','100004','editcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.36.23.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.23.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101598',   
'100019','network','100004','editcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.36.24.266000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.24.266000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101599',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('10-JUN-11 11.36.45.735000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.45.735000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101600',   
'100019','network','100004','editcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.36.51.636000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.51.636000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101601',   
'100019','network','100004','editcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.36.51.959000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.51.959000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101602',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('10-JUN-11 11.36.55.091000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.55.091000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101603',   
'100019','network','100004','editcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.36.56.804000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.56.804000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101604',   
'100019','network','100004','editcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.36.57.132000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.36.57.132000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101605',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('10-JUN-11 11.37.05.112000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.37.05.112000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101606',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('10-JUN-11 11.37.06.592000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.37.06.592000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101607',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('10-JUN-11 11.37.08.977000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.37.08.977000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101608',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('10-JUN-11 11.39.03.085000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.39.03.085000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101609',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('10-JUN-11 11.39.03.383000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.39.03.383000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101610',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('10-JUN-11 11.39.46.458000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.39.46.458000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101611',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('10-JUN-11 11.40.03.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.40.03.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101612',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('10-JUN-11 11.40.32.688000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.40.32.688000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101613',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('10-JUN-11 11.42.20.389000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.42.20.389000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101614',   
'100019','network','0','createPDFcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.44.00.759000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.44.00.759000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101615',   
'100019','network','0','createPDFcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.44.54.654000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.44.54.654000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101616',   
'100019','network','0','createPDFcampaign',  
'tjmoretto',to_timestamp('10-JUN-11 11.44.54.799000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.44.54.799000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101617',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('10-JUN-11 11.45.10.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 11.45.10.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101618',   
'100018','network','','index',  
'hblack',to_timestamp('10-JUN-11 11.57.33.302000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.57.33.302000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101619',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 11.57.33.520000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.57.33.520000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101620',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 11.57.33.776000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.57.33.776000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101621',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 11.57.38.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.57.38.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101622',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 11.57.40.565000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.57.40.565000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101623',   
'100018','network','','saveresourcesection', 
'hblack',to_timestamp('10-JUN-11 11.58.14.777000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.58.14.777000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101624',   
'100018','network','100018','getavailableresourcesforgroup',           
'hblack',to_timestamp('10-JUN-11 11.59.08.355000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.59.08.355000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101625',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('10-JUN-11 11.59.31.145000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 11.59.31.145000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101626',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 12.05.47.034000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.05.47.034000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101627',   
'100018','network','','downloadResource',    
'hblack',to_timestamp('10-JUN-11 12.06.04.871000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.06.04.871000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101628',   
'100018','network','100008','editresource',  
'hblack',to_timestamp('10-JUN-11 12.06.09.843000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.06.09.843000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101629',   
'100018','network','100008','saveresource',  
'hblack',to_timestamp('10-JUN-11 12.06.51.835000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.06.51.835000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101630',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 12.06.51.903000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.06.51.903000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101631',   
'100018','network','100007','editresource',  
'hblack',to_timestamp('10-JUN-11 12.09.59.833000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.09.59.833000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101632',   
'100018','network','100007','saveresource',  
'hblack',to_timestamp('10-JUN-11 12.10.24.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.10.24.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101633',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 12.10.24.605000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.10.24.605000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101634',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.10.37.723000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.10.37.723000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101635',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.10.37.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.10.37.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101636',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 12.10.40.410000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.10.40.410000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101637',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.11.14.802000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.11.14.802000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101638',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.11.14.905000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.11.14.905000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101639',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.08.567000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.08.567000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101640',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.08.598000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.08.598000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101641',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.16.671000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.16.671000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101642',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.26.746000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.26.746000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101643',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.26.990000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.26.990000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101644',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.34.069000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.34.069000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101645',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.34.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.34.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101646',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.50.099000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.50.099000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101647',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.50.390000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.50.390000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101648',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.57.018000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.57.018000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101649',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.12.57.307000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.12.57.307000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101650',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.13.05.935000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.05.935000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101651',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.13.06.153000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.06.153000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101652',   
'100018','network','','index',  
'hblack',to_timestamp('10-JUN-11 12.13.12.205000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.12.205000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101653',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.13.12.280000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.12.280000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101654',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.13.12.640000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.12.640000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101655',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('10-JUN-11 12.13.17.263000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.17.263000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101656',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.13.28.699000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.28.699000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101657',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.13.28.858000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.28.858000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101658',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 12.13.32.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.32.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101659',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.13.46.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.46.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101660',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.13.46.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.46.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101661',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.13.56.888000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.56.888000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101662',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.13.57.151000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.13.57.151000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101663',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.14.19.334000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.14.19.334000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101664',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.14.19.634000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.14.19.634000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101665',   
'100018','logout','','index',   
'hblack',to_timestamp('10-JUN-11 12.14.25.796000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.14.25.796000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101666',   
'100018','network','','index',  
'hblack',to_timestamp('10-JUN-11 12.16.34.930000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.16.34.930000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101667',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.16.35.008000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.16.35.008000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101670',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.17.24.662000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.17.24.662000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101671',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.17.46.983000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.17.46.983000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101672',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 12.17.55.303000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.17.55.303000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101673',   
'100018','network','','openPdf',
'hblack',to_timestamp('10-JUN-11 12.18.08.152000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.18.08.152000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101674',   
'100018','logout','','index',   
'hblack',to_timestamp('10-JUN-11 12.18.59.792000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.18.59.792000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101675',   
'100018','network','','index',  
'hblack',to_timestamp('10-JUN-11 12.19.45.971000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.19.45.971000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101676',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.19.46.033000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.19.46.033000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101690',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.34.27.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.34.27.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101691',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.34.47.031000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.34.47.031000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101692',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.34.56.221000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.34.56.221000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101693',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('10-JUN-11 12.35.00.742000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.35.00.742000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101694',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 12.35.04.765000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.35.04.765000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101695',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.35.05.082000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.35.05.082000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101696',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 12.35.13.097000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.35.13.097000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101697',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('10-JUN-11 12.35.17.338000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 12.35.17.338000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101707',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.16.45.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.16.45.828000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101708',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.16.57.542000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.16.57.542000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101709',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.17.40.478000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.17.40.478000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101710',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 02.17.54.032000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.17.54.032000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101711',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.17.54.406000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.17.54.406000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101712',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 02.18.08.016000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.18.08.016000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101713',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 02.18.11.528000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.18.11.528000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101714',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('10-JUN-11 02.18.18.026000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.18.18.026000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101715',   
'100018','network','','index',  
'hblack',to_timestamp('10-JUN-11 02.36.45.099000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.36.45.099000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101716',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 02.36.45.197000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 02.36.45.197000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101743',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('10-JUN-11 03.06.20.401000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.20.401000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101744',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 03.06.24.242000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.24.242000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101745',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 03.06.24.734000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.24.734000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101746',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 03.06.26.929000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.26.929000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101747',   
'100018','network','','calculator',          
'hblack',to_timestamp('10-JUN-11 03.06.28.948000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.28.948000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101748',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('10-JUN-11 03.06.34.638000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.34.638000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101749',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('10-JUN-11 03.06.38.039000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.38.039000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101750',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('10-JUN-11 03.06.38.349000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.38.349000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101751',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('10-JUN-11 03.06.47.298000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.06.47.298000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101752',   
'100018','network','100006','savecampaign',  
'hblack',to_timestamp('10-JUN-11 03.07.00.674000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.07.00.674000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101753',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 03.07.15.395000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.07.15.395000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101754',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 03.07.15.598000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.07.15.598000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101755',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 03.07.18.509000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.07.18.509000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101756',   
'100018','network','','calculator',          
'hblack',to_timestamp('10-JUN-11 03.07.20.056000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.07.20.056000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101757',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 03.08.33.992000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.08.33.992000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101758',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 03.08.34.251000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.08.34.251000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101759',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('10-JUN-11 03.08.53.907000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.08.53.907000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101760',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('10-JUN-11 03.09.00.327000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.09.00.327000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101761',   
'100018','network','','calculator',          
'hblack',to_timestamp('10-JUN-11 03.09.01.806000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.09.01.806000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101762',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 03.10.18.470000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.10.18.470000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101763',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('10-JUN-11 03.10.18.817000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.10.18.817000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101764',   
'100018','logout','','index',   
'hblack',to_timestamp('10-JUN-11 03.16.30.417000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 03.16.30.417000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101765',   
'100019','network','','index',  
'tjmoretto',to_timestamp('12-JUN-11 12.26.58.943000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.26.58.943000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101766',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 12.26.59.241000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.26.59.241000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101767',   
'100019','network','','index',  
'tjmoretto',to_timestamp('12-JUN-11 12.28.36.990000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.28.36.990000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101768',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 12.28.37.166000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.28.37.166000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101769',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 12.28.37.638000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.28.37.638000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101770',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.28.41.277000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.28.41.277000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101771',   
'100019','network','100012','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.29.01.915000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.29.01.915000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101772',   
'100019','network','100012','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.29.08.702000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.29.08.702000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101773',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.29.08.868000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.29.08.868000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101775',   
'100019','network','100015','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.29.32.769000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.29.32.769000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101776',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.29.32.931000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.29.32.931000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101777',   
'100019','network','100019','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.30.43.484000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.30.43.484000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101780',   
'100019','network','100018','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.31.08.225000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.08.225000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101783',   
'100019','network','100013','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.31.21.566000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.21.566000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101786',   
'100019','network','100019','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.31.36.580000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.36.580000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101789',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('12-JUN-11 12.31.43.102000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.43.102000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101790',   
'100019','network','100019','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.32.05.836000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.32.05.836000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101794',   
'100019','network','100017','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.32.13.076000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.32.13.076000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101795',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.32.13.263000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.32.13.263000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101796',   
'100019','network','100018','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.32.25.716000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.32.25.716000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101797',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.32.27.822000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.32.27.822000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101798',   
'100019','network','100016','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.33.08.391000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.33.08.391000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101799',   
'100019','network','100016','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.33.23.073000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.33.23.073000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101800',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.33.23.191000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.33.23.191000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101801',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('12-JUN-11 12.38.40.410000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.38.40.410000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101802',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('12-JUN-11 12.39.44.632000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.39.44.632000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101803',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.39.44.753000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.39.44.753000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101804',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('12-JUN-11 12.45.39.803000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.45.39.803000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101805',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.46.25.194000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.46.25.194000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101806',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('12-JUN-11 12.55.00.367000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.55.00.367000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101807',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('12-JUN-11 12.57.06.438000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.57.06.438000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101808',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.57.06.559000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.57.06.559000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101809',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 12.57.10.225000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.57.10.225000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101810',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 12.57.10.516000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.57.10.516000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101811',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 12.57.12.197000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.57.12.197000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101812',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 12.57.13.053000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.57.13.053000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101813',   
'100019','network','100018','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('12-JUN-11 12.57.21.283000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.57.21.283000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101814',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('12-JUN-11 12.57.34.020000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.57.34.020000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101815',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 12.58.18.922000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.58.18.922000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101816',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 12.58.20.708000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.58.20.708000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101817',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 12.58.27.765000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.58.27.765000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101818',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 12.58.33.672000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.58.33.672000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101819',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 12.58.37.106000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.58.37.106000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101820',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 12.58.38.220000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.58.38.220000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101821',   
'100019','network','100012','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('12-JUN-11 12.58.50.300000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.58.50.300000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101822',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.59.09.115000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.59.09.115000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101823',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('12-JUN-11 12.59.35.731000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.59.35.731000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101824',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 01.00.17.686000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.17.686000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101825',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 01.00.17.973000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.17.973000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101826',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 01.00.19.232000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.19.232000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101827',   
'100019','network','100018','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('12-JUN-11 01.00.21.670000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.21.670000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101828',   
'100019','network','100012','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('12-JUN-11 01.00.24.122000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.24.122000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101829',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('12-JUN-11 01.00.30.117000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.30.117000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101830',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.00.35.992000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.35.992000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101831',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 01.00.44.555000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.44.555000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101832',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 01.00.44.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.44.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101833',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 01.00.46.782000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.46.782000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101834',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 01.00.47.460000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.47.460000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101835',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.00.51.308000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.51.308000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101836',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.00.52.701000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.52.701000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101837',   
'100019','network','100013','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('12-JUN-11 01.00.54.034000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.54.034000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101838',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('12-JUN-11 01.00.57.303000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.00.57.303000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101839',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.01.188000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.01.188000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101840',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.05.655000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.05.655000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101841',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.09.400000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.09.400000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101842',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.12.523000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.12.523000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101843',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.14.103000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.14.103000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101844',   
'100019','network','100016','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('12-JUN-11 01.01.18.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.18.882000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101845',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('12-JUN-11 01.01.24.435000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.24.435000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101846',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 01.01.29.728000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.29.728000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101847',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 01.01.30.044000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.30.044000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101848',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 01.01.32.291000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.32.291000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101849',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 01.01.33.128000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.33.128000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101850',   
'100019','network','100015','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('12-JUN-11 01.01.38.364000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.38.364000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101851',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('12-JUN-11 01.01.41.578000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.41.578000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101852',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.46.287000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.46.287000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101853',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.49.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.49.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101854',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.55.252000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.55.252000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101855',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.01.58.647000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.01.58.647000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101856',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.02.02.512000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.02.02.512000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101857',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('12-JUN-11 01.02.03.900000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.02.03.900000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101858',   
'100019','network','100017','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('12-JUN-11 01.02.07.672000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.02.07.672000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101859',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('12-JUN-11 01.02.12.472000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.02.12.472000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101860',   
'100019','network','','index',  
'tjmoretto',to_timestamp('12-JUN-11 01.02.17.624000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.02.17.624000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101861',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 01.02.17.737000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.02.17.737000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101862',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 01.02.18.025000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.02.18.025000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101863',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 01.02.19.774000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.02.19.774000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101864',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('12-JUN-11 01.04.06.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.04.06.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101865',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('12-JUN-11 01.04.18.490000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 01.04.18.490000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101866',   
'100019','network','','index',  
'tjmoretto',to_timestamp('12-JUN-11 02.35.15.287000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.35.15.287000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101867',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 02.35.15.466000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.35.15.466000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101868',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 02.35.15.807000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.35.15.807000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101869',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('12-JUN-11 02.40.37.081000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.40.37.081000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101870',   
'100019','network','','index',  
'tjmoretto',to_timestamp('12-JUN-11 02.42.06.235000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.42.06.235000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101871',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 02.42.06.352000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.42.06.352000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101872',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 02.42.07.170000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.42.07.170000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101873',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 02.42.09.398000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.42.09.398000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101874',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 02.42.10.294000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.42.10.294000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101875',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 02.42.16.155000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.42.16.155000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101876',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 02.44.09.393000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.44.09.393000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101877',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('12-JUN-11 02.45.05.704000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.05.704000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101878',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 02.45.12.158000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.12.158000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101879',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 02.45.12.878000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.12.878000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101880',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 02.45.14.626000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.14.626000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101881',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 02.45.15.773000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.15.773000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101882',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('12-JUN-11 02.45.21.014000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.21.014000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101883',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('12-JUN-11 02.45.22.952000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.22.952000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101884',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 02.45.23.757000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.23.757000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101885',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('12-JUN-11 02.45.25.523000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.25.523000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101779',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.30.57.172000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.30.57.172000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101781',   
'100019','network','100018','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.31.12.915000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.12.915000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101782',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.31.13.064000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.13.064000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101784',   
'100019','network','100013','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.31.32.608000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.32.608000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101785',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.31.32.782000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.32.782000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101787',   
'100019','network','100019','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.31.39.636000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.39.636000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101788',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.31.39.766000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.31.39.766000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101791',   
'100019','network','100019','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.32.08.894000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.32.08.894000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101792',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('12-JUN-11 12.32.09.012000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.32.09.012000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101793',   
'100019','network','100017','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.32.11.322000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.32.11.322000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101886',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('12-JUN-11 02.45.26.468000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.26.468000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101887',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('12-JUN-11 02.45.44.007000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.45.44.007000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101888',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('12-JUN-11 02.49.06.696000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 02.49.06.696000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101889',   
'100018','network','','index',  
'hblack',to_timestamp('13-JUN-11 08.08.47.002000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.08.47.002000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101890',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.08.47.057000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.08.47.057000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101891',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.08.47.554000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.08.47.554000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101892',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.09.03.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.03.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101893',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.09.06.523000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.06.523000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101894',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.09.12.693000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.12.693000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101895',   
'100018','network','100005','deletecampaign',
'hblack',to_timestamp('13-JUN-11 08.09.21.953000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.21.953000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101896',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.09.22.013000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.22.013000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101897',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.09.36.877000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.36.877000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101898',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.09.39.720000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.39.720000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101899',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.09.44.520000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.44.520000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101900',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.09.47.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.47.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101901',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.09.49.218000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.49.218000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101902',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.09.49.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.09.49.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101903',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.10.43.541000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.10.43.541000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101904',   
'100018','network','100006','savecampaign',  
'hblack',to_timestamp('13-JUN-11 08.12.48.130000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.12.48.130000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101905',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.13.03.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.13.03.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101906',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.13.12.530000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.13.12.530000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101907',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.13.13.143000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.13.13.143000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101908',   
'100018','logout','','index',   
'hblack',to_timestamp('13-JUN-11 08.13.17.047000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.13.17.047000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101909',   
'100018','network','','index',  
'hblack',to_timestamp('13-JUN-11 08.14.41.702000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.14.41.702000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101910',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.14.41.788000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.14.41.788000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101911',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.14.42.042000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.14.42.042000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101912',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.14.51.102000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.14.51.102000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101913',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.14.53.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.14.53.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101914',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.14.56.585000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.14.56.585000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101915',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.15.22.472000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.15.22.472000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101916',   
'100018','network','','index',  
'hblack',to_timestamp('13-JUN-11 08.15.30.335000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.15.30.335000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101917',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.15.30.371000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.15.30.371000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101918',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.15.30.781000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.15.30.781000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101919',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.15.41.024000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.15.41.024000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101920',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.15.41.113000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.15.41.113000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101921',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.15.41.154000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.15.41.154000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101922',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.15.43.730000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.15.43.730000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101923',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.16.03.137000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.16.03.137000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101924',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.16.03.759000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.16.03.759000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101925',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.16.34.061000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.16.34.061000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101926',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.16.58.007000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.16.58.007000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101927',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.17.12.613000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.17.12.613000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101928',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.17.33.754000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.17.33.754000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101929',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.17.45.641000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.17.45.641000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101930',   
'100018','network','100007','savecampaign',  
'hblack',to_timestamp('13-JUN-11 08.19.21.397000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.21.397000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101774',   
'100019','network','100015','editresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.29.23.733000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.29.23.733000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101778',   
'100019','network','100019','saveresource',  
'tjmoretto',to_timestamp('12-JUN-11 12.30.57.042000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('12-JUN-11 12.30.57.042000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101931',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.19.29.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.29.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101932',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.19.30.012000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.30.012000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101933',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.19.38.250000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.38.250000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101934',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.19.40.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.40.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101935',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.19.40.717000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.40.717000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101936',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.19.43.504000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.43.504000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101937',   
'100018','network','100008','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.19.51.524000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.51.524000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101938',   
'100018','network','100008','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.19.52.073000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.19.52.073000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101939',   
'100018','network','100008','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.20.31.349000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.20.31.349000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101940',   
'100018','network','100008','savecampaign',  
'hblack',to_timestamp('13-JUN-11 08.21.13.693000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.21.13.693000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101941',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.22.48.831000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.22.48.831000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101942',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.22.54.777000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.22.54.777000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101943',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.24.39.260000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.24.39.260000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101944',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.24.39.780000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.24.39.780000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101945',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.25.42.379000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.25.42.379000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101946',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.25.52.113000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.25.52.113000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101947',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.25.58.421000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.25.58.421000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101948',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.26.19.403000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.26.19.403000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101949',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.26.31.412000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.26.31.412000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101950',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('13-JUN-11 08.26.41.900000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.26.41.900000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101951',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.26.56.343000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.26.56.343000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101952',   
'100018','network','100009','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.27.00.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.27.00.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101953',   
'100018','network','100009','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.27.01.297000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.27.01.297000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101954',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.27.05.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.27.05.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101955',   
'100018','network','100008','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.27.07.172000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.27.07.172000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101956',   
'100018','network','100008','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.27.07.866000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.27.07.866000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101957',   
'100018','network','100008','savecampaign',  
'hblack',to_timestamp('13-JUN-11 08.28.01.181000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.28.01.181000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101958',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.28.08.114000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.28.08.114000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101959',   
'100018','network','100009','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.28.20.850000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.28.20.850000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101960',   
'100018','network','100009','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.28.21.512000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.28.21.512000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101961',   
'100018','network','100009','createPDFcampaign',          
'hblack',to_timestamp('13-JUN-11 08.28.30.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.28.30.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101962',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.28.56.451000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.28.56.451000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101963',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.28.56.719000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.28.56.719000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101964',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.29.06.242000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.29.06.242000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101965',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.29.08.543000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.29.08.543000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101966',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.29.08.584000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.29.08.584000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101967',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.29.11.789000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.29.11.789000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101968',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.29.15.017000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.29.15.017000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101969',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.29.15.562000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.29.15.562000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101970',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.29.21.272000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.29.21.272000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100756',   
'100019','network','','index',  
'tjmoretto',to_timestamp('08-JUN-11 01.51.00.543000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.51.00.543000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100757',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 01.51.00.617000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.51.00.617000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100758',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 01.51.01.151000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.51.01.151000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100759',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('08-JUN-11 01.51.13.668000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.51.13.668000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100760',   
'100019','network','','index',  
'tjmoretto',to_timestamp('08-JUN-11 01.51.19.707000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.51.19.707000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100761',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 01.51.19.776000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.51.19.776000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100767',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 01.54.04.801000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.54.04.801000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100768',   
'100018','network','','adminresources',      
'hblack',to_timestamp('08-JUN-11 01.54.08.114000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.54.08.114000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100769',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 01.54.16.993000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.54.16.993000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100775',   
'100020','network','','index',  
'reedyb',to_timestamp('08-JUN-11 04.14.08.886000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.14.08.886000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100776',   
'100020','network','','adminhome',           
'reedyb',to_timestamp('08-JUN-11 04.14.09.341000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.14.09.341000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100801',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.28.19.604000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.28.19.604000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100802',   
'100018','network','','admincontacts',       
'hblack',to_timestamp('08-JUN-11 04.28.29.599000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.28.29.599000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100747',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 01.39.04.871000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.39.04.871000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100751',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 01.40.16.414000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.40.16.414000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100818',   
'100018','network','','editcontact',         
'hblack',to_timestamp('08-JUN-11 04.37.04.399000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.37.04.399000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100822',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.40.50.952000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.40.50.952000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100823',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.40.51.033000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.40.51.033000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100824',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.40.55.484000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.40.55.484000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100856',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.47.16.468000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.47.16.468000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100857',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.47.18.173000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.47.18.173000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100858',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('08-JUN-11 04.47.19.319000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.47.19.319000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100859',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.47.22.753000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.47.22.753000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100860',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('08-JUN-11 04.47.25.300000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.47.25.300000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100861',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.47.26.861000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.47.26.861000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100862',   
'100018','network','','sortcontact',         
'hblack',to_timestamp('08-JUN-11 04.48.04.996000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.48.04.996000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100863',   
'100019','network','100009','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.48.26.164000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.48.26.164000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100864',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.48.27.865000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.48.27.865000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100865',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('08-JUN-11 04.48.33.332000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.48.33.332000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100866',   
'100018','network','','sortcontact',         
'hblack',to_timestamp('08-JUN-11 04.48.34.257000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.48.34.257000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100867',   
'100019','network','100009','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.48.34.603000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.48.34.603000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100868',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.48.35.720000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.48.35.720000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100869',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('08-JUN-11 04.48.40.172000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.48.40.172000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100870',   
'100018','network','','sortcontact',         
'hblack',to_timestamp('08-JUN-11 04.48.45.924000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.48.45.924000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100871',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 04.48.47.661000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.48.47.661000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100872',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.48.48.185000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.48.48.185000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100873',   
'100018','network','','sortcontact',         
'hblack',to_timestamp('08-JUN-11 04.48.57.000000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.48.57.000000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100874',   
'100019','network','','index',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.09.635000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.09.635000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100875',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 04.49.09.708000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.09.708000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101036',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 09.06.34.506000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.06.34.506000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101037',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.06.40.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.06.40.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101038',   
'100018','network','','editresource',        
'hblack',to_timestamp('09-JUN-11 09.08.17.628000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.08.17.628000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101039',   
'100018','network','','saveresource',        
'hblack',to_timestamp('09-JUN-11 09.14.22.217000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.14.22.217000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101040',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.14.22.289000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.14.22.289000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101042',   
'100018','network','','saveresource',        
'hblack',to_timestamp('09-JUN-11 09.20.55.602000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.20.55.602000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101043',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.20.55.671000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.20.55.671000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101045',   
'100018','network','','saveresource',        
'hblack',to_timestamp('09-JUN-11 09.22.59.202000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.22.59.202000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101046',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.22.59.263000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.22.59.263000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101047',   
'100018','network','','editresource',        
'hblack',to_timestamp('09-JUN-11 09.23.01.498000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.23.01.498000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101048',   
'100018','network','','saveresource',        
'hblack',to_timestamp('09-JUN-11 09.33.46.421000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.33.46.421000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101049',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.33.46.585000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.33.46.585000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101050',   
'100018','network','','openPdf',
'hblack',to_timestamp('09-JUN-11 09.34.21.292000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.34.21.292000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101051',   
'100018','network','100011','editresource',  
'hblack',to_timestamp('09-JUN-11 09.34.32.064000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.34.32.064000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101052',   
'100018','network','100011','saveresource',  
'hblack',to_timestamp('09-JUN-11 09.35.32.525000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.35.32.525000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101053',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.35.32.612000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.35.32.612000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101055',   
'100018','network','','saveresource',        
'hblack',to_timestamp('09-JUN-11 09.39.44.588000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.39.44.588000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101056',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.39.44.663000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.39.44.663000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101058',   
'100018','network','','saveresource',        
'hblack',to_timestamp('09-JUN-11 09.49.42.194000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.49.42.194000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101059',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.49.42.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.49.42.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101061',   
'100019','network','','index',  
'tjmoretto',to_timestamp('09-JUN-11 09.51.07.294000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 09.51.07.294000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101062',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 09.51.07.376000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 09.51.07.376000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101065',   
'100019','network','100018','editcontact',   
'tjmoretto',to_timestamp('09-JUN-11 09.51.46.047000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 09.51.46.047000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101067',   
'100019','network','','editcontact',         
'tjmoretto',to_timestamp('09-JUN-11 09.52.00.724000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 09.52.00.724000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101069',   
'100018','network','','saveresource',        
'hblack',to_timestamp('09-JUN-11 09.59.53.520000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.59.53.520000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101070',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 09.59.53.607000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 09.59.53.607000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101074',   
'100018','network','','saveresource',        
'hblack',to_timestamp('09-JUN-11 10.12.38.947000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.12.38.947000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101075',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 10.12.39.020000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.12.39.020000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101171',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 10.34.46.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.34.46.339000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101172',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 10.34.46.599000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.34.46.599000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101173',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.34.50.398000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.50.398000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101174',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.34.50.545000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.50.545000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101175',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.34.53.292000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.53.292000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101176',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.34.55.678000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.55.678000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101177',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 10.35.23.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.35.23.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101178',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 10.35.24.195000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.35.24.195000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101179',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 10.35.24.635000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.35.24.635000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101180',   
'100018','network','','saveresourcesection', 
'hblack',to_timestamp('09-JUN-11 10.35.27.237000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.35.27.237000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101181',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('09-JUN-11 10.35.30.322000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.35.30.322000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101182',   
'100025','network','','resources',           
'jdonnenfeld',to_timestamp('09-JUN-11 10.35.31.841000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.35.31.841000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101183',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.35.40.447000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.35.40.447000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101184',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.35.50.400000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.35.50.400000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101185',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.35.54.216000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.35.54.216000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101186',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.35.57.595000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.35.57.595000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101187',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.35.59.139000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.35.59.139000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101188',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.36.03.154000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.03.154000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101189',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.36.04.751000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.04.751000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101190',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.36.10.931000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.10.931000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101191',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.36.15.939000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.15.939000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101192',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.36.18.482000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.18.482000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101193',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('09-JUN-11 10.36.22.069000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.36.22.069000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101195',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.36.25.370000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.25.370000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101196',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.36.28.278000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.28.278000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101197',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.36.33.426000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.33.426000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101198',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.36.35.268000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.35.268000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101199',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.36.41.112000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.41.112000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100750',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 01.40.15.876000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.40.15.876000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100748',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('08-JUN-11 01.39.21.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.39.21.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100749',   
'100019','network','','index',  
'tjmoretto',to_timestamp('08-JUN-11 01.40.15.785000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.40.15.785000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100752',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('08-JUN-11 01.40.36.334000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.40.36.334000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100753',   
'100018','network','','index',  
'hblack',to_timestamp('08-JUN-11 01.49.01.331000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.49.01.331000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100754',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 01.49.01.520000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.49.01.520000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100755',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 01.49.01.905000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.49.01.905000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100762',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 01.51.20.106000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.51.20.106000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100763',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('08-JUN-11 01.51.36.310000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 01.51.36.310000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100764',   
'100018','logout','','index',   
'hblack',to_timestamp('08-JUN-11 01.53.40.349000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.53.40.349000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100765',   
'100018','network','','index',  
'hblack',to_timestamp('08-JUN-11 01.54.04.451000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.54.04.451000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100766',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 01.54.04.529000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.54.04.529000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100771',   
'100018','logout','','index',   
'hblack',to_timestamp('08-JUN-11 01.54.22.878000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 01.54.22.878000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100772',   
'100019','network','','index',  
'tjmoretto',to_timestamp('08-JUN-11 04.10.08.021000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.10.08.021000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100773',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 04.10.08.150000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.10.08.150000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100777',   
'100020','network','','setselectednetwork',  
'reedyb',to_timestamp('08-JUN-11 04.14.10.421000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.14.10.421000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100778',   
'100020','network','','setselectednetwork',  
'reedyb',to_timestamp('08-JUN-11 04.14.32.434000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.14.32.434000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100779',   
'100020','network','','adminresourcesfornetwork',         
'reedyb',to_timestamp('08-JUN-11 04.14.35.620000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.14.35.620000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100780',   
'100020','network','','saveresourcesection', 
'reedyb',to_timestamp('08-JUN-11 04.14.50.143000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.14.50.143000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100781',   
'100020','network','','savedcampaigns',      
'reedyb',to_timestamp('08-JUN-11 04.14.54.978000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.14.54.978000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100782',   
'100020','network','','calculator',          
'reedyb',to_timestamp('08-JUN-11 04.14.57.495000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.14.57.495000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100783',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.15.36.971000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.15.36.971000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100787',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.19.34.374000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.19.34.374000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100788',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.19.34.473000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.19.34.473000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100789',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.19.41.840000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.19.41.840000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100792',   
'100019','network','100005','editresource',  
'tjmoretto',to_timestamp('08-JUN-11 04.26.33.593000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.26.33.593000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100796',   
'100019','network','100005','saveresource',  
'tjmoretto',to_timestamp('08-JUN-11 04.27.50.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.27.50.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100797',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.27.50.919000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.27.50.919000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100798',   
'100019','network','100005','editresource',  
'tjmoretto',to_timestamp('08-JUN-11 04.27.59.554000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.27.59.554000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100799',   
'100018','network','','index',  
'hblack',to_timestamp('08-JUN-11 04.28.19.203000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.28.19.203000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100800',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 04.28.19.368000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.28.19.368000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100803',   
'100018','network','','editcontact',         
'hblack',to_timestamp('08-JUN-11 04.29.03.580000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.29.03.580000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100807',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.31.25.809000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.31.25.809000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100808',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.31.25.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.31.25.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100809',   
'100019','network','100006','editresource',  
'tjmoretto',to_timestamp('08-JUN-11 04.31.29.550000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.31.29.550000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100812',   
'100018','network','','savecontact',         
'hblack',to_timestamp('08-JUN-11 04.32.44.287000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.32.44.287000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100813',   
'100018','network','','admincontacts',       
'hblack',to_timestamp('08-JUN-11 04.32.44.375000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.32.44.375000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100815',   
'100018','network','','editcontact',         
'hblack',to_timestamp('08-JUN-11 04.33.17.336000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.33.17.336000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100819',   
'100018','network','','savecontact',         
'hblack',to_timestamp('08-JUN-11 04.39.10.921000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.39.10.921000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100820',   
'100018','network','','admincontacts',       
'hblack',to_timestamp('08-JUN-11 04.39.10.986000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.39.10.986000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100827',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('08-JUN-11 04.45.04.999000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.04.999000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100828',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.45.05.079000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.05.079000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100829',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 04.45.09.241000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.09.241000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100840',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.45.56.598000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.45.56.598000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100841',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.45.57.302000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.45.57.302000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100842',   
'100019','network','100009','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.46.01.116000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.46.01.116000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100843',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.46.02.252000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.46.02.252000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100844',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.46.02.705000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.46.02.705000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100845',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('08-JUN-11 04.46.04.443000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.46.04.443000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100846',   
'100019','network','100009','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.46.10.844000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.46.10.844000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100847',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.46.12.173000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.46.12.173000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100848',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.46.25.480000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.46.25.480000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100849',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.46.33.529000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.46.33.529000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100850',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.46.47.209000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.46.47.209000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100851',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.46.57.522000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.46.57.522000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100852',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.47.05.272000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.47.05.272000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100853',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.47.11.916000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.47.11.916000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100854',   
'100019','network','','index',  
'tjmoretto',to_timestamp('08-JUN-11 04.47.15.722000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.47.15.722000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100855',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 04.47.15.808000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.47.15.808000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100876',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.10.257000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.10.257000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100877',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.11.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.11.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100878',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('08-JUN-11 04.49.12.414000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.12.414000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100879',   
'100018','network','','sortcontact',         
'hblack',to_timestamp('08-JUN-11 04.49.14.279000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.49.14.279000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100880',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.17.424000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.17.424000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100881',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('08-JUN-11 04.49.18.477000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.18.477000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100882',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('08-JUN-11 04.49.26.564000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.26.564000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100883',   
'100019','network','100010','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.49.28.666000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.28.666000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100884',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.33.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.33.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100885',   
'100019','network','100010','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.49.34.825000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.34.825000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100886',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.36.336000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.36.336000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100887',   
'100019','network','100010','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.49.37.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.37.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100888',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.39.242000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.39.242000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100889',   
'100019','network','100010','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.49.40.689000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.40.689000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100890',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 04.49.40.879000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.49.40.879000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100891',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.49.41.380000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.49.41.380000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100892',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.41.722000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.41.722000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100893',   
'100019','network','100010','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.49.43.088000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.43.088000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100894',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.43.992000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.43.992000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100895',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.49.44.372000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.49.44.372000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100896',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 04.49.49.238000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.49.238000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100897',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.49.891000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.49.891000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100898',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 04.49.52.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.52.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100899',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('08-JUN-11 04.49.53.299000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.49.53.299000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100900',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('08-JUN-11 04.50.03.169000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.03.169000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100901',   
'100019','network','100011','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.50.05.381000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.05.381000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100902',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('08-JUN-11 04.50.10.141000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.50.10.141000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100903',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.50.11.854000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.11.854000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100904',   
'100019','network','100011','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.50.13.688000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.13.688000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100905',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.50.14.547000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.14.547000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100906',   
'100019','network','100011','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.50.16.031000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.16.031000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100907',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.50.16.779000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.16.779000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100908',   
'100019','network','100011','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.50.18.198000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.18.198000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100909',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.50.22.446000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.22.446000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100912',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('08-JUN-11 04.50.32.497000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.32.497000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100913',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.50.35.830000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.50.35.830000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100914',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.50.47.061000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.50.47.061000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100915',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 04.50.49.426000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.49.426000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100916',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.50.52.983000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.50.52.983000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100910',   
'100019','network','100011','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('08-JUN-11 04.50.29.075000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.50.29.075000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100911',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.50.29.601000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.50.29.601000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100917',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.51.03.792000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.03.792000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100918',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 04.51.09.169000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.51.09.169000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100919',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.51.10.021000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.10.021000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100920',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 04.51.14.644000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.51.14.644000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100921',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.51.15.720000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.15.720000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100922',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.51.20.092000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.20.092000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100923',   
'100019','network','100023','editcontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.51.21.845000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.51.21.845000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100924',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 04.51.41.928000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.41.928000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100925',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.51.42.090000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.42.090000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100926',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.51.44.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.44.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100927',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('08-JUN-11 04.51.49.046000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.49.046000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100928',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.51.56.155000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.56.155000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100929',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.51.59.920000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.51.59.920000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100930',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.52.06.767000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.52.06.767000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100931',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.52.12.563000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.52.12.563000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100932',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.52.18.334000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.52.18.334000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100933',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.52.57.048000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.52.57.048000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100934',   
'100019','network','100023','savecontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.52.57.238000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.52.57.238000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100935',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 04.52.57.329000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.52.57.329000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100936',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.53.02.186000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.53.02.186000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100937',   
'100019','network','100022','editcontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.53.04.765000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.53.04.765000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100938',   
'100018','network','','addcontacttonetwork', 
'hblack',to_timestamp('08-JUN-11 04.53.05.608000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.53.05.608000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100939',   
'100019','network','100022','savecontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.53.10.740000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.53.10.740000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100940',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 04.53.10.874000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.53.10.874000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100941',   
'100019','network','100021','editcontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.53.14.659000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.53.14.659000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100942',   
'100019','network','100021','savecontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.53.21.012000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.53.21.012000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100943',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 04.53.21.161000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.53.21.161000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100944',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 04.53.57.879000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.53.57.879000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100945',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.53.58.143000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.53.58.143000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100946',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.54.00.705000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.00.705000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100947',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('08-JUN-11 04.54.02.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.02.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100948',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 04.54.20.465000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.20.465000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100949',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.54.20.663000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.20.663000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100950',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.54.23.830000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.23.830000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100951',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('08-JUN-11 04.54.25.624000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.25.624000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100952',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 04.54.42.967000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.42.967000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100953',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.54.43.207000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.43.207000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100954',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.54.46.396000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.46.396000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100955',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('08-JUN-11 04.54.49.421000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.54.49.421000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100956',   
'100018','network','','adminhome',           
'hblack',to_timestamp('08-JUN-11 04.55.05.481000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.55.05.481000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100957',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('08-JUN-11 04.55.05.697000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('08-JUN-11 04.55.05.697000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100958',   
'100019','network','100020','editcontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.56.49.867000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.56.49.867000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100959',   
'100019','network','100020','savecontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.57.00.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.57.00.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100960',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 04.57.00.571000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.57.00.571000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100961',   
'100019','network','100020','editcontact',   
'tjmoretto',to_timestamp('08-JUN-11 04.59.57.144000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 04.59.57.144000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100962',   
'100019','network','100020','savecontact',   
'tjmoretto',to_timestamp('08-JUN-11 05.00.03.142000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.00.03.142000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100963',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 05.00.03.240000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.00.03.240000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100964',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.02.30.226000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.02.30.226000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100965',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 05.03.37.429000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.03.37.429000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100966',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.03.37.866000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.03.37.866000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100967',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.03.39.935000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.03.39.935000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100968',   
'100019','network','6000','removecontactfromnetwork',     
'tjmoretto',to_timestamp('08-JUN-11 05.04.26.484000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.04.26.484000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100969',   
'100019','network','100018','removecontactfromnetwork',   
'tjmoretto',to_timestamp('08-JUN-11 05.04.28.281000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.04.28.281000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100970',   
'100019','network','100019','removecontactfromnetwork',   
'tjmoretto',to_timestamp('08-JUN-11 05.04.30.278000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.04.30.278000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100971',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.04.39.742000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.04.39.742000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100972',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.04.43.325000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.04.43.325000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100973',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.04.49.483000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.04.49.483000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100974',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 05.04.53.493000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.04.53.493000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100975',   
'100019','network','100025','editcontact',   
'tjmoretto',to_timestamp('08-JUN-11 05.04.58.883000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.04.58.883000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100976',   
'100019','network','100025','savecontact',   
'tjmoretto',to_timestamp('08-JUN-11 05.05.07.130000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.05.07.130000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100977',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 05.05.07.250000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.05.07.250000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100978',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.05.40.177000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.05.40.177000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100979',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('08-JUN-11 05.05.47.275000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.05.47.275000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100980',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.05.52.993000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.05.52.993000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100981',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 05.06.00.291000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.00.291000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100982',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.06.06.191000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.06.191000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100983',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 05.06.14.710000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.14.710000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100984',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.06.15.186000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.15.186000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100985',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.06.17.469000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.17.469000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100986',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.06.18.527000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.18.527000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100987',   
'100019','network','6000','removecontactfromnetwork',     
'tjmoretto',to_timestamp('08-JUN-11 05.06.21.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.21.910000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100988',   
'100019','network','100018','removecontactfromnetwork',   
'tjmoretto',to_timestamp('08-JUN-11 05.06.23.474000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.23.474000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100989',   
'100019','network','100019','removecontactfromnetwork',   
'tjmoretto',to_timestamp('08-JUN-11 05.06.29.311000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.29.311000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100990',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.06.33.972000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.33.972000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100991',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.06.39.578000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.39.578000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100992',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('08-JUN-11 05.06.48.229000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.06.48.229000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100993',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.07.05.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.07.05.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100994',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 05.08.23.387000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.23.387000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100995',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.08.23.979000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.23.979000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100996',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.08.26.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.26.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100997',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.08.28.030000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.28.030000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100998',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 05.08.34.964000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.34.964000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('100999',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.08.35.375000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.35.375000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101000',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.08.37.686000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.37.686000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101001',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.08.38.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.38.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101004',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.08.46.386000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.46.386000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101005',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.08.47.391000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.47.391000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101006',   
'100019','network','6000','removecontactfromnetwork',     
'tjmoretto',to_timestamp('08-JUN-11 05.08.49.662000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.49.662000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101007',   
'100019','network','100018','removecontactfromnetwork',   
'tjmoretto',to_timestamp('08-JUN-11 05.08.51.526000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.51.526000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101008',   
'100019','network','100019','removecontactfromnetwork',   
'tjmoretto',to_timestamp('08-JUN-11 05.08.53.688000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.53.688000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101009',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.08.56.898000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.56.898000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101010',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.09.00.529000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.09.00.529000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101011',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('08-JUN-11 05.09.05.428000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.09.05.428000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101012',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('08-JUN-11 05.09.09.556000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.09.09.556000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101013',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.09.12.838000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.09.12.838000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101014',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('08-JUN-11 05.09.16.633000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.09.16.633000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101015',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('08-JUN-11 05.09.20.018000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.09.20.018000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101016',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('08-JUN-11 05.10.43.817000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.10.43.817000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101017',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 05.10.46.671000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.10.46.671000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101018',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.10.47.192000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.10.47.192000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101019',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.10.49.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.10.49.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101020',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('08-JUN-11 05.10.50.897000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.10.50.897000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101021',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('08-JUN-11 05.10.53.697000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.10.53.697000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101022',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 05.22.13.152000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.22.13.152000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101023',   
'100019','network','100026','editcontact',   
'tjmoretto',to_timestamp('08-JUN-11 05.24.05.721000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.24.05.721000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101024',   
'100019','network','100026','savecontact',   
'tjmoretto',to_timestamp('08-JUN-11 05.24.15.226000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.24.15.226000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101025',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 05.24.15.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.24.15.312000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101026',   
'100019','network','100026','editcontact',   
'tjmoretto',to_timestamp('08-JUN-11 05.25.40.711000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.25.40.711000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101027',   
'100019','network','100026','savecontact',   
'tjmoretto',to_timestamp('08-JUN-11 05.25.47.802000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.25.47.802000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101028',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-JUN-11 05.25.47.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.25.47.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101029',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('08-JUN-11 05.26.50.643000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.26.50.643000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101030',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('08-JUN-11 05.27.00.767000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.27.00.767000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101031',   
'100018','network','','index',  
'hblack',to_timestamp('09-JUN-11 08.21.47.771000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 08.21.47.771000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101032',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 08.21.47.833000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 08.21.47.833000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101071',   
'100018','network','','openPdf',
'hblack',to_timestamp('09-JUN-11 10.00.03.573000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.00.03.573000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101072',   
'100018','network','','openPdf',
'hblack',to_timestamp('09-JUN-11 10.00.03.754000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.00.03.754000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101073',   
'100018','network','','editresource',        
'hblack',to_timestamp('09-JUN-11 10.07.45.617000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.07.45.617000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101076',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.12.54.466000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.12.54.466000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101137',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 10.31.19.746000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.31.19.746000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101138',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 10.31.24.911000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.31.24.911000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101139',   
'100018','network','','saveresourcesection', 
'hblack',to_timestamp('09-JUN-11 10.31.25.464000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.31.25.464000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101140',   
'100025','network','','contacts',            
'jdonnenfeld',to_timestamp('09-JUN-11 10.31.28.107000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.31.28.107000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101141',   
'100018','network','100014','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.31.44.029000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.31.44.029000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101142',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.31.47.612000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.31.47.612000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101143',   
'100025','network','','savedcampaigns',      
'jdonnenfeld',to_timestamp('09-JUN-11 10.31.48.545000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.31.48.545000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101144',   
'100025','network','','calculator',          
'jdonnenfeld',to_timestamp('09-JUN-11 10.31.51.366000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.31.51.366000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101145',   
'100018','network','100014','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.31.52.013000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.31.52.013000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101146',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.31.53.954000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.31.53.954000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101147',   
'100018','network','100014','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.31.55.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.31.55.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101148',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.31.58.186000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.31.58.186000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101149',   
'100018','network','100014','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.31.59.957000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.31.59.957000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101150',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.32.07.073000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.07.073000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101151',   
'100018','network','100014','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.32.10.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.10.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101152',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.32.14.388000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.14.388000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101153',   
'100018','network','100014','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.32.16.889000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.16.889000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101154',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.32.21.866000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.21.866000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101155',   
'100018','network','100014','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.32.23.528000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.23.528000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101156',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.32.30.699000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.30.699000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101157',   
'100018','network','100014','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.32.32.329000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.32.329000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101158',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('09-JUN-11 10.32.35.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.32.35.823000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101159',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.34.14.255000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.14.255000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101160',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.34.14.439000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.14.439000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101161',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.34.17.614000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.17.614000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101162',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.34.19.043000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.19.043000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101163',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.34.21.733000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.21.733000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101164',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.34.31.126000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.31.126000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101165',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.34.31.295000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.31.295000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101166',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.34.34.703000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.34.703000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101167',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.34.36.898000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.34.36.898000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101168',   
'100025','network','','rendercampaign',      
'jdonnenfeld',to_timestamp('09-JUN-11 10.34.43.913000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.34.43.913000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101169',   
'100019','network','','index',  
'tjmoretto',to_timestamp('09-JUN-11 10.34.46.265000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.34.46.265000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101170',   
'100025','network','','rendercampaign',      
'jdonnenfeld',to_timestamp('09-JUN-11 10.34.46.291000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 10.34.46.291000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101194',   
'100018','network','100015','getavailableresourcesforgroup',           
'hblack',to_timestamp('09-JUN-11 10.36.22.115000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.36.22.115000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101200',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('09-JUN-11 10.37.42.452000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.37.42.452000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101201',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-JUN-11 10.37.48.221000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.37.48.221000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101202',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.38.08.523000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.08.523000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101203',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.38.08.718000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.08.718000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101204',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.38.11.366000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.11.366000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101205',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.38.13.703000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.13.703000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101206',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 10.38.44.964000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.38.44.964000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101207',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 10.38.45.522000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.38.45.522000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101208',   
'100018','network','100037','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.38.48.569000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.48.569000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101209',   
'100018','network','100038','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.38.50.226000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.50.226000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101210',   
'100018','network','100039','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.38.52.037000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.52.037000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101211',   
'100018','network','100040','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.38.53.789000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.53.789000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101212',   
'100018','network','100041','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.38.56.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.38.56.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101213',   
'100018','network','100042','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.39.00.463000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.00.463000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101214',   
'100018','network','100043','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.39.02.812000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.02.812000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101215',   
'100018','network','100044','removeresourcefromgroup',    
'hblack',to_timestamp('09-JUN-11 10.39.05.138000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.05.138000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101216',   
'100018','network','100014','removeresourcesection',      
'hblack',to_timestamp('09-JUN-11 10.39.14.212000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.14.212000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101217',   
'100018','network','','index',  
'hblack',to_timestamp('09-JUN-11 10.39.24.838000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.24.838000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101218',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 10.39.24.897000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.24.897000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101219',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.39.25.282000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.25.282000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101220',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 10.39.28.808000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.28.808000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101002',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-JUN-11 05.08.44.474000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.44.474000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101003',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-JUN-11 05.08.44.980000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-JUN-11 05.08.44.980000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101221',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 10.39.30.316000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 10.39.30.316000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101222',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 10.39.54.611000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.39.54.611000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101223',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 10.40.00.800000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.40.00.800000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101224',   
'100019','network','0','savecampaign',       
'tjmoretto',to_timestamp('09-JUN-11 10.41.17.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.41.17.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101225',   
'100019','network','100003','createPDFcampaign',          
'tjmoretto',to_timestamp('09-JUN-11 10.41.22.645000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.41.22.645000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101226',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('09-JUN-11 10.42.11.941000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.42.11.941000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101227',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 10.42.22.474000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.42.22.474000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101228',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 10.42.22.895000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.42.22.895000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101229',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('09-JUN-11 10.42.26.430000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.42.26.430000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101230',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 10.43.55.955000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.43.55.955000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101231',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 10.43.56.165000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.43.56.165000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101232',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 10.43.59.019000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.43.59.019000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101233',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-JUN-11 10.44.00.497000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.44.00.497000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101234',   
'100019','network','','index',  
'tjmoretto',to_timestamp('09-JUN-11 10.44.29.404000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.44.29.404000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101235',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 10.44.29.501000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.44.29.501000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101236',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 10.44.29.737000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.44.29.737000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101237',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('09-JUN-11 10.49.28.742000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 10.49.28.742000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101238',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.06.05.555000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.06.05.555000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101239',   
'100025','network','','downloadResource',    
'jdonnenfeld',to_timestamp('09-JUN-11 11.06.14.983000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.06.14.983000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101240',   
'100025','network','','resources',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.06.26.746000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.06.26.746000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101241',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.06.32.331000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.06.32.331000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101242',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.06.32.747000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.06.32.747000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101270',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.12.36.748000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.12.36.748000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101271',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.37.070000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.37.070000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101272',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.37.993000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.37.993000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101273',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.12.39.294000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.12.39.294000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101274',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.41.199000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.41.199000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101275',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.12.41.516000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.12.41.516000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101276',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.43.595000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.43.595000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101277',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.47.126000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.47.126000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101278',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.47.459000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.47.459000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101279',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.12.48.323000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.12.48.323000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101280',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.12.53.269000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.12.53.269000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101281',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.13.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.13.00.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101282',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.13.09.288000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.13.09.288000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101283',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.13.19.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.13.19.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101284',   
'100018','network','','sortresourceingroup', 
'hblack',to_timestamp('09-JUN-11 11.13.26.976000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.13.26.976000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101285',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.13.36.934000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.13.36.934000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101286',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.13.37.137000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.13.37.137000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101287',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.13.42.130000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.13.42.130000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101288',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.13.44.950000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.13.44.950000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101289',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.14.38.973000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.14.38.973000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101290',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.14.39.179000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.14.39.179000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101291',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.14.41.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.14.41.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101292',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.14.43.252000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.14.43.252000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101293',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.15.05.118000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.15.05.118000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101294',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.15.05.294000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.15.05.294000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101295',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.15.08.746000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.15.08.746000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101296',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.15.12.209000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.15.12.209000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101297',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.15.29.254000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.15.29.254000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101298',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.15.29.633000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.15.29.633000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101299',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.15.30.556000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.15.30.556000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101300',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.15.41.332000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.15.41.332000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101301',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.15.41.515000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.15.41.515000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101302',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 11.15.44.286000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.15.44.286000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101303',   
'100018','network','100012','editresource',  
'hblack',to_timestamp('09-JUN-11 11.15.50.149000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.15.50.149000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101304',   
'100018','network','100012','saveresource',  
'hblack',to_timestamp('09-JUN-11 11.16.15.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.15.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101305',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 11.16.15.502000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.15.502000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101306',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.16.31.220000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.31.220000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101307',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.16.36.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.36.826000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101308',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.16.37.236000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.37.236000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101309',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.16.39.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.39.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101310',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.16.41.253000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.41.253000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101311',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.16.45.574000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.45.574000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101312',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.16.45.799000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.45.799000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101313',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.16.47.539000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.47.539000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101314',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.16.53.167000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.16.53.167000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101315',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.16.53.510000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.16.53.510000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101316',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.16.54.341000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.16.54.341000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101317',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.16.55.244000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.16.55.244000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101318',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.17.22.537000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.17.22.537000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101319',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.17.22.696000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.17.22.696000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101320',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('09-JUN-11 11.17.38.555000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.17.38.555000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101321',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.17.49.377000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.17.49.377000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101322',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.17.49.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.17.49.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101323',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.17.52.576000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.17.52.576000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101324',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('09-JUN-11 11.17.54.429000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.17.54.429000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101325',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.18.05.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.18.05.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101326',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.18.05.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.18.05.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101327',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.18.08.005000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.18.08.005000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101328',   
'100018','network','','admincontactsfornetwork',          
'hblack',to_timestamp('09-JUN-11 11.18.11.246000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.18.11.246000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101329',   
'100019','network','','index',  
'tjmoretto',to_timestamp('09-JUN-11 11.19.00.038000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.19.00.038000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101330',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 11.19.00.220000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.19.00.220000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101331',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 11.19.00.513000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.19.00.513000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101332',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 11.19.03.574000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.19.03.574000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101333',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('09-JUN-11 11.19.04.001000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.19.04.001000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101334',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('09-JUN-11 11.19.06.001000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.19.06.001000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101335',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.19.26.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.19.26.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101336',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.19.27.008000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.19.27.008000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101337',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.19.27.872000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.19.27.872000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101338',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.19.42.827000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.19.42.827000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101339',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.19.52.528000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.19.52.528000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101340',   
'100025','network','','resources',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.19.54.298000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.19.54.298000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101341',   
'100025','network','','downloadResource',    
'jdonnenfeld',to_timestamp('09-JUN-11 11.20.03.712000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.20.03.712000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101342',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('09-JUN-11 11.20.30.378000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.20.30.378000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101345',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('09-JUN-11 11.20.36.687000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.20.36.687000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101346',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.20.43.656000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.20.43.656000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101347',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.20.43.986000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.20.43.986000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101348',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.20.44.776000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.20.44.776000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101349',   
'100025','network','','calculator',          
'jdonnenfeld',to_timestamp('09-JUN-11 11.20.46.770000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.20.46.770000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101350',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('09-JUN-11 11.20.47.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.20.47.164000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101351',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 11.20.54.074000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.20.54.074000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101352',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 11.20.54.521000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.20.54.521000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101353',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 11.21.07.610000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.21.07.610000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101354',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 11.21.07.771000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.21.07.771000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101355',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-JUN-11 11.21.09.155000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.21.09.155000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101356',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('09-JUN-11 11.22.32.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.22.32.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101357',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 11.22.34.406000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.22.34.406000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101358',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 11.22.34.702000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.22.34.702000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101359',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 11.24.10.929000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.24.10.929000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101360',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 11.24.13.659000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.24.13.659000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101361',   
'100019','network','100003','editcampaign',  
'tjmoretto',to_timestamp('09-JUN-11 11.24.23.201000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.24.23.201000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101362',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 11.24.54.257000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.24.54.257000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101363',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 11.24.54.496000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.24.54.496000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101364',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-JUN-11 11.24.55.321000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.24.55.321000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101365',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.25.47.457000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.25.47.457000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101366',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.25.47.821000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.25.47.821000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101367',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-JUN-11 11.26.00.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.26.00.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101368',   
'100025','network','','rendercampaign',      
'jdonnenfeld',to_timestamp('09-JUN-11 11.26.04.134000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.26.04.134000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101369',   
'100025','network','','rendercampaign',      
'jdonnenfeld',to_timestamp('09-JUN-11 11.26.05.569000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.26.05.569000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101370',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.26.08.525000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.26.08.525000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101371',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.26.08.774000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.26.08.774000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101372',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.27.00.689000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.27.00.689000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101373',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.27.23.525000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.27.23.525000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101343',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 11.20.34.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.20.34.824000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101344',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-JUN-11 11.20.35.068000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.20.35.068000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101374',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.34.50.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.34.50.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101375',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 11.34.51.207000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.34.51.207000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101376',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 11.34.52.049000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 11.34.52.049000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101377',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.35.57.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.35.57.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101378',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 11.46.12.997000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.46.12.997000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101379',   
'100018','network','100004','editresource',  
'hblack',to_timestamp('09-JUN-11 11.46.32.399000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.46.32.399000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101380',   
'100018','network','100004','saveresource',  
'hblack',to_timestamp('09-JUN-11 11.47.21.717000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.47.21.717000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101381',   
'100018','network','','adminresources',      
'hblack',to_timestamp('09-JUN-11 11.47.21.913000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.47.21.913000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101382',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.47.46.845000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.47.46.845000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101383',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.47.47.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.47.47.163000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101384',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.47.50.291000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.47.50.291000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101385',   
'100018','network','','openPdf',
'hblack',to_timestamp('09-JUN-11 11.48.02.961000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.48.02.961000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101386',   
'100018','network','','openPdf',
'hblack',to_timestamp('09-JUN-11 11.48.03.146000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.48.03.146000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101387',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.49.03.703000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.49.03.703000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101388',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.49.06.989000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.49.06.989000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101389',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.49.10.155000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.49.10.155000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101390',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.49.14.867000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.49.14.867000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101391',   
'100018','network','','adminhome',           
'hblack',to_timestamp('09-JUN-11 11.49.29.631000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.49.29.631000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101392',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.49.29.857000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.49.29.857000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101393',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('09-JUN-11 11.49.35.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.49.35.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101394',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('09-JUN-11 11.49.37.128000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('09-JUN-11 11.49.37.128000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101395',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('09-JUN-11 11.55.31.548000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.55.31.548000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101396',   
'100019','network','100003','deletecampaign',
'tjmoretto',to_timestamp('09-JUN-11 11.55.36.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.55.36.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101397',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('09-JUN-11 11.55.36.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.55.36.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101398',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-JUN-11 11.55.40.090000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.55.40.090000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101399',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.56.28.372000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.56.28.372000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101400',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-JUN-11 11.56.28.668000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 11.56.28.668000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101401',   
'100025','network','','calculator',          
'jdonnenfeld',to_timestamp('09-JUN-11 01.16.45.610000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.16.45.610000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101402',   
'100025','network','','index',  
'jdonnenfeld',to_timestamp('09-JUN-11 01.16.49.192000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.16.49.192000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101403',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 01.16.49.531000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.16.49.531000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101404',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 01.16.50.434000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.16.50.434000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101405',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 01.16.54.010000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.16.54.010000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101406',   
'100025','network','','calculator',          
'jdonnenfeld',to_timestamp('09-JUN-11 01.16.55.056000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.16.55.056000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101407',   
'100025','network','','savedcampaigns',      
'jdonnenfeld',to_timestamp('09-JUN-11 01.16.58.896000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.16.58.896000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101408',   
'100025','network','','resources',           
'jdonnenfeld',to_timestamp('09-JUN-11 01.22.46.086000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.22.46.086000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101409',   
'100025','network','','contacts',            
'jdonnenfeld',to_timestamp('09-JUN-11 01.22.49.935000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.22.49.935000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101410',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('09-JUN-11 01.22.53.087000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.22.53.087000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101411',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('09-JUN-11 01.22.53.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.22.53.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101412',   
'100025','network','','calculator',          
'jdonnenfeld',to_timestamp('09-JUN-11 01.23.35.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.23.35.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101413',   
'100025','network','','rendercampaign',      
'jdonnenfeld',to_timestamp('09-JUN-11 01.25.20.035000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.25.20.035000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101414',   
'100025','network','','rendercampaign',      
'jdonnenfeld',to_timestamp('09-JUN-11 01.25.21.493000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.25.21.493000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101415',   
'100025','network','0','savecampaign',       
'jdonnenfeld',to_timestamp('09-JUN-11 01.27.18.269000 PM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('09-JUN-11 01.27.18.269000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101416',   
'100019','network','','index',  
'tjmoretto',to_timestamp('09-JUN-11 03.22.09.275000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 03.22.09.275000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101417',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-JUN-11 03.22.09.385000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-JUN-11 03.22.09.385000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101421',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('10-JUN-11 08.28.40.171000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.28.40.171000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101422',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('10-JUN-11 08.28.42.867000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.28.42.867000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101423',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.28.46.358000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.28.46.358000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101424',   
'100019','network','100025','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.28.49.435000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.28.49.435000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101425',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.29.34.576000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.29.34.576000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101426',   
'100019','network','100025','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.29.39.303000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.29.39.303000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101427',   
'100019','network','100025','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.29.54.839000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.29.54.839000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101428',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.29.55.148000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.29.55.148000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101429',   
'100019','network','100020','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.30.22.147000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.30.22.147000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101430',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.31.07.316000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.31.07.316000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101431',   
'100019','network','100025','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.31.17.548000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.31.17.548000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101432',   
'100019','network','100025','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.31.29.754000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.31.29.754000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101433',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.31.29.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.31.29.825000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101434',   
'100019','network','100020','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.31.35.498000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.31.35.498000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101435',   
'100019','network','100020','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.31.54.947000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.31.54.947000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101436',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.31.55.013000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.31.55.013000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101437',   
'100019','network','100021','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.05.080000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.05.080000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101438',   
'100019','network','100021','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.15.830000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.15.830000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101439',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.32.15.903000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.15.903000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101440',   
'100019','network','100024','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.22.907000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.22.907000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101443',   
'100019','network','100025','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.30.895000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.30.895000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101444',   
'100019','network','100025','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.36.728000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.36.728000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101445',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.32.36.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.36.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101446',   
'100019','network','100022','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.39.222000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.39.222000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101447',   
'100019','network','100022','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.44.329000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.44.329000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101448',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.32.44.393000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.44.393000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101449',   
'100019','network','100023','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.48.642000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.48.642000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101450',   
'100019','network','100023','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.54.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.54.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101451',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.32.54.332000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.54.332000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101452',   
'100019','network','100020','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.59.521000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.59.521000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101453',   
'100019','network','100020','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.33.04.373000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.33.04.373000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101454',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.33.04.467000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.33.04.467000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101455',   
'100019','network','100026','editcontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.33.11.430000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.33.11.430000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101456',   
'100019','network','100026','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.33.15.658000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.33.15.658000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101457',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.33.15.726000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.33.15.726000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101458',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('10-JUN-11 09.00.14.811000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.00.14.811000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101459',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('10-JUN-11 09.00.55.261000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.00.55.261000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101460',   
'100019','network','','index',  
'tjmoretto',to_timestamp('10-JUN-11 09.25.25.221000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.25.25.221000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101461',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('10-JUN-11 09.25.25.283000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.25.25.283000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101462',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('10-JUN-11 09.25.25.527000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.25.25.527000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101463',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('10-JUN-11 09.27.00.827000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.27.00.827000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101464',   
'100027','network','','index',  
'nctakiosk',to_timestamp('10-JUN-11 09.27.30.812000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.27.30.812000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101465',   
'100027','network','','index',  
'nctakiosk',to_timestamp('10-JUN-11 09.27.42.739000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.27.42.739000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101466',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('10-JUN-11 09.27.47.885000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.27.47.885000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101467',   
'100027','network','','index',  
'nctakiosk',to_timestamp('10-JUN-11 09.45.13.552000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.45.13.552000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101468',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('10-JUN-11 09.45.21.753000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.45.21.753000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101441',   
'100019','network','100024','savecontact',   
'tjmoretto',to_timestamp('10-JUN-11 08.32.28.461000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.28.461000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101442',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('10-JUN-11 08.32.28.516000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 08.32.28.516000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101469',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('10-JUN-11 09.45.27.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.45.27.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101470',   
'100027','network','100004','editcampaign',  
'nctakiosk',to_timestamp('10-JUN-11 09.45.31.933000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.45.31.933000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101471',   
'100027','network','100004','editcampaign',  
'nctakiosk',to_timestamp('10-JUN-11 09.45.36.258000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.45.36.258000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101472',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('10-JUN-11 09.45.49.017000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.45.49.017000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101473',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 09.45.53.652000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.45.53.652000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101474',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('10-JUN-11 09.45.58.186000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.45.58.186000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101475',   
'100027','network','','downloadResource',    
'nctakiosk',to_timestamp('10-JUN-11 09.46.12.108000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.46.12.108000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101476',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('10-JUN-11 09.46.30.409000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.46.30.409000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101477',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('10-JUN-11 09.47.27.512000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.47.27.512000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101478',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('10-JUN-11 09.47.28.135000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.47.28.135000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101479',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('10-JUN-11 09.47.47.187000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.47.47.187000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101480',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('10-JUN-11 09.48.02.149000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.48.02.149000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101481',   
'100027','network','','index',  
'nctakiosk',to_timestamp('10-JUN-11 09.50.17.626000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.50.17.626000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101482',   
'100027','network','','index',  
'nctakiosk',to_timestamp('10-JUN-11 09.51.53.043000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.51.53.043000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101483',   
'100027','network','','index',  
'nctakiosk',to_timestamp('10-JUN-11 09.53.36.533000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('10-JUN-11 09.53.36.533000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101484',   
'100018','network','','index',  
'hblack',to_timestamp('10-JUN-11 10.24.21.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.24.21.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101485',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.24.21.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.24.21.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101488',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.24.53.304000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.24.53.304000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101489',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.24.53.976000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.24.53.976000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101490',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.24.58.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.24.58.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101491',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 10.25.04.608000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.25.04.608000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101492',   
'100018','network','','saveresourcesection', 
'hblack',to_timestamp('10-JUN-11 10.25.48.743000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.25.48.743000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101493',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.26.46.060000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.26.46.060000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101494',   
'100018','network','','editresource',        
'hblack',to_timestamp('10-JUN-11 10.33.09.475000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.33.09.475000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101495',   
'100018','network','','saveresource',        
'hblack',to_timestamp('10-JUN-11 10.36.52.731000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.36.52.731000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101496',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.36.52.821000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.36.52.821000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101497',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.37.04.818000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.37.04.818000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101498',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.37.05.014000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.37.05.014000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101499',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 10.37.07.226000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.37.07.226000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101500',   
'100018','network','100016','getavailableresourcesforgroup',           
'hblack',to_timestamp('10-JUN-11 10.37.11.044000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.37.11.044000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101501',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('10-JUN-11 10.37.14.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.37.14.448000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101502',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.37.33.372000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.37.33.372000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101503',   
'100018','network','','editresource',        
'hblack',to_timestamp('10-JUN-11 10.37.35.752000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.37.35.752000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101504',   
'100018','network','','saveresource',        
'hblack',to_timestamp('10-JUN-11 10.38.51.900000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.38.51.900000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101505',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.38.52.023000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.38.52.023000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101506',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.38.55.555000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.38.55.555000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101507',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.38.55.722000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.38.55.722000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101508',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 10.38.57.933000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.38.57.933000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101509',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.39.07.140000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.39.07.140000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101510',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.39.07.403000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.39.07.403000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101511',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.39.09.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.39.09.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101512',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 10.39.11.349000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.39.11.349000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101513',   
'100018','network','','saveresourcesection', 
'hblack',to_timestamp('10-JUN-11 10.39.46.778000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.39.46.778000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101514',   
'100018','network','100017','getavailableresourcesforgroup',           
'hblack',to_timestamp('10-JUN-11 10.40.05.570000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.40.05.570000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101515',   
'100018','network','','addresourcetogroup',  
'hblack',to_timestamp('10-JUN-11 10.40.08.654000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.40.08.654000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101516',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.40.20.086000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.40.20.086000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101517',   
'100018','network','','editresource',        
'hblack',to_timestamp('10-JUN-11 10.40.23.398000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.40.23.398000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101518',   
'100018','network','','saveresource',        
'hblack',to_timestamp('10-JUN-11 10.44.56.248000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.44.56.248000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101519',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.44.56.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.44.56.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101520',   
'100018','network','100017','editresource',  
'hblack',to_timestamp('10-JUN-11 10.45.05.548000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.45.05.548000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101521',   
'100018','network','100017','saveresource',  
'hblack',to_timestamp('10-JUN-11 10.45.48.124000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.45.48.124000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101522',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.45.48.189000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.45.48.189000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101523',   
'100018','network','100018','editresource',  
'hblack',to_timestamp('10-JUN-11 10.46.04.245000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.46.04.245000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101524',   
'100018','network','100018','saveresource',  
'hblack',to_timestamp('10-JUN-11 10.46.27.641000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.46.27.641000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101525',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.46.27.737000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.46.27.737000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101526',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.46.40.901000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.46.40.901000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101527',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.46.41.112000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.46.41.112000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101528',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 10.46.43.668000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.46.43.668000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101529',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.47.10.428000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.10.428000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101530',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.47.10.685000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.10.685000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101531',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.47.13.039000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.13.039000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101532',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 10.47.14.636000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.14.636000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101533',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.47.27.879000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.27.879000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101534',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.47.28.155000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.28.155000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101535',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.47.30.812000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.30.812000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101536',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('10-JUN-11 10.47.36.157000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.36.157000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101537',   
'100018','network','','adminhome',           
'hblack',to_timestamp('10-JUN-11 10.47.46.202000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.46.202000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101538',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('10-JUN-11 10.47.46.408000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.47.46.408000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101539',   
'100018','network','','adminresources',      
'hblack',to_timestamp('10-JUN-11 10.55.05.956000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('10-JUN-11 10.55.05.956000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102253',   
'100019','network','100021','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.48.11.413000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.11.413000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102254',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.48.19.701000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.19.701000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102255',   
'100019','network','100021','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.48.21.350000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.21.350000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102256',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.48.25.445000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.25.445000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102257',   
'100019','network','100021','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.48.28.411000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.28.411000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102258',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.48.30.982000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.30.982000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102259',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('13-JUN-11 03.48.34.734000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.34.734000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102260',   
'100019','network','100020','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.48.44.322000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.44.322000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102261',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.48.49.051000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.49.051000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102262',   
'100019','network','100020','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.48.50.353000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.50.353000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102263',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.48.53.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.53.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102264',   
'100019','network','100020','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.48.58.938000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.58.938000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102265',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.06.151000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.06.151000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102266',   
'100019','network','100020','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.49.08.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.08.314000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102267',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.27.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.27.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102268',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.49.29.431000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.29.431000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102269',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.29.724000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.29.724000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102270',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.49.32.860000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.32.860000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102271',   
'100019','network','100005','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.37.729000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.37.729000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102272',   
'100019','network','100005','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.40.530000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.40.530000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102273',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.49.40.611000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.40.611000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102274',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.49.42.169000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.42.169000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102275',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.42.378000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.42.378000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102276',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.49.43.420000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.43.420000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102277',   
'100019','network','100020','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.49.46.394000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.46.394000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102278',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.51.549000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.51.549000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102279',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('13-JUN-11 03.49.54.031000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.54.031000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102280',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.49.56.997000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.56.997000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102281',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.57.196000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.57.196000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102282',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.49.59.049000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.49.59.049000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102283',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.50.00.222000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.00.222000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102284',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.50.00.627000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.00.627000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102285',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('13-JUN-11 03.50.05.386000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.05.386000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102286',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.50.08.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.08.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102287',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.50.08.558000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.08.558000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102288',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.50.11.411000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.11.411000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102289',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.50.11.976000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.11.976000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102290',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('13-JUN-11 03.50.17.528000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.17.528000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102291',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.50.19.571000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.19.571000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102292',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.50.19.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.19.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102293',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.50.21.721000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.21.721000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102294',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.50.22.359000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.22.359000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102295',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('13-JUN-11 03.50.26.803000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.26.803000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102296',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.50.29.083000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.29.083000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102297',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.50.29.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.29.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102298',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.50.30.799000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.30.799000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102299',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.50.31.709000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.31.709000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102300',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 03.50.55.210000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.50.55.210000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102301',   
'100027','network','','index',  
'nctakiosk',to_timestamp('13-JUN-11 03.51.02.304000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.51.02.304000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102302',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('13-JUN-11 03.51.08.809000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.51.08.809000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102303',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('13-JUN-11 03.51.52.476000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.51.52.476000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102304',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('13-JUN-11 03.51.54.623000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.51.54.623000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102305',   
'100027','network','','contacts',            
'nctakiosk',to_timestamp('13-JUN-11 03.52.00.440000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.00.440000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102306',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('13-JUN-11 03.52.02.705000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.02.705000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102307',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 03.52.08.412000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.08.412000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102308',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.52.08.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.08.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102309',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.52.08.721000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.08.721000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102310',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('13-JUN-11 03.52.10.493000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.10.493000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102311',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.52.12.479000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.12.479000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102312',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.52.12.683000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.12.683000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102313',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.52.14.311000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.14.311000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102314',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('13-JUN-11 03.52.15.020000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.15.020000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102315',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('13-JUN-11 03.52.23.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.23.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102316',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('13-JUN-11 03.52.29.968000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.29.968000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102317',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('13-JUN-11 03.52.35.630000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.35.630000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102318',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('13-JUN-11 03.52.38.597000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.38.597000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102319',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('13-JUN-11 03.52.39.824000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.39.824000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102320',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('13-JUN-11 03.52.41.377000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.41.377000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102321',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('13-JUN-11 03.52.42.190000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.42.190000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102322',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.52.47.475000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.47.475000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102323',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.52.47.656000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.47.656000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102324',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.52.49.515000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.49.515000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102325',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('13-JUN-11 03.52.50.097000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.50.097000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102326',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.52.54.023000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.54.023000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102327',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.52.54.205000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.54.205000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102328',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.52.56.109000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.56.109000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102329',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('13-JUN-11 03.52.56.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.52.56.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102330',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('13-JUN-11 03.53.01.712000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.01.712000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102331',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('13-JUN-11 03.53.03.672000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.03.672000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102332',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('13-JUN-11 03.53.06.945000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.06.945000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102333',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('13-JUN-11 03.53.08.826000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.08.826000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102334',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('13-JUN-11 03.53.12.595000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.12.595000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102335',   
'100019','network','','sortcontact',         
'tjmoretto',to_timestamp('13-JUN-11 03.53.14.848000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.14.848000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102336',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('13-JUN-11 03.53.16.018000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.16.018000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102337',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('13-JUN-11 03.53.17.470000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.17.470000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102338',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('13-JUN-11 03.53.26.586000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.53.26.586000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102339',   
'100018','network','','index',  
'hblack',to_timestamp('13-JUN-11 03.53.52.632000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.53.52.632000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102340',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 03.53.52.703000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.53.52.703000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102341',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 03.53.53.038000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.53.53.038000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102342',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.55.35.426000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.35.426000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102343',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.55.35.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.35.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102344',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.55.38.186000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.38.186000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102414',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 04.14.24.500000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.24.500000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102415',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 04.14.26.172000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.26.172000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102416',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('13-JUN-11 04.14.27.602000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.27.602000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102417',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('13-JUN-11 04.14.29.113000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.29.113000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102418',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 04.14.35.620000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.35.620000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102419',   
'100027','network','','index',  
'nctakiosk',to_timestamp('13-JUN-11 04.14.53.088000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.53.088000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102420',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('13-JUN-11 04.14.55.315000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.55.315000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102421',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('13-JUN-11 04.14.56.726000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.56.726000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102422',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('13-JUN-11 04.14.58.739000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.58.739000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102423',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 04.24.09.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.24.09.619000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102424',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 04.24.09.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.24.09.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102425',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 04.24.10.034000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.24.10.034000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102426',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 04.24.18.565000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.24.18.565000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102427',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('13-JUN-11 04.24.19.425000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.24.19.425000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102428',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('13-JUN-11 04.24.21.101000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.24.21.101000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102429',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 04.24.36.318000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.24.36.318000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102430',   
'100018','network','','index',  
'hblack',to_timestamp('13-JUN-11 04.25.30.508000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.30.508000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102431',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 04.25.30.623000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.30.623000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102460',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.26.27.551000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.27.551000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102461',   
'100018','network','100009','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.29.778000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.29.778000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102462',   
'100018','network','100009','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.30.082000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.30.082000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102463',   
'100018','network','100009','savecampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.33.896000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.33.896000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102464',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.26.37.693000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.37.693000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102465',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 04.26.40.116000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.40.116000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102466',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.26.40.331000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.40.331000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102467',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.26.41.841000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.41.841000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102468',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.26.42.579000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.42.579000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102469',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.26.43.913000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.43.913000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102470',   
'100018','logout','','index',   
'hblack',to_timestamp('13-JUN-11 04.26.45.970000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.45.970000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102471',   
'100027','network','','index',  
'nctakiosk',to_timestamp('13-JUN-11 04.26.56.434000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.26.56.434000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102472',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('13-JUN-11 04.27.00.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.27.00.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102473',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('13-JUN-11 04.27.02.152000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.27.02.152000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102474',   
'100027','network','','index',  
'nctakiosk',to_timestamp('13-JUN-11 09.13.12.511000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 09.13.12.511000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102475',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('13-JUN-11 09.13.30.013000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 09.13.30.013000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102476',   
'100027','network','','index',  
'nctakiosk',to_timestamp('14-JUN-11 09.16.30.580000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 09.16.30.580000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102477',   
'100027','network','','index',  
'nctakiosk',to_timestamp('14-JUN-11 11.30.58.701000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 11.30.58.701000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102478',   
'100027','network','','index',  
'nctakiosk',to_timestamp('14-JUN-11 11.31.11.132000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 11.31.11.132000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102479',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('14-JUN-11 11.31.13.266000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 11.31.13.266000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102480',   
'100027','network','','contacts',            
'nctakiosk',to_timestamp('14-JUN-11 11.31.22.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 11.31.22.755000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102481',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('14-JUN-11 11.31.48.866000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 11.31.48.866000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102482',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('14-JUN-11 11.31.52.536000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 11.31.52.536000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102483',   
'100027','network','','index',  
'nctakiosk',to_timestamp('14-JUN-11 11.58.19.325000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 11.58.19.325000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102484',   
'100027','network','','index',  
'nctakiosk',to_timestamp('14-JUN-11 11.58.58.072000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 11.58.58.072000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102485',   
'100027','network','','index',  
'nctakiosk',to_timestamp('14-JUN-11 12.00.04.171000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.00.04.171000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102486',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('14-JUN-11 12.00.09.217000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.00.09.217000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102487',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('14-JUN-11 12.00.32.002000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.00.32.002000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102488',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('14-JUN-11 12.00.37.113000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.00.37.113000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102489',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('14-JUN-11 12.00.39.653000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.00.39.653000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102490',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('14-JUN-11 12.00.41.247000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.00.41.247000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102491',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('14-JUN-11 12.00.50.161000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.00.50.161000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102492',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.01.57.876000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.01.57.876000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102493',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.01.58.467000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.01.58.467000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102494',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.14.870000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.14.870000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102495',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.18.220000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.18.220000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102496',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.20.796000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.20.796000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102497',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.25.864000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.25.864000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102498',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.31.175000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.31.175000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102499',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.32.210000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.32.210000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102500',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.35.206000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.35.206000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102501',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.36.098000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.36.098000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102502',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.02.42.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.02.42.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102503',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.03.00.111000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.03.00.111000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102504',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.03.09.375000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.03.09.375000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102505',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('14-JUN-11 12.03.13.077000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.03.13.077000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102506',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('14-JUN-11 12.03.19.502000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.03.19.502000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102507',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('14-JUN-11 12.03.20.916000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.03.20.916000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102508',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('14-JUN-11 12.03.21.542000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.03.21.542000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102509',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('14-JUN-11 12.03.29.095000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.03.29.095000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102510',   
'100027','network','','index',  
'nctakiosk',to_timestamp('14-JUN-11 12.03.52.427000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 12.03.52.427000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102511',   
'100027','network','','index',  
'nctakiosk',to_timestamp('14-JUN-11 02.16.27.674000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 02.16.27.674000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102512',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('14-JUN-11 02.16.29.602000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 02.16.29.602000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102513',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('14-JUN-11 02.16.30.649000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 02.16.30.649000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102514',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('14-JUN-11 02.16.34.953000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 02.16.34.953000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102515',   
'100019','network','','index',  
'tjmoretto',to_timestamp('14-JUN-11 02.16.40.698000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 02.16.40.698000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102516',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('14-JUN-11 02.16.40.784000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 02.16.40.784000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102517',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('14-JUN-11 02.16.41.016000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('14-JUN-11 02.16.41.016000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102518',   
'100018','network','','index',  
'hblack',to_timestamp('14-JUN-11 03.58.44.907000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 03.58.44.907000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102519',   
'100018','network','','adminhome',           
'hblack',to_timestamp('14-JUN-11 03.58.45.043000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 03.58.45.043000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102520',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('14-JUN-11 03.58.45.385000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 03.58.45.385000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102521',   
'100018','network','','adminresources',      
'hblack',to_timestamp('14-JUN-11 03.59.46.215000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 03.59.46.215000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102525',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('14-JUN-11 04.31.30.366000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 04.31.30.366000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102526',   
'100018','logout','','index',   
'hblack',to_timestamp('14-JUN-11 04.32.42.279000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 04.32.42.279000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102527',   
'100027','network','','index',  
'nctakiosk',to_timestamp('16-JUN-11 08.50.19.262000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-JUN-11 08.50.19.262000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102528',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('16-JUN-11 08.50.21.663000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-JUN-11 08.50.21.663000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102529',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('16-JUN-11 08.50.22.945000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-JUN-11 08.50.22.945000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102530',   
'100027','network','','index',  
'nctakiosk',to_timestamp('16-JUN-11 08.50.33.584000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-JUN-11 08.50.33.584000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102531',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('16-JUN-11 08.50.36.429000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-JUN-11 08.50.36.429000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102532',   
'100019','network','','index',  
'tjmoretto',to_timestamp('16-JUN-11 10.43.14.540000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-JUN-11 10.43.14.540000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102533',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('16-JUN-11 10.43.14.687000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-JUN-11 10.43.14.687000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102567',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUN-11 01.56.43.532000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 01.56.43.532000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102568',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-JUN-11 02.09.51.409000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 02.09.51.409000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102569',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-JUN-11 02.09.51.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 02.09.51.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102570',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUN-11 02.09.52.201000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 02.09.52.201000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102571',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('22-JUN-11 02.55.59.278000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 02.55.59.278000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102572',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-JUN-11 02.56.12.127000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 02.56.12.127000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102573',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-JUN-11 02.56.12.567000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 02.56.12.567000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102574',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUN-11 02.56.13.049000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 02.56.13.049000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102577',   
'100019','network','','index',  
'tjmoretto',to_timestamp('11-JUL-11 08.53.17.829000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.53.17.829000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102578',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('11-JUL-11 08.53.18.244000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.53.18.244000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102522',   
'100018','logout','','index',   
'hblack',to_timestamp('14-JUN-11 04.08.49.948000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 04.08.49.948000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102523',   
'100018','network','','index',  
'hblack',to_timestamp('14-JUN-11 04.31.29.968000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 04.31.29.968000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102524',   
'100018','network','','adminhome',           
'hblack',to_timestamp('14-JUN-11 04.31.30.043000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('14-JUN-11 04.31.30.043000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102534',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('16-JUN-11 10.43.15.054000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-JUN-11 10.43.15.054000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102535',   
'100019','network','','index',  
'tjmoretto',to_timestamp('17-JUN-11 01.15.06.729000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('17-JUN-11 01.15.06.729000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102536',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('17-JUN-11 01.15.06.998000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('17-JUN-11 01.15.06.998000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102537',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('17-JUN-11 01.15.07.483000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('17-JUN-11 01.15.07.483000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102538',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('17-JUN-11 01.15.11.462000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('17-JUN-11 01.15.11.462000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102539',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('17-JUN-11 01.15.11.917000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('17-JUN-11 01.15.11.917000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102540',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('17-JUN-11 01.15.13.789000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('17-JUN-11 01.15.13.789000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102541',   
'100019','network','100011','editcampaign',  
'tjmoretto',to_timestamp('17-JUN-11 01.15.15.689000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('17-JUN-11 01.15.15.689000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102542',   
'100019','network','100011','editcampaign',  
'tjmoretto',to_timestamp('17-JUN-11 01.15.16.177000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('17-JUN-11 01.15.16.177000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102543',   
'100027','network','','index',  
'nctakiosk',to_timestamp('20-JUN-11 09.02.08.908000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUN-11 09.02.08.908000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102544',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('20-JUN-11 09.02.11.600000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUN-11 09.02.11.600000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102545',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('20-JUN-11 09.02.13.311000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUN-11 09.02.13.311000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102546',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('20-JUN-11 09.02.23.573000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUN-11 09.02.23.573000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102547',   
'6000','network','','index',    
'canoeadmin',to_timestamp('21-JUN-11 02.52.48.041000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('21-JUN-11 02.52.48.041000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102548',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('21-JUN-11 02.52.48.193000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('21-JUN-11 02.52.48.193000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102549',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('21-JUN-11 04.34.23.733000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('21-JUN-11 04.34.23.733000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102550',   
'100027','network','','index',  
'nctakiosk',to_timestamp('21-JUN-11 05.40.20.254000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('21-JUN-11 05.40.20.254000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102551',   
'100027','network','','index',  
'nctakiosk',to_timestamp('21-JUN-11 05.41.13.030000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('21-JUN-11 05.41.13.030000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102552',   
'100030','network','','index',  
'jmunoz',to_timestamp('22-JUN-11 08.28.59.730000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.28.59.730000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102553',   
'100030','network','','emptyhome',           
'jmunoz',to_timestamp('22-JUN-11 08.28.59.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.28.59.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102554',   
'100030','network','','index',  
'jmunoz',to_timestamp('22-JUN-11 08.29.19.022000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.29.19.022000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102555',   
'100030','network','','emptyhome',           
'jmunoz',to_timestamp('22-JUN-11 08.29.19.122000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.29.19.122000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102556',   
'100030','network','','index',  
'jmunoz',to_timestamp('22-JUN-11 08.29.28.808000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.29.28.808000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102557',   
'100030','network','','emptyhome',           
'jmunoz',to_timestamp('22-JUN-11 08.29.28.908000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.29.28.908000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102558',   
'100030','logout','','index',   
'jmunoz',to_timestamp('22-JUN-11 08.30.01.732000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.30.01.732000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102559',   
'100030','network','','index',  
'jmunoz',to_timestamp('22-JUN-11 08.30.10.275000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.30.10.275000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102560',   
'100030','network','','emptyhome',           
'jmunoz',to_timestamp('22-JUN-11 08.30.10.367000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.30.10.367000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102561',   
'100030','logout','','index',   
'jmunoz',to_timestamp('22-JUN-11 08.30.13.861000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUN-11 08.30.13.861000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102562',   
'6000','network','','index',    
'canoeadmin',to_timestamp('22-JUN-11 12.21.50.685000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUN-11 12.21.50.685000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102563',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('22-JUN-11 12.21.50.813000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUN-11 12.21.50.813000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102564',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('22-JUN-11 12.22.12.286000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUN-11 12.22.12.286000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102565',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-JUN-11 01.56.42.701000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 01.56.42.701000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102566',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-JUN-11 01.56.42.835000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUN-11 01.56.42.835000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102579',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('11-JUL-11 08.53.18.935000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.53.18.935000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102580',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('11-JUL-11 08.53.21.146000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.53.21.146000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102581',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('11-JUL-11 08.53.22.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.53.22.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102582',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.53.46.051000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.53.46.051000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102583',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.54.07.880000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.54.07.880000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102584',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.54.28.535000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.54.28.535000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102585',   
'100019','network','','index',  
'tjmoretto',to_timestamp('11-JUL-11 08.55.48.557000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.55.48.557000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102586',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('11-JUL-11 08.55.48.734000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.55.48.734000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102587',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('11-JUL-11 08.55.49.507000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.55.49.507000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102588',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('11-JUL-11 08.55.55.498000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.55.55.498000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102589',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('11-JUL-11 08.55.58.501000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.55.58.501000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102590',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.56.03.085000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.56.03.085000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102591',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.56.09.427000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.56.09.427000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102592',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.56.16.630000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.56.16.630000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102593',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.56.22.026000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.56.22.026000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102594',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.56.25.054000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.56.25.054000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102595',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.56.28.404000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.56.28.404000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102596',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.56.31.273000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.56.31.273000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102597',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 08.56.41.589000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.56.41.589000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102598',   
'100019','network','100012','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('11-JUL-11 08.57.26.379000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.57.26.379000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102599',   
'100019','network','100009','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('11-JUL-11 08.58.01.559000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 08.58.01.559000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102600',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('11-JUL-11 09.02.01.092000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 09.02.01.092000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102601',   
'100027','network','','index',  
'nctakiosk',to_timestamp('11-JUL-11 10.08.14.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.08.14.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102602',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('11-JUL-11 10.08.43.568000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.08.43.568000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102603',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('11-JUL-11 10.10.30.107000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.10.30.107000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102604',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('11-JUL-11 10.10.46.718000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.10.46.718000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102605',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('11-JUL-11 10.10.49.472000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.10.49.472000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102606',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('11-JUL-11 10.10.50.050000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.10.50.050000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102607',   
'100027','network','100012','createPDFcampaign',          
'nctakiosk',to_timestamp('11-JUL-11 10.11.10.954000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.11.10.954000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102608',   
'100027','network','','contacts',            
'nctakiosk',to_timestamp('11-JUL-11 10.11.49.649000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.11.49.649000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102609',   
'100027','network','','index',  
'nctakiosk',to_timestamp('11-JUL-11 10.12.08.156000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.08.156000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102610',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('11-JUL-11 10.12.09.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.09.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102611',   
'100019','network','','index',  
'tjmoretto',to_timestamp('11-JUL-11 10.12.16.832000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.16.832000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102612',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('11-JUL-11 10.12.16.926000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.16.926000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102613',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('11-JUL-11 10.12.17.313000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.17.313000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102614',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('11-JUL-11 10.12.31.694000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.31.694000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102615',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('11-JUL-11 10.12.36.761000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.36.761000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102616',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 10.12.56.230000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.56.230000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102617',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('11-JUL-11 10.12.59.407000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.12.59.407000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102618',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('11-JUL-11 10.13.03.654000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.13.03.654000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102619',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('11-JUL-11 10.13.30.811000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.13.30.811000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102620',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('11-JUL-11 10.13.30.992000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.13.30.992000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102621',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('11-JUL-11 10.13.33.122000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.13.33.122000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102622',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('11-JUL-11 10.13.38.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.13.38.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102623',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('11-JUL-11 10.13.47.978000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.13.47.978000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102624',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('11-JUL-11 10.14.24.434000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.14.24.434000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102625',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('11-JUL-11 10.15.34.946000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.15.34.946000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102626',   
'100019','network','100009','editresource',  
'tjmoretto',to_timestamp('11-JUL-11 10.15.37.630000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.15.37.630000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102627',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('11-JUL-11 10.15.49.545000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.15.49.545000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102628',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('11-JUL-11 10.34.34.192000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 10.34.34.192000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102629',   
'100019','network','','index',  
'tjmoretto',to_timestamp('11-JUL-11 01.07.13.967000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 01.07.13.967000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102630',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('11-JUL-11 01.07.14.057000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 01.07.14.057000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102631',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('11-JUL-11 01.07.14.334000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('11-JUL-11 01.07.14.334000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102632',   
'6000','network','','index',    
'canoeadmin',to_timestamp('13-JUL-11 12.13.31.168000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUL-11 12.13.31.168000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102633',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('13-JUL-11 12.13.31.311000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUL-11 12.13.31.311000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102634',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('13-JUL-11 12.13.35.756000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUL-11 12.13.35.756000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102635',   
'100019','network','','index',  
'tjmoretto',to_timestamp('18-JUL-11 08.18.50.083000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('18-JUL-11 08.18.50.083000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102636',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('18-JUL-11 08.18.50.295000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('18-JUL-11 08.18.50.295000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102637',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('18-JUL-11 08.18.51.459000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('18-JUL-11 08.18.51.459000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102638',   
'100019','network','','index',  
'tjmoretto',to_timestamp('20-JUL-11 07.23.44.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.23.44.351000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102639',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('20-JUL-11 07.23.44.583000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.23.44.583000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102640',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('20-JUL-11 07.23.45.172000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.23.45.172000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102345',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('13-JUN-11 03.55.40.218000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.40.218000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102346',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.55.43.687000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.43.687000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102347',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.55.47.564000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.47.564000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102348',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.55.52.100000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.52.100000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102349',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.55.52.252000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.52.252000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102350',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 03.55.54.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.55.54.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102351',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 03.57.41.844000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.57.41.844000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102352',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 03.57.43.406000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.57.43.406000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102353',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 03.57.47.111000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.57.47.111000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102354',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 03.57.50.741000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.57.50.741000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102355',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 03.57.51.164000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.57.51.164000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102356',   
'100018','network','100006','savecampaign',  
'hblack',to_timestamp('13-JUN-11 03.59.21.234000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.59.21.234000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102357',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 03.59.26.110000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.59.26.110000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102358',   
'100018','network','100011','editcampaign',  
'hblack',to_timestamp('13-JUN-11 03.59.29.245000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.59.29.245000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102359',   
'100018','network','100011','editcampaign',  
'hblack',to_timestamp('13-JUN-11 03.59.29.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.59.29.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102360',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 04.00.25.058000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.00.25.058000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102361',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.00.25.480000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.00.25.480000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102362',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.00.28.355000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.00.28.355000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102363',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.00.30.465000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.00.30.465000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102364',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 04.02.20.109000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.02.20.109000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102365',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 04.02.20.410000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.02.20.410000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102366',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 04.02.48.526000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.02.48.526000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102367',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('13-JUN-11 04.03.24.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.03.24.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102368',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.03.33.352000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.03.33.352000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102369',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.03.34.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.03.34.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102370',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 04.05.30.696000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.05.30.696000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102371',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 04.05.31.085000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.05.31.085000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102372',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.05.41.147000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.05.41.147000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102373',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.05.49.168000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.05.49.168000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102374',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.05.53.277000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.05.53.277000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102375',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.05.56.137000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.05.56.137000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102376',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 04.06.00.467000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.06.00.467000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102377',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 04.06.00.730000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.06.00.730000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102378',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('13-JUN-11 04.06.07.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.06.07.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102379',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.06.14.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.06.14.535000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102380',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.06.20.077000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.06.20.077000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102381',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.06.20.322000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.06.20.322000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102382',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.06.59.100000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.06.59.100000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102383',   
'100018','network','100012','savecampaign',  
'hblack',to_timestamp('13-JUN-11 04.07.03.970000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.03.970000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102384',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.07.13.957000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.13.957000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102385',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.07.16.195000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.16.195000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102386',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.07.16.468000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.16.468000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102387',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.07.32.557000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.32.557000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102388',   
'100018','network','100013','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.07.34.726000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.34.726000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102389',   
'100018','network','100013','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.07.35.146000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.35.146000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102390',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 04.07.48.615000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.48.615000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102391',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.07.48.764000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.48.764000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102392',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.07.51.413000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.51.413000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102393',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.07.53.810000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.53.810000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102394',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.07.56.521000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.56.521000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102395',   
'100018','network','100011','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.07.58.921000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.58.921000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102396',   
'100018','network','100011','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.07.59.207000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.07.59.207000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102397',   
'100018','network','100011','savecampaign',  
'hblack',to_timestamp('13-JUN-11 04.08.32.648000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.08.32.648000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102398',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 04.08.41.206000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.08.41.206000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102399',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.08.41.372000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.08.41.372000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102400',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.08.44.317000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.08.44.317000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102401',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.08.49.625000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.08.49.625000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102402',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.08.53.562000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.08.53.562000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102403',   
'100018','network','100013','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.08.57.215000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.08.57.215000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102404',   
'100018','network','100013','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.08.57.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.08.57.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102405',   
'100018','network','100013','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.09.06.698000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.09.06.698000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102406',   
'100018','network','100013','savecampaign',  
'hblack',to_timestamp('13-JUN-11 04.10.03.733000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.10.03.733000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102407',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.10.09.736000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.10.09.736000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102408',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.10.12.086000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.10.12.086000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102409',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.10.12.359000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.10.12.359000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102410',   
'100018','network','100012','savecampaign',  
'hblack',to_timestamp('13-JUN-11 04.10.40.316000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.10.40.316000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102411',   
'100018','logout','','index',   
'hblack',to_timestamp('13-JUN-11 04.10.48.199000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.10.48.199000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102412',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 04.14.23.912000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.23.912000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102413',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 04.14.23.995000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 04.14.23.995000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102432',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.25.30.903000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.30.903000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102433',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.25.33.775000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.33.775000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102434',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.25.34.643000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.34.643000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102435',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.25.35.876000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.35.876000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102436',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 04.25.45.695000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.45.695000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102437',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.25.45.849000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.45.849000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102438',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.25.47.962000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.47.962000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102439',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.25.48.184000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.48.184000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102440',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.25.49.652000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.49.652000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102441',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.25.52.365000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.52.365000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102442',   
'100018','network','100012','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.25.52.848000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.52.848000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102443',   
'100018','network','100012','savecampaign',  
'hblack',to_timestamp('13-JUN-11 04.25.56.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.56.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102444',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.25.59.944000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.25.59.944000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102445',   
'100018','network','100013','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.02.127000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.02.127000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102446',   
'100018','network','100013','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.02.429000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.02.429000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102447',   
'100018','network','100013','savecampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.05.675000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.05.675000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102448',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 04.26.09.589000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.09.589000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102449',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.26.09.920000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.09.920000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102450',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.26.12.256000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.12.256000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102451',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.26.12.769000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.12.769000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102452',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 04.26.13.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.13.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102453',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.16.330000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.16.330000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102454',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.16.772000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.16.772000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102455',   
'100018','network','100007','savecampaign',  
'hblack',to_timestamp('13-JUN-11 04.26.19.183000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.19.183000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102456',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 04.26.22.251000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.22.251000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102457',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.26.22.531000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.22.531000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102458',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 04.26.25.729000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.25.729000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102459',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 04.26.26.338000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 04.26.26.338000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101971',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.29.22.609000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.29.22.609000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101972',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.30.53.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.30.53.320000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101973',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.30.53.811000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.30.53.811000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101974',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('13-JUN-11 08.31.05.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.05.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101975',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.31.17.650000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.17.650000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101976',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.31.17.884000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.17.884000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101977',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.31.22.587000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.22.587000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101978',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.31.24.710000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.24.710000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102045',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.59.11.819000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.59.11.819000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102046',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 09.02.53.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 09.02.53.677000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102047',   
'100018','network','','adminresourcesfornetwork',         
'hblack',to_timestamp('13-JUN-11 09.02.56.305000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 09.02.56.305000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102048',   
'100018','network','','downloadResource',    
'hblack',to_timestamp('13-JUN-11 09.03.59.876000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 09.03.59.876000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102049',   
'100018','network','','openPdf',
'hblack',to_timestamp('13-JUN-11 09.05.28.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 09.05.28.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102050',   
'100018','network','','openPdf',
'hblack',to_timestamp('13-JUN-11 09.05.58.943000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 09.05.58.943000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102051',   
'100018','network','','openPdf',
'hblack',to_timestamp('13-JUN-11 09.06.13.075000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 09.06.13.075000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102052',   
'100018','logout','','index',   
'hblack',to_timestamp('13-JUN-11 09.06.25.495000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 09.06.25.495000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102053',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 09.52.35.328000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 09.52.35.328000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102054',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 09.52.35.404000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 09.52.35.404000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102055',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 09.52.35.672000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 09.52.35.672000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102056',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 09.53.26.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 09.53.26.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102060',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('13-JUN-11 10.01.01.394000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('13-JUN-11 10.01.01.394000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102061',   
'100025','network','','setselectednetwork',  
'jdonnenfeld',to_timestamp('13-JUN-11 10.01.12.157000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('13-JUN-11 10.01.12.157000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102062',   
'100025','network','','calculator',          
'jdonnenfeld',to_timestamp('13-JUN-11 10.01.16.368000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('13-JUN-11 10.01.16.368000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102063',   
'100025','network','','savedcampaigns',      
'jdonnenfeld',to_timestamp('13-JUN-11 10.01.20.089000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('13-JUN-11 10.01.20.089000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102064',   
'100025','network','100004','deletecampaign',
'jdonnenfeld',to_timestamp('13-JUN-11 10.01.49.517000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('13-JUN-11 10.01.49.517000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102065',   
'100025','network','','savedcampaigns',      
'jdonnenfeld',to_timestamp('13-JUN-11 10.01.50.055000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('13-JUN-11 10.01.50.055000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102066',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 11.46.30.794000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 11.46.30.794000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102067',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 11.46.30.884000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 11.46.30.884000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102072',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 12.57.37.444000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 12.57.37.444000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102073',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 12.57.39.864000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 12.57.39.864000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102074',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 02.03.07.801000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.03.07.801000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102075',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 02.03.07.900000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.03.07.900000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102088',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.16.08.958000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.16.08.958000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102089',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 03.16.10.713000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.16.10.713000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102090',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 03.30.32.537000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.30.32.537000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102091',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.30.32.811000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.30.32.811000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102096',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.35.18.851000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.35.18.851000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102097',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.36.26.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.36.26.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102098',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.36.29.249000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.36.29.249000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102099',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.36.59.779000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.36.59.779000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102100',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.36.59.968000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.36.59.968000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102101',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.37.01.316000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.01.316000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102102',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.37.01.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.01.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102103',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.37.06.604000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.06.604000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102104',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.37.06.870000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.06.870000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102105',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.37.08.129000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.08.129000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102106',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.37.08.569000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.08.569000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102107',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.37.17.392000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.17.392000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102108',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.37.21.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.21.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102109',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.37.21.734000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.21.734000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102110',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.37.23.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.23.496000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102111',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.37.23.758000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.23.758000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102112',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.37.37.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.37.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102113',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.37.38.079000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.38.079000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102114',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.37.40.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.40.837000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102115',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.37.42.167000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.37.42.167000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102116',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.38.21.070000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.21.070000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102117',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.38.23.997000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.23.997000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102118',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.38.24.929000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.24.929000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102119',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.38.25.154000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.25.154000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102120',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.38.26.870000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.26.870000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102121',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.38.28.050000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.28.050000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102122',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.38.38.592000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.38.592000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102123',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.38.47.965000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.47.965000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102124',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.38.48.201000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.48.201000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102125',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.38.49.543000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.49.543000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102126',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.38.50.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.50.121000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102127',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.38.54.682000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.54.682000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102128',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.38.59.064000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.59.064000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102129',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.38.59.441000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.38.59.441000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102130',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.39.00.705000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.00.705000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102131',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.39.01.160000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.01.160000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102132',   
'6000','network','','index',    
'canoeadmin',to_timestamp('13-JUN-11 03.39.03.635000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 03.39.03.635000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102133',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('13-JUN-11 03.39.03.736000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 03.39.03.736000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102134',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.39.13.592000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.13.592000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102135',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.39.18.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.18.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102136',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.39.18.748000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.18.748000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102137',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.39.20.249000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.20.249000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102138',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.39.20.724000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.20.724000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102139',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.39.26.241000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.26.241000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102140',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.39.30.008000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.30.008000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102141',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.39.30.238000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.30.238000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102142',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.39.32.365000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.32.365000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102143',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.39.32.886000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.32.886000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102145',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.39.42.831000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.42.831000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102146',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.39.47.739000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.47.739000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102147',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.39.52.412000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.52.412000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102148',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.39.52.642000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.52.642000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102149',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.39.54.863000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.54.863000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102150',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.39.55.593000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.55.593000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102151',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.40.00.401000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.00.401000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102152',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.40.12.792000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.12.792000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102153',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.40.15.408000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.15.408000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102154',   
'100019','network','100020','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.40.27.871000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.27.871000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102057',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 09.53.26.928000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 09.53.26.928000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102058',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 09.53.30.157000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 09.53.30.157000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102059',   
'100025','network','','adminhome',           
'jdonnenfeld',to_timestamp('13-JUN-11 10.01.00.457000 AM','DD-MON-YY HH.MI.SS.FF AM'),           
'',to_timestamp('13-JUN-11 10.01.00.457000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102080',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 02.25.07.240000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.25.07.240000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102081',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 02.25.10.771000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.25.10.771000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102082',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 02.45.28.227000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.45.28.227000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102083',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 02.45.28.598000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.45.28.598000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102092',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.30.33.039000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.30.33.039000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102093',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 03.30.35.476000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.30.35.476000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102094',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 03.35.18.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.35.18.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102095',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.35.18.575000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.35.18.575000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102144',   
'100019','network','','sortresourcesection', 
'tjmoretto',to_timestamp('13-JUN-11 03.39.39.861000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.39.39.861000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102155',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.40.32.472000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.32.472000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102156',   
'100019','network','100009','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.40.36.049000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.36.049000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102157',   
'100019','network','100009','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.40.39.703000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.39.703000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102158',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.40.39.768000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.39.768000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102159',   
'100019','network','100012','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.40.43.297000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.43.297000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102160',   
'100019','network','100012','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.40.46.285000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.46.285000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102161',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.40.46.363000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.46.363000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102162',   
'100019','network','100015','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.40.52.180000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.52.180000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102163',   
'100019','network','100015','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.40.54.784000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.54.784000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102164',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.40.54.835000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.54.835000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102165',   
'100019','network','100021','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.40.57.753000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.40.57.753000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102166',   
'100019','network','100021','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.00.320000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.00.320000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102167',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.41.00.391000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.00.391000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102168',   
'100019','network','100016','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.04.728000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.04.728000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102169',   
'100019','network','100016','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.07.729000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.07.729000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102170',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.41.07.804000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.07.804000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102171',   
'100019','network','100022','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.11.647000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.11.647000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102172',   
'100019','network','100022','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.15.707000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.15.707000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102173',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.41.15.783000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.15.783000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102174',   
'100019','network','100014','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.20.642000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.20.642000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102175',   
'100019','network','100014','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.24.129000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.24.129000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102176',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.41.24.268000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.24.268000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102177',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('13-JUN-11 03.41.25.231000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('13-JUN-11 03.41.25.231000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102178',   
'100019','network','100011','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.29.352000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.29.352000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102179',   
'100019','network','100011','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.32.214000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.32.214000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102180',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.41.32.281000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.32.281000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102181',   
'100019','network','100010','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.36.825000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.36.825000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102182',   
'100019','network','100010','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.40.423000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.40.423000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102183',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.41.40.481000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.40.481000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102184',   
'100019','network','100020','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.47.299000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.47.299000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102185',   
'100019','network','100020','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.50.919000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.50.919000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102186',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.41.51.038000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.51.038000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102187',   
'100019','network','100006','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.56.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.56.890000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102188',   
'100019','network','100006','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.41.59.254000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.59.254000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102189',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.41.59.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.41.59.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102190',   
'100019','network','100008','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.06.734000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.06.734000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102191',   
'100019','network','100008','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.09.030000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.09.030000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102192',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.42.09.083000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.09.083000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102193',   
'100029','network','','index',  
'Susieq',to_timestamp('13-JUN-11 03.42.13.367000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.42.13.367000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102194',   
'100029','network','','adminhome',           
'Susieq',to_timestamp('13-JUN-11 03.42.13.459000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.42.13.459000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102195',   
'100029','network','','setselectednetwork',  
'Susieq',to_timestamp('13-JUN-11 03.42.14.022000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.42.14.022000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102196',   
'100019','network','100006','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.15.459000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.15.459000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102197',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.42.17.065000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.17.065000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102198',   
'100019','network','100013','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.19.382000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.19.382000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102199',   
'100019','network','100013','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.21.867000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.21.867000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102200',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.42.21.949000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.21.949000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102201',   
'100029','logout','','index',   
'Susieq',to_timestamp('13-JUN-11 03.42.22.590000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 03.42.22.590000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102202',   
'100019','network','100007','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.25.635000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.25.635000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102203',   
'100019','network','100007','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.27.869000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.27.869000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102204',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.42.27.938000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.27.938000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102205',   
'100019','network','100004','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.31.225000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.31.225000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102206',   
'100019','network','100004','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.33.787000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.33.787000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102207',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.42.33.856000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.33.856000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102208',   
'100019','network','100006','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.42.37.700000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.37.700000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102209',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.42.39.956000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.39.956000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102210',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('13-JUN-11 03.42.51.333000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.42.51.333000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102211',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('13-JUN-11 03.43.56.018000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.43.56.018000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102212',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.43.56.099000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.43.56.099000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102213',   
'100019','network','100023','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.44.43.077000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.44.43.077000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102214',   
'100019','network','100023','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.44.47.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.44.47.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102215',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.44.48.000000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.44.48.000000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102216',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('13-JUN-11 03.44.51.941000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.44.51.941000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102217',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('13-JUN-11 03.45.42.999000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.45.42.999000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102218',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.45.43.051000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.45.43.051000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102219',   
'100019','network','100023','editresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.45.56.456000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.45.56.456000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102220',   
'100019','network','100023','saveresource',  
'tjmoretto',to_timestamp('13-JUN-11 03.46.03.732000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.03.732000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102221',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('13-JUN-11 03.46.03.788000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.03.788000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102222',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.46.14.082000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.14.082000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102223',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.46.14.303000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.14.303000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102224',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.46.16.014000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.16.014000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102225',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.46.16.526000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.16.526000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102226',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.46.20.951000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.20.951000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102227',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.46.21.057000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.21.057000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102228',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 03.46.23.575000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.23.575000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102229',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('13-JUN-11 03.46.24.292000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.24.292000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102230',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.46.28.810000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.28.810000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102231',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.46.30.418000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.30.418000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102232',   
'100019','network','100065','removeresourcefromgroup',    
'tjmoretto',to_timestamp('13-JUN-11 03.46.38.024000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.38.024000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102233',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.46.44.025000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.44.025000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102234',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.46.46.678000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.46.678000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102235',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.46.48.664000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.48.664000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101979',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.31.24.746000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.24.746000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101980',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.31.29.002000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.29.002000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101981',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.31.32.665000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.32.665000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101982',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.31.33.233000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.33.233000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101983',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.31.48.967000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.48.967000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101984',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.31.50.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.31.50.606000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101985',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.32.14.911000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.32.14.911000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101986',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.32.17.237000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.32.17.237000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101987',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.32.17.796000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.32.17.796000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101988',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.33.03.293000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.33.03.293000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101989',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.33.06.262000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.33.06.262000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101990',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.35.04.117000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.35.04.117000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101991',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.35.04.635000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.35.04.635000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101992',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.35.38.927000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.35.38.927000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101993',   
'100018','network','','rendercampaign',      
'hblack',to_timestamp('13-JUN-11 08.35.51.958000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.35.51.958000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101994',   
'100018','network','0','savecampaign',       
'hblack',to_timestamp('13-JUN-11 08.36.00.835000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.00.835000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101995',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.36.09.581000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.09.581000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101996',   
'100018','network','100011','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.36.12.739000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.12.739000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101997',   
'100018','network','100011','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.36.13.264000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.13.264000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101998',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.36.23.421000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.23.421000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('101999',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.36.27.042000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.27.042000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102000',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.36.27.553000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.27.553000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102001',   
'100018','network','100006','savecampaign',  
'hblack',to_timestamp('13-JUN-11 08.36.36.855000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.36.855000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102002',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.36.52.564000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.52.564000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102003',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.36.52.793000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.36.52.793000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102004',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.37.01.281000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.01.281000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102005',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.37.01.383000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.01.383000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102006',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.37.01.712000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.01.712000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102007',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.37.04.035000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.04.035000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102008',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.37.07.524000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.07.524000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102009',   
'100018','network','100007','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.37.08.078000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.08.078000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102010',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.37.11.532000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.11.532000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102011',   
'100018','network','100010','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.37.13.489000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.13.489000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102012',   
'100018','network','100010','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.37.14.022000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.14.022000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102013',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.37.18.659000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.18.659000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102014',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.37.24.735000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.24.735000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102015',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.37.24.970000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.24.970000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102016',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.37.30.986000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.30.986000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102017',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.37.31.112000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.31.112000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102018',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.37.32.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.32.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102019',   
'100018','network','100009','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.37.48.751000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.48.751000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102020',   
'100018','network','100009','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.37.49.328000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.49.328000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102021',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.37.52.118000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.52.118000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102022',   
'100018','network','100008','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.37.53.342000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.53.342000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102023',   
'100018','network','100008','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.37.54.040000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.54.040000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102024',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.37.56.018000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.56.018000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102025',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.37.58.236000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.58.236000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102026',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.37.58.717000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.37.58.717000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102027',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.38.03.455000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.38.03.455000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102028',   
'100018','network','','calculator',          
'hblack',to_timestamp('13-JUN-11 08.38.05.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.38.05.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102029',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.38.08.029000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.38.08.029000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102030',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.38.11.817000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.38.11.817000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102031',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.38.12.358000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.38.12.358000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102032',   
'100018','network','100006','savecampaign',  
'hblack',to_timestamp('13-JUN-11 08.38.30.366000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.38.30.366000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102033',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.38.35.844000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.38.35.844000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102034',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.40.12.902000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.40.12.902000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102035',   
'100018','network','100006','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.40.13.422000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.40.13.422000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102036',   
'100018','network','','savedcampaigns',      
'hblack',to_timestamp('13-JUN-11 08.41.13.701000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.41.13.701000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102037',   
'100018','network','100011','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.41.16.173000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.41.16.173000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102038',   
'100018','network','100011','editcampaign',  
'hblack',to_timestamp('13-JUN-11 08.41.16.705000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.41.16.705000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102039',   
'100018','network','','index',  
'hblack',to_timestamp('13-JUN-11 08.43.17.262000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.43.17.262000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102040',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.43.17.296000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.43.17.296000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102041',   
'100018','network','','setselectednetwork',  
'hblack',to_timestamp('13-JUN-11 08.43.17.526000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.43.17.526000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102042',   
'100018','logout','','index',   
'hblack',to_timestamp('13-JUN-11 08.43.19.536000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.43.19.536000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102043',   
'100018','network','','index',  
'hblack',to_timestamp('13-JUN-11 08.59.11.504000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.59.11.504000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102044',   
'100018','network','','adminhome',           
'hblack',to_timestamp('13-JUN-11 08.59.11.576000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('13-JUN-11 08.59.11.576000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102068',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 11.46.31.357000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 11.46.31.357000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102069',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 11.46.37.785000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 11.46.37.785000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102070',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 12.57.37.029000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 12.57.37.029000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102071',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 12.57.37.113000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 12.57.37.113000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102076',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 02.03.08.364000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.03.08.364000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102077',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 02.03.11.290000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.03.11.290000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102078',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 02.25.06.944000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.25.06.944000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102079',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 02.25.07.002000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.25.07.002000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102084',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('13-JUN-11 02.45.29.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.45.29.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102085',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('13-JUN-11 02.45.31.915000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 02.45.31.915000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102086',   
'100019','network','','index',  
'tjmoretto',to_timestamp('13-JUN-11 03.16.08.123000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.16.08.123000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102087',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('13-JUN-11 03.16.08.273000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.16.08.273000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102236',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.46.55.622000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.55.622000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102237',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.46.57.131000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.46.57.131000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102238',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.47.02.071000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.02.071000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102239',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.47.06.278000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.06.278000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102240',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.47.08.848000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.08.848000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102241',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.47.13.145000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.13.145000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102242',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.47.16.717000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.16.717000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102243',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.47.22.724000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.22.724000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102244',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.47.33.078000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.33.078000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102245',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.47.38.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.38.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102246',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.47.45.656000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.45.656000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102247',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.47.50.278000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.50.278000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102248',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.47.51.763000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.51.763000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102249',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.47.53.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.47.53.036000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102250',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.48.01.020000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.01.020000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102251',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('13-JUN-11 03.48.06.276000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.06.276000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102252',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('13-JUN-11 03.48.08.480000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('13-JUN-11 03.48.08.480000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103222',   
'100019','network','100030','editcontact',   
'tjmoretto',to_timestamp('09-DEC-11 04.36.52.455000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.36.52.455000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103223',   
'100019','network','100030','savecontact',   
'tjmoretto',to_timestamp('09-DEC-11 04.37.09.019000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.37.09.019000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103224',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('09-DEC-11 04.37.09.383000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.37.09.383000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103227',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('05-JAN-12 11.18.09.244000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 11.18.09.244000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103228',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('05-JAN-12 11.25.45.303000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 11.25.45.303000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103229',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('05-JAN-12 11.25.48.816000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 11.25.48.816000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103230',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('05-JAN-12 04.07.39.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 04.07.39.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103231',   
'100019','network','','index',  
'tjmoretto',to_timestamp('05-JAN-12 04.17.22.972000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 04.17.22.972000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103232',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('05-JAN-12 04.17.23.080000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 04.17.23.080000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103239',   
'100026','network','','setselectednetwork',  
'aorduna',to_timestamp('18-JAN-12 12.11.12.189000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.11.12.189000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103240',   
'100026','network','','setselectednetwork',  
'aorduna',to_timestamp('18-JAN-12 12.12.01.743000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.12.01.743000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103241',   
'100026','network','','index',  
'aorduna',to_timestamp('18-JAN-12 12.14.47.236000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.14.47.236000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103242',   
'100026','network','','adminhome',           
'aorduna',to_timestamp('18-JAN-12 12.14.47.528000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.14.47.528000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103243',   
'100026','network','','setselectednetwork',  
'aorduna',to_timestamp('18-JAN-12 12.14.48.152000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.14.48.152000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103244',   
'100026','network','','resources',           
'aorduna',to_timestamp('18-JAN-12 12.14.51.050000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.14.51.050000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103245',   
'100026','network','','savedcampaigns',      
'aorduna',to_timestamp('18-JAN-12 12.14.55.870000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.14.55.870000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103246',   
'100026','network','','contacts',            
'aorduna',to_timestamp('18-JAN-12 12.15.00.652000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.15.00.652000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103247',   
'100026','network','','adminhome',           
'aorduna',to_timestamp('18-JAN-12 12.15.15.357000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.15.15.357000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103248',   
'100026','network','','setselectednetwork',  
'aorduna',to_timestamp('18-JAN-12 12.15.16.001000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.15.16.001000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103249',   
'100026','logout','','index',   
'aorduna',to_timestamp('18-JAN-12 12.15.22.482000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.15.22.482000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103250',   
'100019','network','','index',  
'tjmoretto',to_timestamp('19-JAN-12 11.10.43.680000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 11.10.43.680000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103251',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('19-JAN-12 11.10.43.838000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 11.10.43.838000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103262',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('23-JAN-12 11.27.22.971000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.27.22.971000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103263',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('23-JAN-12 11.27.27.656000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.27.27.656000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103264',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('23-JAN-12 11.27.29.242000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.27.29.242000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103265',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('23-JAN-12 11.27.43.603000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.27.43.603000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103266',   
'100019','network','100023','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('23-JAN-12 11.27.47.769000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.27.47.769000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103267',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('23-JAN-12 11.27.55.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.27.55.723000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103268',   
'100019','network','100009','editresource',  
'tjmoretto',to_timestamp('23-JAN-12 11.28.02.502000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.28.02.502000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103269',   
'100019','network','100009','saveresource',  
'tjmoretto',to_timestamp('23-JAN-12 11.28.26.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.28.26.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103270',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('23-JAN-12 11.28.26.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.28.26.890000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103271',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('23-JAN-12 11.28.30.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.28.30.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103272',   
'100019','network','100023','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('23-JAN-12 11.28.35.031000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.28.35.031000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103275',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('24-JAN-12 04.49.14.080000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-JAN-12 04.49.14.080000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103225',   
'100019','network','','index',  
'tjmoretto',to_timestamp('05-JAN-12 11.18.07.882000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 11.18.07.882000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103226',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('05-JAN-12 11.18.08.242000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 11.18.08.242000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103233',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('05-JAN-12 04.17.23.583000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-JAN-12 04.17.23.583000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103237',   
'100026','network','','index',  
'aorduna',to_timestamp('18-JAN-12 12.11.11.010000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.11.11.010000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103238',   
'100026','network','','adminhome',           
'aorduna',to_timestamp('18-JAN-12 12.11.11.476000 PM','DD-MON-YY HH.MI.SS.FF AM'),  
'',to_timestamp('18-JAN-12 12.11.11.476000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103252',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('19-JAN-12 11.10.44.492000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 11.10.44.492000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103253',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('19-JAN-12 11.10.48.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 11.10.48.892000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103254',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('19-JAN-12 11.10.49.867000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 11.10.49.867000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103255',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('19-JAN-12 12.11.10.861000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 12.11.10.861000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103256',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('19-JAN-12 12.11.14.471000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 12.11.14.471000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103257',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('19-JAN-12 12.12.00.009000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 12.12.00.009000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103258',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('19-JAN-12 12.12.01.551000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 12.12.01.551000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103259',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('19-JAN-12 12.12.37.963000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('19-JAN-12 12.12.37.963000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103260',   
'100019','network','','index',  
'tjmoretto',to_timestamp('23-JAN-12 11.27.22.434000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.27.22.434000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103261',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('23-JAN-12 11.27.22.542000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('23-JAN-12 11.27.22.542000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103273',   
'100019','network','','index',  
'tjmoretto',to_timestamp('24-JAN-12 04.49.13.265000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-JAN-12 04.49.13.265000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103274',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('24-JAN-12 04.49.13.382000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-JAN-12 04.49.13.382000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102714',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('20-JUL-11 08.40.03.565000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.40.03.565000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102715',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('20-JUL-11 08.40.06.151000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.40.06.151000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102716',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('20-JUL-11 08.40.07.469000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.40.07.469000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102717',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('20-JUL-11 08.48.24.191000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.48.24.191000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102718',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('20-JUL-11 08.48.24.488000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.48.24.488000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102719',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('20-JUL-11 08.48.26.545000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.48.26.545000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102720',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('20-JUL-11 08.48.27.251000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.48.27.251000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102721',   
'100019','network','','index',  
'tjmoretto',to_timestamp('20-JUL-11 09.09.52.081000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.09.52.081000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102722',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('20-JUL-11 09.09.52.227000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.09.52.227000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102723',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('20-JUL-11 09.09.52.579000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.09.52.579000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102724',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('20-JUL-11 09.09.55.235000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.09.55.235000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102725',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('20-JUL-11 09.09.56.278000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.09.56.278000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102726',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('20-JUL-11 09.21.32.384000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.21.32.384000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102727',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('20-JUL-11 09.21.38.417000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.21.38.417000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102728',   
'100019','network','100023','editcontact',   
'tjmoretto',to_timestamp('20-JUL-11 09.21.40.922000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.21.40.922000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102729',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('20-JUL-11 09.21.44.854000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.21.44.854000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102730',   
'100019','network','100021','editcontact',   
'tjmoretto',to_timestamp('20-JUL-11 09.21.48.721000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.21.48.721000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102731',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('20-JUL-11 09.23.04.041000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.23.04.041000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102732',   
'100019','network','100025','editcontact',   
'tjmoretto',to_timestamp('20-JUL-11 09.23.05.966000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.23.05.966000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102733',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('20-JUL-11 09.23.36.972000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.23.36.972000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102734',   
'100019','network','100020','editcontact',   
'tjmoretto',to_timestamp('20-JUL-11 09.23.42.931000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.23.42.931000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102735',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('20-JUL-11 09.24.20.728000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.24.20.728000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102736',   
'100019','network','100022','editcontact',   
'tjmoretto',to_timestamp('20-JUL-11 09.24.27.697000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.24.27.697000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102737',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('20-JUL-11 09.41.57.571000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 09.41.57.571000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102738',   
'6000','network','','index',    
'canoeadmin',to_timestamp('22-JUL-11 10.05.50.675000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 10.05.50.675000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102739',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('22-JUL-11 10.05.50.924000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 10.05.50.924000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102740',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('22-JUL-11 10.11.12.158000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 10.11.12.158000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102741',   
'100032','network','','index',  
'stagetst1',to_timestamp('22-JUL-11 10.12.53.226000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 10.12.53.226000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102742',   
'100032','network','','index',  
'stagetst1',to_timestamp('22-JUL-11 10.14.02.231000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 10.14.02.231000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102743',   
'100032','network','','calculator',          
'stagetst1',to_timestamp('22-JUL-11 10.14.03.965000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 10.14.03.965000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102744',   
'100032','network','','rendercampaign',      
'stagetst1',to_timestamp('22-JUL-11 10.15.31.268000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 10.15.31.268000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102745',   
'100032','network','','rendercampaign',      
'stagetst1',to_timestamp('22-JUL-11 10.15.32.376000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 10.15.32.376000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102746',   
'100032','network','','index',  
'stagetst1',to_timestamp('22-JUL-11 10.27.45.861000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 10.27.45.861000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102747',   
'100032','network','','index',  
'stagetst1',to_timestamp('22-JUL-11 10.27.54.249000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 10.27.54.249000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102748',   
'100033','network','','index',  
'SusanM',to_timestamp('22-JUL-11 10.29.09.572000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 10.29.09.572000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102749',   
'100033','network','','adminhome',           
'SusanM',to_timestamp('22-JUL-11 10.29.09.642000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 10.29.09.642000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102750',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 10.29.10.053000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 10.29.10.053000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102751',   
'100033','network','','admincontacts',       
'SusanM',to_timestamp('22-JUL-11 10.29.14.772000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 10.29.14.772000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102770',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 11.12.25.854000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.12.25.854000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102771',   
'100033','logout','','index',   
'SusanM',to_timestamp('22-JUL-11 11.12.40.297000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.12.40.297000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102772',   
'6000','network','','index',    
'canoeadmin',to_timestamp('22-JUL-11 11.13.02.969000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 11.13.02.969000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102773',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('22-JUL-11 11.13.03.089000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 11.13.03.089000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102774',   
'100033','network','','index',  
'SusanM',to_timestamp('22-JUL-11 11.14.05.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.05.338000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102775',   
'100033','network','','adminhome',           
'SusanM',to_timestamp('22-JUL-11 11.14.05.468000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.05.468000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102812',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUL-11 11.27.20.031000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.27.20.031000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102813',   
'100032','network','','index',  
'stagetst1',to_timestamp('22-JUL-11 11.31.45.919000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.31.45.919000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102814',   
'100032','network','','calculator',          
'stagetst1',to_timestamp('22-JUL-11 11.31.58.518000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.31.58.518000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102815',   
'100032','network','','savedcampaigns',      
'stagetst1',to_timestamp('22-JUL-11 11.32.01.270000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.32.01.270000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102816',   
'100032','network','100013','editcampaign',  
'stagetst1',to_timestamp('22-JUL-11 11.32.18.009000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.32.18.009000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102817',   
'100032','network','100013','editcampaign',  
'stagetst1',to_timestamp('22-JUL-11 11.32.18.196000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.32.18.196000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102818',   
'100032','network','100013','editcampaign',  
'stagetst1',to_timestamp('22-JUL-11 11.32.18.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.32.18.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102819',   
'100032','network','100013','createPDFcampaign',          
'stagetst1',to_timestamp('22-JUL-11 11.32.20.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.32.20.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102820',   
'100032','network','','resources',           
'stagetst1',to_timestamp('22-JUL-11 11.35.02.835000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.35.02.835000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102821',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-JUL-11 01.37.04.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 01.37.04.120000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102822',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-JUL-11 01.37.04.309000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 01.37.04.309000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102826',   
'100019','network','100009','saveresource',  
'tjmoretto',to_timestamp('22-JUL-11 01.37.33.744000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 01.37.33.744000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102827',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('22-JUL-11 01.37.33.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 01.37.33.829000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102834',   
'6000','network','','index',    
'canoeadmin',to_timestamp('22-JUL-11 02.11.58.105000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 02.11.58.105000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102835',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('22-JUL-11 02.11.58.344000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 02.11.58.344000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102836',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('22-JUL-11 02.12.22.138000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 02.12.22.138000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102837',   
'100033','network','','index',  
'SusanM',to_timestamp('22-JUL-11 02.12.32.326000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.12.32.326000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102838',   
'100033','network','','adminhome',           
'SusanM',to_timestamp('22-JUL-11 02.12.32.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.12.32.492000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102839',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 02.12.33.237000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.12.33.237000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102840',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 02.12.36.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.12.36.911000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102841',   
'100033','network','','adminresources',      
'SusanM',to_timestamp('22-JUL-11 02.12.39.544000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.12.39.544000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102842',   
'100033','network','100026','editresource',  
'SusanM',to_timestamp('22-JUL-11 02.12.52.867000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.12.52.867000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102843',   
'100033','network','100026','saveresource',  
'SusanM',to_timestamp('22-JUL-11 02.13.03.498000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.13.03.498000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102844',   
'100033','network','','adminresources',      
'SusanM',to_timestamp('22-JUL-11 02.13.03.629000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.13.03.629000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102845',   
'100033','network','','adminresourcesfornetwork',         
'SusanM',to_timestamp('22-JUL-11 02.13.13.680000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.13.13.680000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102846',   
'100033','network','100019','getavailableresourcesforgroup',           
'SusanM',to_timestamp('22-JUL-11 02.13.29.307000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.13.29.307000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102847',   
'100033','network','','addresourcetogroup',  
'SusanM',to_timestamp('22-JUL-11 02.13.36.650000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.13.36.650000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102848',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-JUL-11 02.16.37.244000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.16.37.244000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102849',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-JUL-11 02.16.37.339000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.16.37.339000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102859',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUL-11 02.18.06.066000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.18.06.066000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102860',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUL-11 02.18.07.622000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.18.07.622000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102861',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('22-JUL-11 02.18.08.436000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.18.08.436000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102862',   
'100033','network','','index',  
'SusanM',to_timestamp('22-JUL-11 02.24.31.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.24.31.727000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102863',   
'100033','network','','adminhome',           
'SusanM',to_timestamp('22-JUL-11 02.24.31.866000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.24.31.866000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102907',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('01-AUG-11 04.36.46.170000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.36.46.170000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102908',   
'100027','network','','index',  
'nctakiosk',to_timestamp('01-AUG-11 04.36.53.793000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.36.53.793000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102909',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('01-AUG-11 04.36.59.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.36.59.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102910',   
'100027','network','100025','video',         
'nctakiosk',to_timestamp('01-AUG-11 04.37.06.435000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.37.06.435000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102911',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('01-AUG-11 04.37.11.344000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.37.11.344000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102912',   
'100027','network','','downloadResource',    
'nctakiosk',to_timestamp('01-AUG-11 04.37.23.678000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.37.23.678000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102913',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('01-AUG-11 04.37.45.396000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.37.45.396000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102914',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('01-AUG-11 04.37.47.894000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.37.47.894000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102915',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.37.49.133000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.37.49.133000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102916',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.37.49.780000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.37.49.780000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102917',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.37.56.516000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.37.56.516000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102918',   
'100027','network','100012','savecampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.38.04.638000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.38.04.638000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102919',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('01-AUG-11 04.38.08.126000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.38.08.126000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102920',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.38.09.820000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.38.09.820000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102921',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.38.10.360000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.38.10.360000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102922',   
'100027','network','100012','savecampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.38.31.395000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.38.31.395000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102923',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('01-AUG-11 04.38.38.243000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.38.38.243000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102924',   
'100027','network','100013','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.38.39.712000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.38.39.712000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102925',   
'100027','network','100013','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.38.40.021000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.38.40.021000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102850',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUL-11 02.16.37.723000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.16.37.723000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102851',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('22-JUL-11 02.16.42.065000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.16.42.065000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102853',   
'100019','network','100026','saveresource',  
'tjmoretto',to_timestamp('22-JUL-11 02.17.00.154000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.17.00.154000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102854',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('22-JUL-11 02.17.00.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.17.00.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102858',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-JUL-11 02.18.05.602000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.18.05.602000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102864',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 02.24.32.227000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 02.24.32.227000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102865',   
'100019','network','','index',  
'tjmoretto',to_timestamp('01-AUG-11 04.30.58.214000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.30.58.214000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102866',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('01-AUG-11 04.30.58.336000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.30.58.336000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102867',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('01-AUG-11 04.30.58.760000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.30.58.760000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102868',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('01-AUG-11 04.31.01.110000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.31.01.110000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102869',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('01-AUG-11 04.31.02.560000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.31.02.560000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102870',   
'100019','network','100104','removeresourcefromgroup',    
'tjmoretto',to_timestamp('01-AUG-11 04.31.11.216000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.31.11.216000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102871',   
'100019','network','100025','video',         
'tjmoretto',to_timestamp('01-AUG-11 04.31.14.830000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.31.14.830000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102872',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('01-AUG-11 04.31.29.233000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.31.29.233000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102873',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('01-AUG-11 04.31.54.667000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.31.54.667000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102874',   
'100019','network','100025','editresource',  
'tjmoretto',to_timestamp('01-AUG-11 04.32.00.088000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.00.088000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102875',   
'100019','network','100025','saveresource',  
'tjmoretto',to_timestamp('01-AUG-11 04.32.19.896000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.19.896000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102876',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('01-AUG-11 04.32.19.977000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.19.977000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102877',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('01-AUG-11 04.32.23.522000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.23.522000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102878',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('01-AUG-11 04.32.31.605000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.31.605000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102879',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('01-AUG-11 04.32.35.320000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.35.320000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102880',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('01-AUG-11 04.32.39.840000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.39.840000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102881',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('01-AUG-11 04.32.46.360000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.46.360000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102882',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('01-AUG-11 04.32.54.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.32.54.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102883',   
'100019','network','100103','removeresourcefromgroup',    
'tjmoretto',to_timestamp('01-AUG-11 04.33.00.355000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.00.355000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102884',   
'100019','network','100070','removeresourcefromgroup',    
'tjmoretto',to_timestamp('01-AUG-11 04.33.10.158000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.10.158000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102885',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('01-AUG-11 04.33.21.472000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.21.472000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102886',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('01-AUG-11 04.33.25.172000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.25.172000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102887',   
'100019','network','100105','removeresourcefromgroup',    
'tjmoretto',to_timestamp('01-AUG-11 04.33.27.445000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.27.445000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102888',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('01-AUG-11 04.33.28.430000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.28.430000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102889',   
'100019','network','100020','deleteresource',
'tjmoretto',to_timestamp('01-AUG-11 04.33.35.795000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.35.795000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102890',   
'100019','network','100026','deleteresource',
'tjmoretto',to_timestamp('01-AUG-11 04.33.42.255000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.42.255000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102891',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('01-AUG-11 04.33.46.508000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.46.508000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102892',   
'100019','network','100019','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('01-AUG-11 04.33.53.965000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.53.965000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102893',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('01-AUG-11 04.33.55.879000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.33.55.879000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102894',   
'100019','network','','sortresourceingroup', 
'tjmoretto',to_timestamp('01-AUG-11 04.34.02.590000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.34.02.590000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102895',   
'100019','network','100025','video',         
'tjmoretto',to_timestamp('01-AUG-11 04.34.06.330000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.34.06.330000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102896',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('01-AUG-11 04.34.10.500000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.34.10.500000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102897',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('01-AUG-11 04.34.23.035000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.34.23.035000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102898',   
'100019','network','100024','removecontactfromnetwork',   
'tjmoretto',to_timestamp('01-AUG-11 04.34.35.573000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.34.35.573000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102899',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('01-AUG-11 04.34.38.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.34.38.487000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102900',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('01-AUG-11 04.34.45.306000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.34.45.306000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102901',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('01-AUG-11 04.34.51.072000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.34.51.072000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102902',   
'100027','network','','index',  
'nctakiosk',to_timestamp('01-AUG-11 04.35.05.845000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.35.05.845000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102903',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('01-AUG-11 04.35.10.713000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.35.10.713000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102904',   
'100019','network','','index',  
'tjmoretto',to_timestamp('01-AUG-11 04.35.17.135000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.35.17.135000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102905',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('01-AUG-11 04.35.17.445000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.35.17.445000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102926',   
'100027','network','100013','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.39.13.611000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.39.13.611000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102927',   
'100027','network','100013','savecampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.39.17.874000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.39.17.874000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102928',   
'100027','network','100013','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.39.44.116000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.39.44.116000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102929',   
'100027','network','100013','savecampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.39.52.511000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.39.52.511000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102930',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('01-AUG-11 04.39.55.289000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.39.55.289000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102931',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.39.56.601000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.39.56.601000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102932',   
'100027','network','100012','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.39.56.924000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.39.56.924000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102933',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('01-AUG-11 04.40.02.001000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.40.02.001000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102934',   
'100027','network','100013','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.40.03.281000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.40.03.281000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102935',   
'100027','network','100013','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.40.03.611000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.40.03.611000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102936',   
'100027','network','100013','savecampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.40.19.010000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.40.19.010000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102937',   
'100027','network','100013','editcampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.40.24.723000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.40.24.723000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102938',   
'100027','network','100013','savecampaign',  
'nctakiosk',to_timestamp('01-AUG-11 04.40.29.802000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.40.29.802000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102939',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('01-AUG-11 04.40.50.479000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.40.50.479000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102940',   
'100027','network','','index',  
'nctakiosk',to_timestamp('02-AUG-11 06.44.09.083000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 06.44.09.083000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102941',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('02-AUG-11 06.44.14.504000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 06.44.14.504000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102942',   
'100027','network','','index',  
'nctakiosk',to_timestamp('02-AUG-11 07.07.29.778000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.07.29.778000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102943',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('02-AUG-11 07.08.06.981000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.08.06.981000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102944',   
'100027','network','100025','video',         
'nctakiosk',to_timestamp('02-AUG-11 07.08.33.259000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.08.33.259000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102945',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('02-AUG-11 07.08.42.669000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.08.42.669000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102946',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('02-AUG-11 07.09.01.459000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.09.01.459000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102947',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('02-AUG-11 07.10.20.092000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.10.20.092000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102948',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('02-AUG-11 07.10.20.730000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.10.20.730000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102949',   
'100027','network','0','savecampaign',       
'nctakiosk',to_timestamp('02-AUG-11 07.11.59.840000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.11.59.840000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102950',   
'100027','network','','savedcampaigns',      
'nctakiosk',to_timestamp('02-AUG-11 07.12.02.762000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.12.02.762000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102951',   
'100027','network','100014','editcampaign',  
'nctakiosk',to_timestamp('02-AUG-11 07.12.08.021000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.12.08.021000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102952',   
'100027','network','100014','editcampaign',  
'nctakiosk',to_timestamp('02-AUG-11 07.12.08.331000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.12.08.331000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102953',   
'100027','network','100014','createPDFcampaign',          
'nctakiosk',to_timestamp('02-AUG-11 07.12.10.136000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.12.10.136000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102954',   
'100027','network','','contacts',            
'nctakiosk',to_timestamp('02-AUG-11 07.12.32.281000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.12.32.281000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102955',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('02-AUG-11 07.13.10.485000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('02-AUG-11 07.13.10.485000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102956',   
'100019','network','','index',  
'tjmoretto',to_timestamp('04-AUG-11 08.18.45.701000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 08.18.45.701000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102957',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('04-AUG-11 08.18.45.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 08.18.45.820000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102958',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 08.18.46.301000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 08.18.46.301000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102959',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 08.18.48.589000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 08.18.48.589000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102960',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('04-AUG-11 08.18.49.661000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 08.18.49.661000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102961',   
'100019','network','','index',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.25.038000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.25.038000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102962',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('04-AUG-11 01.27.25.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.25.248000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102963',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.25.590000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.25.590000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102964',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.28.519000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.28.519000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102965',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('04-AUG-11 01.27.29.057000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.29.057000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102966',   
'100019','network','100012','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('04-AUG-11 01.27.31.157000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.31.157000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102967',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('04-AUG-11 01.27.34.393000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.34.393000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102968',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.34.651000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.34.651000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102969',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.36.228000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.36.228000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102970',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('04-AUG-11 01.27.36.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.36.827000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102642',   
'100019','network','100019','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 07.29.30.204000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.29.30.204000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102644',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 07.30.46.276000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.30.46.276000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102645',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 07.30.52.301000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.30.52.301000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102648',   
'100019','network','100022','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 07.36.30.168000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.36.30.168000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102650',   
'100019','network','','downloadResource',    
'tjmoretto',to_timestamp('20-JUL-11 07.59.00.395000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.59.00.395000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102651',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.00.10.632000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.00.10.632000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102652',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.00.47.928000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.00.47.928000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102653',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.00.54.149000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.00.54.149000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102654',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.01.05.352000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.01.05.352000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102655',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.01.18.540000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.01.18.540000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102656',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.01.24.012000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.01.24.012000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102657',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.01.37.220000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.01.37.220000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102658',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.01.44.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.01.44.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102659',   
'100019','network','','downloadResource',    
'tjmoretto',to_timestamp('20-JUL-11 08.01.56.759000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.01.56.759000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102660',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.02.16.023000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.02.16.023000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102661',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.02.55.680000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.02.55.680000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102662',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.03.01.838000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.01.838000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102663',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.03.09.697000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.09.697000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102664',   
'100019','network','','downloadResource',    
'tjmoretto',to_timestamp('20-JUL-11 08.03.21.786000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.21.786000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102665',   
'100019','network','','downloadResource',    
'tjmoretto',to_timestamp('20-JUL-11 08.03.27.647000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.27.647000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102666',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.03.39.122000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.39.122000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102667',   
'100019','network','','downloadResource',    
'tjmoretto',to_timestamp('20-JUL-11 08.03.44.546000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.44.546000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102668',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.03.48.631000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.48.631000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102669',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.03.54.570000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.54.570000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102670',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.03.59.551000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.03.59.551000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102671',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 08.04.03.743000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.04.03.743000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102672',   
'100019','network','100009','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.11.24.666000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.11.24.666000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102673',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.12.55.575000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.12.55.575000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102674',   
'100019','network','100019','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.12.58.004000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.12.58.004000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102676',   
'100019','network','100024','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.13.26.613000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.13.26.613000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102678',   
'100019','network','100012','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.14.03.724000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.14.03.724000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102680',   
'100019','network','100015','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.14.33.787000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.14.33.787000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102682',   
'100019','network','100021','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.15.03.309000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.15.03.309000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102684',   
'100019','network','100017','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.15.34.903000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.15.34.903000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102686',   
'100019','network','100016','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.15.54.496000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.15.54.496000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102689',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.16.43.767000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.16.43.767000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102691',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.17.08.445000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.17.08.445000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102693',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.17.33.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.17.33.948000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102694',   
'100019','network','100011','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.17.36.324000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.17.36.324000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102696',   
'100019','network','100010','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.17.57.990000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.17.57.990000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102697',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.18.21.502000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.18.21.502000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102698',   
'100019','network','100020','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.18.33.207000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.18.33.207000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102700',   
'100019','network','100005','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.19.11.181000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.19.11.181000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102702',   
'100019','network','100008','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.19.45.511000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.19.45.511000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102704',   
'100019','network','100006','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.36.45.125000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.36.45.125000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102706',   
'100019','network','100004','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.37.22.570000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.37.22.570000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102708',   
'100019','network','100007','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.38.00.051000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.38.00.051000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102710',   
'100019','network','100018','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.38.37.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.38.37.713000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102711',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.39.08.987000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.39.08.987000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102754',   
'6000','network','','index',    
'canoeadmin',to_timestamp('22-JUL-11 10.30.42.402000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 10.30.42.402000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102755',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('22-JUL-11 10.30.42.556000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 10.30.42.556000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102776',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 11.14.05.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.05.783000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102777',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 11.14.09.437000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.09.437000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102778',   
'100033','network','','adminresourcesfornetwork',         
'SusanM',to_timestamp('22-JUL-11 11.14.11.313000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.11.313000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102779',   
'100033','network','','adminresources',      
'SusanM',to_timestamp('22-JUL-11 11.14.22.793000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.22.793000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102780',   
'100033','network','','editresource',        
'SusanM',to_timestamp('22-JUL-11 11.14.25.672000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.25.672000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102781',   
'100033','network','','adminresources',      
'SusanM',to_timestamp('22-JUL-11 11.14.31.176000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.31.176000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102782',   
'100033','network','100025','video',         
'SusanM',to_timestamp('22-JUL-11 11.14.35.653000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.35.653000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102783',   
'100033','network','','adminresources',      
'SusanM',to_timestamp('22-JUL-11 11.14.39.464000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.39.464000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102784',   
'100033','network','100025','editresource',  
'SusanM',to_timestamp('22-JUL-11 11.14.46.482000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.46.482000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102785',   
'100033','network','100025','editresource',  
'SusanM',to_timestamp('22-JUL-11 11.14.46.570000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.46.570000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102786',   
'100033','network','100025','saveresource',  
'SusanM',to_timestamp('22-JUL-11 11.14.57.432000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.57.432000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102787',   
'100033','network','','adminresources',      
'SusanM',to_timestamp('22-JUL-11 11.14.57.796000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.14.57.796000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102788',   
'100033','network','','editresource',        
'SusanM',to_timestamp('22-JUL-11 11.21.14.667000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.14.667000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102789',   
'100033','login','','denied',   
'SusanM',to_timestamp('22-JUL-11 11.21.31.971000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.31.971000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102790',   
'100033','login','','denied',   
'SusanM',to_timestamp('22-JUL-11 11.21.32.122000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.32.122000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102791',   
'100033','login','','denied',   
'SusanM',to_timestamp('22-JUL-11 11.21.37.025000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.37.025000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102792',   
'100033','login','','denied',   
'SusanM',to_timestamp('22-JUL-11 11.21.39.046000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.39.046000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102793',   
'100033','login','','auth',     
'SusanM',to_timestamp('22-JUL-11 11.21.40.437000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.40.437000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102794',   
'100033','network','','index',  
'SusanM',to_timestamp('22-JUL-11 11.21.40.515000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.40.515000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102795',   
'100033','network','','adminhome',           
'SusanM',to_timestamp('22-JUL-11 11.21.40.562000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.40.562000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102796',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 11.21.40.830000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.21.40.830000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102797',   
'100033','logout','','index',   
'SusanM',to_timestamp('22-JUL-11 11.22.12.785000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.22.12.785000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102798',   
'6000','network','','index',    
'canoeadmin',to_timestamp('22-JUL-11 11.22.23.006000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 11.22.23.006000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102799',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('22-JUL-11 11.22.23.125000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 11.22.23.125000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102800',   
'6000','login','','denied',     
'canoeadmin',to_timestamp('22-JUL-11 11.23.48.964000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 11.23.48.964000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102801',   
'100033','network','','index',  
'SusanM',to_timestamp('22-JUL-11 11.24.20.286000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.24.20.286000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102802',   
'100033','network','','adminhome',           
'SusanM',to_timestamp('22-JUL-11 11.24.20.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.24.20.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102805',   
'100033','network','','editresource',        
'SusanM',to_timestamp('22-JUL-11 11.24.28.670000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.24.28.670000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102808',   
'100033','network','','savedcampaigns',      
'SusanM',to_timestamp('22-JUL-11 11.26.58.199000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.26.58.199000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102809',   
'100033','logout','','index',   
'SusanM',to_timestamp('22-JUL-11 11.27.02.072000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.27.02.072000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102810',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-JUL-11 11.27.19.500000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.27.19.500000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102811',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-JUL-11 11.27.19.628000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.27.19.628000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102852',   
'100019','network','100026','editresource',  
'tjmoretto',to_timestamp('22-JUL-11 02.16.47.553000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.16.47.553000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102855',   
'100019','network','100025','editresource',  
'tjmoretto',to_timestamp('22-JUL-11 02.17.03.801000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.17.03.801000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102856',   
'100019','network','100025','saveresource',  
'tjmoretto',to_timestamp('22-JUL-11 02.17.12.622000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.17.12.622000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102857',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('22-JUL-11 02.17.12.720000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.17.12.720000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102906',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('01-AUG-11 04.35.17.696000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('01-AUG-11 04.35.17.696000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102971',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('04-AUG-11 01.27.41.865000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.41.865000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102972',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.42.079000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.42.079000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102973',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.43.967000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.43.967000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102974',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('04-AUG-11 01.27.44.382000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.44.382000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102975',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('04-AUG-11 01.27.46.502000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.46.502000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102976',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.46.724000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.46.724000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102977',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('04-AUG-11 01.27.48.056000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.48.056000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102978',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('04-AUG-11 01.27.48.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.48.706000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102979',   
'100019','network','','saveresourcesection', 
'tjmoretto',to_timestamp('04-AUG-11 01.27.57.186000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.27.57.186000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102980',   
'100019','network','100022','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('04-AUG-11 01.28.07.302000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.07.302000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102641',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 07.28.54.778000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.28.54.778000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102643',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 07.30.02.069000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.30.02.069000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102646',   
'100019','network','','openPdf',
'tjmoretto',to_timestamp('20-JUL-11 07.32.43.458000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.32.43.458000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102647',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 07.32.46.119000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.32.46.119000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102649',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 07.36.31.926000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 07.36.31.926000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102675',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.13.24.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.13.24.756000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102677',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.14.00.562000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.14.00.562000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102679',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.14.31.094000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.14.31.094000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102681',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.15.00.075000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.15.00.075000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102683',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.15.27.766000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.15.27.766000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102685',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.15.51.455000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.15.51.455000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102687',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.16.13.580000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.16.13.580000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102688',   
'100019','network','100022','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.16.16.211000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.16.16.211000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102690',   
'100019','network','100023','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.16.47.174000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.16.47.174000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102692',   
'100019','network','100014','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.17.12.135000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.17.12.135000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102695',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.17.55.862000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.17.55.862000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102699',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.19.08.410000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.19.08.410000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102701',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.19.39.762000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.19.39.762000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102703',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.36.41.354000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.36.41.354000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102705',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.37.18.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.37.18.891000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102707',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.37.56.070000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.37.56.070000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102709',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('20-JUL-11 08.38.34.637000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.38.34.637000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102712',   
'100019','network','100013','editresource',  
'tjmoretto',to_timestamp('20-JUL-11 08.39.10.818000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.39.10.818000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102713',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('20-JUL-11 08.40.03.016000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('20-JUL-11 08.40.03.016000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102752',   
'6000','network','','index',    
'canoeadmin',to_timestamp('22-JUL-11 10.29.44.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 10.29.44.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102753',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('22-JUL-11 10.29.44.974000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 10.29.44.974000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102756',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('22-JUL-11 11.07.38.590000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('22-JUL-11 11.07.38.590000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102757',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-JUL-11 11.07.49.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.07.49.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102758',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-JUL-11 11.07.49.986000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.07.49.986000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102759',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUL-11 11.07.50.337000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.07.50.337000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102760',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUL-11 11.07.55.475000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.07.55.475000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102761',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('22-JUL-11 11.07.57.352000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.07.57.352000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102762',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('22-JUL-11 11.08.14.656000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.08.14.656000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102763',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('22-JUL-11 11.09.05.454000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.09.05.454000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102764',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('22-JUL-11 11.09.05.581000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.09.05.581000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102765',   
'100019','network','100025','video',         
'tjmoretto',to_timestamp('22-JUL-11 11.09.21.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.09.21.797000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102766',   
'100019','network','100025','video',         
'tjmoretto',to_timestamp('22-JUL-11 11.09.21.949000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.09.21.949000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102767',   
'100019','network','100025','video',         
'tjmoretto',to_timestamp('22-JUL-11 11.11.14.794000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 11.11.14.794000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102768',   
'100033','network','','index',  
'SusanM',to_timestamp('22-JUL-11 11.12.25.364000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.12.25.364000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102769',   
'100033','network','','adminhome',           
'SusanM',to_timestamp('22-JUL-11 11.12.25.510000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.12.25.510000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102803',   
'100033','network','','setselectednetwork',  
'SusanM',to_timestamp('22-JUL-11 11.24.20.828000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.24.20.828000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102804',   
'100033','network','','adminresources',      
'SusanM',to_timestamp('22-JUL-11 11.24.23.360000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.24.23.360000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102806',   
'100033','network','','saveresource',        
'SusanM',to_timestamp('22-JUL-11 11.24.50.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.24.50.274000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102807',   
'100033','network','','adminresources',      
'SusanM',to_timestamp('22-JUL-11 11.24.50.463000 AM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('22-JUL-11 11.24.50.463000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102823',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-JUL-11 01.37.04.636000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 01.37.04.636000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102824',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('22-JUL-11 01.37.14.099000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 01.37.14.099000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102825',   
'100019','network','100009','editresource',  
'tjmoretto',to_timestamp('22-JUL-11 01.37.16.556000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 01.37.16.556000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102828',   
'100019','network','','resources',           
'tjmoretto',to_timestamp('22-JUL-11 02.03.02.678000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.03.02.678000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102829',   
'100019','network','','resources',           
'tjmoretto',to_timestamp('22-JUL-11 02.03.11.616000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.03.11.616000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102830',   
'100019','network','','resources',           
'tjmoretto',to_timestamp('22-JUL-11 02.03.18.800000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.03.18.800000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102831',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('22-JUL-11 02.03.21.805000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.03.21.805000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102832',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('22-JUL-11 02.03.34.992000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.03.34.992000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102833',   
'100027','network','','openPdf',
'nctakiosk',to_timestamp('22-JUL-11 02.03.35.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-JUL-11 02.03.35.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102981',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('04-AUG-11 01.28.12.323000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.12.323000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102982',   
'100019','network','100009','editresource',  
'tjmoretto',to_timestamp('04-AUG-11 01.28.19.849000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.19.849000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102983',   
'100019','network','100009','saveresource',  
'tjmoretto',to_timestamp('04-AUG-11 01.28.26.014000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.26.014000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102984',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('04-AUG-11 01.28.26.192000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.26.192000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102985',   
'100019','network','100012','editresource',  
'tjmoretto',to_timestamp('04-AUG-11 01.28.32.519000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.32.519000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102986',   
'100019','network','100012','saveresource',  
'tjmoretto',to_timestamp('04-AUG-11 01.28.35.989000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.35.989000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102987',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('04-AUG-11 01.28.36.126000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.36.126000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102988',   
'100019','network','100015','editresource',  
'tjmoretto',to_timestamp('04-AUG-11 01.28.44.591000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.44.591000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102989',   
'100019','network','100015','saveresource',  
'tjmoretto',to_timestamp('04-AUG-11 01.28.47.693000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.47.693000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102990',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('04-AUG-11 01.28.47.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.47.750000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102991',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('04-AUG-11 01.28.49.154000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.49.154000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102992',   
'100019','network','100022','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('04-AUG-11 01.28.51.436000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('04-AUG-11 01.28.51.436000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102993',   
'6000','network','','index',    
'canoeadmin',to_timestamp('24-AUG-11 01.19.04.263000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.19.04.263000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102994',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('24-AUG-11 01.19.04.521000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.19.04.521000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102995',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('24-AUG-11 01.19.27.627000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.19.27.627000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102996',   
'100019','network','','index',  
'tjmoretto',to_timestamp('24-AUG-11 01.19.55.630000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.19.55.630000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102997',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('24-AUG-11 01.19.55.748000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.19.55.748000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102998',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('24-AUG-11 01.19.56.165000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.19.56.165000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('102999',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('24-AUG-11 01.20.05.906000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.20.05.906000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103000',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('24-AUG-11 01.20.11.145000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.20.11.145000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103001',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('24-AUG-11 01.20.11.580000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.20.11.580000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103002',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('24-AUG-11 01.20.13.816000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.20.13.816000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103003',   
'6000','network','','index',    
'canoeadmin',to_timestamp('24-AUG-11 01.20.49.106000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.20.49.106000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103004',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('24-AUG-11 01.20.49.176000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.20.49.176000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103005',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('24-AUG-11 01.20.59.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.20.59.761000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103006',   
'100029','network','','index',  
'Susieq',to_timestamp('24-AUG-11 01.21.12.830000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('24-AUG-11 01.21.12.830000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103007',   
'100029','network','','adminhome',           
'Susieq',to_timestamp('24-AUG-11 01.21.12.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('24-AUG-11 01.21.12.904000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103008',   
'100029','network','','setselectednetwork',  
'Susieq',to_timestamp('24-AUG-11 01.21.13.375000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('24-AUG-11 01.21.13.375000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103009',   
'100029','logout','','index',   
'Susieq',to_timestamp('24-AUG-11 01.21.17.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('24-AUG-11 01.21.17.819000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103010',   
'6000','network','','index',    
'canoeadmin',to_timestamp('24-AUG-11 01.21.29.286000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.21.29.286000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103011',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('24-AUG-11 01.21.29.361000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.21.29.361000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103012',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('24-AUG-11 01.23.45.261000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('24-AUG-11 01.23.45.261000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103013',   
'100019','network','','index',  
'tjmoretto',to_timestamp('24-AUG-11 01.23.54.898000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.23.54.898000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103014',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('24-AUG-11 01.23.54.968000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.23.54.968000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103015',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('24-AUG-11 01.23.55.279000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.23.55.279000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103016',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('24-AUG-11 01.24.03.146000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.24.03.146000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103017',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('24-AUG-11 01.24.04.694000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.24.04.694000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103018',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('24-AUG-11 01.24.43.096000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.24.43.096000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103019',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('24-AUG-11 01.24.44.304000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.24.44.304000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103020',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('24-AUG-11 01.31.26.528000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('24-AUG-11 01.31.26.528000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103021',   
'6000','network','','index',    
'canoeadmin',to_timestamp('29-AUG-11 08.49.10.650000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('29-AUG-11 08.49.10.650000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103022',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('29-AUG-11 08.49.10.779000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('29-AUG-11 08.49.10.779000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103023',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('29-AUG-11 08.50.37.077000 AM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('29-AUG-11 08.50.37.077000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103024',   
'100019','network','','index',  
'tjmoretto',to_timestamp('29-AUG-11 08.50.56.574000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.50.56.574000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103025',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('29-AUG-11 08.50.56.696000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.50.56.696000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103026',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 08.50.57.532000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.50.57.532000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103027',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 08.51.02.063000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.02.063000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103028',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('29-AUG-11 08.51.04.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.04.847000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103029',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('29-AUG-11 08.51.20.703000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.20.703000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103030',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('29-AUG-11 08.51.23.364000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.23.364000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103031',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 08.51.23.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.23.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103032',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 08.51.26.999000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.26.999000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103033',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('29-AUG-11 08.51.29.183000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.29.183000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103034',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('29-AUG-11 08.51.31.812000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.31.812000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103035',   
'100019','network','100011','editcampaign',  
'tjmoretto',to_timestamp('29-AUG-11 08.51.35.097000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.35.097000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103036',   
'100019','network','100011','editcampaign',  
'tjmoretto',to_timestamp('29-AUG-11 08.51.36.153000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.51.36.153000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103037',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('29-AUG-11 08.52.44.200000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.52.44.200000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103038',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('29-AUG-11 08.52.50.422000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.52.50.422000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103039',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('29-AUG-11 08.56.09.982000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.56.09.982000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103040',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('29-AUG-11 08.56.10.635000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 08.56.10.635000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103041',   
'100019','login','','auth',     
'tjmoretto',to_timestamp('29-AUG-11 10.10.38.522000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.10.38.522000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103042',   
'100019','network','','index',  
'tjmoretto',to_timestamp('29-AUG-11 10.10.39.183000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.10.39.183000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103043',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('29-AUG-11 10.10.39.559000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.10.39.559000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103044',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 10.10.42.030000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.10.42.030000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103045',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('29-AUG-11 10.10.56.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.10.56.837000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103046',   
'100019','network','','index',  
'tjmoretto',to_timestamp('29-AUG-11 10.11.30.187000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.11.30.187000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103047',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('29-AUG-11 10.11.30.283000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.11.30.283000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103048',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 10.11.30.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.11.30.707000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103049',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 10.11.34.089000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.11.34.089000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103050',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('29-AUG-11 10.11.35.530000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.11.35.530000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103051',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('29-AUG-11 10.12.09.546000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.12.09.546000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103052',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('29-AUG-11 10.12.10.393000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.12.10.393000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103053',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('29-AUG-11 10.15.58.646000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.15.58.646000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103054',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('29-AUG-11 10.16.01.447000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.16.01.447000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103055',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('29-AUG-11 10.16.38.116000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.16.38.116000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103056',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('29-AUG-11 10.17.36.354000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.17.36.354000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103057',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('29-AUG-11 10.17.37.308000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.17.37.308000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103058',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('29-AUG-11 10.48.52.959000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.48.52.959000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103059',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('29-AUG-11 10.48.59.077000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.48.59.077000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103060',   
'100019','network','','saveresource',        
'tjmoretto',to_timestamp('29-AUG-11 10.50.06.627000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.50.06.627000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103061',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('29-AUG-11 10.50.06.714000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.50.06.714000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103062',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('29-AUG-11 10.52.04.979000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.52.04.979000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103063',   
'100019','network','100012','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('29-AUG-11 10.52.16.387000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.52.16.387000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103064',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('29-AUG-11 10.52.33.273000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.52.33.273000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103065',   
'100019','network','100018','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('29-AUG-11 10.52.51.278000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.52.51.278000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103066',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('29-AUG-11 10.52.56.297000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.52.56.297000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103067',   
'100019','network','100018','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('29-AUG-11 10.53.08.790000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.53.08.790000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103068',   
'100019','network','','index',  
'tjmoretto',to_timestamp('29-AUG-11 10.58.56.705000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.58.56.705000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103069',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('29-AUG-11 10.58.56.794000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.58.56.794000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103070',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 10.58.57.097000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.58.57.097000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103071',   
'100019','network','','index',  
'tjmoretto',to_timestamp('29-AUG-11 10.59.20.589000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.59.20.589000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103072',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('29-AUG-11 10.59.20.680000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.59.20.680000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103073',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('29-AUG-11 10.59.21.037000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 10.59.21.037000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103074',   
'100035','network','','index',  
'Test306a',to_timestamp('29-AUG-11 11.13.17.211000 AM','DD-MON-YY HH.MI.SS.FF AM'), 
'',to_timestamp('29-AUG-11 11.13.17.211000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103075',   
'100035','network','','resources',           
'Test306a',to_timestamp('29-AUG-11 11.13.22.080000 AM','DD-MON-YY HH.MI.SS.FF AM'), 
'',to_timestamp('29-AUG-11 11.13.22.080000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103076',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('29-AUG-11 11.13.49.506000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.13.49.506000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103077',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('29-AUG-11 11.13.53.734000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.13.53.734000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103078',   
'100019','network','100012','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('29-AUG-11 11.14.00.675000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.14.00.675000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103079',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('29-AUG-11 11.14.07.642000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.14.07.642000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103080',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('29-AUG-11 11.20.34.869000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.20.34.869000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103081',   
'100019','network','100009','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('29-AUG-11 11.20.43.786000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.20.43.786000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103082',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('29-AUG-11 11.21.11.314000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.21.11.314000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103083',   
'100019','network','100009','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('29-AUG-11 11.21.33.205000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.21.33.205000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103084',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('29-AUG-11 11.21.44.704000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.21.44.704000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103085',   
'100019','network','100128','removeresourcefromgroup',    
'tjmoretto',to_timestamp('29-AUG-11 11.22.48.536000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.22.48.536000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103086',   
'100019','network','','downloadResource',    
'tjmoretto',to_timestamp('29-AUG-11 11.23.03.244000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.23.03.244000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103087',   
'100019','network','100125','removeresourcefromgroup',    
'tjmoretto',to_timestamp('29-AUG-11 11.23.09.986000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.23.09.986000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103088',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('29-AUG-11 11.23.24.249000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.23.24.249000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103089',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('29-AUG-11 11.23.40.094000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.23.40.094000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103090',   
'100019','network','100012','getavailableresourcesforgroup',           
'tjmoretto',to_timestamp('29-AUG-11 11.23.50.271000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.23.50.271000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103091',   
'100019','network','','addresourcetogroup',  
'tjmoretto',to_timestamp('29-AUG-11 11.23.54.831000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.23.54.831000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103092',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('29-AUG-11 11.23.58.751000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.23.58.751000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103093',   
'100019','network','100027','deleteresource',
'tjmoretto',to_timestamp('29-AUG-11 11.24.04.828000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.24.04.828000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103094',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('29-AUG-11 11.24.08.315000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.24.08.315000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103095',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('29-AUG-11 11.26.25.022000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.26.25.022000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103096',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('29-AUG-11 11.26.35.944000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 11.26.35.944000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103097',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('29-AUG-11 12.03.03.694000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('29-AUG-11 12.03.03.694000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103102',   
'100019','network','','index',  
'tjmoretto',to_timestamp('16-NOV-11 08.05.49.252000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.05.49.252000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103103',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('16-NOV-11 08.05.49.872000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.05.49.872000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103104',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('16-NOV-11 08.05.50.977000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.05.50.977000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103105',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('16-NOV-11 08.06.20.445000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.06.20.445000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103106',   
'100027','network','','index',  
'nctakiosk',to_timestamp('16-NOV-11 08.06.49.841000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.06.49.841000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103107',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('16-NOV-11 08.07.02.085000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.07.02.085000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103108',   
'100027','network','','index',  
'nctakiosk',to_timestamp('16-NOV-11 08.07.09.007000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.07.09.007000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103109',   
'100027','network','','contacts',            
'nctakiosk',to_timestamp('16-NOV-11 08.11.41.842000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.11.41.842000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103110',   
'100027','network','','index',  
'nctakiosk',to_timestamp('16-NOV-11 08.12.00.035000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.12.00.035000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103111',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('16-NOV-11 08.17.21.294000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.17.21.294000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103112',   
'100027','network','','index',  
'nctakiosk',to_timestamp('16-NOV-11 08.25.57.048000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.25.57.048000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103113',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('16-NOV-11 08.26.29.256000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.26.29.256000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103114',   
'100027','network','100025','video',         
'nctakiosk',to_timestamp('16-NOV-11 08.26.42.426000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.26.42.426000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103115',   
'100027','network','','resources',           
'nctakiosk',to_timestamp('16-NOV-11 08.26.57.038000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.26.57.038000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103116',   
'100027','network','','calculator',          
'nctakiosk',to_timestamp('16-NOV-11 08.27.28.308000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.27.28.308000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103117',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('16-NOV-11 08.29.05.115000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.29.05.115000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103118',   
'100027','network','','rendercampaign',      
'nctakiosk',to_timestamp('16-NOV-11 08.29.06.506000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.29.06.506000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103119',   
'100027','network','0','createPDFcampaign',  
'nctakiosk',to_timestamp('16-NOV-11 08.29.55.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.29.55.858000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103120',   
'100027','network','0','savecampaign',       
'nctakiosk',to_timestamp('16-NOV-11 08.30.31.180000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.30.31.180000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103121',   
'100027','network','','contacts',            
'nctakiosk',to_timestamp('16-NOV-11 08.30.39.809000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.30.39.809000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103122',   
'100027','logout','','index',   
'nctakiosk',to_timestamp('16-NOV-11 08.39.27.521000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 08.39.27.521000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103123',   
'100027','network','','index',  
'nctakiosk',to_timestamp('16-NOV-11 10.33.35.750000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 10.33.35.750000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103124',   
'100027','network','','contacts',            
'nctakiosk',to_timestamp('16-NOV-11 10.33.41.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('16-NOV-11 10.33.41.431000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103125',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-NOV-11 03.44.14.585000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 03.44.14.585000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103126',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-NOV-11 03.44.14.680000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 03.44.14.680000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103127',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-NOV-11 03.44.15.135000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 03.44.15.135000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103128',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-NOV-11 04.14.43.856000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.14.43.856000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103129',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-NOV-11 04.14.43.945000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.14.43.945000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103130',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-NOV-11 04.14.44.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.14.44.274000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103131',   
'100019','network','','index',  
'tjmoretto',to_timestamp('22-NOV-11 04.15.04.063000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.15.04.063000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103132',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('22-NOV-11 04.15.04.147000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.15.04.147000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103133',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-NOV-11 04.15.04.518000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.15.04.518000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103134',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('22-NOV-11 04.15.35.647000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.15.35.647000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103135',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('22-NOV-11 04.15.38.095000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.15.38.095000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103136',   
'100019','network','','editcontact',         
'tjmoretto',to_timestamp('22-NOV-11 04.15.46.373000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('22-NOV-11 04.15.46.373000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103137',   
'100019','network','','index',  
'tjmoretto',to_timestamp('05-DEC-11 11.23.58.602000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.23.58.602000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103138',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('05-DEC-11 11.23.58.904000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.23.58.904000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103139',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('05-DEC-11 11.23.59.397000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.23.59.397000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103140',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('05-DEC-11 11.24.04.324000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.24.04.324000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103141',   
'100019','network','','index',  
'tjmoretto',to_timestamp('05-DEC-11 11.24.24.214000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.24.24.214000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103142',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('05-DEC-11 11.24.24.284000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.24.24.284000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103143',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('05-DEC-11 11.24.24.861000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.24.24.861000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103144',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('05-DEC-11 11.24.28.102000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.24.28.102000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103145',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('05-DEC-11 11.25.56.980000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.25.56.980000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103146',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('05-DEC-11 11.28.48.671000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 11.28.48.671000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103147',   
'100019','network','','index',  
'tjmoretto',to_timestamp('05-DEC-11 01.20.56.447000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 01.20.56.447000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103148',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('05-DEC-11 01.20.56.553000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 01.20.56.553000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103149',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('05-DEC-11 01.20.57.717000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 01.20.57.717000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103150',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('05-DEC-11 01.21.21.876000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 01.21.21.876000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103151',   
'100019','network','','admincontactsfornetwork',          
'tjmoretto',to_timestamp('05-DEC-11 01.21.25.989000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 01.21.25.989000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103152',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('05-DEC-11 01.21.31.557000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 01.21.31.557000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103153',   
'100019','network','','addcontacttonetwork', 
'tjmoretto',to_timestamp('05-DEC-11 01.21.39.907000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 01.21.39.907000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103154',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('05-DEC-11 02.35.48.914000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('05-DEC-11 02.35.48.914000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103155',   
'6000','network','','index',    
'canoeadmin',to_timestamp('05-DEC-11 02.36.30.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('05-DEC-11 02.36.30.517000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103156',   
'6000','network','','emptyhome',
'canoeadmin',to_timestamp('05-DEC-11 02.36.30.622000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('05-DEC-11 02.36.30.622000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103157',   
'6000','logout','','index',     
'canoeadmin',to_timestamp('05-DEC-11 02.38.17.195000 PM','DD-MON-YY HH.MI.SS.FF AM'),            
'',to_timestamp('05-DEC-11 02.38.17.195000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103158',   
'100036','network','','index',  
'AdOps1',to_timestamp('05-DEC-11 02.39.03.075000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('05-DEC-11 02.39.03.075000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103159',   
'100036','network','','adminhome',           
'AdOps1',to_timestamp('05-DEC-11 02.39.03.149000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('05-DEC-11 02.39.03.149000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103160',   
'100036','network','','setselectednetwork',  
'AdOps1',to_timestamp('05-DEC-11 02.39.03.540000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('05-DEC-11 02.39.03.540000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103161',   
'100036','network','','setselectednetwork',  
'AdOps1',to_timestamp('05-DEC-11 02.47.02.748000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('05-DEC-11 02.47.02.748000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103162',   
'100036','network','','contacts',            
'AdOps1',to_timestamp('05-DEC-11 02.47.15.869000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('05-DEC-11 02.47.15.869000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103163',   
'100036','network','','adminhome',           
'AdOps1',to_timestamp('05-DEC-11 02.58.32.108000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('05-DEC-11 02.58.32.108000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103164',   
'100036','network','','setselectednetwork',  
'AdOps1',to_timestamp('05-DEC-11 02.58.32.498000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('05-DEC-11 02.58.32.498000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103165',   
'100036','logout','','index',   
'AdOps1',to_timestamp('05-DEC-11 04.09.53.355000 PM','DD-MON-YY HH.MI.SS.FF AM'),   
'',to_timestamp('05-DEC-11 04.09.53.355000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103166',   
'100019','network','','index',  
'tjmoretto',to_timestamp('06-DEC-11 01.38.37.147000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 01.38.37.147000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103167',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('06-DEC-11 01.38.37.253000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 01.38.37.253000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103168',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('06-DEC-11 01.38.38.079000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 01.38.38.079000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103169',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('06-DEC-11 01.49.51.994000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 01.49.51.994000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103170',   
'100019','network','','index',  
'tjmoretto',to_timestamp('06-DEC-11 02.26.37.764000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.26.37.764000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103171',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('06-DEC-11 02.26.37.889000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.26.37.889000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103172',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('06-DEC-11 02.26.39.236000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.26.39.236000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103173',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('06-DEC-11 02.27.03.341000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.27.03.341000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103174',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('06-DEC-11 02.27.05.048000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.27.05.048000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103175',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('06-DEC-11 02.27.15.873000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.27.15.873000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103176',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('06-DEC-11 02.27.16.271000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.27.16.271000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103177',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('06-DEC-11 02.27.19.380000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.27.19.380000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103178',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('06-DEC-11 02.27.21.520000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.27.21.520000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103179',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('06-DEC-11 02.31.06.379000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.31.06.379000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103180',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('06-DEC-11 02.31.06.948000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 02.31.06.948000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103181',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('06-DEC-11 04.55.08.096000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('06-DEC-11 04.55.08.096000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103182',   
'100019','network','','index',  
'tjmoretto',to_timestamp('08-DEC-11 02.26.24.558000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.26.24.558000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103183',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('08-DEC-11 02.26.24.686000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.26.24.686000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103184',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('08-DEC-11 02.26.25.944000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.26.25.944000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103185',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-DEC-11 02.26.28.355000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.26.28.355000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103186',   
'100019','network','100036','editcontact',   
'tjmoretto',to_timestamp('08-DEC-11 02.29.31.364000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.29.31.364000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103187',   
'100019','network','100036','savecontact',   
'tjmoretto',to_timestamp('08-DEC-11 02.29.46.230000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.29.46.230000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103188',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('08-DEC-11 02.29.46.361000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.29.46.361000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103189',   
'100019','network','100033','editcontact',   
'tjmoretto',to_timestamp('08-DEC-11 02.29.55.161000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.29.55.161000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103190',   
'100019','network','100033','savecontact',   
'tjmoretto',to_timestamp('08-DEC-11 02.30.12.533000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.30.12.533000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103191',   
'100019','network','100033','editcontact',   
'tjmoretto',to_timestamp('08-DEC-11 02.30.12.710000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('08-DEC-11 02.30.12.710000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103192',   
'100019','network','','index',  
'tjmoretto',to_timestamp('09-DEC-11 10.03.00.408000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.03.00.408000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103193',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-DEC-11 10.03.00.599000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.03.00.599000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103194',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-DEC-11 10.03.01.089000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.03.01.089000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103195',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-DEC-11 10.03.05.996000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.03.05.996000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103196',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-DEC-11 10.03.07.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.03.07.768000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103197',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('09-DEC-11 10.07.01.144000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.07.01.144000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103198',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('09-DEC-11 10.07.03.926000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.07.03.926000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103199',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('09-DEC-11 10.25.45.642000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.25.45.642000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103200',   
'100019','network','','index',  
'tjmoretto',to_timestamp('09-DEC-11 10.54.41.515000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.54.41.515000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103201',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-DEC-11 10.54.41.691000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.54.41.691000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103202',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-DEC-11 10.54.42.747000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.54.42.747000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103203',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-DEC-11 10.54.48.950000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.54.48.950000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103204',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('09-DEC-11 10.54.50.602000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.54.50.602000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103205',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('09-DEC-11 10.54.57.327000 AM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 10.54.57.327000 AM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103206',   
'100019','network','','savedcampaigns',      
'tjmoretto',to_timestamp('09-DEC-11 02.30.50.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 02.30.50.313000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103207',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-DEC-11 02.30.53.525000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 02.30.53.525000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103208',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-DEC-11 04.20.14.064000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.20.14.064000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103209',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-DEC-11 04.20.16.069000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.20.16.069000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103210',   
'100019','logout','','index',   
'tjmoretto',to_timestamp('09-DEC-11 04.21.04.105000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.21.04.105000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103211',   
'100019','network','','index',  
'tjmoretto',to_timestamp('09-DEC-11 04.21.16.110000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.21.16.110000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103212',   
'100019','network','','adminhome',           
'tjmoretto',to_timestamp('09-DEC-11 04.21.16.243000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.21.16.243000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103213',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-DEC-11 04.21.16.823000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.21.16.823000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103214',   
'100019','network','','setselectednetwork',  
'tjmoretto',to_timestamp('09-DEC-11 04.21.21.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.21.21.260000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103215',   
'100019','network','','calculator',          
'tjmoretto',to_timestamp('09-DEC-11 04.21.22.489000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.21.22.489000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103216',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-DEC-11 04.22.33.524000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.22.33.524000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103217',   
'100019','network','','rendercampaign',      
'tjmoretto',to_timestamp('09-DEC-11 04.22.33.946000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.22.33.946000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103218',   
'100019','network','','adminresourcesfornetwork',         
'tjmoretto',to_timestamp('09-DEC-11 04.25.48.900000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.25.48.900000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103219',   
'100019','network','','adminresources',      
'tjmoretto',to_timestamp('09-DEC-11 04.27.19.415000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.27.19.415000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103220',   
'100019','network','','editresource',        
'tjmoretto',to_timestamp('09-DEC-11 04.27.20.995000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.27.20.995000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
insert into web_portal.resource_usage values ('103221',   
'100019','network','','admincontacts',       
'tjmoretto',to_timestamp('09-DEC-11 04.36.44.368000 PM','DD-MON-YY HH.MI.SS.FF AM'),
'',to_timestamp('09-DEC-11 04.36.44.368000 PM','DD-MON-YY HH.MI.SS.FF AM'),         
'0'); 
      
commit;            
drop table web_portal.user_company_subscriber cascade constraints purge;            
  CREATE TABLE "WEB_PORTAL"."USER_COMPANY_SUBSCRIBER"     
   (	"USER_COMPANY_SUBSCRIBER_SID" NUMBER(38,0),          
	"WEB_PORTAL_USER_SID" NUMBER(38,0),         
	"IS_SUBSCRIBED" CHAR(1 CHAR),  
	"SUBSCRIPTION_OPT_OUT_DATE" DATE,           
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 CHAR) DEFAULT '0',      
	"VERSION" NUMBER(22,0),        
	"NETWORK_URI" VARCHAR2(255 CHAR),           
	"EMAIL_URI" VARCHAR2(255 CHAR) 
   )  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING            
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
insert into WEB_PORTAL.user_company_subscriber values ('100014',       
'100034','1',      
to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',  
to_timestamp('29-AUG-11 11.00.54.694000 AM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('29-AUG-11 11.00.54.694000 AM','DD-MON-YY HH.MI.SS.FF AM'),to_number('0'),to_number('0'),        
'/sysdata/api/v1/network/21000',
'/sysdata/api/v1/email/70034'); 
      
insert into WEB_PORTAL.user_company_subscriber values ('100015',       
'100035','0',      
to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',  
to_timestamp('29-AUG-11 11.02.36.543000 AM','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',
to_timestamp('29-AUG-11 11.20.29.115000 AM','DD-MON-YY HH.MI.SS.FF AM'),to_number('0'),to_number('0'),        
'/sysdata/api/v1/network/21002',
'/sysdata/api/v1/email/70035'); 
      
insert into WEB_PORTAL.user_company_subscriber values ('100005',       
'100027','0',      
to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),'tjmoretto',  
to_timestamp('13-JUN-11 03.50.48.160000 PM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('13-JUN-11 03.50.48.160000 PM','DD-MON-YY HH.MI.SS.FF AM'),to_number('0'),to_number('0'),        
'/sysdata/api/v1/network/21003',
'/sysdata/api/v1/email/70027'); 
      
insert into WEB_PORTAL.user_company_subscriber values ('100009',       
'100032','1',      
to_timestamp('','DD-MON-YY HH.MI.SS.FF AM'),'canoeadmin', 
to_timestamp('22-JUL-11 10.07.45.398000 AM','DD-MON-YY HH.MI.SS.FF AM'),'',         
to_timestamp('22-JUL-11 10.07.45.398000 AM','DD-MON-YY HH.MI.SS.FF AM'),to_number('0'),to_number('0'),        
'/sysdata/api/v1/network/21003',
'/sysdata/api/v1/email/70032'); 
      
commit;            
drop table web_portal.display_group_images cascade constraint purge;   
CREATE TABLE "WEB_PORTAL"."DISPLAY_GROUP_IMAGES"          
   (	"DISPLAY_GROUP_IMAGES_SID" NUMBER(38,0),
	"IMAGE_URI" VARCHAR2(255 CHAR),
	"CREATED_BY" VARCHAR2(255 CHAR),            
	"CREATED_DATE" TIMESTAMP (6),  
	"UPDATED_BY" VARCHAR2(255 CHAR),            
	"UPDATED_DATE" TIMESTAMP (6),  
	"IS_DELETED" CHAR(1 BYTE) DEFAULT '0',      
	"VERSION" NUMBER(22,0)         
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA" ;           
      
 CREATE INDEX "WEB_PORTAL"."DISPLAY_GROUP_IDX" ON "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" ("DISPLAY_GROUP_SID")  
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX" ;           
      
 CREATE INDEX "WEB_PORTAL"."DISPLAY_RESOURCE_IDX" ON "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" ("RESOURCE_SID")    
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX" ;           
      
 CREATE INDEX "WEB_PORTAL"."FC_PLAN_USR_IDX" ON "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" ("USER_SID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX" ;           
      
 CREATE INDEX "WEB_PORTAL"."FC_USAGE_SOURCE_IDX" ON "WEB_PORTAL"."RESOURCE_USAGE" ("SOURCE")     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX" ;           
      
 CREATE INDEX "WEB_PORTAL"."FC_USAGE_USER_IDX" ON "WEB_PORTAL"."RESOURCE_USAGE" ("USER_SID")     
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX" ;           
      
 CREATE INDEX "WEB_PORTAL"."KEY_VALUE_PAIR_PLAN_IDX" ON "WEB_PORTAL"."KEY_VALUE_PAIR" ("FC_PLAN_SID")         
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX" ;           
      
 CREATE INDEX "WEB_PORTAL"."RESOURCE_COMPANY_LIST_1_IDX" ON "WEB_PORTAL"."RESOURCE_COMPANY_LIST" ("RESOURCE_SID")          
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX" ;           
      
 CREATE INDEX "WEB_PORTAL"."USER_COMPANY_SUBSCR_USER_IDX" ON "WEB_PORTAL"."USER_COMPANY_SUBSCRIBER" ("WEB_PORTAL_USER_SID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS   
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX" ;           
      
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP" ADD CONSTRAINT "DISPLAY_GROUP_PK" PRIMARY KEY ("DISPLAY_GROUP_SID")  
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP" MODIFY ("CREATED_BY" NOT NULL ENABLE);     
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP" MODIFY ("CREATED_DATE" NOT NULL ENABLE);   
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP" MODIFY ("IS_DELETED" NOT NULL ENABLE);     
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;           
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP_IMAGES" ADD CONSTRAINT "DISPLAY_GROUP_IMAGES_PK" PRIMARY KEY ("DISPLAY_GROUP_IMAGES_SID")       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS LOGGING         
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP_IMAGES" MODIFY ("CREATED_BY" NOT NULL ENABLE);           
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP_IMAGES" MODIFY ("CREATED_DATE" NOT NULL ENABLE);         
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP_IMAGES" MODIFY ("IS_DELETED" NOT NULL ENABLE);           
ALTER TABLE "WEB_PORTAL"."DISPLAY_GROUP_IMAGES" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;    
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" ADD CONSTRAINT "RESOURCE_DISPLAY_LIST_PK" PRIMARY KEY ("RESOURCE_DISPLAY_SID")         
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."EMAIL_JOB" ADD CONSTRAINT "EMAIL_JOB_PK" PRIMARY KEY ("EMAIL_JOB_SID") 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS LOGGING         
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1        
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."EMAIL_JOB" MODIFY ("RESOURCE_DISPLAY_SID" NOT NULL ENABLE);            
ALTER TABLE "WEB_PORTAL"."EMAIL_JOB" MODIFY ("CREATED_BY" NOT NULL ENABLE);         
ALTER TABLE "WEB_PORTAL"."EMAIL_JOB" MODIFY ("CREATED_DATE" NOT NULL ENABLE);       
ALTER TABLE "WEB_PORTAL"."EMAIL_JOB" MODIFY ("IS_DELETED" NOT NULL ENABLE);         
ALTER TABLE "WEB_PORTAL"."EMAIL_JOB" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;  
ALTER TABLE "WEB_PORTAL"."EMAIL_JOB" ADD CONSTRAINT "EMAIL_JOB_DISPLAY_LIST_FK" FOREIGN KEY ("RESOURCE_DISPLAY_SID")       
	  REFERENCES "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" ("RESOURCE_DISPLAY_SID") DEFERRABLE INITIALLY DEFERRED ENABLE;          
      
ALTER TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" ADD CONSTRAINT "FC_PLAN_PK" PRIMARY KEY ("FC_PLAN_SID")      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" MODIFY ("USER_SID" NOT NULL ENABLE);            
ALTER TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" MODIFY ("IS_PRIVATE" NOT NULL ENABLE);          
ALTER TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" MODIFY ("CREATED_BY" NOT NULL ENABLE);          
ALTER TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" MODIFY ("CREATED_DATE" NOT NULL ENABLE);        
ALTER TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" MODIFY ("IS_DELETED" NOT NULL ENABLE);          
ALTER TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" ADD CHECK ( IS_PRIVATE IN ('0', '1')) ENABLE;   
ALTER TABLE "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;   
ALTER TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" ADD CONSTRAINT "KEY_VALUE_PAIR_PK" PRIMARY KEY ("FC_PLAN_SID", "KEY_NAME")       
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" MODIFY ("FC_PLAN_SID" NOT NULL ENABLE);   
ALTER TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" MODIFY ("KEY_NAME" NOT NULL ENABLE);      
ALTER TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" MODIFY ("CREATED_BY" NOT NULL ENABLE);    
ALTER TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" MODIFY ("CREATED_DATE" NOT NULL ENABLE);  
ALTER TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" MODIFY ("IS_DELETED" NOT NULL ENABLE);    
ALTER TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;          
ALTER TABLE "WEB_PORTAL"."KEY_VALUE_PAIR" ADD CONSTRAINT "FULFILLMENT_CALCULATOR_PLAN_FK" FOREIGN KEY ("FC_PLAN_SID")      
	  REFERENCES "WEB_PORTAL"."FULFILLMENT_CALC_PLAN" ("FC_PLAN_SID") ENABLE;          
      
ALTER TABLE "WEB_PORTAL"."RESOURCES" ADD CONSTRAINT "RESOURCE_PK" PRIMARY KEY ("RESOURCE_SID")   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."RESOURCES" MODIFY ("CREATED_BY" NOT NULL ENABLE);         
ALTER TABLE "WEB_PORTAL"."RESOURCES" MODIFY ("CREATED_DATE" NOT NULL ENABLE);       
ALTER TABLE "WEB_PORTAL"."RESOURCES" MODIFY ("IS_DELETED" NOT NULL ENABLE);         
ALTER TABLE "WEB_PORTAL"."RESOURCES" MODIFY ("TO_BE_WATERMARKED" NOT NULL ENABLE);  
ALTER TABLE "WEB_PORTAL"."RESOURCES" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;  
ALTER TABLE "WEB_PORTAL"."RESOURCES" ADD CHECK ( TO_BE_WATERMARKED IN ('0', '1')) ENABLE;        
ALTER TABLE "WEB_PORTAL"."RESOURCE_COMPANY_LIST" ADD CONSTRAINT "RESOURCE_COMPANY_LIST_PK" PRIMARY KEY ("RESOURCE_COMPANY_LIST_SID")    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."RESOURCE_COMPANY_LIST" MODIFY ("RESOURCE_SID" NOT NULL ENABLE);        
ALTER TABLE "WEB_PORTAL"."RESOURCE_COMPANY_LIST" MODIFY ("CREATED_BY" NOT NULL ENABLE);          
ALTER TABLE "WEB_PORTAL"."RESOURCE_COMPANY_LIST" MODIFY ("CREATED_DATE" NOT NULL ENABLE);        
ALTER TABLE "WEB_PORTAL"."RESOURCE_COMPANY_LIST" MODIFY ("IS_DELETED" NOT NULL ENABLE);          
ALTER TABLE "WEB_PORTAL"."RESOURCE_COMPANY_LIST" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;   
ALTER TABLE "WEB_PORTAL"."RESOURCE_COMPANY_LIST" ADD CONSTRAINT "LIST_RESOURCE_FK" FOREIGN KEY ("RESOURCE_SID")            
	  REFERENCES "WEB_PORTAL"."RESOURCES" ("RESOURCE_SID") ENABLE;        
      
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" MODIFY ("DISPLAY_GROUP_SID" NOT NULL ENABLE);   
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" MODIFY ("RESOURCE_SID" NOT NULL ENABLE);        
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" MODIFY ("CREATED_BY" NOT NULL ENABLE);          
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" MODIFY ("CREATED_DATE" NOT NULL ENABLE);        
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" MODIFY ("IS_DELETED" NOT NULL ENABLE);          
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;   
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" ADD CONSTRAINT "LIST_DISPLAY_GROUP_FK" FOREIGN KEY ("DISPLAY_GROUP_SID")  
	  REFERENCES "WEB_PORTAL"."DISPLAY_GROUP" ("DISPLAY_GROUP_SID") ENABLE;            
      
ALTER TABLE "WEB_PORTAL"."RESOURCE_DISPLAY_LIST" ADD CONSTRAINT "LIST_RESOURCE_1_FK" FOREIGN KEY ("RESOURCE_SID")          
	  REFERENCES "WEB_PORTAL"."RESOURCES" ("RESOURCE_SID") ENABLE;        
      
ALTER TABLE "WEB_PORTAL"."RESOURCE_USAGE" ADD CONSTRAINT "SYSTEM_USAGE_PK" PRIMARY KEY ("USAGE_SID")          
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."RESOURCE_USAGE" MODIFY ("USAGE_SID" NOT NULL ENABLE);     
ALTER TABLE "WEB_PORTAL"."RESOURCE_USAGE" MODIFY ("USER_SID" NOT NULL ENABLE);      
ALTER TABLE "WEB_PORTAL"."RESOURCE_USAGE" MODIFY ("CREATED_BY" NOT NULL ENABLE);    
ALTER TABLE "WEB_PORTAL"."RESOURCE_USAGE" MODIFY ("CREATED_DATE" NOT NULL ENABLE);  
GRANT REFERENCES ON "WEB_PORTAL"."RESOURCE_USAGE" TO PUBLIC;           
ALTER TABLE "WEB_PORTAL"."SECURITY_QUESTION" ADD CONSTRAINT "SECURITY_QUESTION_1_UN" UNIQUE ("QUESTION")      
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."SECURITY_QUESTION" ADD CONSTRAINT "SECURITY_QUESTION_PK" PRIMARY KEY ("SECURITY_QUESTION_SID")   
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."SECURITY_QUESTION" MODIFY ("SECURITY_QUESTION_SID" NOT NULL ENABLE);   
ALTER TABLE "WEB_PORTAL"."SECURITY_QUESTION" MODIFY ("CREATED_BY" NOT NULL ENABLE); 
ALTER TABLE "WEB_PORTAL"."SECURITY_QUESTION" MODIFY ("CREATED_DATE" NOT NULL ENABLE);            
ALTER TABLE "WEB_PORTAL"."SECURITY_QUESTION" MODIFY ("IS_DELETED" NOT NULL ENABLE); 
ALTER TABLE "WEB_PORTAL"."SECURITY_QUESTION" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;       
ALTER TABLE "WEB_PORTAL"."USERS" MODIFY ("USER_SID" NOT NULL ENABLE);  
ALTER TABLE "WEB_PORTAL"."USERS" MODIFY ("USER_NAME" NOT NULL ENABLE); 
ALTER TABLE "WEB_PORTAL"."USERS" MODIFY ("IS_DELETED" NOT NULL ENABLE);
ALTER TABLE "WEB_PORTAL"."USERS" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE;      
ALTER TABLE "WEB_PORTAL"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_SID") 
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."USERS" ADD CONSTRAINT "USERS__UN" UNIQUE ("USER_NAME")    
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_DATA"  ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."USERS" ADD CONSTRAINT "USERS_SECURITY_QUESTION_FK" FOREIGN KEY ("SECURITY_QUESTION_SID")         
	  REFERENCES "WEB_PORTAL"."SECURITY_QUESTION" ("SECURITY_QUESTION_SID") ENABLE;    
      
ALTER TABLE "WEB_PORTAL"."USER_COMPANY_SUBSCRIBER" MODIFY ("WEB_PORTAL_USER_SID" NOT NULL ENABLE);            
ALTER TABLE "WEB_PORTAL"."USER_COMPANY_SUBSCRIBER" MODIFY ("CREATED_BY" NOT NULL ENABLE);        
ALTER TABLE "WEB_PORTAL"."USER_COMPANY_SUBSCRIBER" MODIFY ("CREATED_DATE" NOT NULL ENABLE);      
ALTER TABLE "WEB_PORTAL"."USER_COMPANY_SUBSCRIBER" MODIFY ("IS_DELETED" NOT NULL ENABLE);        
ALTER TABLE "WEB_PORTAL"."USER_COMPANY_SUBSCRIBER" ADD CHECK ( IS_DELETED IN ('0', '1')) ENABLE; 
ALTER TABLE "WEB_PORTAL"."USER_COMPANY_SUBSCRIBER" ADD CONSTRAINT "USER_COMPANY_SUBSCRIBER_PK" PRIMARY KEY ("USER_COMPANY_SUBSCRIBER_SID")           
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS    
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1         
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 )           
  TABLESPACE "ACCESS_CANOE_INDX"  ENABLE;    
      
drop sequence web_portal.CANOE_CONTACT_COMPANY_LIST_SEQ;  
drop sequence web_portal.DISPLAY_GROUP_SEQ;  
drop sequence web_portal.FOOTPRINT_SEQ;      
drop sequence web_portal.FULFILLMENT_CALC_PLAN_SEQ;       
drop sequence web_portal.RESOURCES_SEQ;      
drop sequence web_portal.RESOURCE_COMPANY_LIST_SEQ;       
drop sequence web_portal.RESOURCE_DISPLAY_LIST_SEQ;       
drop sequence web_portal.RESOURCE_USAGE_SEQ; 
drop sequence web_portal.SECURITY_QUESTION_SEQ;           
drop sequence web_portal.USER_COMPANY_SUBSCRIBER_SEQ;     
drop sequence web_portal.EMAIL_JOB_SEQ;      
drop sequence web_portal.display_group_images_seq;        
drop sequence web_portal.users_seq;          
create sequence web_portal.CANOE_CONTACT_COMPANY_LIST_SEQ start with 100044         
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.DISPLAY_GROUP_SEQ start with 100024         
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.FOOTPRINT_SEQ start with 100000
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.FULFILLMENT_CALC_PLAN_SEQ start with 100016 
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.RESOURCES_SEQ start with 100028
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.RESOURCE_COMPANY_LIST_SEQ start with 100223 
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.RESOURCE_DISPLAY_LIST_SEQ start with 100143 
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.RESOURCE_USAGE_SEQ start with 103277        
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.SECURITY_QUESTION_SEQ start with 100000     
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.USER_COMPANY_SUBSCRIBER_SEQ start with 100019            
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.EMAIL_JOB_SEQ start with 100023
increment by 1 maxvalue 9999999999999999999999999999 minvalue 100000;  
      
create sequence web_portal.users_seq start with 1000000 increment by 1 minvalue 100000           
maxvalue 9999999999999999999999999999;       
      
create sequence web_portal.display_group_images_seq start with 1000000 increment by 1 minvalue 100000         
maxvalue 9999999999999999999999999999;       
      
drop public synonym EMAIL_JOB_SEQ;           
drop public synonym EMAIL_JOB;  
drop public synonym CANOE_CONTACT_COMPANY_LIST;           
drop public synonym CANOE_CONTACT_COMPANY_LIST_SEQ;       
drop public synonym DISPLAY_GROUP;           
drop public synonym DISPLAY_GROUP_SEQ;       
drop public synonym FOOTPRINT;  
drop public synonym FOOTPRINT_SEQ;           
drop public synonym FULFILLMENT_CALC_PLAN;   
drop public synonym FULFILLMENT_CALC_PLAN_SEQ;            
drop public synonym KEY_VALUE_PAIR;          
drop public synonym KEY_VALUE_PAIR_SEQ;      
drop public synonym RESOURCES;  
drop public synonym RESOURCES_SEQ;           
drop public synonym RESOURCE_COMPANY_LIST;   
drop public synonym RESOURCE_COMPANY_LIST_SEQ;            
drop public synonym RESOURCE_DISPLAY_LIST;   
drop public synonym RESOURCE_DISPLAY_LIST_SEQ;            
drop public synonym RESOURCE_USAGE;          
drop public synonym RESOURCE_USAGE_SEQ;      
drop public synonym SECURITY_QUESTION;       
drop public synonym SECURITY_QUESTION_SEQ;   
drop public synonym USER_COMPANY_SUBSCRIBER; 
drop public synonym USER_COMPANY_SUBSCRIBER_SEQ;          
drop synonym webapp.USER_COMPANY_SUBSCRIBER; 
drop synonym webapp.CANOE_CONTACT_COMPANY_LIST_SEQ;       
drop synonym webapp.COMPANY_SEQ;
drop synonym webapp.COMPANY_TYPE_SEQ;        
drop synonym webapp.CONTACT_INFO_SEQ;        
drop synonym webapp.DISPLAY_GROUP_SEQ;       
drop synonym webapp.EMAIL_INFO_SEQ;          
drop synonym webapp.FOOTPRINT_SEQ;           
drop synonym webapp.FULFILLMENT_CALC_PLAN_SEQ;            
drop synonym webapp.IMAGE_SEQ;  
drop synonym webapp.LIST_OF_VALUES_SEQ;      
drop synonym webapp.PHONE_INFO_SEQ;          
drop synonym webapp.RESOURCES_SEQ;           
drop synonym webapp.RESOURCE_COMPANY_LIST_SEQ;            
drop synonym webapp.RESOURCE_DISPLAY_LIST_SEQ;            
drop synonym webapp.RESOURCE_USAGE_SEQ;      
drop synonym webapp.SECURITY_QUESTION_SEQ;   
drop synonym webapp.USER_COMPANY_SUBSCRIBER_SEQ;          
drop synonym webapp.EMAIL_JOB;  
drop synonym webapp.EMAIL_JOB_SEQ;           
drop synonym webapp.CANOE_CONTACT_COMPANY_LIST;           
drop synonym webapp.COMPANY;    
drop synonym webapp.COMPANY_TYPE;            
drop synonym webapp.CONTACT_INFO;            
drop synonym webapp.DISPLAY_GROUP;           
drop synonym webapp.EMAIL_INFO; 
drop synonym webapp.FOOTPRINT;  
drop synonym webapp.FULFILLMENT_CALC_PLAN;   
drop synonym webapp.IMAGE;      
drop synonym webapp.KEY_VALUE_PAIR;          
drop synonym webapp.LIST_OF_VALUES;          
drop synonym webapp.NETWORK;    
drop synonym webapp.PHONE_INFO; 
drop synonym webapp.RESOURCES;  
drop synonym webapp.RESOURCE_COMPANY_LIST;   
drop synonym webapp.RESOURCE_DISPLAY_LIST;   
drop synonym webapp.RESOURCE_USAGE;          
drop synonym webapp.SECURITY_QUESTION;       
drop synonym webapp.USERS;      
create or replace synonym webapp.CANOE_CONTACT_COMPANY_LIST for web_portal.CANOE_CONTACT_COMPANY_LIST;        
create or replace synonym webapp.CANOE_CONTACT_COMPANY_LIST_SEQ for web_portal.CANOE_CONTACT_COMPANY_LIST_SEQ;
create or replace synonym webapp.DISPLAY_GROUP for web_portal.DISPLAY_GROUP;        
create or replace synonym webapp.DISPLAY_GROUP_SEQ for web_portal.DISPLAY_GROUP_SEQ;
create or replace synonym webapp.EMAIL_JOB for web_portal.EMAIL_JOB;   
create or replace synonym webapp.EMAIL_JOB_SEQ for web_portal.EMAIL_JOB_SEQ;        
create or replace synonym webapp.FOOTPRINT for web_portal.FOOTPRINT;   
create or replace synonym webapp.FOOTPRINT_SEQ for web_portal.FOOTPRINT_SEQ;        
create or replace synonym webapp.FULFILLMENT_CALC_PLAN for web_portal.FULFILLMENT_CALC_PLAN;     
create or replace synonym webapp.FULFILLMENT_CALC_PLAN_SEQ for web_portal.FULFILLMENT_CALC_PLAN_SEQ;          
create or replace synonym webapp.KEY_VALUE_PAIR for web_portal.KEY_VALUE_PAIR;      
create or replace synonym webapp.RESOURCES for web_portal.RESOURCES;   
create or replace synonym webapp.RESOURCES_SEQ for web_portal.RESOURCES_SEQ;        
create or replace synonym webapp.RESOURCE_COMPANY_LIST for web_portal.RESOURCE_COMPANY_LIST;     
create or replace synonym webapp.RESOURCE_COMPANY_LIST_SEQ for web_portal.RESOURCE_COMPANY_LIST_SEQ;          
create or replace synonym webapp.RESOURCE_DISPLAY_LIST for web_portal.RESOURCE_DISPLAY_LIST;     
create or replace synonym webapp.RESOURCE_DISPLAY_LIST_SEQ for web_portal.RESOURCE_DISPLAY_LIST_SEQ;          
create or replace synonym webapp.RESOURCE_USAGE for web_portal.RESOURCE_USAGE;      
create or replace synonym webapp.RESOURCE_USAGE_SEQ for web_portal.RESOURCE_USAGE_SEQ;           
create or replace synonym webapp.SECURITY_QUESTION for web_portal.SECURITY_QUESTION;
create or replace synonym webapp.SECURITY_QUESTION_SEQ for web_portal.SECURITY_QUESTION_SEQ;     
create or replace synonym webapp.USER_COMPANY_SUBSCRIBER for web_portal.USER_COMPANY_SUBSCRIBER; 
create or replace synonym webapp.USER_COMPANY_SUBSCRIBER_SEQ for web_portal.USER_COMPANY_SUBSCRIBER_SEQ;      
create or replace synonym webapp.users_seq for web_portal.users_seq;   
create or replace synonym webapp.users for web_portal.users;           
create or replace synonym webapp.display_group_images for web_portal.display_group_images;       
create or replace synonym webapp.display_group_images_seq for web_portal.display_group_images_seq;            
grant select, update, insert, delete on web_portal.CANOE_CONTACT_COMPANY_LIST to webapp;         
grant select, update, insert, delete on web_portal.DISPLAY_GROUP to webapp;         
grant select, update, insert, delete on web_portal.EMAIL_JOB to webapp;
grant select, update, insert, delete on web_portal.FOOTPRINT to webapp;
grant select, update, insert, delete on web_portal.FULFILLMENT_CALC_PLAN to webapp; 
grant select, update, insert, delete on web_portal.KEY_VALUE_PAIR to webapp;        
grant select, update, insert, delete on web_portal.RESOURCES to webapp;
grant select, update, insert, delete on web_portal.RESOURCE_COMPANY_LIST to webapp; 
grant select, update, insert, delete on web_portal.RESOURCE_DISPLAY_LIST to webapp; 
grant select, update, insert, delete on web_portal.RESOURCE_USAGE to webapp;        
grant select, update, insert, delete on web_portal.SECURITY_QUESTION to webapp;     
grant select, update, insert, delete on web_portal.USER_COMPANY_SUBSCRIBER to webapp;            
grant select, update, insert, delete on web_portal.users to webapp;    
grant select, update, insert, delete on web_portal.display_group_images to webapp;  
grant select on web_portal.CANOE_CONTACT_COMPANY_LIST_SEQ to webapp;   
grant select on web_portal.DISPLAY_GROUP_SEQ to webapp;   
grant select on web_portal.EMAIL_JOB_SEQ to webapp;       
grant select on web_portal.FOOTPRINT_SEQ to webapp;       
grant select on web_portal.FULFILLMENT_CALC_PLAN_SEQ to webapp;        
grant select on web_portal.RESOURCES_SEQ to webapp;       
grant select on web_portal.RESOURCE_COMPANY_LIST_SEQ to webapp;        
grant select on web_portal.RESOURCE_DISPLAY_LIST_SEQ to webapp;        
grant select on web_portal.RESOURCE_USAGE_SEQ to webapp;  
grant select on web_portal.SECURITY_QUESTION_SEQ to webapp;            
grant select on web_portal.USER_COMPANY_SUBSCRIBER_SEQ to webapp;      
grant select on web_portal.users_seq to webapp;           
grant select on web_portal.display_group_images_seq to webapp;         

-- b/src/sql/archives/1.4.3/sysdata_data_update.sql
update web_portal.resource_company_list set company_uri = replace(company_uri,'company','network');
commit;
spool off