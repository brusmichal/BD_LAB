--Stwórz sekwencję, która będzie zwracała liczbę całkowitą malejącą startując od numeru 99, 
--a po osiągnięciu liczby 27, zacznie ponownie zwracać liczby poczynając od 99.

create sequence int_sq
    minvalue 27
    start with 99
    maxvalue 99
    increment by -1
    cycle;
    
select int_sq.nextval from dual connect by level <=70;

--Napisz widok, który będzie zwracał rok założenia oraz średni roczny budżet departamentów 
--dla grup tworzonych ze względu na rok założenia departamentu.

create or replace view dep_y_bud as
    select established, avg(year_budget) as average
    from departments 
    group by established;
    
select * from dep_y_bud;

--Stwórz widok zmaterializowany, który będzie przechowywał nazwę zakładu, nazwę kraju oraz 
--konkatenację imienia i nazwiska pracowników zatrudnionych
--w zakładach mających swoje siedziby w krajach, w których liczba ludności jest wyższa niż 40 (mln).

create materialized view dep_c_nm_srnm as
    select d.name as department, c.name as country, concat(e.name, e.surname) as username
    from departments d join addresses a on d.address_id = a.address_id
    join countries c on a.country_id = c.country_id 
    join employees e on d.department_id = e.department_id
    where c.population > 40;
    
drop materialized view dep_c_nm_srnm;

select * from dep_c_nm_srnm;






