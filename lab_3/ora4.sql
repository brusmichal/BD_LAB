SELECT value FROM nls_session_parameters
WHERE  parameter = 'NLS_DATE_FORMAT';
ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YY";
SELECT SYSDATE FROM DUAL;

INSERT INTO regions VALUES(0, 'Europa');
INSERT INTO regions VALUES(1, 'Ameryka PN');
select * from regions;

INSERT INTO countries VALUES (0,'Poland', 0);
Insert into countries VALUES(1, 'Poland', 32);

INSERT  INTO addresses (street, postal_code, city, country_id) VALUES ('Koszykowa', '02-111', 'Warszawa', 0);

UPDATE countries SET name = 'NIENZNANE';
select * from countries;
DELETE FROM countries;
DELETE FROM addresses;\
DELETE FROM countries;
TRUNCATE TABLE countries;

Select * from departments;
SELECT Department_id, name, Established from departments;
SELECT UPPER(name) from departments;
SELECT employee_id, name, surname, salary, 0.23*salary as Podatek from employees;
Select COUNT(department_id) from employees;
select count(name) from employees;
select count(distinct(name)) from employees;


select * from employees where salary > 3000;

select * from employees where salary between 2000 and 3000;
select count(*) from employees where salary <= 3000 and salary >= 2000;

select name, surname, date_employed, salary from employees 
    where salary between 2000 and 3000 and date_employed > '01/01/10';
select name, surname, salary * 0.23 as podatek from employees
    where 0.23*salary < 500;
select * from countries where name like 'K%';
select * from employees where department_id IS NULL;
select * from employees where department_id in (102, 103, 105);
    
