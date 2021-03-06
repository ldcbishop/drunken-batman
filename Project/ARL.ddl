-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-04-20 17:37:17 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE ARL_Document CASCADE CONSTRAINTS ;

DROP TABLE ARL_Employee CASCADE CONSTRAINTS ;

DROP TABLE ARL_List CASCADE CONSTRAINTS ;

DROP TABLE ARL_Member CASCADE CONSTRAINTS ;

DROP TABLE ARL_NL2NL CASCADE CONSTRAINTS ;

DROP TABLE ARL_NLM2NL CASCADE CONSTRAINTS ;

CREATE TABLE ARL_Document
  (
    document_id   INTEGER NOT NULL ,
    filename      VARCHAR2 (4000) ,
    file_mimetype VARCHAR2 (512) ,
    file_charset  VARCHAR2 (512) ,
    file_data BLOB ,
    file_comments          VARCHAR2 (4000) ,
    tags                   VARCHAR2 (4000) ,
    ARL_Member_list_seq_id INTEGER
  ) ;
ALTER TABLE ARL_Document ADD CONSTRAINT ARL_Document_PK PRIMARY KEY ( document_id ) ;

CREATE TABLE ARL_Employee
  (
    employee_id       INTEGER NOT NULL ,
    employee_name     VARCHAR2 (30) ,
    employee_lab      VARCHAR2 (4) ,
    employee_division VARCHAR2 (4) ,
    employee_status   VARCHAR2 (1) ,
    status_eff_date   DATE
  ) ;
ALTER TABLE ARL_Employee ADD CONSTRAINT ARL_Employee_PK PRIMARY KEY ( employee_id ) ;

CREATE TABLE ARL_List
  (
    list_seq_id        INTEGER NOT NULL ,
    list_name          VARCHAR2 (40) NOT NULL ,
    ownership_div_code VARCHAR2 (4) ,
    list_description   VARCHAR2 (3500) NOT NULL ,
    external_view_name VARCHAR2 (50) ,
    creation_date      DATE ,
    list_status        VARCHAR2 (1) ,
    status_eff_date    DATE
  ) ;
ALTER TABLE ARL_List ADD CONSTRAINT ARL_List_PK PRIMARY KEY ( list_seq_id ) ;

CREATE TABLE ARL_Member
  (
    list_seq_id              INTEGER NOT NULL ,
    member_list_id           INTEGER ,
    date_added               DATE ,
    ARL_Employee_employee_id INTEGER NOT NULL
  ) ;
CREATE UNIQUE INDEX ARL_Member__IDX ON ARL_Member
  (
    ARL_Employee_employee_id ASC
  )
  ;
  ALTER TABLE ARL_Member ADD CONSTRAINT ARL_Member_PK PRIMARY KEY ( list_seq_id ) ;

CREATE TABLE ARL_NL2NL
  (
    membership_id         INTEGER NOT NULL ,
    ARL_List_list_seq_id  INTEGER NOT NULL ,
    ARL_List_list_seq_id2 INTEGER NOT NULL
  ) ;
ALTER TABLE ARL_NL2NL ADD CONSTRAINT ARL_NL2NL_PK PRIMARY KEY ( membership_id ) ;

CREATE TABLE ARL_NLM2NL
  (
    membership_id          INTEGER NOT NULL ,
    ARL_List_list_seq_id   INTEGER NOT NULL ,
    ARL_Member_list_seq_id INTEGER NOT NULL
  ) ;
ALTER TABLE ARL_NLM2NL ADD CONSTRAINT ARL_NLM2NL_PK PRIMARY KEY ( membership_id ) ;

ALTER TABLE ARL_Document ADD CONSTRAINT ARL_Document_ARL_Member_FK FOREIGN KEY ( ARL_Member_list_seq_id ) REFERENCES ARL_Member ( list_seq_id ) ;

ALTER TABLE ARL_Member ADD CONSTRAINT ARL_Member_ARL_Employee_FK FOREIGN KEY ( ARL_Employee_employee_id ) REFERENCES ARL_Employee ( employee_id ) ;

ALTER TABLE ARL_NL2NL ADD CONSTRAINT ARL_NL2NL_ARL_List_FK FOREIGN KEY ( ARL_List_list_seq_id ) REFERENCES ARL_List ( list_seq_id ) ;

ALTER TABLE ARL_NL2NL ADD CONSTRAINT ARL_NL2NL_ARL_List_FKv2 FOREIGN KEY ( ARL_List_list_seq_id2 ) REFERENCES ARL_List ( list_seq_id ) ;

ALTER TABLE ARL_NLM2NL ADD CONSTRAINT ARL_NLM2NL_ARL_List_FK FOREIGN KEY ( ARL_List_list_seq_id ) REFERENCES ARL_List ( list_seq_id ) ;

ALTER TABLE ARL_NLM2NL ADD CONSTRAINT ARL_NLM2NL_ARL_Member_FK FOREIGN KEY ( ARL_Member_list_seq_id ) REFERENCES ARL_Member ( list_seq_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             1
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
