SELECT e.name, e.surname, d.department_id, d.name
FROM employees e CROSS JOIN departments d;

select count(*)
from
    (SELECT e.name, e.surname, d.department_id, d.name
    FROM employees e CROSS JOIN departments d);



SELECT e.name, e.surname, department_id, d.name
FROM employees e JOIN departments d USING (department_id);

SELECT e.name, e.surname, d.department_id, d.name
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

SELECT department_id
FROM employees e JOIN departments d USING (department_id);

SELECT d.department_id
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

SELECT e.name, e.surname, department_id, d.name
FROM employees e JOIN departments d USING (department_id)
WHERE gender = 'K' 
AND EXTRACT(YEAR FROM established) > 2005;



select * 
from countries natural join regions;


select *
from countries join regions
using (region_id);


--Znajdź pracowników, których zarobki nie są zgodne z “widełkami” na jego stanowisku. 
--Zwróć imię, nazwisko, wynagrodzenie oraz nazwę stanowiska. Czy zapytanie możemy zrealizować wykorzystując NATURAL JOIN?

SELECT e.name, surname, salary, p.name
FROM employees e join positions p
ON (e.position_id = p.position_id )
WHERE salary NOT BETWEEN min_salary AND max_salary;


INSERT INTO employees VALUES (159, 'Sławomir', 'Martyniuk', sysdate, 'M', 304, 12000, sysdate, 109, NULL, 101);


--Zmodyfikuj poprzednie zapytanie tak, aby dodatkowo wyświetlić informacje o nazwie zakładu pracownika.

SELECT e.name, surname, salary, p.name, d.name
FROM employees e join positions p
ON (e.position_id = p.position_id )
JOIN departments d
using (department_id)
WHERE salary NOT BETWEEN min_salary AND max_salary;

--Wyświetl nazwę zakładu wraz z imieniem i nazwiskiem jego kierowników. 
--Pokaż tylko zakłady, które mają budżet pomiędzy 5000000  i 10000000.
--Czy to zapytanie można napisać wykorzystując NATURAL JOIN?

SELECT d.name, e.name, e.surname
FROM departments d 
    JOIN employees e
    ON (d.manager_id = e.employee_id)
WHERE d.year_budget BETWEEN 5000000 AND 10000000;

--Znajdź zakłady (podaj ich nazwę), które mają swoje siedziby w Polsce.

SELECT d.name, c.name
FROM departments d
    JOIN addresses a on (a.address_id = d.address_id)
    JOIN countries c ON (c.country_id = a.country_id)
WHERE UPPER(c.name)='POLSKA';


--Zmodyfikuj zapytanie 3 tak, aby uwzględniać w wynikach tylko zakłady,
--które mają siedziby w Polsce. (ZAPYTANIE #001)

SELECT d.name, e.name, e.surname
FROM departments d 
    JOIN employees e
    ON (d.manager_id = e.employee_id)
WHERE d.year_budget BETWEEN 5000000 AND 10000000
AND d.department_id IN
    (SELECT d1.department_id
    FROM departments d1
        JOIN addresses a on (a.address_id = d1.address_id)
        JOIN countries c ON (c.country_id = a.country_id)
    WHERE UPPER(c.name)='POLSKA');
    

--Wyświetl listę zawierającą nazwisko pracownika, stanowisko, 
--na którym pracuje, aktualne zarobki oraz widełki płacowe dla tego stanowiska.
--Sterując rodzajem złączenia, zagwarantuj,
--że w wynikach znajdą się wszyscy pracownicy.

SELECT e.surname, p.name, e.salary, p.min_salary, p.max_salary
FROM employees e LEFT JOIN positions p ON (e.position_id = p.position_id);


SELECT e1.name, e1.surname, e1.salary, e2.salary as threshold
FROM employees e1 
JOIN employees e2 ON (e1.salary > e2.salary AND e2.surname = 'King');

--Dla każdego imienia pracownika z zakładów Administracja lub 
--Marketing zwróć liczbę pracowników, którzy mają takie samo imię i podaj ich średnie zarobki.

SELECT COUNT(*), avg(salary), e.name
    FROM employees e JOIN departments d ON (e.department_id = d.department_id)
    WHERE d.name = 'Administracja' or d.name = 'Marketing'
    GROUP BY e.name;

--Napisz zapytanie zwracające liczbę zakładów w krajach. 
--W wynikach podaj nazwę kraju oraz jego ludność.


select c.name,c.population, count(*)
from countries c 
    join addresses a on ( a.country_id = c.country_id)
    join departments d on (d.address_id = a.address_id)
    group by c.name, c.population;
    


