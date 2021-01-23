DECLARE 
    v_id      NUMBER := 102; 
    v_name    VARCHAR2 (50); 
    v_surname employees.surname%TYPE; 
    v_employee employees%ROWTYPE;
    c_magic CONSTANT NUMBER := 10; 
BEGIN 
    dbms_output.put_line('Employee with id ' || v_id || ' has name ' || v_name || ' ' || v_surname); 

    SELECT name, surname  INTO  v_name, v_surname 
    FROM   employees WHERE  employee_id = v_id; 
    dbms_output.put_line('Employee with id ' || v_id || ' has name ' || v_name || ' ' || v_surname); 

    v_id := v_id + LENGTH(v_surname) + c_magic; 

    SELECT * INTO v_employee from employees WHERE employee_id = v_id;
    dbms_output.put_line('Employee with id ' ||  v_id || ' has name ' || v_employee.name || ' ' ||      v_employee.surname);
INSERT INTO countries (country_id,name, region_id) VALUES (125, 'Islandia', 101); 
COMMIT;
END;
/
SELECT * FROM COUNTRIES WHERE name = 'Islandia';


CREATE OR replace FUNCTION calculate_seniority_bonus(p_id NUMBER) 
RETURN NUMBER 
AS 
  v_age NUMBER; v_yrs_employed NUMBER;
  v_birth_date DATE;  v_date_employed DATE; v_salary NUMBER;
  v_bonus NUMBER := 0;
  c_sal_multiplier CONSTANT NUMBER := 2;
  c_age_min CONSTANT NUMBER := 30; 
  c_emp_min CONSTANT NUMBER := 3;
BEGIN 
    SELECT birth_date, date_employed, salary INTO v_birth_date, v_date_employed, v_salary
    FROM employees WHERE employee_id=p_id;
    
    v_age := EXTRACT (year from sysdate) - EXTRACT (year from v_birth_date);
    v_yrs_employed := EXTRACT (year from sysdate) - EXTRACT (year from v_date_employed);
    
    IF v_age > c_age_min AND v_yrs_employed > c_emp_min THEN 
      v_bonus := c_sal_multiplier * v_salary; 
    END IF; 

    RETURN v_bonus; 
END; 
/

SELECT calculate_seniority_bonus(104)
FROM dual;

SELECT e.*, calculate_seniority_bonus (employee_id)
FROM employees e ;

SELECT d.name, COUNT (employee_id) as liczba, NVL(TO_CHAR(MAX(calculate_seniority_bonus(employee_id))),'BRAK BONUSU') as max_bonus
FROM employees e RIGHT JOIN departments d USING (department_id)
GROUP BY d.name
ORDER BY 2 DESC;



BEGIN
dbms_output.put_line('Wynik dla 105:' || calculate_seniority_bonus(105));
END;
/


SELECT e1.*,calculate_seniority_bonus(e1.employee_id)
FROM employees e1
WHERE calculate_seniority_bonus(e1.employee_id) > 0
ORDER BY calculate_seniority_bonus(e1.employee_id) DESC;

SELECT calculate_seniority_bonus(employee_id), count(*)
FROM employees e join emp_status s using (status_id)
WHERE s.name NOT IN ('Kandydat', 'Emeryt')
GROUP BY calculate_seniority_bonus(employee_id)
ORDER BY 1 DESC;



SELECT d.department_id, MAX(calculate_seniority_bonus(e.employee_id))
FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id
ORDER BY 2 desc;




/*Napisz funkcję, która wyliczy dodatek funkcyjny dla kierowników zespołóww.
Dodatek funkcyjny powinien wynosić 10% pensji za każdego podległego pracownika, 
ale nie może przekraczać 50% miesięcznej pensji.*/
/

CREATE OR replace FUNCTION manager_bonus(p_id NUMBER) 
RETURN NUMBER 
AS 
    v_salary employees.salary%TYPE;
    v_sub_emps NUMBER;
    v_bonus NUMBER := 0;
    c_multiplier NUMBER := 0.1;
    c_limit NUMBER := 0.5;
