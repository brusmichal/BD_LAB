SELECT e1.name, e1.surname, e1.salary
FROM employees e1
WHERE e1.salary > ALL
    (SELECT e2.salary
    FROM employees e2
    WHERE e1.position_id = e2.position_id 
      AND e2.department_id IN (101, 102, 103, 104)
AND e2.position_id IS NOT NULL);


SELECT e1.name, e1.surname, e1.salary 
FROM employees e1
WHERE e1.salary >
    (SELECT avg(e2.salary)
    FROM employees e2
    WHERE e1.position_id = e2.position_id);
    
SELECT avg(e2.salary)
    FROM employees e2
    WHERE e1.position_id = e2.position_id;
    
SELECT e2.salary
    FROM employees e2
    WHERE e2.department_id IN (101, 102, 103, 104);


SELECT name, surname
FROM employees e1
WHERE EXISTS (
    SELECT e2.employee_ID 
    FROM employees e2
    WHERE e1.employee_id = e2.manager_id);
    
-- Napisz zapytanie, które zwróci wszystkich pracowników niebędących managerami.

SELECT name, surname
FROM employees e1
WHERE NOT EXISTS (
    SELECT e2.employee_ID 
    FROM employees e2
    WHERE e1.employee_id = e2.manager_id);
    
    
--Napisz zapytanie, które zwróci pracowników zarabiających więcej niż średnia w ich departamencie.

SELECT name, surname
FROM employees e1
WHERE e1.salary >
    (SELECT avg(e2.salary)
    FROM employees e2
    WHERE e1.department_id = e2.department_id);
    
-- Napisz zapytanie, które dla wszystkich pracowników posiadających pensję zwróci informację o różnicy między ich pensją,
--a średnią pensją pracowników. Różnicę podaj jako zaokrągloną wartość bezwzględną.

SELECT e1.*, ROUND(ABS(e1.salary - (SELECT avg(salary) FROM employees)), 2) AS SUB
FROM employees e1
WHERE salary IS NOT NULL;


--Korzystając z poprzedniego rozwiązania, napisz zapytanie, które zwróci tylko tych pracowników,
--którzy są kobietami i dla których różnica do wartości średniej jest powyżej 1000.

SELECT t1.*
FROM    (SELECT e1.*, ROUND(ABS(e1.salary - (SELECT avg(salary) FROM employees)), 2) AS SUB
        FROM employees e1
        WHERE salary IS NOT NULL) t1
WHERE
    SUB >= 1000
    AND t1.gender = 'K';
    



SELECT Department_ID, COUNT(Employee_ID), MIN(Salary), MAX(date_employed)
FROM Employees
GROUP BY Department_ID;  

--Przygotuj zapytanie, które wyświetli informację ilu pracowników ma aktualnie dany status_id 
--(Status_ID odwołujący się do tabeli EMP_STATUS).
SELECT status_id, count(*)
FROM Employees
GROUP BY status_id;

SELECT status_id, count(*), max(date_employed)
FROM Employees
GROUP BY status_id;


--Zmodyfikuj poprzednie zapytanie, żeby pokazać jedynie liczbę kobiet będących w danym statusie.
SELECT status_id, count(*), max(date_employed)
FROM Employees
WHERE gender = 'K'
GROUP BY status_id;

--Wyświetl informacje o liczbie krajów mających dany język jako urzędowy. Pokaż języki których jest nie mniej niż 2.

SELECT Count(*)
FROM countries
WHERE language='angielski';

SELECT Count(*), language
FROM countries
GROUP BY language
HAVING Count(*) >= 2;

--Wyświetl średnie zarobki dla każdego ze stanowisk, o ile średnie te są większe
--od średniej zarobków obliczonej dla wszystkich pracowników łącznie.

SELECT AVG(salary), position_id
FROM employees
GROUP BY position_id
HAVING AVG(salary) >
   (SELECT AVG(salary) 
    FROM employees);
    
SELECT AVG(salary) avg_sal, manager_ID
	FROM employees
	GROUP BY manager_ID
MINUS
SELECT AVG(salary), manager_ID
	FROM employees
	GROUP BY manager_ID
	HAVING manager_ID IS NULL
ORDER BY avg_sal;

SELECT employee_id, name, surname
FROM employees
WHERE department_id = 101
UNION
SELECT employee_id, name, surname
FROM employees
WHERE department_id = 103;

SELECT employee_id, name, surname
FROM employees
WHERE department_id IN( 101, 103);

SELECT name
FROM positions
WHERE name LIKE'P%'
UNION
SELECT name
FROM positions
WHERE name LIKE 'K%'
UNION
SELECT name
FROM positions
WHERE name LIKE'A%'
INTERSECT
SELECT name
FROM positions
WHERE min_salary >= 1500;

SELECT name, min_salary
	FROM positions
	WHERE UPPER(name) LIKE 'A%' OR UPPER(name) LIKE 'K%' OR UPPER(name) LIKE 'P%'
INTERSECT
SELECT name, min_salary
	FROM positions
	WHERE min_salary >= 1500;


SELECT position_id, AVG(salary)
FROM employees
GROUP BY position_id
MINUS
SELECT position_id, AVG(salary)
FROM employees
GROUP BY position_id
HAVING position_id = 102
ORDER BY 2;


SELECT department_id, AVG(salary), count(*)
FROM employees
WHERE date_employed < '01-JAN-20'
GROUP BY department_id
HAVING COUNT(*) > 2;



SELECT department_id, AVG(salary), count(*)
FROM employees
WHERE date_employed < '01-JAN-10'
GROUP BY department_id
INTERSECT
SELECT department_id, AVG(salary), count(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;

SELECT AVG(salary), COUNT (*), department_id
FROM employees
WHERE date_employed < '01-JAN-10'
GROUP BY department_id
HAVING (SELECT COUNT(*) FROM employees WHERE date_employed < '01-JAN-10') > 2;

SELECT department_id, gender, AVG(salary)
FROM employees
GROUP BY department_id, gender
ORDER BY 1;


SELECT region_id, count(*)
FROM countries
WHERE language = 'angielski'
GROUP BY region_id;
    

SELECT name, COUNT(*) 
FROM employees 
GROUP BY name 
HAVING COUNT(*) >=2;

SELECT region_id, MAX(population)
FROM countries
GROUP By region_id;

SELECT currency, count(*)
FROM countries
GROUP BY currency
HAVING COUNT(*) > 1;

SELECT AVG(pos_history_count.count)
    FROM  (
        SELECT COUNT(*) count
        FROM positions_history
        GROUP BY employee_id
    ) pos_history_count ;


    



