create view emp_pos_view
as
    select e.name, e.surname, e.salary, p.name as position
    from employees e join positions p on e.position_id = p.position_id;
    
select * from emp_pos_view;

SELECT  position, COUNT(*) 
             FROM emp_pos_view
	WHERE salary > 2100 
	GROUP BY position
	HAVING COUNT (*) >= 2
	ORDER BY  2 DESC;
-----------------------------------------------------
CREATE OR REPLACE VIEW emp_view AS
    Select employee_id, name, surname, birth_date
    From employees;

INSERT INTO emp_view VALUES (302, 'Maria', 'Wronowska', SYSDATE);

UPDATE emp_view SET name = 'MARIA' WHERE name like 'Maria';

-----------------------------------------------------
create view emp_view_names as
    select employee_id, name, surname, birth_date 
    from employees
    where name like 'P%' or name like 'M%'
    with check option;
--check option sprawia, że mozna insert/delete/update tylko rzeczy, które spełniają
--warunek where
UPDATE emp_view_names SET name = 'Matthew' WHERE name like 'MATTHEW'; --dziala
UPDATE emp_view_names SET name = 'Guy' WHERE name like 'GUY';-- nie dziala, 
------------------------------------------------------
create materialized view emp_pos_MView as
    select e.name as name, e.surname, e.salary, p.name as posiiton, d.name as department
    from employees e join positions p using (position_id)
    join departments d using (department_id);
    
select * from emp_pos_mview;
--------------------------------------
--1.Zdefiniuj widok, który będzie zwracać imię, nazwisko, zarobki, nazwę stanowiska, nazwę departamentu 
--oraz imię i nazwisko managera dla wszystkich pracowników w tabeli employees.

create view emp_sal_pos_dep_man as
    select e1.name as name, e1.surname as surname, e1.salary, p.name as position, d.name as department, e2.name as m_name, e2.surname as m_surname
    from employees e1 join positions p using (position_id) 
    join departments d using (department_id)
    join employees e2 on e1.manager_id = e2.employee_id;
    
select * from emp_sal_pos_dep_man;
---------------------------------------------
--2.Zdefiniuj widok typu WITH CHECK OPTION przechowujący id stanowisk (position_id) oraz nazwę wszystkich stanowisk rozpoczynających się od litery ‘P’, ‘K’ lub ‘M’. 
--Następnie spróbuj zwiększyć minimalne zarobki dla stanowiska ‘Rekruter’ o 1000 i przeanalizuj komunikat błędu.

create view pos_name as
    select position_id, name 
    from positions
    where name like 'P%' or name like 'K%' or  name like 'M%'
    with check option;

select * from pos_name;

update pos_name set min_salary = min_salary + 1000 where name = 'Rekruter';

--3.Wykonaj polecenia DROP VIEW lub DROP MATERIALIZED VIEW, aby usunąć jeden z wcześniej utworzonych widoków.
drop view pos_name;

----------------------------------------------------
--Zdefiniuj sekwencję o nazwie Int_seq1, która będzie generowała wartości całkowite z przedziału 100 ÷ 1000:
create sequence int_sq1 start with 100 maxvalue 1000;

select int_sq1.nextval from dual;
select int_sq1.currval from dual;

-----------------------------------------------
--Przykład: zdefiniuj synonim prywatny o nazwie emps dla tabeli employees:
create synonym emps for employees;

select * from emps;
------------------------------
--1.Zdefiniuj sekwencję, która: (i) będzie posiadała minimalną wartość 10; (ii) rozpocznie generowanie wartości od 12;
--(iii) będzie posiadała maksymalną wartość 17; (iv) będzie cykliczna. Następnie wygeneruj kilkanaście wartości za pomocą tej sekwencji i obserwuj rezultaty.

create sequence int_sq2 
    minvalue 10 
    start with 12
    maxvalue 17 
    cycle
    nocache;

select int_sq2.nextval from dual;
-----------------------------------------------
--2.Zdefiniuj sekwencję, która będzie generowała malejąco liczby parzyste z przedziału 100 ÷ 0.

create sequence even_sq
    minvalue 0
    maxvalue 100
    start with 100
    increment by -2;
    cycle;
    
drop sequence even_sq;

select even_sq.nextval from dual connect by level <=50;
----------------------------------------------
--3.Nadaj synonim dla dowolnej z dwóch poprzednio zdefiniowanych sekwencji i pobierz z niej wartość za pomocą synonimu.
create synonym even_numbers for even_sq;

select even_numbers.nextval from dual;
--------------------------------------------------
--1.Utwórz widok zawierający złączenia kilku tabel (np. employees, positions, departments, addresses)
--i spróbuj go wykorzystać do wprowadzenia nowych danych do tych tabel.
--Jaki komunikat błędu zaobserwowałeś? 
--Wyszukaj w dokumentacji możliwe rozwiązanie tego problemu.

create view emp_dep_addr_view as
    select e.name as name, e.surname, d.name as department, a.city 
    from employees e join departments d using (department_id)
    join addresses a using (address_id);

select * from emp_dep_addr_view;

insert into emp_dep_addr_view values ('Jan', 'Milewicz', 'Marketing', 'GDYNIA');
/* SQL Error: ORA-01776: cannot modify more than one base table through a join view
01776. 00000 -  "cannot modify more than one base table through a join view"
*Cause:    Columns belonging to more than one underlying table were either
           inserted into or updated.
*Action:   Phrase the statement as two or more separate statements. */

--2. Zdefiniuj widok łączący tabele countries, regions i addresses. 
--Następnie wykorzystując złączenie pomiędzy tym widokiem, a tabelą departments wyświetl kraje oraz regiony położenia wszystkich departamentów.

create view c_reg_addr_view as
    select c.name as country, r. name as region, a.address_id
    from countries c join regions r using (region_id) 
    join addresses a using (country_id);
    
drop view c_reg_addr_view;

select * from c_reg_addr_view;

select d.department_id, d.name as departement, v.country, v.region
from departments d join c_reg_addr_view v using(address_id);


















    
    