BEGIN
    SELECT e.salary,(SELECT COUNT(*) FROM employees e1 WHERE e1.manager_id = p_id) 
    INTO v_salary, v_sub_emps
    FROM employees e
    WHERE e.employee_id = p_id;
    
    IF v_sub_emps >= 1 THEN 
        v_bonus := c_multiplier * v_salary * v_sub_emps;
        v_bonus := LEAST(v_bonus, c_limit * v_salary);
    END IF;
    
    RETURN v_bonus;
END;
/


SELECT name, surname, salary, (SELECT COUNT(*) FROM employees e1 WHERE e1.manager_id = e.employee_id) AS SUB_EMP,
manager_bonus(e.employee_id) AS Bonus 
FROM employees e
ORDER BY 4 desc;


/
CREATE OR REPLACE PROCEDURE add_candidate (p_name VARCHAR2, p_surname VARCHAR2, p_birth_date DATE, p_gender VARCHAR2, p_pos_name VARCHAR2, p_dep_name VARCHAR2)
AS
    v_pos_id NUMBER; v_dep_id NUMBER; v_cand_num NUMBER;
    c_candidate_status CONSTANT NUMBER := 304; c_num_max CONSTANT NUMBER := 2;
BEGIN
    SELECT position_id INTO v_pos_id FROM positions WHERE name=p_pos_name;
    SELECT department_id INTO v_dep_id FROM departments WHERE name = p_dep_name;
    SELECT COUNT(employee_id) INTO v_cand_num FROM employees WHERE department_id = v_dep_id and status_id = c_candidate_status;
    IF v_cand_num < c_num_max THEN
        INSERT INTO employees VALUES(NULL, p_name, p_surname, p_birth_date, p_gender, c_candidate_status, null, null, v_dep_id, v_pos_id,null); 
        commit;
        dbms_output.put_line ('Dodano kandydata ' || p_name || ' ' || p_surname);
    ELSE 
        dbms_output.put_line ('Za duzo kandydatów w departamencie: ' || p_dep_name);
    END IF;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line ('Niepoprawna nazwa stanowiska i/lub zakładu');
        RAISE;
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line ('Nieunikalna nazwa stanowiska i/lub zakładu');
        RAISE;
END;
/
/
EXEC add_candidate('Olga', 'Sapiechowska', SYSDATE, 'K', 'Programista', 'Grafika222');
/
select * from employees WHERE name = 'Olga';
/
begin
add_candidate ('Jan', 'Janowski', sysdate, 'M', 'Programista', 'Produkcja');
end;
/


/*Napisz procedurę, która wykona zmianę stanowiska pracownika. 
Procedura powinna przyjmować identyfikator pracownika oraz identyfikator jego nowego stanowiska.*/
/
CREATE OR REPLACE PROCEDURE update_position (p_id NUMBER, p_new_pos_id NUMBER)
AS
    v_previous_pos_id NUMBER;
    v_date_start DATE;
    v_date_max DATE;
    v_date_empl DATE;
    
BEGIN

    SELECT position_id, date_employed INTO v_previous_pos_id, v_date_empl
    FROM employees
    WHERE employee_id = p_id;
    
    IF p_new_pos_id = v_previous_pos_id THEN
        RETURN;
    END IF;
    
    UPDATE employees SET position_id = p_new_pos_id
    WHERE employee_id = p_id;
    
    
    SELECT MAX(date_end) INTO v_date_max
    FROM positions_history
    WHERE employee_id = p_id;
    
    IF v_date_max IS NULL THEN
        v_date_start := v_date_empl;
    ELSE
        v_date_start := v_date_max;
    END IF;
    
    INSERT INTO positions_history VALUES (NULL, p_id, v_previous_pos_id, v_date_start, SYSDATE);
    COMMIT;
END;
/
    




