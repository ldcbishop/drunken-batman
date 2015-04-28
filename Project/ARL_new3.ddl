DROP SEQUENCE ARL_Admin_seq ; 
create sequence ARL_Admin_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Admin_PK_trig 
before insert on ARL_Admin
for each row 
begin 
select ARL_Admin_seq.nextval into :new.ARL_Employee_employee_id from dual; 
end; 
/
alter table ARL_Admin add created date ; 
alter table ARL_Admin add created_by VARCHAR2 (255) ; 
alter table ARL_Admin add row_version_number integer ; 
alter table ARL_Admin add updated date ; 
alter table ARL_Admin add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Admin_AUD_trig 
before insert or update on ARL_Admin 
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

DROP SEQUENCE ARL_Document_seq ; 
create sequence ARL_Document_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Document_PK_trig 
before insert on ARL_Document
for each row 
begin 
select ARL_Document_seq.nextval into :new.document_id from dual; 
end; 
/
alter table ARL_Document add created date ; 
alter table ARL_Document add created_by VARCHAR2 (255) ; 
alter table ARL_Document add row_version_number integer ; 
alter table ARL_Document add updated date ; 
alter table ARL_Document add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Document_AUD_trig 
before insert or update on ARL_Document 
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

DROP SEQUENCE ARL_Employee_seq ; 
create sequence ARL_Employee_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Employee_PK_trig 
before insert on ARL_Employee
for each row 
begin 
select ARL_Employee_seq.nextval into :new.employee_id from dual; 
end; 
/
alter table ARL_Employee add created date ; 
alter table ARL_Employee add created_by VARCHAR2 (255) ; 
alter table ARL_Employee add row_version_number integer ; 
alter table ARL_Employee add updated date ; 
alter table ARL_Employee add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Employee_AUD_trig 
before insert or update on ARL_Employee 
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

DROP SEQUENCE ARL_List_seq ; 
create sequence ARL_List_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_List_PK_trig 
before insert on ARL_List
for each row 
begin 
select ARL_List_seq.nextval into :new.list_seq_id from dual; 
end; 
/
alter table ARL_List add created date ; 
alter table ARL_List add created_by VARCHAR2 (255) ; 
alter table ARL_List add row_version_number integer ; 
alter table ARL_List add updated date ; 
alter table ARL_List add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_List_AUD_trig 
before insert or update on ARL_List 
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

DROP SEQUENCE ARL_Member_seq ; 
create sequence ARL_Member_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Member_PK_trig 
before insert on ARL_Member
for each row 
begin 
select ARL_Member_seq.nextval into :new.list_seq_id from dual; 
end; 
/
alter table ARL_Member add created date ; 
alter table ARL_Member add created_by VARCHAR2 (255) ; 
alter table ARL_Member add row_version_number integer ; 
alter table ARL_Member add updated date ; 
alter table ARL_Member add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Member_AUD_trig 
before insert or update on ARL_Member 
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

DROP SEQUENCE ARL_NL2NL_seq ; 
create sequence ARL_NL2NL_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_NL2NL_PK_trig 
before insert on ARL_NL2NL
for each row 
begin 
select ARL_NL2NL_seq.nextval into :new.membership_id from dual; 
end; 
/
alter table ARL_NL2NL add created date ; 
alter table ARL_NL2NL add created_by VARCHAR2 (255) ; 
alter table ARL_NL2NL add row_version_number integer ; 
alter table ARL_NL2NL add updated date ; 
alter table ARL_NL2NL add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_NL2NL_AUD_trig 
before insert or update on ARL_NL2NL 
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

DROP SEQUENCE ARL_NLM2NL_seq ; 
create sequence ARL_NLM2NL_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_NLM2NL_PK_trig 
before insert on ARL_NLM2NL
for each row 
begin 
select ARL_NLM2NL_seq.nextval into :new.membership_id from dual; 
end; 
/
alter table ARL_NLM2NL add created date ; 
alter table ARL_NLM2NL add created_by VARCHAR2 (255) ; 
alter table ARL_NLM2NL add row_version_number integer ; 
alter table ARL_NLM2NL add updated date ; 
alter table ARL_NLM2NL add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_NLM2NL_AUD_trig 
before insert or update on ARL_NLM2NL 
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

DROP INDEX ARL_Employee_employee__FK_0 ;
CREATE INDEX ARL_Employee_employee__FK_0 ON ARL_Admin(ARL_Employee_employee_id) ;
DROP INDEX ARL_Member_list_seq_id_FK_1 ;
CREATE INDEX ARL_Member_list_seq_id_FK_1 ON ARL_Document(ARL_Member_list_seq_id) ;
DROP INDEX ARL_Employee_employee__FK_2 ;
CREATE INDEX ARL_Employee_employee__FK_2 ON ARL_Member(ARL_Employee_employee_id) ;
DROP INDEX ARL_List_list_seq_id_FK_3 ;
CREATE INDEX ARL_List_list_seq_id_FK_3 ON ARL_NL2NL(ARL_List_list_seq_id) ;
DROP INDEX ARL_List_list_seq_id1_FK_4 ;
CREATE INDEX ARL_List_list_seq_id1_FK_4 ON ARL_NL2NL(ARL_List_list_seq_id1) ;
DROP INDEX ARL_List_list_seq_id_FK_5 ;
CREATE INDEX ARL_List_list_seq_id_FK_5 ON ARL_NLM2NL(ARL_List_list_seq_id) ;
DROP INDEX ARL_Member_list_seq_id_FK_6 ;
CREATE INDEX ARL_Member_list_seq_id_FK_6 ON ARL_NLM2NL(ARL_Member_list_seq_id) ;
