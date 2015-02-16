DROP SEQUENCE SIM_Person_seq ; 
create sequence SIM_Person_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SIM_Person_PK_trig 
before insert on SIM_Person
for each row 
begin 
select SIM_Person_seq.nextval into :new.person_id from dual; 
end; 
/
alter table SIM_Person add created date ; 
alter table SIM_Person add created_by VARCHAR2 (255) ; 
alter table SIM_Person add row_version_number integer ; 
alter table SIM_Person add updated date ; 
alter table SIM_Person add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SIM_Person_AUD_trig 
before insert or update on SIM_Person 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE SIM_dept_seq ; 
create sequence SIM_dept_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SIM_dept_PK_trig 
before insert on SIM_dept
for each row 
begin 
select SIM_dept_seq.nextval into :new.dept_id from dual; 
end; 
/
alter table SIM_dept add created date ; 
alter table SIM_dept add created_by VARCHAR2 (255) ; 
alter table SIM_dept add row_version_number integer ; 
alter table SIM_dept add updated date ; 
alter table SIM_dept add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SIM_dept_AUD_trig 
before insert or update on SIM_dept 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE SIM_proj_assign_seq ; 
create sequence SIM_proj_assign_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SIM_proj_assign_PK_trig 
before insert on SIM_proj_assign
for each row 
begin 
select SIM_proj_assign_seq.nextval into :new.assignment_id from dual; 
end; 
/
alter table SIM_proj_assign add created date ; 
alter table SIM_proj_assign add created_by VARCHAR2 (255) ; 
alter table SIM_proj_assign add row_version_number integer ; 
alter table SIM_proj_assign add updated date ; 
alter table SIM_proj_assign add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SIM_proj_assign_AUD_trig 
before insert or update on SIM_proj_assign 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE SIM_project_seq ; 
create sequence SIM_project_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SIM_project_PK_trig 
before insert on SIM_project
for each row 
begin 
select SIM_project_seq.nextval into :new.project_id from dual; 
end; 
/
alter table SIM_project add created date ; 
alter table SIM_project add created_by VARCHAR2 (255) ; 
alter table SIM_project add row_version_number integer ; 
alter table SIM_project add updated date ; 
alter table SIM_project add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SIM_project_AUD_trig 
before insert or update on SIM_project 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP INDEX SIM_dept_dept_id_FK_0 ;
CREATE INDEX SIM_dept_dept_id_FK_0 ON SIM_Person(SIM_dept_dept_id) ;
DROP INDEX SIM_dept_dept_id1_FK_1 ;
CREATE INDEX SIM_dept_dept_id1_FK_1 ON SIM_Person(SIM_dept_dept_id1) ;
DROP INDEX SIM_Person_person_id_FK_2 ;
CREATE INDEX SIM_Person_person_id_FK_2 ON SIM_proj_assign(SIM_Person_person_id) ;
DROP INDEX SIM_project_project_id_FK_3 ;
CREATE INDEX SIM_project_project_id_FK_3 ON SIM_proj_assign(SIM_project_project_id) ;
DROP INDEX SIM_dept_dept_id_FK_4 ;
CREATE INDEX SIM_dept_dept_id_FK_4 ON SIM_project(SIM_dept_dept_id) ;
