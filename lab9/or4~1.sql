--Wykorzystując kursor niejawny oraz deklaracje zmiennych/stałych podnieś o 
--2% pensje wszystkim pracownikom zatrudnionymw przeszłości 
--(tzn. przed aktualnym stanowiskiem pracy) na co najmniej dwóch stanowiskach pracy.

BEGIN
    FOR r_emp IN (SELECT employee_id FROM employees JOIN positions_history USING (employee_id) GROUP BY employee_id HAVING COUNT(employee_id) >= 1)
    LOOP
        UPDATE employees SET salary = 1.02*salary WHERE employee_id = r_emp.employee_id;
    END LOOP;
END;
 /       
SELECT employee_id FROM employees JOIN positions_history USING (employee_id) GROUP BY employee_id HAVING COUNT(employee_id) >= 1      