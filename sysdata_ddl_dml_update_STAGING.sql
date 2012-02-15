spool sysdata_staging.log
-- connect system/&systempassword@&tnsnames_entry
set def on
def sid_name = 'caasdbt3'
--def sid_name = 'xe'

--
--create tablespace sysdata_data datafile '/oradata4/&sid_name/data/sysdata_data.dbf' size 50M autoextend on maxsize 100M;
--create tablespace sysdata_index datafile '/oradata4/&sid_name/data/sysdata_index.dbf' size 40M autoextend on maxsize 100M;


create user sysdata identified by secret default tablespace sysdata_data temporary tablespace temp;
grant connect, resource, unlimited tablespace to sysdata;
grant create view, create sequence, create synonym to resource;

set def off

--------------------------------------------------------
--  DDL for Table DATABASECHANGELOG
--------------------------------------------------------

  CREATE TABLE "SYSDATA"."DATABASECHANGELOG" 
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
  TABLESPACE "SYSDATA_DATA" ;
--------------------------------------------------------
--  DDL for Index PK_DATABASECHANGELOG
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSDATA"."PK_DATABASECHANGELOG" ON "SYSDATA"."DATABASECHANGELOG" ("ID", "AUTHOR", "FILENAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSDATA_DATA" ;
--------------------------------------------------------
--  Constraints for Table DATABASECHANGELOG
--------------------------------------------------------

  ALTER TABLE  "SYSDATA"."DATABASECHANGELOG" ADD CONSTRAINT "PK_DATABASECHANGELOG" PRIMARY KEY ("ID", "AUTHOR", "FILENAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSDATA_DATA"  ENABLE;
 
   ALTER TABLE  "SYSDATA"."DATABASECHANGELOG" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE  "SYSDATA"."DATABASECHANGELOG" MODIFY ("AUTHOR" NOT NULL ENABLE);
 
  ALTER TABLE  "SYSDATA"."DATABASECHANGELOG" MODIFY ("FILENAME" NOT NULL ENABLE);
 
  ALTER TABLE  "SYSDATA"."DATABASECHANGELOG" MODIFY ("DATEEXECUTED" NOT NULL ENABLE);
 
  ALTER TABLE  "SYSDATA"."DATABASECHANGELOG" MODIFY ("ORDEREXECUTED" NOT NULL ENABLE);
 
  ALTER TABLE  "SYSDATA"."DATABASECHANGELOG" MODIFY ("EXECTYPE" NOT NULL ENABLE);

  
 --------------------------------------------------------
--  DDL for Table DATABASECHANGELOGLOCK
--------------------------------------------------------

  CREATE TABLE "SYSDATA"."DATABASECHANGELOGLOCK" 
   (	"ID" NUMBER(*,0), 
	"LOCKED" NUMBER(1,0), 
	"LOCKGRANTED" TIMESTAMP (6), 
	"LOCKEDBY" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSDATA_DATA" ;
--------------------------------------------------------
--  DDL for Index PK_DATABASECHANGELOGLOCK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSDATA"."PK_DATABASECHANGELOGLOCK" ON "SYSDATA"."DATABASECHANGELOGLOCK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSDATA_DATA" ;
--------------------------------------------------------
--  Constraints for Table DATABASECHANGELOGLOCK
--------------------------------------------------------

  ALTER TABLE  "SYSDATA"."DATABASECHANGELOGLOCK" ADD CONSTRAINT "PK_DATABASECHANGELOGLOCK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSDATA_DATA"  ENABLE;
 
  ALTER TABLE  "SYSDATA"."DATABASECHANGELOGLOCK" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE  "SYSDATA"."DATABASECHANGELOGLOCK" MODIFY ("LOCKED" NOT NULL ENABLE);

 

-- Lock Database
-- Changeset changelog-init.groovy::initial tables::Jim Moore::(Checksum: 3:008f197f999dcabddb28083f8568d247)
-- This is the imported (but cleaned up) version of the table structure of what is in the database when Liquibase is being added to the project. All the tables are created with the LOGGING option turned on, and exist in the SYSDATA_DATA tablespace.
CREATE TABLE SYSDATA.canoe_contact_role (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, canoe_contact_id NUMBER(19,0) NOT NULL, company_id NUMBER(19,0) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), rank NUMBER(10,0) NOT NULL, role VARCHAR2(255 CHAR) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.company (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, communications_enabled NUMBER(1,0) NOT NULL, company_legal_name VARCHAR2(255 CHAR), company_name VARCHAR2(255 CHAR) NOT NULL, company_type VARCHAR2(255 CHAR) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), image_id NUMBER(19,0), is_customer NUMBER(1,0) NOT NULL, is_deleted NUMBER(1,0) NOT NULL, status VARCHAR2(22 CHAR), updated_by NUMBER(19,0) NOT NULL, class VARCHAR2(255 CHAR) NOT NULL, category VARCHAR2(255 CHAR), client_code VARCHAR2(255 CHAR), certified_date TIMESTAMP(6), description VARCHAR2(255 CHAR), network_name VARCHAR2(255 CHAR), nielsen_code VARCHAR2(255 CHAR), enabled_households NUMBER(10,0), mso_code VARCHAR2(255 CHAR), password VARCHAR2(255 CHAR), reporting_name VARCHAR2(255 CHAR), user_name VARCHAR2(255 CHAR), order_source VARCHAR2(255 CHAR)) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.company_type (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, can_be_customer NUMBER(1,0) NOT NULL, can_have_end_points NUMBER(1,0) NOT NULL, can_have_video NUMBER(1,0) NOT NULL, company_type VARCHAR2(255 CHAR) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.contact (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, alternate_name VARCHAR2(255 CHAR), company_id NUMBER(19,0), created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), first_name VARCHAR2(255 CHAR) NOT NULL, image_id NUMBER(19,0), is_deleted NUMBER(1,0) NOT NULL, last_name VARCHAR2(255 CHAR) NOT NULL, location_id NUMBER(19,0), title VARCHAR2(255 CHAR), updated_by NUMBER(19,0) NOT NULL, class VARCHAR2(255 CHAR) NOT NULL, canoe_office VARCHAR2(255 CHAR)) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.email (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, contact_id NUMBER(19,0), created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), email_address VARCHAR2(255 CHAR) NOT NULL, email_type VARCHAR2(255 CHAR), is_deleted NUMBER(1,0) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.end_point (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, communication_type VARCHAR2(255 CHAR) NOT NULL, company_id NUMBER(19,0), created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), enabled NUMBER(1,0) NOT NULL, password VARCHAR2(255 CHAR), push_protocol VARCHAR2(255 CHAR), spec_version VARCHAR2(255 CHAR), supported_spec VARCHAR2(255 CHAR), updated_by NUMBER(19,0) NOT NULL, url VARCHAR2(255 CHAR) NOT NULL, user_name VARCHAR2(255 CHAR)) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.geographic (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, code VARCHAR2(255 CHAR) NOT NULL, description VARCHAR2(255 CHAR) NOT NULL, type VARCHAR2(255 CHAR) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.image (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), full_path_name VARCHAR2(1024 CHAR), image_binary BLOB, image_name VARCHAR2(255 CHAR) NOT NULL, is_deleted NUMBER(1,0) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.list_of_value (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, category VARCHAR2(255 CHAR) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6) NOT NULL, description VARCHAR2(1024 CHAR), display_value VARCHAR2(255 CHAR) NOT NULL, edited_date TIMESTAMP(6), is_deleted NUMBER(1,0) NOT NULL, parent_id NUMBER(19,0), return_value VARCHAR2(255 CHAR) NOT NULL, sort_order NUMBER(10,0) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.location (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, address1 VARCHAR2(100 CHAR) NOT NULL, address2 VARCHAR2(100 CHAR), city VARCHAR2(100 CHAR) NOT NULL, company_id NUMBER(19,0), created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), description VARCHAR2(100 CHAR), edited_date TIMESTAMP(6), is_deleted NUMBER(1,0) NOT NULL, location_type VARCHAR2(255 CHAR), postal_code9 VARCHAR2(10 CHAR) NOT NULL, state VARCHAR2(38 CHAR) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.network_owner (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), network_id NUMBER(19,0) NOT NULL, programmer_id NUMBER(19,0) NOT NULL, relation_end_date TIMESTAMP(6), relation_start_date TIMESTAMP(6) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.phone (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, company_id NUMBER(19,0), contact_id NUMBER(19,0), created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), description VARCHAR2(50 CHAR), edited_date TIMESTAMP(6), phone_extension VARCHAR2(10 CHAR), phone_number VARCHAR2(20 CHAR), type VARCHAR2(255 CHAR) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.product_type (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, ap_id VARCHAR2(255 CHAR), available NUMBER(1,0) NOT NULL, branded NUMBER(1,0) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), description VARCHAR2(255 CHAR), edited_date TIMESTAMP(6), ep_family VARCHAR2(255 CHAR), epsid VARCHAR2(255 CHAR), ep_type VARCHAR2(255 CHAR), is_deleted NUMBER(1,0) NOT NULL, max_questions NUMBER(1,0) NOT NULL, name VARCHAR2(255 CHAR) NOT NULL, org_id VARCHAR2(255 CHAR), product_version VARCHAR2(255 CHAR), sponsorable NUMBER(1,0) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.security_question (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), is_deleted NUMBER(1,0) NOT NULL, question VARCHAR2(255 CHAR) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.syscode (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), edited_date TIMESTAMP(6), end_point_id NUMBER(19,0) NOT NULL, syscode VARCHAR2(4 CHAR) NOT NULL, updated_by NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.users (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, contact_id NUMBER(19,0) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), disabled NUMBER(1,0) NOT NULL, edited_date TIMESTAMP(6), is_deleted NUMBER(1,0) NOT NULL, portal_user_type VARCHAR2(255 CHAR) NOT NULL, security_answer VARCHAR2(255 CHAR) NOT NULL, security_question_id NUMBER(19,0) NOT NULL, updated_by NUMBER(19,0) NOT NULL, user_name VARCHAR2(255 CHAR) NOT NULL, user_role VARCHAR2(255 CHAR) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.valid_triplet (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, epsid_digit NUMBER(10,0) NOT NULL, event_id NUMBER(10,0) NOT NULL, product_type CHAR(1) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.video_inventory (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, created_by NUMBER(19,0) NOT NULL, created_date TIMESTAMP(6), description VARCHAR2(255 CHAR), duration NUMBER(10,0) NOT NULL, edited_date TIMESTAMP(6), name VARCHAR2(255 CHAR) NOT NULL, updated_by NUMBER(19,0) NOT NULL, class VARCHAR2(255 CHAR) NOT NULL, season_id NUMBER(19,0)) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

CREATE TABLE SYSDATA.video_ownership (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, end_date TIMESTAMP(6), name VARCHAR2(255 CHAR) NOT NULL, network_id NUMBER(19,0) NOT NULL, start_date TIMESTAMP(6) NOT NULL, telecast_id VARCHAR2(255 CHAR), video_inventory_id NUMBER(19,0) NOT NULL) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the imported (but cleaned up) version of the table structure of what is in the database when Liquibase is being added to the project. All the tables are created with the LOGGING option turned on, and exist in the SYSDATA_DATA tablespace.', SYSTIMESTAMP, 'CREATE TABLE SYSDATA.(x19)', 'EXECUTED', 'changelog-init.groovy', 'initial tables', '2.0.1', '3:008f197f999dcabddb28083f8568d247', 1);

-- Changeset changelog-init.groovy::initial sequences::Jim Moore::(Checksum: 3:edce1fa274c951d2b297fd8b17de93b0)
-- This is the imported (but cleaned up) version of the table sequence generators of what is in the database when Liquibase is being added to the project. All the sequences are created with the "CACHE 20" option turned on.
CREATE SEQUENCE SYSDATA.company_type_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.company_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.contact_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.email_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.endpoint_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.geograph_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.image_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.lov_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.location_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.phone_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.product_type_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.security_question_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.syscode_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.user_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.video_inv_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

CREATE SEQUENCE SYSDATA.hibernate_sequence START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the imported (but cleaned up) version of the table sequence generators of what is in the database when Liquibase is being added to the project. All the sequences are created with the "CACHE 20" option turned on.', SYSTIMESTAMP, 'CREATE SEQUENCE SYSDATA.(x16)', 'EXECUTED', 'changelog-init.groovy', 'initial sequences', '2.0.1', '3:edce1fa274c951d2b297fd8b17de93b0', 2);

-- Changeset changelog-init.groovy::initial LIST_OF_VALUE seed data::Jim Moore::(Checksum: 3:f0b3726934dc38bebfe8919af898f2fe)
-- This is the standard set of data that is in the database when Liquibase is being added to the project.
INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (10,0,'LOV Category',0,sysdate,null,'LOV Category',sysdate,'1',null,'LOV Category',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (11,0,'LOV Category',0,sysdate,null,'Canoe Contact Role',sysdate,'0',null,'Canoe Contact Role',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (12,0,'LOV Category',0,sysdate,null,'Canoe Contact Location',sysdate,'0',null,'Canoe Contact Location',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (13,0,'LOV Category',0,sysdate,null,'Phone Type',sysdate,'0',null,'Phone Type',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (14,0,'LOV Category',0,sysdate,null,'Location Type',sysdate,'0',null,'Location Type',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (15,0,'LOV Category',0,sysdate,null,'Geographic',sysdate,'0',null,'Geographic',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (16,0,'LOV Category',0,sysdate,null,'Email Type',sysdate,'0',null,'Email Type',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (17,0,'LOV Category',0,sysdate,null,'MSO Code',sysdate,'0',null,'MSO Code',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (18,0,'LOV Category',0,sysdate,null,'Advertiser Category',sysdate,'0',null,'Advertiser Category',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (19,0,'LOV Category',0,sysdate,null,'Company Status',sysdate,'0',null,'Company Status',7,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (20,0,'LOV Category',0,sysdate,null,'Communication Type',sysdate,'0',null,'Communication Type',8,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (21,0,'LOV Category',0,sysdate,null,'Supported Spec',sysdate,'0',null,'Supported Spec',9,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (22,0,'LOV Category',0,sysdate,null,'Spec Version',sysdate,'0',null,'Spec Version',10,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (101,0,'Canoe Contact Role',0,sysdate,null,'ACCOUNT_EXEC',sysdate,'0',null,'Account Executive',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (102,0,'Canoe Contact Role',0,sysdate,null,'SALES_COORD',sysdate,'0',null,'Sales Coordinator',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (103,0,'Canoe Contact Role',0,sysdate,null,'OPS_COORD',sysdate,'0',null,'Operations Coordinator',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (104,0,'Canoe Contact Role',0,sysdate,null,'SALES_MGR',sysdate,'0',null,'Sales Manager',4,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (105,0,'Canoe Contact Role',0,sysdate,null,'CANOE_ADMIN',sysdate,'0',null,'Canoe Administrator',5,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (203,0,'Canoe Contact Location',0,sysdate,null,'New York',sysdate,'0',null,'New York',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (204,0,'Canoe Contact Location',0,sysdate,null,'South East',sysdate,'0',null,'South East',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (205,0,'Canoe Contact Location',0,sysdate,null,'Inverness',sysdate,'0',null,'Inverness',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (206,0,'Canoe Contact Location',0,sysdate,null,'CMC',sysdate,'0',null,'Comcast Media Center',4,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (301,0,'Advertiser Category',0,sysdate,null,'AUTO_DOM',sysdate,'0',null,'Automotive (Domestic)',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (302,0,'Advertiser Category',0,sysdate,null,'AUTO_FOR',sysdate,'0',null,'Automotive (Foreign)',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (303,0,'Advertiser Category',0,sysdate,null,'FUN',sysdate,'0',null,'Local Services & Amusements',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (304,0,'Advertiser Category',0,sysdate,null,'FIN',sysdate,'0',null,'Financial Services',4,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (305,0,'Advertiser Category',0,sysdate,null,'TELE',sysdate,'0',null,'Telecommunications',5,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (306,0,'Advertiser Category',0,sysdate,null,'INTERNET',sysdate,'0',null,'Internet Services',6,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (307,0,'Advertiser Category',0,sysdate,null,'RETAIL',sysdate,'0',null,'Miscelaneous Retail',7,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (308,0,'Advertiser Category',0,sysdate,null,'DIRECT',sysdate,'0',null,'Direct Response',8,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (309,0,'Advertiser Category',0,sysdate,null,'FOOD',sysdate,'0',null,'Food and Candy',9,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (310,0,'Advertiser Category',0,sysdate,null,'PCP',sysdate,'0',null,'Personal Care Products',10,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (311,0,'Advertiser Category',0,sysdate,null,'TANDT',sysdate,'0',null,'Travel and Tourism',11,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (312,0,'Advertiser Category',0,sysdate,null,'REST',sysdate,'0',null,'Restaurants',12,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (313,0,'Advertiser Category',0,sysdate,null,'INSUR',sysdate,'0',null,'Insurance and Real Estate',13,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (314,0,'Advertiser Category',0,sysdate,null,'GOV',sysdate,'0',null,'Government',14,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (315,0,'Advertiser Category',0,sysdate,null,'POLIT',sysdate,'0',null,'Politics',15,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (316,0,'Advertiser Category',0,sysdate,null,'ORG',sysdate,'0',null,'Organizations',16,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (317,0,'Advertiser Category',0,sysdate,null,'SCHOOL',sysdate,'0',null,'Schools, Camps, Seminiars',17,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (318,0,'Advertiser Category',0,sysdate,null,'MRADIO',sysdate,'0',null,'Media Radio',18,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (319,0,'Advertiser Category',0,sysdate,null,'MTV',sysdate,'0',null,'Media TV',19,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (320,0,'Advertiser Category',0,sysdate,null,'MOTHER',sysdate,'0',null,'Media Other',20,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (501,0,'MSO Code',0,sysdate,null,'CMCSA',sysdate,'0',null,'Comcast Corporation',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (502,0,'MSO Code',0,sysdate,null,'CHTR',sysdate,'0',null,'Charter Communications',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (503,0,'MSO Code',0,sysdate,null,'TWCT',sysdate,'0',null,'Time Warner Cable Television',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (504,0,'MSO Code',0,sysdate,null,'COX',sysdate,'0',null,'Cox Communications Inc.',4,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (505,0,'MSO Code',0,sysdate,null,'CVC',sysdate,'0',null,'Cablevision Systems Corporation',5,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (506,0,'MSO Code',0,sysdate,null,'BHN',sysdate,'0',null,'Bright House Networks',6,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (601,0,'Phone Type',0,sysdate,null,'Office',sysdate,'0',null,'Office',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (602,0,'Phone Type',0,sysdate,null,'Home',sysdate,'0',null,'Home',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (603,0,'Phone Type',0,sysdate,null,'Contact',sysdate,'0',null,'Contact',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (604,0,'Phone Type',0,sysdate,null,'Mobile',sysdate,'0',null,'Mobile',4,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (605,0,'Phone Type',0,sysdate,null,'Main',sysdate,'0',null,'Main',5,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (606,0,'Phone Type',0,sysdate,null,'Fax',sysdate,'0',null,'Fax',6,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (701,0,'Location Type',0,sysdate,null,'Physical',sysdate,'0',null,'Physical',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (702,0,'Location Type',0,sysdate,null,'Billing',sysdate,'0',null,'Billing',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (703,0,'Location Type',0,sysdate,null,'Mailing',sysdate,'0',null,'Correspondence Mailing',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (801,0,'Email Type',0,sysdate,null,'Work',sysdate,'0',null,'Work',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (802,0,'Email Type',0,sysdate,null,'Home',sysdate,'0',null,'Personal',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (901,0,'Geographic',0,sysdate,null,'State',sysdate,'0',null,'State',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (902,0,'Geographic',0,sysdate,null,'Market Area',sysdate,'0',null,'Market Area',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1001,0,'Company Status',0,sysdate,null,'Active',sysdate,'0',null,'Active',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1002,0,'Company Status',0,sysdate,null,'Pending',sysdate,'0',null,'Pending',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1003,0,'Company Status',0,sysdate,null,'Draft',sysdate,'0',null,'Draft',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1004,0,'Company Status',0,sysdate,null,'Inactive',sysdate,'0',null,'Inactive',4,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1101,0,'Communication Type',0,sysdate,null,'sftp',sysdate,'0',null,'SFTP',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1102,0,'Communication Type',0,sysdate,null,'email',sysdate,'0',null,'Email',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1103,0,'Communication Type',0,sysdate,null,'webservices',sysdate,'0',null,'Web Services',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1201,0,'Supported Spec',0,sysdate,null,'Active',sysdate,'0',null,'Active',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1202,0,'Supported Spec',0,sysdate,null,'Pending',sysdate,'0',null,'Pending',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1301,0,'Spec Version',0,sysdate,null,'1.0',sysdate,'0',null,'1.0',1,0);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the standard set of data that is in the database when Liquibase is being added to the project.', SYSTIMESTAMP, 'Custom SQL (x71)', 'EXECUTED', 'changelog-init.groovy', 'initial LIST_OF_VALUE seed data', '2.0.1', '3:f0b3726934dc38bebfe8919af898f2fe', 3);

-- Changeset changelog-init.groovy::initial COMPANY_TYPE seed data::Jim Moore::(Checksum: 3:91a4335f985687da0edcdb78e24c1352)
-- This is the standard set of data that is in the database when Liquibase is being added to the project.
INSERT INTO SYSDATA.company_type (id,version,can_be_customer,can_have_end_points,can_have_video,company_type,created_by,created_date,edited_date,updated_by) VALUES (0,0,0,0,0,'Canoe',0,sysdate,sysdate,0);

INSERT INTO SYSDATA.company_type (id,version,can_be_customer,can_have_end_points,can_have_video,company_type,created_by,created_date,edited_date,updated_by) VALUES (1,0,1,0,0,'Advertiser',0,sysdate,sysdate,0);

INSERT INTO SYSDATA.company_type (id,version,can_be_customer,can_have_end_points,can_have_video,company_type,created_by,created_date,edited_date,updated_by) VALUES (2,0,0,1,0,'Data Processor',0,sysdate,sysdate,0);

INSERT INTO SYSDATA.company_type (id,version,can_be_customer,can_have_end_points,can_have_video,company_type,created_by,created_date,edited_date,updated_by) VALUES (3,0,0,1,0,'Fulfillment House',0,sysdate,sysdate,0);

INSERT INTO SYSDATA.company_type (id,version,can_be_customer,can_have_end_points,can_have_video,company_type,created_by,created_date,edited_date,updated_by) VALUES (4,0,0,1,0,'MSO',0,sysdate,sysdate,0);

INSERT INTO SYSDATA.company_type (id,version,can_be_customer,can_have_end_points,can_have_video,company_type,created_by,created_date,edited_date,updated_by) VALUES (5,0,0,0,0,'Network',0,sysdate,sysdate,0);

INSERT INTO SYSDATA.company_type (id,version,can_be_customer,can_have_end_points,can_have_video,company_type,created_by,created_date,edited_date,updated_by) VALUES (6,0,0,0,1,'Programmer',0,sysdate,sysdate,0);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the standard set of data that is in the database when Liquibase is being added to the project.', SYSTIMESTAMP, 'Custom SQL (x7)', 'EXECUTED', 'changelog-init.groovy', 'initial COMPANY_TYPE seed data', '2.0.1', '3:91a4335f985687da0edcdb78e24c1352', 4);

-- Changeset changelog-init.groovy::initial COMPANY seed data::Jim Moore::(Checksum: 3:4789a94acc2ecf5918b592c8b06a51e1)
-- This is the standard set of data that is in the database when Liquibase is being added to the project.
INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (1, 0, 0, 'Canoe Ventures, LLC', 'Canoe Ventures', 'Canoe', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Company', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5026, 0, 0, 'Promo legal name', 'Promo', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5045, 0, 0, 'Wrigley legal name', 'Wrigley', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5067, 0, 0, 'USPS legal name', 'USPS', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5087, 0, 0, 'St. Jude legal name', 'St. Jude', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5088, 0, 0, 'Total Gym legal name', 'Total Gym', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5109, 0, 0, 'General Motors legal name', 'General Motors', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5129, 0, 0, 'Universal Orlando legal name', 'Universal Orlando', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5150, 0, 0, 'CTAM Universal Pictures legal name', 'CTAM Universal Pictures', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5151, 0, 0, 'G4 TV legal name', 'G4 TV', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5169, 0, 0, 'Allstate legal name', 'Allstate', 'Advertiser', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Advertiser', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6204, 0, 0, 'Cablevision legal name', 'Cablevision', 'MSO', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.MSO', null, null, null, null, null, null,  null, 111, 'CVC', 'password', 'Cablevision', 'cablevision_user');

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6205, 0, 0, 'Charter legal name', 'Charter', 'MSO', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.MSO', null, null, null, null, null, null,  null, 222, 'CHTR', 'password', 'Charter', 'charter_user');

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6206, 0, 0, 'Comcast legal name', 'Comcast', 'MSO', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.MSO', null, null, null, null, null, null,  null, 333, 'CMCSA', 'password', 'Comcast', 'comcasst user');

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6207, 0, 0, 'Cox Communications legal name', 'Cox Communications', 'MSO', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.MSO', null, null, null, null, null, null,  null, 444, 'COX', 'password', 'Cox', 'cox_user');

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6208, 0, 0, 'Time Warner Cable legal name', 'Time Warner', 'MSO', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.MSO', null, null, null, null, null, null,  null, 555, 'TWCT', 'password', 'Time Warner', 'time_warner_user');

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6209, 0, 0, 'Bright House Networks legal name', 'Bright House Networks', 'MSO', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.MSO', null, null, null, null, null, null,  null, 666, 'BHN', 'password', 'Bright House', 'bright_house_user');

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6301, 0, 0, 'NBCU legal name', 'NBCU', 'Programmer', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Programmer', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6302, 0, 0, 'Discovery Communications legal name', 'DSC', 'Programmer', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Programmer', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6303, 0, 0, 'Comcast legal name', 'COM', 'Programmer', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Programmer', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6304, 0, 0, 'Turner Broadcasting legal name', 'TBS', 'Programmer', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Programmer', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6305, 0, 0, 'TNT legal name', 'TNT', 'Programmer', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Programmer', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6306, 0, 0, 'ESPN legal name', 'ESPN', 'Programmer', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Programmer', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6307, 0, 0, 'NBC legal name', 'NBC', 'Programmer', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Programmer', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (6308, 0, 0, 'Rainbow Media legal name', 'RM', 'Programmer', 0, null, null, null, 0, 0, 'Active', 0, 'com.canoeventures.company.Programmer', null, null, null, null, null, null,  null, null, null, null, null, null);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the standard set of data that is in the database when Liquibase is being added to the project.', SYSTIMESTAMP, 'Custom SQL (x25)', 'EXECUTED', 'changelog-init.groovy', 'initial COMPANY seed data', '2.0.1', '3:4789a94acc2ecf5918b592c8b06a51e1', 5);

-- Changeset changelog-init.groovy::initial GEOGRAPHIC seed data::Jim Moore::(Checksum: 3:ec861ccad7d9e80fcb90e119023071c9)
-- This is the standard set of data that is in the database when Liquibase is being added to the project.
INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1101,1,'501','New York','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1102,1,'803','Los Angeles','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1103,1,'602','Chicago','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1104,1,'504','Philadelphia','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1105,1,'506','Boston','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1106,1,'807','San Francisco-Oakland-San Jose','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1107,1,'623','Dallas-Ft. Worth','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1108,1,'511','Washington,DC (Hagrstwn)','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1109,1,'524','Atlanta','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1110,1,'618','Houston','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1111,1,'505','Detroit','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1112,1,'539','Tampa-St Petersburg (Sarasota)','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1113,1,'819','Seattle-Tacoma','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1114,1,'753','Phoenix-Prescott','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1115,1,'613','Minneapolis-St Paul','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1116,1,'510','Cleveland-Akron','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1117,1,'528','Miami-Ft. Lauderdale','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1118,1,'751','Denver','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1119,1,'862','Sacramnto-Stockton-Modesto','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1120,1,'534','Orlando-Daytona','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1121,1,'609','St Louis','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1122,1,'508','Pittsburgh','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1123,1,'820','Portland,OR','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1124,1,'512','Baltimore','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1125,1,'527','Indianapolis','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1126,1,'825','San Diego','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1127,1,'517','Charlotte','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1128,1,'533','Hartford-New Haven','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1129,1,'560','Raleigh-Durham (Fayetvlle)','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1130,1,'659','Nashville','Market Area');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1530,1,'WV','West Virginia','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1531,1,'AA','Armed Forces Americas','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1532,1,'AE','Armed Forces Afr/Can/Eur/ME','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1533,1,'VI','Virgin Islands','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1534,1,'RI','Rhode Island','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1535,1,'DE','Delaware','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1536,1,'DC','District of Columbia','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1537,1,'AS','American Samoa','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1538,1,'AL','Alabama','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1539,1,'MA','Massachusettes','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1540,1,'NE','Nebraska','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1541,1,'NY','New York','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1542,1,'SC','South Carolina','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1543,1,'AP','Armed Forces Pacific','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1544,1,'MO','Missouri','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1545,1,'OK','Oklahoma','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1546,1,'ND','North Dakota','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1547,1,'MH','Marshall Islands','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1548,1,'WI','Wisconsin','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1549,1,'NM','New Mexico','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1550,1,'FM','Federated States of Micronesia','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1551,1,'UT','Utah','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1552,1,'PW','Palau','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1553,1,'HI','Hawaii','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1554,1,'ID','Idaho','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1555,1,'MP','Northern Mariana Islands','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1556,1,'TN','Tennessee','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1557,1,'GA','Georgia','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1558,1,'IL','Illinois','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1559,1,'FL','Florida','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1560,1,'NV','Nevada','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1561,1,'PA','Pennsylvania','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1562,1,'CA','California','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1563,1,'GU','Guam','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1564,1,'MI','Michigan','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1565,1,'CO','Colorado','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1566,1,'WA','Washington','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1567,1,'LA','Louisiana','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1568,1,'OR','Oregon','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1569,1,'AK','Alaska','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1570,1,'MN','Minnesota','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1571,1,'PR','Puerto Rico','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1572,1,'WY','Wyoming','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1573,1,'VA','Virginia','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1574,1,'MD','Maryland','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1575,1,'IA','Iowa','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1576,1,'MS','Mississippi','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1577,1,'AR','Arkansas','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1578,1,'OH','Ohio','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1579,1,'NH','New Hampshire','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1580,1,'ME','Maine','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1581,1,'MT','Montana','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1582,1,'VT','Vermont','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1583,1,'CT','Connecticut','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1584,1,'IN','Indiana','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1585,1,'NC','North Carolina','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1586,1,'KY','Kentucky','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1587,1,'AZ','Arizona','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1588,1,'NJ','New Jersey','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1589,1,'SD','South Dakota','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1590,1,'KS','Kansas','State');

INSERT INTO SYSDATA.geographic (id,version,code,description,type) VALUES (1591,1,'TX','Texas','State');

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the standard set of data that is in the database when Liquibase is being added to the project.', SYSTIMESTAMP, 'Custom SQL (x92)', 'EXECUTED', 'changelog-init.groovy', 'initial GEOGRAPHIC seed data', '2.0.1', '3:ec861ccad7d9e80fcb90e119023071c9', 6);

-- Changeset changelog-init.groovy::initial LOCATION seed data::Jim Moore::(Checksum: 3:aa3f09d0f0a068dea14dc46dd52f6423)
-- This is the standard set of data that is in the database when Liquibase is being added to the project.
INSERT INTO SYSDATA.location(id,version,address1,address2,city,company_id,created_by,created_date,description,edited_date,is_deleted,location_type,postal_code9,state,updated_by) VALUES (1700,0,'666 E. Third Ave','26th Floor','New York',1,0,sysdate,'Canoe Ventures Corporate Office',null,0,'Physical','100170001','NY',0);

INSERT INTO SYSDATA.location(id,version,address1,address2,city,company_id,created_by,created_date,description,edited_date,is_deleted,location_type,postal_code9,state,updated_by) VALUES (1701,0,'2453 Kingsley Dr.',null,'Marietta',1,0,sysdate,'Southeast',null,0,'Physical','300620001','GA',0);

INSERT INTO SYSDATA.location(id,version,address1,address2,city,company_id,created_by,created_date,description,edited_date,is_deleted,location_type,postal_code9,state,updated_by) VALUES (1702,0,'4100 East Dry Creek Ave',null,'Centennial',1,0,sysdate,'CMC',null,0,'Physical','801220001','CO',0);

INSERT INTO SYSDATA.location(id,version,address1,address2,city,company_id,created_by,created_date,description,edited_date,is_deleted,location_type,postal_code9,state,updated_by) VALUES (1703,0,'4100 East Dry Creek Ave',null,'Englewood',1,0,sysdate,'CMC',null,0,'Physical','801120001','CO',0);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the standard set of data that is in the database when Liquibase is being added to the project.', SYSTIMESTAMP, 'Custom SQL (x4)', 'EXECUTED', 'changelog-init.groovy', 'initial LOCATION seed data', '2.0.1', '3:aa3f09d0f0a068dea14dc46dd52f6423', 7);

-- Changeset changelog-init.groovy::initial PHONE seed data::Jim Moore::(Checksum: 3:51653c9450be176e116288f9193acae7)
-- This is the standard set of data that is in the database when Liquibase is being added to the project.
INSERT INTO SYSDATA.phone (id,version,company_id,contact_id,created_by,created_date,description,edited_date,phone_extension,phone_number,type,updated_by) VALUES (2100,0,1,null,0,sysdate,'Canoe Ventures Corporate Main',null,null,'212-364-3637','Main',0);

INSERT INTO SYSDATA.phone (id,version,company_id,contact_id,created_by,created_date,description,edited_date,phone_extension,phone_number,type,updated_by) VALUES (2101,0,1,null,0,sysdate,'Canoe Ventures Corporate Fax',null,null,'212-364-3601','Fax',0);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the standard set of data that is in the database when Liquibase is being added to the project.', SYSTIMESTAMP, 'Custom SQL (x2)', 'EXECUTED', 'changelog-init.groovy', 'initial PHONE seed data', '2.0.1', '3:51653c9450be176e116288f9193acae7', 8);

-- Changeset changelog-init.groovy::initial primary keys::Jim Moore::(Checksum: 3:8cf99503553a8d9a683f99f080ec93c5)
-- This is the imported (but cleaned up) version of the primary key constraints of what is in the database when Liquibase is being added to the project. All the indexes are created with the LOGGING and NOSORT options turned on, and exist in the SYSDATA_INDEX tablespace.
ALTER TABLE  SYSDATA.canoe_contact_role ADD CONSTRAINT canoe_contact_role_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.company ADD CONSTRAINT company_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.company_type ADD CONSTRAINT company_type_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.contact ADD CONSTRAINT contact_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.email ADD CONSTRAINT email_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.end_point ADD CONSTRAINT end_point_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.geographic ADD CONSTRAINT geographic_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.image ADD CONSTRAINT image_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.list_of_value ADD CONSTRAINT list_of_value_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.location ADD CONSTRAINT location_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.network_owner ADD CONSTRAINT network_owner_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.phone ADD CONSTRAINT phone_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.product_type ADD CONSTRAINT product_type_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.security_question ADD CONSTRAINT security_question_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.syscode ADD CONSTRAINT syscode_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.users ADD CONSTRAINT users_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.video_inventory ADD CONSTRAINT video_inventory_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.valid_triplet ADD CONSTRAINT valid_triplet_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

ALTER TABLE  SYSDATA.video_ownership ADD CONSTRAINT video_ownership_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the imported (but cleaned up) version of the primary key constraints of what is in the database when Liquibase is being added to the project. All the indexes are created with the LOGGING and NOSORT options turned on, and exist in the SYSDATA_IN...', SYSTIMESTAMP, 'Add Primary Key (x19)', 'EXECUTED', 'changelog-init.groovy', 'initial primary keys', '2.0.1', '3:8cf99503553a8d9a683f99f080ec93c5', 9);

-- Changeset changelog-init.groovy::initial indexes::Jim Moore::(Checksum: 3:03394d7f0cb972730444284c280ccec6)
-- This is the imported (but cleaned up) version of non-PK or -FK indexes in the database when Liquibase is being added to the project. All the indexes are created with the LOGGING, NOCOMPRESS and NOPARRALLEL options turned on, and exist in the SYSDATA_INDEX tablespace.
CREATE UNIQUE INDEX SYSDATA.list_of_value_return_idx ON sysdata.list_of_value(parent_id, category, return_value) TABLESPACE sysdata_index LOGGING NOCOMPRESS NOPARALLEL;

CREATE UNIQUE INDEX SYSDATA.list_of_value_display_idx ON sysdata.list_of_value(parent_id, category, display_value) TABLESPACE sysdata_index LOGGING NOCOMPRESS NOPARALLEL;

CREATE INDEX SYSDATA.list_of_value_sort_idx ON sysdata.list_of_value(sort_order) TABLESPACE sysdata_index LOGGING NOCOMPRESS NOPARALLEL;

CREATE UNIQUE INDEX SYSDATA.syscode_syscode_idx ON sysdata.syscode(syscode) TABLESPACE sysdata_index LOGGING NOCOMPRESS NOPARALLEL;

CREATE UNIQUE INDEX SYSDATA.endpoint_url_idx ON sysdata.end_point(url) TABLESPACE sysdata_index LOGGING NOCOMPRESS NOPARALLEL;

CREATE INDEX SYSDATA.geographic_type_code_idx ON sysdata.geographic(type, code) LOGGING NOCOMPRESS NOPARALLEL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the imported (but cleaned up) version of non-PK or -FK indexes in the database when Liquibase is being added to the project. All the indexes are created with the LOGGING, NOCOMPRESS and NOPARRALLEL options turned on, and exist in the SYSDATA_IN...', SYSTIMESTAMP, 'CREATE INDEX SYSDATA.(x6)', 'EXECUTED', 'changelog-init.groovy', 'initial indexes', '2.0.1', '3:03394d7f0cb972730444284c280ccec6', 10);

-- Changeset changelog-init.groovy::initial foreign keys::Jim Moore::(Checksum: 3:4e7365ee40e5f6c44db26ba90c2e935c)
-- This is the imported (but cleaned up) version of the foreign key constraints in the database when Liquibase is being added to the project. All the indexes are created with the NOT DEFERRABLE option turned on, and exist in the SYSDATA_INDEX tablespace.
ALTER TABLE  SYSDATA.company ADD CONSTRAINT company_image_fk FOREIGN KEY (image_id) REFERENCES sysdata.image (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.contact ADD CONSTRAINT contact_company_fk FOREIGN KEY (company_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.contact ADD CONSTRAINT contact_image_fk FOREIGN KEY (image_id) REFERENCES sysdata.image (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.contact ADD CONSTRAINT contact_location_fk FOREIGN KEY (location_id) REFERENCES sysdata.location (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.email ADD CONSTRAINT email_contact_fk FOREIGN KEY (contact_id) REFERENCES sysdata.contact (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.location ADD CONSTRAINT location_company_fk FOREIGN KEY (company_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.phone ADD CONSTRAINT phone_company_fk FOREIGN KEY (company_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.phone ADD CONSTRAINT phone_contact_fk FOREIGN KEY (contact_id) REFERENCES sysdata.contact (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.users ADD CONSTRAINT users_contact_fk FOREIGN KEY (contact_id) REFERENCES sysdata.contact (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.canoe_contact_role ADD CONSTRAINT contact_role_id_fk FOREIGN KEY (canoe_contact_id) REFERENCES sysdata.contact (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.canoe_contact_role ADD CONSTRAINT contact_role_company_fk FOREIGN KEY (company_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.end_point ADD CONSTRAINT endpoint_company_fk FOREIGN KEY (company_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.list_of_value ADD CONSTRAINT list_of_value_parent_fk FOREIGN KEY (parent_id) REFERENCES sysdata.list_of_value (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.network_owner ADD CONSTRAINT netowner_network_fk FOREIGN KEY (network_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.network_owner ADD CONSTRAINT netowner_programmer_fk FOREIGN KEY (programmer_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.syscode ADD CONSTRAINT syscode_endpoint_fk FOREIGN KEY (end_point_id) REFERENCES sysdata.end_point (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.users ADD CONSTRAINT users_security_fk FOREIGN KEY (security_question_id) REFERENCES sysdata.security_question (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.video_inventory ADD CONSTRAINT inventory_season_fk FOREIGN KEY (season_id) REFERENCES sysdata.video_inventory (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.video_ownership ADD CONSTRAINT ownership_company_fk FOREIGN KEY (network_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

ALTER TABLE  SYSDATA.video_ownership ADD CONSTRAINT ownership_inventory_fk FOREIGN KEY (video_inventory_id) REFERENCES sysdata.video_inventory (id) NOT DEFERRABLE;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Jim Moore', 'This is the imported (but cleaned up) version of the foreign key constraints in the database when Liquibase is being added to the project. All the indexes are created with the NOT DEFERRABLE option turned on, and exist in the SYSDATA_INDEX tablespace.', SYSTIMESTAMP, 'Add Foreign Key Constraint (x20)', 'EXECUTED', 'changelog-init.groovy', 'initial foreign keys', '2.0.1', '3:4e7365ee40e5f6c44db26ba90c2e935c', 11);

-- Changeset changelog-SYSDATA-0093_0128.groovy::SYSDATA-93 and SYSDATA-128::Rick Rothenberg::(Checksum: 3:8e1c2676ac0338cbffa148a9787cdec9)
-- The required fields of advertiser category and client code are missing and SYSDATA-128 STATUS is NOT NULL
DELETE FROM SYSDATA.company where id = 5026;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5026, 0, 0, 'Promo legal name', 'Promo', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'MOTHER', 'PROMO', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5045;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5045, 0, 0, 'Wrigley legal name', 'Wrigley', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'FOOD', 'WRIGLEY', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5067;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5067, 0, 0, 'USPS legal name', 'USPS', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'GOV', 'USPS', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5087;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5087, 0, 0, 'St. Jude legal name', 'St. Jude', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'ORG', 'ST_JUDE', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5088;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5088, 0, 0, 'Total Gym legal name', 'Total Gym', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'ORG', 'TOTAL_GYM', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5109;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5109, 0, 0, 'General Motors legal name', 'General Motors', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'AUTO_DOM', 'GM', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5129;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5129, 0, 0, 'Universal Orlando legal name', 'Universal Orlando', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'FUN', 'UNIV_ORLANDO', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5150;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5150, 0, 0, 'CTAM Universal Pictures legal name', 'CTAM Universal Pictures', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'MOTHER', 'CTAM', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5151;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5151, 0, 0, 'G4 TV legal name', 'G4 TV', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'MTV', 'G4', null, null, null, null,  null, null, null, null, null, null);

DELETE FROM SYSDATA.company where id = 5169;

INSERT INTO SYSDATA.company (id, version, communications_enabled, company_legal_name, company_name, company_type, created_by, created_date, edited_date, image_id, is_customer, is_deleted, status, updated_by, class, category, client_code, order_source, certified_date, description, network_name, nielsen_code, enabled_households, mso_code, password, reporting_name, user_name) VALUES (5169, 0, 0, 'Allstate legal name', 'Allstate', 'Advertiser', 0, null, null, null, 0, 0, 'Inactive', 0, 'com.canoeventures.company.Advertiser', 'INSUR', 'ALLSTATE', null, null, null, null,  null, null, null, null, null, null);

ALTER TABLE  SYSDATA.company MODIFY status NOT NULL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', 'The required fields of advertiser category and client code are missing and SYSDATA-128 STATUS is NOT NULL', SYSTIMESTAMP, 'Custom SQL (x20), Add Not-Null Constraint', 'EXECUTED', 'changelog-SYSDATA-0093_0128.groovy', 'SYSDATA-93 and SYSDATA-128', '2.0.1', '3:8e1c2676ac0338cbffa148a9787cdec9', 12);

-- Changeset changelog-SYSDATA-0099.groovy::SYSDATA-99 contacts need to be sortable::James Bradford::(Checksum: 3:7bbbd6c0c4bafca96411012182eaa99a)
ALTER TABLE  SYSDATA.contact ADD rank NUMBER;

UPDATE SYSDATA.contact set rank = 0 where rank is null;

ALTER TABLE  SYSDATA.CONTACT MODIFY RANK NOT NULL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('James Bradford', '', SYSTIMESTAMP, 'Add Column, Custom SQL, Add Not-Null Constraint', 'EXECUTED', 'changelog-SYSDATA-0099.groovy', 'SYSDATA-99 contacts need to be sortable', '2.0.1', '3:7bbbd6c0c4bafca96411012182eaa99a', 13);

-- Changeset changelog-SYSDATA-0109_0118.groovy::SYSDATA-118::Karen Janda::(Checksum: 3:14f54edbcde1d236aaf9e8968440f527)
CREATE UNIQUE INDEX SYSDATA.unique_nielsen_code_idx ON sysdata.company(nielsen_code);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Karen Janda', '', SYSTIMESTAMP, 'Create Index', 'EXECUTED', 'changelog-SYSDATA-0109_0118.groovy', 'SYSDATA-118', '2.0.1', '3:14f54edbcde1d236aaf9e8968440f527', 14);

-- Changeset changelog-SYSDATA-0109_0118.groovy::SYSDATA-109 : Create unique Company + Company Legal Name::Doug Tracy::(Checksum: 3:33189c6378de10aeb47a30d340d6abd8)
CREATE UNIQUE INDEX SYSDATA.unique_legal_company_name ON sysdata.company(company_name, company_legal_name);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Doug Tracy', '', SYSTIMESTAMP, 'Create Index', 'EXECUTED', 'changelog-SYSDATA-0109_0118.groovy', 'SYSDATA-109 : Create unique Company + Company Legal Name', '2.0.1', '3:33189c6378de10aeb47a30d340d6abd8', 15);

-- Changeset changelog-SYSDATA-0121_0122.groovy::SYSDATA-121 and SYSDATA-122::Doug Tracy::(Checksum: 3:464675884e910cef7818d97faf0b3557)
-- SYSDATA-121 Max length for LOV; SYSDATA-122 Max length for LOV
UPDATE SYSDATA.list_of_value set description = substr(description,1,50);

UPDATE SYSDATA.list_of_value set display_value = substr(nvl(display_value,'display value'),1,255);

UPDATE SYSDATA.list_of_value set return_value = substr(nvl(return_value,'return value'),1,50);

ALTER TABLE  SYSDATA.list_of_value MODIFY description VARCHAR2(50 char);

ALTER TABLE  SYSDATA.list_of_value MODIFY display_value VARCHAR2(255 char);

ALTER TABLE  SYSDATA.list_of_value MODIFY return_value VARCHAR2(50 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Doug Tracy', 'SYSDATA-121 Max length for LOV; SYSDATA-122 Max length for LOV', SYSTIMESTAMP, 'Custom SQL (x3), Modify data type (x3)', 'EXECUTED', 'changelog-SYSDATA-0121_0122.groovy', 'SYSDATA-121 and SYSDATA-122', '2.0.1', '3:464675884e910cef7818d97faf0b3557', 16);

-- Changeset changelog-SYSDATA-0129.groovy::SYSDATA-129::Doug Tracy::(Checksum: 3:13f1823e4cbf5d31bf1dc76fe0654bc4)
-- SYSDATA-129 Max length for Company Names
UPDATE SYSDATA.company set company_name = substr(nvl(company_name,'company name'),1,50);

UPDATE SYSDATA.company set company_legal_name = substr(nvl(company_legal_name,company_name),1,50);

ALTER TABLE  SYSDATA.company MODIFY company_name VARCHAR2(50 char);

ALTER TABLE  SYSDATA.company MODIFY company_legal_name VARCHAR2(50 char);

ALTER TABLE  SYSDATA.company MODIFY company_legal_name NOT NULL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Doug Tracy', 'SYSDATA-129 Max length for Company Names', SYSTIMESTAMP, 'Custom SQL (x2), Modify data type (x2), Add Not-Null Constraint', 'EXECUTED', 'changelog-SYSDATA-0129.groovy', 'SYSDATA-129', '2.0.1', '3:13f1823e4cbf5d31bf1dc76fe0654bc4', 17);

-- Changeset changelog-SYSDATA-0139.groovy::SYSDATA-139: widen phone description::Rick Rothenberg::(Checksum: 3:0dcfa3e1c155a2254c31c85a85bcbb1b)
ALTER TABLE  SYSDATA.phone MODIFY description VARCHAR2(255 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Modify data type', 'EXECUTED', 'changelog-SYSDATA-0139.groovy', 'SYSDATA-139: widen phone description', '2.0.1', '3:0dcfa3e1c155a2254c31c85a85bcbb1b', 18);

-- Changeset changelog-SYSDATA-0171.groovy::SYSDATA-171: Remove unnecessary tables and columns::Rick Rothenberg::(Checksum: 3:a7828b243066b0b73c8558bc4776e9f7)
ALTER TABLE  SYSDATA.END_POINT DROP CONSTRAINT ENDPOINT_COMPANY_FK;

ALTER TABLE  SYSDATA.SYSCODE DROP CONSTRAINT SYSCODE_ENDPOINT_FK;

ALTER TABLE  SYSDATA.USERS DROP CONSTRAINT USERS_CONTACT_FK;

ALTER TABLE  SYSDATA.USERS DROP CONSTRAINT USERS_SECURITY_FK;

-- DROP INDEX ENDPOINT_URL_IDX;

-- DROP INDEX SYSCODE_SYSCODE_IDX;

ALTER TABLE  SYSDATA.COMPANY DROP COLUMN PASSWORD;

ALTER TABLE  SYSDATA.COMPANY DROP COLUMN USER_NAME;

DROP SEQUENCE sysdata.ENDPOINT_SEQ;

DROP SEQUENCE sysdata.SECURITY_QUESTION_SEQ;

DROP SEQUENCE sysdata.SYSCODE_SEQ;

DROP SEQUENCE sysdata.USER_SEQ;

DROP TABLE sysdata.END_POINT;

DROP TABLE sysdata.SECURITY_QUESTION;

DROP TABLE sysdata.SYSCODE;

DROP TABLE sysdata.USERS;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Drop Foreign Key Constraint (x4), Drop Index (x2), Drop Column (x2), Drop Sequence (x4), Drop Table (x4)', 'EXECUTED', 'changelog-SYSDATA-0171.groovy', 'SYSDATA-171: Remove unnecessary tables and columns', '2.0.1', '3:a7828b243066b0b73c8558bc4776e9f7', 19);

-- Changeset changelog-SYSDATA-0177.groovy::SYSDATA-177: Fix product type::Rick Rothenberg::(Checksum: 3:45e638023eec103772c156d42bbb6079)
ALTER TABLE  SYSDATA.product_type ADD app_version VARCHAR2(25) NOT NULL;

ALTER TABLE  SYSDATA.product_type ADD product_family VARCHAR2(25) NOT NULL;

ALTER TABLE  SYSDATA.product_type ADD report_window_duration NUMBER NOT NULL;

ALTER TABLE  SYSDATA.product_type RENAME COLUMN branded TO brandable;

ALTER TABLE  SYSDATA.product_type RENAME COLUMN max_questions TO max_questions_unlimited;

ALTER TABLE  SYSDATA.PRODUCT_TYPE MODIFY AP_ID NOT NULL;

ALTER TABLE  SYSDATA.PRODUCT_TYPE MODIFY EP_FAMILY NOT NULL;

ALTER TABLE  SYSDATA.PRODUCT_TYPE MODIFY ORG_ID NOT NULL;

ALTER TABLE  SYSDATA.PRODUCT_TYPE MODIFY PRODUCT_VERSION NOT NULL;

ALTER TABLE  SYSDATA.PRODUCT_TYPE DROP COLUMN DESCRIPTION;

ALTER TABLE  SYSDATA.PRODUCT_TYPE DROP COLUMN EPSID;

ALTER TABLE  SYSDATA.PRODUCT_TYPE DROP COLUMN EP_TYPE;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column (x3), Rename Column (x2), Add Not-Null Constraint (x4), Drop Column (x3)', 'EXECUTED', 'changelog-SYSDATA-0177.groovy', 'SYSDATA-177: Fix product type', '2.0.1', '3:45e638023eec103772c156d42bbb6079', 20);

-- Changeset changelog-SYSDATA-0179.groovy::SYSDATA-179: Make geographic description optional::Rick Rothenberg::(Checksum: 3:083139fd217d8acb0cfe365a8dca0e4a)
ALTER TABLE  SYSDATA.GEOGRAPHIC MODIFY DESCRIPTION NULL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Drop Not-Null Constraint', 'EXECUTED', 'changelog-SYSDATA-0179.groovy', 'SYSDATA-179: Make geographic description optional', '2.0.1', '3:083139fd217d8acb0cfe365a8dca0e4a', 21);

-- Changeset changelog-SYSDATA-0126.groovy::SYSDATA-126: Remove communications enabled flag::Rick Rothenberg::(Checksum: 3:d3df99b805de7eee42ae20ab8043f626)
ALTER TABLE  SYSDATA.COMPANY DROP COLUMN COMMUNICATIONS_ENABLED;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Drop Column', 'EXECUTED', 'changelog-SYSDATA-0126.groovy', 'SYSDATA-126: Remove communications enabled flag', '2.0.1', '3:d3df99b805de7eee42ae20ab8043f626', 22);

-- Changeset changelog-SYSDATA-0183.groovy::SYSDATA-183: Add audit trail to geographic::Rick Rothenberg::(Checksum: 3:10a4a652d3c7f26c1cbf3bc13489eacc)
ALTER TABLE  SYSDATA.geographic ADD created_by NUMBER;

ALTER TABLE  SYSDATA.geographic ADD created_date TIMESTAMP;

ALTER TABLE  SYSDATA.geographic ADD edited_date TIMESTAMP;

ALTER TABLE  SYSDATA.geographic ADD updated_by NUMBER;

UPDATE SYSDATA.geographic set created_by = 0;

UPDATE SYSDATA.geographic set updated_by = 0;

ALTER TABLE  SYSDATA.geographic MODIFY created_by NOT NULL;

ALTER TABLE  SYSDATA.geographic MODIFY updated_by NOT NULL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column (x4), Custom SQL (x2), Add Not-Null Constraint (x2)', 'EXECUTED', 'changelog-SYSDATA-0183.groovy', 'SYSDATA-183: Add audit trail to geographic', '2.0.1', '3:10a4a652d3c7f26c1cbf3bc13489eacc', 23);

-- Changeset changelog-SYSDATA-0176.groovy::SYSDATA-176: Change audit trail ids to names::Rick Rothenberg::(Checksum: 3:e91f25fbca520e5891d660b964efbec4)
ALTER TABLE  SYSDATA.CANOE_CONTACT_ROLE MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.CANOE_CONTACT_ROLE MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.COMPANY MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.COMPANY MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.COMPANY_TYPE MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.COMPANY_TYPE MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.CONTACT MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.CONTACT MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.EMAIL MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.EMAIL MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.GEOGRAPHIC MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.GEOGRAPHIC MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.IMAGE MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.IMAGE MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.LIST_OF_VALUE MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.LIST_OF_VALUE MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.LIST_OF_VALUE MODIFY CREATED_DATE NULL;

ALTER TABLE  SYSDATA.LOCATION MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.LOCATION MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.NETWORK_OWNER MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.NETWORK_OWNER MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.PHONE MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.PHONE MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.PRODUCT_TYPE MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.PRODUCT_TYPE MODIFY UPDATED_BY NULL;

ALTER TABLE  SYSDATA.VIDEO_INVENTORY MODIFY CREATED_BY NULL;

ALTER TABLE  SYSDATA.VIDEO_INVENTORY MODIFY UPDATED_BY NULL;

UPDATE SYSDATA.CANOE_CONTACT_ROLE set CREATED_BY = null;

UPDATE SYSDATA.CANOE_CONTACT_ROLE set UPDATED_BY = null;

UPDATE SYSDATA.COMPANY set CREATED_BY = null;

UPDATE SYSDATA.COMPANY set UPDATED_BY = null;

UPDATE SYSDATA.COMPANY_TYPE set CREATED_BY = null;

UPDATE SYSDATA.COMPANY_TYPE set UPDATED_BY = null;

UPDATE SYSDATA.CONTACT set CREATED_BY = null;

UPDATE SYSDATA.CONTACT set UPDATED_BY = null;

UPDATE SYSDATA.EMAIL set CREATED_BY = null;

UPDATE SYSDATA.EMAIL set UPDATED_BY = null;

UPDATE SYSDATA.GEOGRAPHIC set CREATED_BY = null;

UPDATE SYSDATA.GEOGRAPHIC set UPDATED_BY = null;

UPDATE SYSDATA.IMAGE set CREATED_BY = null;

UPDATE SYSDATA.IMAGE set UPDATED_BY = null;

UPDATE SYSDATA.LIST_OF_VALUE set CREATED_BY = null;

UPDATE SYSDATA.LIST_OF_VALUE set UPDATED_BY = null;

UPDATE SYSDATA.LOCATION set CREATED_BY = null;

UPDATE SYSDATA.LOCATION set UPDATED_BY = null;

UPDATE SYSDATA.NETWORK_OWNER set CREATED_BY = null;

UPDATE SYSDATA.NETWORK_OWNER set UPDATED_BY = null;

UPDATE SYSDATA.PHONE set CREATED_BY = null;

UPDATE SYSDATA.PHONE set UPDATED_BY = null;

UPDATE SYSDATA.PRODUCT_TYPE set CREATED_BY = null;

UPDATE SYSDATA.PRODUCT_TYPE set UPDATED_BY = null;

UPDATE SYSDATA.VIDEO_INVENTORY set CREATED_BY = null;

UPDATE SYSDATA.VIDEO_INVENTORY set UPDATED_BY = null;

ALTER TABLE  SYSDATA.CANOE_CONTACT_ROLE MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.CANOE_CONTACT_ROLE MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.COMPANY MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.COMPANY MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.COMPANY_TYPE MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.COMPANY_TYPE MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.CONTACT MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.CONTACT MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.EMAIL MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.EMAIL MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.GEOGRAPHIC MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.GEOGRAPHIC MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.IMAGE MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.IMAGE MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.LIST_OF_VALUE MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.LIST_OF_VALUE MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.LOCATION MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.LOCATION MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.NETWORK_OWNER MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.NETWORK_OWNER MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.PHONE MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.PHONE MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.PRODUCT_TYPE MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.PRODUCT_TYPE MODIFY UPDATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.VIDEO_INVENTORY MODIFY CREATED_BY VARCHAR2(255 char);

ALTER TABLE  SYSDATA.VIDEO_INVENTORY MODIFY UPDATED_BY VARCHAR2(255 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Drop Not-Null Constraint (x27), Custom SQL (x26), Modify data type (x26)', 'EXECUTED', 'changelog-SYSDATA-0176.groovy', 'SYSDATA-176: Change audit trail ids to names', '2.0.1', '3:e91f25fbca520e5891d660b964efbec4', 24);

-- Changeset changelog-SYSDATA-0186.groovy::SYSDATA-186: Fix location description max length::Rick Rothenberg::(Checksum: 3:954b1bc97224b3cc3863307208137e73)
UPDATE SYSDATA.location set description = substr(description, 1, 50);

ALTER TABLE  SYSDATA.location MODIFY description VARCHAR2(50 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Custom SQL, Modify data type', 'EXECUTED', 'changelog-SYSDATA-0186.groovy', 'SYSDATA-186: Fix location description max length', '2.0.1', '3:954b1bc97224b3cc3863307208137e73', 25);

-- Changeset changelog-SYSDATA-0189.groovy::SYSDATA-189: Add network feed table and index::Rick Rothenberg::(Checksum: 3:aa1e1c2a5a2d224c32e1137767c8638a)
CREATE TABLE SYSDATA.network_feed (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, created_by VARCHAR2(255 char), created_date TIMESTAMP(6), edited_date TIMESTAMP(6), is_deleted NUMBER(1,0) NOT NULL, name VARCHAR2(50 char) NOT NULL, network_id NUMBER(19,0), updated_by VARCHAR2(255 char)) TABLESPACE sysdata_data LOGGING NOCOMPRESS NOPARALLEL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Create Table', 'EXECUTED', 'changelog-SYSDATA-0189.groovy', 'SYSDATA-189: Add network feed table and index', '2.0.1', '3:aa1e1c2a5a2d224c32e1137767c8638a', 26);

-- Changeset changelog-SYSDATA-0189.groovy::SYSDATA-189: Add network feed primary key::Rick Rothenberg::(Checksum: 3:aaeb8aad0a5955e92e70b9112e84ff53)
ALTER TABLE  SYSDATA.network_feed ADD CONSTRAINT network_feed_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Primary Key', 'EXECUTED', 'changelog-SYSDATA-0189.groovy', 'SYSDATA-189: Add network feed primary key', '2.0.1', '3:aaeb8aad0a5955e92e70b9112e84ff53', 27);

-- Changeset changelog-SYSDATA-0189.groovy::SYSDATA-189: Add network feed foreign key constraint::Rick Rothenberg::(Checksum: 3:6cd98868ec3ee27c8d79530659921d4f)
ALTER TABLE  SYSDATA.network_feed ADD CONSTRAINT feed_network_fk FOREIGN KEY (network_id) REFERENCES sysdata.company (id) NOT DEFERRABLE;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Foreign Key Constraint', 'EXECUTED', 'changelog-SYSDATA-0189.groovy', 'SYSDATA-189: Add network feed foreign key constraint', '2.0.1', '3:6cd98868ec3ee27c8d79530659921d4f', 28);

-- Changeset changelog-SYSDATA-0189.groovy::SYSDATA-189: Add network feed sequence::Rick Rothenberg::(Checksum: 3:95c773f6dc53041820b3b8290031ca47)
CREATE SEQUENCE SYSDATA.network_feed_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Create Sequence', 'EXECUTED', 'changelog-SYSDATA-0189.groovy', 'SYSDATA-189: Add network feed sequence', '2.0.1', '3:95c773f6dc53041820b3b8290031ca47', 29);

-- Changeset changelog-SYSDATA-0189.groovy::SYSDATA-189: Add network feed LOVs::Rick Rothenberg::(Checksum: 3:e445266d7cee5ffa61354fea4c5b96c0)
INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (23,0,'LOV Category',0,sysdate,null,'Network Feed',sysdate,'0',null,'Network Feed',11,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1401,0,'Network Feed',0,sysdate,null,'East',sysdate,'0',null,'East',1,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1402,0,'Network Feed',0,sysdate,null,'West',sysdate,'0',null,'West',2,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1403,0,'Network Feed',0,sysdate,null,'HD',sysdate,'0',null,'HD',3,0);

INSERT INTO SYSDATA.list_of_value (id,version,category,created_by,created_date,description,return_value,edited_date,is_deleted,parent_id,display_value,sort_order,updated_by) VALUES (1404,0,'Network Feed',0,sysdate,null,'GigE',sysdate,'0',null,'GigE',4,0);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Custom SQL (x5)', 'EXECUTED', 'changelog-SYSDATA-0189.groovy', 'SYSDATA-189: Add network feed LOVs', '2.0.1', '3:e445266d7cee5ffa61354fea4c5b96c0', 30);

-- Changeset changelog-ZipCode_table.groovy::ZipCode_table::Doug Tracy::(Checksum: 3:8ca022d96b4ebba845d56cc2aab5b642)
-- Not really needed as a Domain object, but necessary as a table for the Caas Validation service
CREATE TABLE SYSDATA.zipcode (id NUMBER(19,0) NOT NULL, version NUMBER(19,0) NOT NULL, activeflag VARCHAR2(1 CHAR) NOT NULL, zipcode VARCHAR2(5 CHAR) NOT NULL, plus4 VARCHAR2(4 CHAR), range VARCHAR2(4 CHAR), city VARCHAR2(100 CHAR), statecode VARCHAR2(2 CHAR), created_by VARCHAR2(255 CHAR), created_date TIMESTAMP(6), edited_date TIMESTAMP(6), updated_by VARCHAR2(255 CHAR)) TABLESPACE sysdata_data;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Doug Tracy', 'Not really needed as a Domain object, but necessary as a table for the Caas Validation service', SYSTIMESTAMP, 'Create Table', 'EXECUTED', 'changelog-ZipCode_table.groovy', 'ZipCode_table', '2.0.1', '3:8ca022d96b4ebba845d56cc2aab5b642', 31);

-- Changeset changelog-ZipCode_table.groovy::ZipCode_table sequence::Rick Rothenberg::(Checksum: 3:362aa7f2e725bb0333335982ea6ac6be)
CREATE SEQUENCE SYSDATA.zipcode_seq START WITH 1000000 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999999999999999 CACHE 20;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Create Sequence', 'EXECUTED', 'changelog-ZipCode_table.groovy', 'ZipCode_table sequence', '2.0.1', '3:362aa7f2e725bb0333335982ea6ac6be', 32);

-- Changeset changelog-ZipCode_table.groovy::ZipCode_table primary key::Rick Rothenberg::(Checksum: 3:3df44f838323ae12f74abdd99334d0bc)
ALTER TABLE  SYSDATA.zipcode ADD CONSTRAINT zipcode_pk PRIMARY KEY (id) USING INDEX TABLESPACE sysdata_index LOGGING NOSORT;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Primary Key', 'EXECUTED', 'changelog-ZipCode_table.groovy', 'ZipCode_table primary key', '2.0.1', '3:3df44f838323ae12f74abdd99334d0bc', 33);

-- Changeset changelog-SYSDATA-0201.groovy::SYSDATA-201: ProductType name/version must be unique::Rick Rothenberg::(Checksum: 3:716d2c005b7e16842b28908bdc39784e)
CREATE UNIQUE INDEX SYSDATA.product_type_name_idx ON sysdata.product_type(product_version, name) TABLESPACE sysdata_index LOGGING NOCOMPRESS NOPARALLEL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Create Index', 'EXECUTED', 'changelog-SYSDATA-0201.groovy', 'SYSDATA-201: ProductType name/version must be unique', '2.0.1', '3:716d2c005b7e16842b28908bdc39784e', 34);

-- Changeset changelog-SYSDATA-0198.groovy::SYSDATA-198: Fix geographic code max length::Rick Rothenberg::(Checksum: 3:8be6f2b423c91024116f1c3102b97512)
UPDATE SYSDATA.geographic set code = substr(code, 1, 50);

ALTER TABLE  SYSDATA.geographic MODIFY code VARCHAR2(50 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Custom SQL, Modify data type', 'EXECUTED', 'changelog-SYSDATA-0198.groovy', 'SYSDATA-198: Fix geographic code max length', '2.0.1', '3:8be6f2b423c91024116f1c3102b97512', 35);

-- Changeset changelog-SYSDATA-0237.groovy::SYSDATA-237: Add username to Contact::Rick Rothenberg::(Checksum: 3:3d506ad3130d983db369883a0893bf5f)
ALTER TABLE  SYSDATA.contact ADD username VARCHAR2(255 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column', 'EXECUTED', 'changelog-SYSDATA-0237.groovy', 'SYSDATA-237: Add username to Contact', '2.0.1', '3:3d506ad3130d983db369883a0893bf5f', 36);

-- Changeset changelog-SYSDATA-0227.groovy::SYSDATA-227: Add description to ProductType::Rick Rothenberg::(Checksum: 3:163ef7f77d2b098f4ef7fc0f4176af6c)
ALTER TABLE  SYSDATA.product_type ADD description VARCHAR2(255 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column', 'EXECUTED', 'changelog-SYSDATA-0227.groovy', 'SYSDATA-227: Add description to ProductType', '2.0.1', '3:163ef7f77d2b098f4ef7fc0f4176af6c', 37);

-- Changeset changelog-SYSDATA-0241_0242.groovy::SYSDATA-241, SYSDATA-242: Fix canBeCustomer flag on CompanyType::Rick Rothenberg::(Checksum: 3:edd66a301db7231d2ded42970c6b6fab)
UPDATE SYSDATA.company_type set can_be_customer = 1 where company_type = 'MSO';

UPDATE SYSDATA.company_type set can_be_customer = 1 where company_type = 'Network';

UPDATE SYSDATA.company_type set can_be_customer = 1 where company_type = 'Programmer';

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Custom SQL (x3)', 'EXECUTED', 'changelog-SYSDATA-0241_0242.groovy', 'SYSDATA-241, SYSDATA-242: Fix canBeCustomer flag on CompanyType', '2.0.1', '3:edd66a301db7231d2ded42970c6b6fab', 38);

-- Changeset changelog-SYSDATA-0226.groovy::SYSDATA-226: Add missing advertiser categories::Rick Rothenberg::(Checksum: 3:aea7ad59591dca56457f9a52250b50f1)
INSERT INTO SYSDATA.list_of_value (id, version, category, display_value, return_value, sort_order, is_deleted) values(321, 0, 'Advertiser Category', 'Test', 'TEST', 21, 0);

INSERT INTO SYSDATA.list_of_value (id, version, category, display_value, return_value, sort_order, is_deleted) values(322, 0, 'Advertiser Category', 'Promo', 'PROMO', 22, 0);

INSERT INTO SYSDATA.list_of_value (id, version, category, display_value, return_value, sort_order, is_deleted) values(323, 0, 'Advertiser Category', 'Misc', 'MISC', 23, 0);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Custom SQL (x3)', 'EXECUTED', 'changelog-SYSDATA-0226.groovy', 'SYSDATA-226: Add missing advertiser categories', '2.0.1', '3:aea7ad59591dca56457f9a52250b50f1', 39);

-- Changeset changelog-SYSDATA-0222.groovy::SYSDATA-222: Canoe Contact Role should be optional::Rick Rothenberg::(Checksum: 3:de4cba74bbccdd725200c8c6dd1b04ea)
ALTER TABLE  SYSDATA.CANOE_CONTACT_ROLE MODIFY ROLE NULL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Drop Not-Null Constraint', 'EXECUTED', 'changelog-SYSDATA-0222.groovy', 'SYSDATA-222: Canoe Contact Role should be optional', '2.0.1', '3:de4cba74bbccdd725200c8c6dd1b04ea', 40);

-- Changeset changelog-SYSDATA-0229.groovy::SYSDATA-229: Fix zip codes::Rick Rothenberg::(Checksum: 3:b3a9e293b93104d39038132c5d11d572)
UPDATE SYSDATA.location set postal_code9 = substr(postal_code9,1,5) || '-' || substr(postal_code9,6,4) where length(postal_code9) = 9;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Custom SQL', 'EXECUTED', 'changelog-SYSDATA-0229.groovy', 'SYSDATA-229: Fix zip codes', '2.0.1', '3:b3a9e293b93104d39038132c5d11d572', 41);

-- Release Database Lock
INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Create Sequence', 'EXECUTED', 'changelog-ZipCode_table.groovy', 'ZipCode_TABLE SYSDATA.sequence', '2.0.1', '3:362aa7f2e725bb0333335982ea6ac6be', 32);

-- Changeset changelog-SYSDATA-0250.groovy::SYSDATA-250: Add missing phone type::Rick Rothenberg::(Checksum: 3:cfc8b5c4f52585d8449b479aade0bd3b)
insert INTO SYSDATA.list_of_value (id, version, category, display_value, return_value, sort_order, is_deleted) values(607, 0, 'Phone Type', 'Corporate', 'Corporate', 7, 0);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Custom SQL', 'EXECUTED', 'changelog-SYSDATA-0250.groovy', 'SYSDATA-250: Add missing phone type', '2.0.1', '3:cfc8b5c4f52585d8449b479aade0bd3b', 42);

-- Changeset changelog-SYSDATA-0257.groovy::SYSDATA-257: Make phone type optional::Rick Rothenberg::(Checksum: 3:969bf4079a51115e754b5b3bf73f8d90)
ALTER TABLE SYSDATA.PHONE MODIFY TYPE NULL;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Drop Not-Null Constraint', 'EXECUTED', 'changelog-SYSDATA-0257.groovy', 'SYSDATA-257: Make phone type optional', '2.0.1', '3:969bf4079a51115e754b5b3bf73f8d90', 43);

-- Changeset changelog-SYSDATA-0296.groovy::SYSDATA-296: Add Network Abbreviation::Rick Rothenberg::(Checksum: 3:6076c402ddc85590bb9ffc7d3226b7f4)
ALTER TABLE SYSDATA.company ADD network_abbreviation VARCHAR2(50 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column', 'EXECUTED', 'changelog-SYSDATA-0296.groovy', 'SYSDATA-296: Add Network Abbreviation', '2.0.1', '3:6076c402ddc85590bb9ffc7d3226b7f4', 44);

-- Changeset changelog-SYSDATA-0294.groovy::SYSDATA-294: Add FulfillmentHouse URL::Rick Rothenberg::(Checksum: 3:66ab72079b2eb79e36a309bbdaf3710e)
ALTER TABLE SYSDATA.company ADD fulfillment_house_url_address VARCHAR2(50 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column', 'EXECUTED', 'changelog-SYSDATA-0294.groovy', 'SYSDATA-294: Add FulfillmentHouse URL', '2.0.1', '3:66ab72079b2eb79e36a309bbdaf3710e', 45);

-- Changeset changelog-SYSDATA-0289.groovy::SYSDATA-289: Add sales coordinator flag to canoe contact::Rick Rothenberg::(Checksum: 3:bd79323549174a66f6871d4f9d30ff30)
ALTER TABLE SYSDATA.contact ADD sales_coordinator NUMBER(1,0);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column', 'EXECUTED', 'changelog-SYSDATA-0289.groovy', 'SYSDATA-289: Add sales coordinator flag to canoe contact', '2.0.1', '3:bd79323549174a66f6871d4f9d30ff30', 46);

-- Changeset changelog-SYSDATA-0290.groovy::SYSDATA-290: Add External ID to Company::Rick Rothenberg::(Checksum: 3:42afe29b6da0b281be313d993c07ce8f)
ALTER TABLE SYSDATA.company ADD external_id VARCHAR2(50 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column', 'EXECUTED', 'changelog-SYSDATA-0290.groovy', 'SYSDATA-290: Add External ID to Company', '2.0.1', '3:42afe29b6da0b281be313d993c07ce8f', 47);

-- Changeset changelog-SYSDATA-0290.groovy::SYSDATA-290: Copy any nielsen codes to external ID::Rick Rothenberg::(Checksum: 3:7686a924dac8a085827b7f7d316a984c)
UPDATE SYSDATA.company set external_id = substr(nielsen_code, 1, 50) where company_type = 'Network';

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Custom SQL', 'EXECUTED', 'changelog-SYSDATA-0290.groovy', 'SYSDATA-290: Copy any nielsen codes to external ID', '2.0.1', '3:7686a924dac8a085827b7f7d316a984c', 48);

-- Changeset changelog-SYSDATA-0290.groovy::SYSDATA-290: Remove Nielsen Code from Network::Rick Rothenberg::(Checksum: 3:931e6ad7f3dae8fa3989feaecd3dc290)
DROP INDEX SYSDATA.UNIQUE_NIELSEN_CODE_IDX;

ALTER TABLE SYSDATA.COMPANY DROP COLUMN NIELSEN_CODE;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Drop Index, Drop Column', 'EXECUTED', 'changelog-SYSDATA-0290.groovy', 'SYSDATA-290: Remove Nielsen Code from Network', '2.0.1', '3:931e6ad7f3dae8fa3989feaecd3dc290', 49);

-- Changeset changelog-SYSDATA-0284.groovy::SYSDATA-284: Change maxQuestionsUnlimited to maxQuestions::Rick Rothenberg::(Checksum: 3:2ae615b0bf9d73324a79d7385139aac4)
ALTER TABLE SYSDATA.product_type ADD max_questions NUMBER(2,0);

ALTER TABLE SYSDATA.PRODUCT_TYPE DROP COLUMN MAX_QUESTIONS_UNLIMITED;

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column, Drop Column', 'EXECUTED', 'changelog-SYSDATA-0284.groovy', 'SYSDATA-284: Change maxQuestionsUnlimited to maxQuestions', '2.0.1', '3:2ae615b0bf9d73324a79d7385139aac4', 50);

-- Changeset changelog-SYSDATA-0284-2.groovy::SYSDATA-284: Add product type code::Rick Rothenberg::(Checksum: 3:8d4b6a77e635dc21faa681fd621da926)
ALTER TABLE SYSDATA.product_type ADD product_type_code VARCHAR2(1 char);

INSERT INTO SYSDATA.DATABASECHANGELOG (AUTHOR, COMMENTS, DATEEXECUTED, DESCRIPTION, EXECTYPE, FILENAME, ID, LIQUIBASE, MD5SUM, ORDEREXECUTED) VALUES ('Rick Rothenberg', '', SYSTIMESTAMP, 'Add Column', 'EXECUTED', 'changelog-SYSDATA-0284-2.groovy', 'SYSDATA-284: Add product type code', '2.0.1', '3:8d4b6a77e635dc21faa681fd621da926', 51);

commit;
 --connect sysdata/&sysdata_password@&staging_caas_tns     



--drop user master_data;

spool off