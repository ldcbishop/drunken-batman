-- Generated by Oracle SQL Developer Data Modeler 4.1.0.866
--   at:        2015-02-13 15:12:24 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE SIM_person CASCADE CONSTRAINTS ;

DROP TABLE SIM_dept CASCADE CONSTRAINTS ;

DROP TABLE SIM_proj_assn CASCADE CONSTRAINTS ;

DROP TABLE SIM_project CASCADE CONSTRAINTS ;

CREATE TABLE SIM_person
  (
    person_id             INTEGER NOT NULL ,
    type                  VARCHAR2 (255 CHAR),
    name                  VARCHAR2 (255 CHAR) ,
    ssnum                 INTEGER ,
    gender                VARCHAR2 (255 CHAR) ,
    birth_date            DATE ,
    address               VARCHAR2 (255 CHAR) ,
    city                  VARCHAR2 (255 CHAR) ,
    state                 VARCHAR2 (255 CHAR) ,
    zip                   INTEGER ,
    emp_id                INTEGER NOT NULL ,
    hire_date             DATE ,
    salary                INTEGER ,
    status                VARCHAR2 (255 CHAR) ,
    title                 VARCHAR2 (255 CHAR) ,
    bonus                 INTEGER ,
    dept_id               INTEGER ,
    rating                VARCHAR2 (255 CHAR) ,
    SIM_dept_SIM_dept_ID  NUMBER NOT NULL ,
    SIM_dept_SIM_dept_ID1 NUMBER NOT NULL
  ) ;
CREATE UNIQUE INDEX SIM_person__IDX ON SIM_person
  (
    SIM_dept_SIM_dept_ID ASC
  )
  ;
  ALTER TABLE SIM_person ADD CONSTRAINT SIM_person_PK PRIMARY KEY ( person_id ) ;

CREATE TABLE SIM_dept
  (
    dept_id     INTEGER ,
    name        VARCHAR2 (255 CHAR) ,
    location    VARCHAR2 (255 CHAR) ,
    emp_id      INTEGER ,
    SIM_dept_ID NUMBER NOT NULL
  ) ;
ALTER TABLE SIM_dept ADD CONSTRAINT SIM_dept_PK PRIMARY KEY ( SIM_dept_ID ) ;

CREATE TABLE SIM_proj_assn
  (
    assignment_id          INTEGER NOT NULL ,
    emp_id                 INTEGER ,
    project_id             INTEGER ,
    SIM_project_project_id INTEGER NOT NULL ,
    SIM_person_person_id   INTEGER NOT NULL
  ) ;
ALTER TABLE SIM_proj_assn ADD CONSTRAINT SIM_proj_assn_PK PRIMARY KEY ( assignment_id ) ;

CREATE TABLE SIM_project
  (
    project_id           INTEGER NOT NULL ,
    name                 VARCHAR2 (255 CHAR) ,
    dept_id              INTEGER ,
    SIM_dept_SIM_dept_ID NUMBER NOT NULL
  ) ;
ALTER TABLE SIM_project ADD CONSTRAINT SIM_project_PK PRIMARY KEY ( project_id ) ;

ALTER TABLE SIM_person ADD CONSTRAINT SIM_person_SIM_dept_FK FOREIGN KEY ( SIM_dept_SIM_dept_ID ) REFERENCES SIM_dept ( SIM_dept_ID ) ;

ALTER TABLE SIM_person ADD CONSTRAINT SIM_person_SIM_dept_FKv1 FOREIGN KEY ( SIM_dept_SIM_dept_ID1 ) REFERENCES SIM_dept ( SIM_dept_ID ) ;

ALTER TABLE SIM_proj_assn ADD CONSTRAINT SIM_proj_assn_SIM_person_FK FOREIGN KEY ( SIM_person_person_id ) REFERENCES SIM_person ( person_id ) ;

ALTER TABLE SIM_proj_assn ADD CONSTRAINT SIM_proj_assn_SIM_project_FK FOREIGN KEY ( SIM_project_project_id ) REFERENCES SIM_project ( project_id ) ;

ALTER TABLE SIM_project ADD CONSTRAINT SIM_project_SIM_dept_FK FOREIGN KEY ( SIM_dept_SIM_dept_ID ) REFERENCES SIM_dept ( SIM_dept_ID ) ;

CREATE SEQUENCE SIM_dept_SIM_dept_ID_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER SIM_dept_SIM_dept_ID_TRG BEFORE
  INSERT ON SIM_dept FOR EACH ROW WHEN (NEW.SIM_dept_ID IS NULL) BEGIN :NEW.SIM_dept_ID := SIM_dept_SIM_dept_ID_SEQ.NEXTVAL;
END;
/


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             1
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
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
-- CREATE SEQUENCE                          1
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
