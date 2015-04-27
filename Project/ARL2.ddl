DROP SEQUENCE ARL_Document_seq ; 
create sequence ARL_Document_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Document_PK_trig 
; 

create or replace trigger ARL_Document_PK_trig 
before insert on ARL_Document
for each row 
begin 
select ARL_Document_seq.nextval into :new.document_id from dual; 
end; 
/

DROP SEQUENCE ARL_Employee_seq ; 
create sequence ARL_Employee_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Employee_PK_trig 
; 

create or replace trigger ARL_Employee_PK_trig 
before insert on ARL_Employee
for each row 
begin 
select ARL_Employee_seq.nextval into :new.employee_id from dual; 
end; 
/

DROP SEQUENCE ARL_List_seq ; 
create sequence ARL_List_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_List_PK_trig 
; 

create or replace trigger ARL_List_PK_trig 
before insert on ARL_List
for each row 
begin 
select ARL_List_seq.nextval into :new.list_seq_id from dual; 
end; 
/

DROP SEQUENCE ARL_Member_seq ; 
create sequence ARL_Member_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Member_PK_trig 
; 

create or replace trigger ARL_Member_PK_trig 
before insert on ARL_Member
for each row 
begin 
select ARL_Member_seq.nextval into :new.list_seq_id from dual; 
end; 
/

DROP SEQUENCE ARL_NL2NL_seq ; 
create sequence ARL_NL2NL_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_NL2NL_PK_trig 
; 

create or replace trigger ARL_NL2NL_PK_trig 
before insert on ARL_NL2NL
for each row 
begin 
select ARL_NL2NL_seq.nextval into :new.membership_id from dual; 
end; 
/

DROP SEQUENCE ARL_NLM2NL_seq ; 
create sequence ARL_NLM2NL_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_NLM2NL_PK_trig 
; 

create or replace trigger ARL_NLM2NL_PK_trig 
before insert on ARL_NLM2NL
for each row 
begin 
select ARL_NLM2NL_seq.nextval into :new.membership_id from dual; 
end; 
/

DROP INDEX ARL_Member_list_seq_id_FK_0 ;
CREATE INDEX ARL_Member_list_seq_id_FK_0 ON ARL_Document(ARL_Member_list_seq_id) ;
DROP INDEX ARL_Employee_employee__FK_1 ;
CREATE INDEX ARL_Employee_employee__FK_1 ON ARL_Member(ARL_Employee_employee_id) ;
DROP INDEX ARL_List_list_seq_id_FK_2 ;
CREATE INDEX ARL_List_list_seq_id_FK_2 ON ARL_NL2NL(ARL_List_list_seq_id) ;
DROP INDEX ARL_List_list_seq_id2_FK_3 ;
CREATE INDEX ARL_List_list_seq_id2_FK_3 ON ARL_NL2NL(ARL_List_list_seq_id2) ;
DROP INDEX ARL_List_list_seq_id_FK_4 ;
CREATE INDEX ARL_List_list_seq_id_FK_4 ON ARL_NLM2NL(ARL_List_list_seq_id) ;
DROP INDEX ARL_Member_list_seq_id_FK_5 ;
CREATE INDEX ARL_Member_list_seq_id_FK_5 ON ARL_NLM2NL(ARL_Member_list_seq_id) ;
