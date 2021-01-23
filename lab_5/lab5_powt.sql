SELECT COUNT(*), status_id
FROM employees
GROUP BY status_id;


SELECT COUNT(*), status_id
FROM employees
WHERE gender = 'K'
GROUP BY status_id;

SELECT position_id, MIN(salary), MAX(salary), AVG(salary), MEDIAN(salary)
FROM employees
GROUP BY position_id;

SELECT COUNT(country_id)
FROM countries
WHERE language = 'angielski';

SELECT language, COUNT(country_id)
FROM countries
GROUP BY language
HAVING count(*) >= 2;

SELECT position_id, AVG(salary)
FROM employees
GROUP BY position_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);
