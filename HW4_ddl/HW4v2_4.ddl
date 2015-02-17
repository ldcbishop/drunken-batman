drop view sim_person_view ;
drop view sim_emp ;
drop view sim_project_emp ;
drop view sim_manager ;

create view sim_person_view as
SELECT PERSON_ID, TYPE, NAME, SSNUM, GENDER, BIRTH_DATE, ADDRESS, CITY, STATE, ZIP
FROM SIM_PERSON ;

create view sim_emp as
SELECT PERSON_ID, TYPE, NAME, SSNUM, GENDER, BIRTH_DATE, ADDRESS, CITY, STATE, ZIP, HIRE_DATE, SALARY, STATUS 
FROM SIM_PERSON
WHERE TYPE = 'Project Employee' OR TYPE = 'Manager' ;

create view sim_project_emp as
SELECT PERSON_ID, TYPE, NAME, SSNUM, GENDER, BIRTH_DATE, ADDRESS, CITY, STATE, ZIP, HIRE_DATE, SALARY, STATUS, TITLE, RATING, SIM_dept_dept_ID
FROM SIM_PERSON
WHERE TYPE = 'Project Employee' ;

create or replace TRIGGER project_emp_trigger
     INSTEAD OF insert ON sim_project_emp
     FOR EACH ROW
BEGIN
    insert into sim_person(
        PERSON_ID,
        TYPE,
        NAME,
        SSNUM,
        GENDER,
        BIRTH_DATE,
        ADDRESS,
        CITY,
        STATE,
        ZIP,
        HIRE_DATE,
        SALARY,
        STATUS,
        TITLE,
        RATING,
        SIM_dept_dept_ID)
     VALUES (
        :new.PERSON_ID,
        'Project Employee',
        :new.NAME,
        :new.SSNUM,
        :new.GENDER,
        :new.BIRTH_DATE,
        :new.ADDRESS,
        :new.CITY,
        :new.STATE,
        :new.ZIP,       
        :new.HIRE_DATE,
        :new.SALARY,
        :new.STATUS,
        :new.TITLE,
        :new.RATING,
        :new.SIM_dept_dept_ID) ;
END;
/

create view sim_manager as
SELECT PERSON_ID, TYPE, NAME, SSNUM, GENDER, BIRTH_DATE, ADDRESS, CITY, STATE, ZIP, HIRE_DATE, SALARY, STATUS, TITLE, BONUS, SIM_dept_dept_ID1
FROM SIM_PERSON
WHERE TYPE = 'Manager' ;

create or replace TRIGGER manager_trigger
     INSTEAD OF insert ON sim_manager
     FOR EACH ROW
BEGIN
    insert into sim_person(
        PERSON_ID,
        TYPE,
        NAME,
        SSNUM,
        GENDER,
        BIRTH_DATE,
        ADDRESS,
        CITY,
        STATE,
        ZIP,
        HIRE_DATE,
        SALARY,
        STATUS,
        TITLE,
        BONUS,
        SIM_dept_dept_ID1)
    VALUES (
        :new.PERSON_ID,
        'Manager',
        :new.NAME,
        :new.SSNUM,
        :new.GENDER,
        :new.BIRTH_DATE,
        :new.ADDRESS,
        :new.CITY,
        :new.STATE,
        :new.ZIP,       
        :new.HIRE_DATE,
        :new.SALARY,
        :new.STATUS,
        :new.TITLE,
        :new.BONUS,
        :new.SIM_dept_dept_ID1) ;
END;
/