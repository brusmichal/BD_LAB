SELECT name, surname, salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary) 
    FROM Employees
    );

SELECT MAX(salary) 
    FROM Employees;
    
SELECT name, surname, gender
	FROM employees
	WHERE (salary, gender) = (
	    SELECT MIN(salary), 'K'
	    FROM Employees
	    WHERE Gender = 'K'
    	);

     SELECT MIN(salary), 'K'
	    FROM Employees
	    WHERE Gender = 'K';
        
Napisz zapytanie, które wyświetli ID zakładów, w których pracownicy mają większe zarobki niż minimalne zarobki na stanowisku o id 102.

select distinct department_id from employees where salary > (select min(salary) from employees where position_id = 102);

Napisz zapytanie, które wyświetli wszystkich pracowników, którzy zostali zatrudnieni nie wcześniej niż 
najwcześniej zatrudniony pracownik w zakładzie o id 101 i nie później niż najpóźniej zatrudniony pracownik w zakładzie o id 107.

select * 
from employees 
where date_employed 
     between(
        select min(date_employed)
        from employees
        where department_id = 101
        )
    and(
        select max(date_employed)
        from employees
        where department_id = 107
        );
        
--Napisz zapytanie, które wyświetli wszystkich pracowników, których ID jest większe 
--od wszystkich wartości kolumny MANAGER_ID w tabeli employees
select * 
from employees
where employee_id > ALL(
    select manager_id
    from employees
    );
--w wynikach jest null, ktory psuje mozliwosc porwonania i dostajemy pusta tabele
select distinct manager_id
    from employees;
select * from employees where employee_id > 137;

select * 
from employees
where employee_id > ALL(
    select manager_id 
    from employees
    where manager_id is not null
    );
    
