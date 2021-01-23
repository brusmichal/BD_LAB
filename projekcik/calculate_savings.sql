
--------------------
CREATE OR REPLACE FUNCTION calculate_promo_code_savings (pc_id NUMBER)
RETURN NUMBER
AS 
    CURSOR cr_orders(pc_id NUMBER) IS
        SELECT price FROM orders WHERE promo_code_id = pc_id;
    v_pc_sum NUMBER;
    v_price orders.price%TYPE;

BEGIN
    OPEN cr_orders(pc_id);
    LOOP
        EXIT WHEN cr_orders%NOTFOUND;
        FETCH cr_orders INTO v_price;
        v_pc_sum := v_pc_sum + v_price;
    END LOOP;
    CLOSE cr_orders;
RETURN v_pc_sum;
END;
/
------------------------------
/
CREATE OR REPLACE TRIGGER tg_check_tables
BEFORE INSERT OR UPDATE OF table_id ON orders FOR EACH ROW
WHEN (new.table_id != old.table_id)
DECLARE
v_rest_id NUMBER;

BEGIN

    SELECT t.restaurant_id INTO v_rest_id FROM tables t where t.table_id = :new.table_id;
    IF INSERTING THEN
        IF v_rest_id != :new.restaurant_id THEN
            raise_application_error(-20001, 'Nie ma stolika o id: ' || :new.table_id || ' w restauracji o id: ' || :new.restaurant_id);
        END IF;
    ELSIF UPDATING THEN
        IF v_rest_id != :old.restaurant_id THEN
            raise_application_error(-20001, 'Nie ma stolika o id: ' || :new.table_id || ' w restauracji o id: ' || :old.restaurant_id);
        END IF;
    END IF;
END;
/

            
            
    
        














