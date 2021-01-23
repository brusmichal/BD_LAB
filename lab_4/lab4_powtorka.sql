SELECT distinct department_id
FROM employees
WHERE salary >
    (SELECT MIN(salary)
    FROM employees
    WHERE position_id = 102);
    
SELECT name, surname, date_employed
FROM employees
WHERE date_employed BETWEEN 
    (SELECT MIN(date_employed)
    FROM employees
    WHERE department_id = 101)
AND
    (SELECT MAX(date_employed)
    FROM employees 
    WHERE department_id = 107);
    
SELECT *
FROM employees
WHERE employee_id > ALL
    (SELECT manager_id
    FROM employees);
    
SELECT *
FROM employees
WHERE salary*0.25 >= ANY (SELECT salary FROM employees);


SELECT name, surname
FROM employees e1
WHERE NOT EXISTS
    (SELECT e2.employee_id
    FROM employees e2
    WHERE e1.employee_id = e2.manager_id);

SELECT e1.name, e1.surname, e1.department_id
FROM employees e1
WHERE e1.salary > 
    (SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id);

SELECT e.*, ROUND(ABS(e.salary - (SELECT AVG(salary) FROM employees)), 2) AS różnica
FROM employees e
WHERE e.salary IS NOT NULL;


SELECT e1.*
FROM(
    SELECT e.*, ROUND(ABS(e.salary - (SELECT AVG(salary) FROM employees)), 2) AS różnica
    FROM employees e
    WHERE e.salary IS NOT NULL
    ) e1
WHERE e1.różnica > 1000 AND
    e1.gender = 'K';
    
SELECT *
FROM employees e1
WHERE EXISTS
    (SELECT e2.employee_id
    FROM employees e2
    WHERE e1.employee_id = e2.manager_id) AND
    e1.salary > (SELECT AVG(e3.salary) FROM employees e3 WHERE e1.position_id = e3.position_id);

SELECT name, surname, salary
FROM employees
WHERE employee_id IN (
    SELECT manager_id
    FROM employees
    ) AND salary > (
    SELECT AVG(salary)
    FROM employees
    );
    
SELECT e1.name, e1.surname, e1.salary
FROM employees e1
WHERE e1.employee_id IN (
    SELECT manager_id
    FROM employees
    ) AND salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e1.position_id = e2.position_id
    );
    

    