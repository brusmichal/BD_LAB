SELECT e.name, e.name, p.name, e.salary, p.min_salary, p.max_salary
FROM employees e LEFT JOIN positions p ON e.position_id = p.position_id;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 2000;

--Napisz jedno zapytanie które zwróci nazwę departamentu i 
--liczbę jego pracowników wraz z informacją o sumie ich pensji  
--oraz różnicy między budżetem departamentu a sumą pensji pracowników 

--oraz nazwę stanowiska i liczbę pracowników pracujących na tym stanowisku
--wraz z informacją o sumie ich pensji oraz różnicą między max_pensja
--na stanowisku wymnożoną przez liczbę pracowników (na tym stanowisku)
-- a sumą pensji pracowników (na tym stanowisku). 

--W wynikach wyświetl kategorię wpisu 'D' dla departamentu i 'P' dla stanowisk. 

    
    
    SELECT COUNT(department_id)
    FROM employees 
    GROUP BY department_id;



SELECT position_id, AVG(salary)
FROM employees
GROUP BY position_id
HAVING STDDEV(salary) < 500;


SELECT department_id, name, year_budget
FROM departments
WHERE year_budget = (SELECT MAX(year_budget) FROM 
    (SELECT department_id
    FROM departments
    MINUS
    SELECT department_id
    FROM departments
    WHERE year_budget = ( SELECT MAX(year_budget) FROM departments)));
    
    
SELECT d1.department_id, d1.name, d1.year_budget
FROM departments d1
WHERE d1.year_budget = SELECT ;


SELECT d.name, e1.name, e1.surname, e2.name, e2.surname
FROM employees e1 JOIN departments d USING(department_id)
JOIN emplo
WHERE ;

SELECT emp.name, emp.surname, man.name, man.surname, d.name

FROM employees emp 
JOIN employees man ON (emp.manager_id = man.employee_id)
JOIN departments d ON (man.employee_id = d.manager_id)
WHERE man.name ='David' and man.surname='Ernst'
gropu by department_id;
    
Wykorzystując podzapytania napisz zapytanie, które zwróci imię i nazwisko pracowniczki (pracowniczek) zatrudnionej najwcześniej. 
























    
    
    
    
