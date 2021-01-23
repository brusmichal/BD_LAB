CREATE OR REPLACE TRIGGER tg_emp_ph
AFTER UPDATE OF position_id ON employees FOR EACH ROW
WHEN (new.position_id != old.position_id)
DECLARE
v_date_start DATE ;
BEGIN
SELECT MAX(date_end) INTO v_date_start FROM positions_history where employee_id=:old.employee_id;

IF v_date_start IS NULL THEN
v_date_start := :old.date_employed;
END IF;

INSERT INTO positions_history
VALUES (NULL, :old.employee_id, :old.position_id, v_date_start, SYSDATE);
END;
/
UPDATE employees SET position_id = 110 WHERE employee_id = 111;

SELECT *
FROM positions_history
WHERE employee_id = 111;

/
CREATE OR REPLACE TRIGGER tg_salary_emp
BEFORE INSERT or UPDATE ON employees FOR EACH ROW
DECLARE 
    v_min_sal positions.min_salary%TYPE;
    v_max_sal positions.max_salary%TYPE;
BEGIN
    SELECT min_salary, max_salary INTO v_min_sal, v_max_sal
    FROM positions WHERE position_id = :new.position_id;
    
    IF INSERTING THEN
        IF :new.salary NOT BETWEEN v_min_sal AND v_max_sal
            THEN 
                dbms_output.put_line('Zarobki pracownika spoza zakresu płac: ' || v_min_sal || ' ' || v_max_sal);
                raise_application_error(-20001, 'Przekroczony zakres płacy');
            END IF;
    
    ELSE
        IF :new.salary NOT BETWEEN v_min_sal AND v_max_sal
            THEN
            :new.salary := v_min_sal;
        END IF;
    END IF;
    
END;
/



UPDATE employees SET salary = 0 WHERE employee_id IN (105, 106, 107);
SELECT * FROM employees WHERE employee_id IN (105, 106, 107);

--Stwórz wyzwalacz, który dla każdego nowego pracownika nieposiadającego managera, 
--ale zatrudnionego w departamencie, przypisze temu pracownikowi managera 
--będącego jednocześnie managerem departamentu w którym ten pracownik pracuje.
--Wykorzystaj klauzulę WHEN wyzwalacza. Przetestuj działanie.

/
CREATE OR REPLACE TRIGGER tg_emp_no_man
BEFORE INSERT ON employees FOR EACH ROW
WHEN (new.manager_id IS NULL AND new.department_id IS NOT NULL)
DECLARE
    v_dep_manager_id departments.manager_id%TYPE;
BEGIN

    SELECT manager_id INTO v_dep_manager_id FROM departments WHERE department_id = :new.department_id;
    :new.manager_id := v_dep_manager_id;
END;
/

INSERT INTO employees (Name, Surname, Birth_Date, department_id) VALUES ('Tomasz', 'Bolej', sysdate, 101);
SELECT * FROM employees WHERE name='Tomasz' AND surname='Bolej';
/

--Stwórz wyzwalacz, który po dodaniu nowego pracownika, usunięciu pracownika lub 
--modyfikacji zarobków pracowników wyświetli aktualne średnie zarobki wszystkich pracowników. 
--Przetestuj działanie.
/
CREATE OR REPLACE TRIGGER tg_new_emp
AFTER INSERT or DELETE or UPDATE ON employees
DECLARE
    emp_avg_sal employees.salary%TYPE;
BEGIN
    SELECT AVG(salary) INTO emp_avg_sal FROM employees;
    dbms_output.put_line(' ' || emp_avg_sal);
END;
/
INSERT INTO employees (Name, Surname, Birth_Date, department_id, salary) VALUES ('Michał', 'Ogor', sysdate, 101, 5000);
UPDATE employees SET salary=5000 WHERE manager_id IS NULL;

-------------------------------------------
/
DECLARE
CURSOR cr IS 
    SELECT * FROM employees;
v_rec_employees employees%ROWTYPE;

BEGIN
  OPEN cr;
  LOOP
    EXIT WHEN cr%NOTFOUND OR cr%ROWCOUNT =5;
    FETCH cr INTO v_rec_employees;
    dbms_output.put_line('Podstawowe dane pracownika: ' ||  v_rec_employees.name || ' ' ||
    v_rec_employees.surname || ' ' || v_rec_employees.salary || ' ' ||
    v_rec_employees.salary || ' ' || 'Podatek: ' || 0.2*v_rec_employees.salary);
  END LOOP;
  CLOSE cr;
END;
--------------------------------------------
/
DECLARE
CURSOR cr(dep_id NUMBER) IS 
    SELECT * FROM employees WHERE department_id = dep_id;
    

BEGIN
    FOR v_rec_employees IN  cr(110)
    LOOP
        dbms_output.put_line('Podstawowe dane pracownika: ' ||  v_rec_employees.name || ' ' ||
         v_rec_employees.surname || ' ' || v_rec_employees.salary || ' ' ||
         v_rec_employees.salary || ' ' || 'Podatek: ' || 0.2*v_rec_employees.salary);
  END LOOP;
END;
/

--Wykorzystując kursor niejawny oraz deklaracje zmiennych/stałych podnieś o 
--2% pensje wszystkim pracownikom zatrudnionymw przeszłości 
--(tzn. przed aktualnym stanowiskiem pracy) na co najmniej dwóch stanowiskach pracy.
/
BEGIN
    FOR r_emp IN (SELECT employee_id FROM employees JOIN positions_history USING (employee_id) GROUP BY employee_id HAVING COUNT(employee_id) >= 1)
    LOOP
        UPDATE employees SET salary = 1.02*salary WHERE employee_id = r_emp;
    END LOOP;
END;
 /       
        






