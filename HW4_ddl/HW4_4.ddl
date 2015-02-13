drop view sim_person ;
drop view sim_emp ;
drop view sim_project_emp ;
drop view sim_manager ;

create view sim_person as
SELECT PERSON_ID,  
FROM SO_PERSON
WHERE TYPE = 'Contributor' ;

create or replace TRIGGER person_trigger
     INSTEAD OF insert ON org_person
     FOR EACH ROW
BEGIN
     insert into so_person(
        PERSON_ID,
        TYPE,
        NAME,
        DOB)
     VALUES (
        :new.PERSON_ID,
        'Contributor',
        :new.NAME,
        :new.DOB) ;
END;
/

create view org_owner as
SELECT PERSON_ID, TYPE, NAME, DOB 
FROM SO_PERSON
WHERE TYPE = 'Owner' ;

create or replace TRIGGER owner_trigger
     INSTEAD OF insert ON org_owner
     FOR EACH ROW
BEGIN
     insert into so_person(
        PERSON_ID,
        TYPE,
        NAME,
        DOB)
     VALUES (
        :new.PERSON_ID,
        'Owner',
        :new.NAME,
        :new.DOB) ;
END;
/

create view org_employee as
SELECT PERSON_ID, TYPE, NAME, DOB, EMPID, SO_ORG_ORG_ID
FROM SO_PERSON
WHERE TYPE = 'Employee' ;

create or replace TRIGGER employee_trigger
     INSTEAD OF insert ON org_employee
     FOR EACH ROW
BEGIN
     insert into so_person(
        PERSON_ID,
        TYPE,
        NAME,
        DOB,
        EMPID,
        SO_ORG_ORG_ID)
     VALUES (
        :new.PERSON_ID,
        'Employee',
        :new.NAME,
        :new.DOB,
        :new.EMPID,
        :new.SO_ORG_ORG_ID) ;
END;
/