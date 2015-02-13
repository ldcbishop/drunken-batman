DROP SEQUENCE SIM_person_seq ; 
create sequence SIM_person_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_person_PK_trig 
; 

create or replace trigger SIM_person_PK_trig 
before insert on SIM_person
for each row 
begin 
select SIM_person_seq.nextval into :new.person_id from dual; 
end; 
/

DROP SEQUENCE SIM_dept_seq ; 
create sequence SIM_dept_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_dept_PK_trig 
; 

create or replace trigger SIM_dept_PK_trig 
before insert on SIM_dept
for each row 
begin 
select SIM_dept_seq.nextval into :new.SIM_dept_ID from dual; 
end; 
/

DROP SEQUENCE SIM_proj_assn_seq ; 
create sequence SIM_proj_assn_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_proj_assn_PK_trig 
; 

create or replace trigger SIM_proj_assn_PK_trig 
before insert on SIM_proj_assn
for each row 
begin 
select SIM_proj_assn_seq.nextval into :new.assignment_id from dual; 
end; 
/

DROP SEQUENCE SIM_project_seq ; 
create sequence SIM_project_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SIM_project_PK_trig 
; 

create or replace trigger SIM_project_PK_trig 
before insert on SIM_project
for each row 
begin 
select SIM_project_seq.nextval into :new.project_id from dual; 
end; 
/

--DROP INDEX SIM_dept_SIM_dept_ID_FK_0 ;
CREATE INDEX SIM_dept_SIM_dept_ID_FK_0 ON SIM_person(SIM_dept_SIM_dept_ID) ;
DROP INDEX SIM_dept_SIM_dept_ID1_FK_1 ;
CREATE INDEX SIM_dept_SIM_dept_ID1_FK_1 ON SIM_person(SIM_dept_SIM_dept_ID1) ;
DROP INDEX SIM_person_person_id_FK_2 ;
CREATE INDEX SIM_person_person_id_FK_2 ON SIM_proj_assn(SIM_person_person_id) ;
DROP INDEX SIM_project_project_id_FK_3 ;
CREATE INDEX SIM_project_project_id_FK_3 ON SIM_proj_assn(SIM_project_project_id) ;
DROP INDEX SIM_dept_SIM_dept_ID_FK_4 ;
CREATE INDEX SIM_dept_SIM_dept_ID_FK_4 ON SIM_project(SIM_dept_SIM_dept_ID) ;
