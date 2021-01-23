INSERT INTO orders (order_id, restaurant_id, table_id, promo_code_id, payment_method_id, order_status_id) VALUES (30, 300, 30, 1, 1, 1) ;
INSERT INTO orders (order_id, restaurant_id, table_id, promo_code_id, payment_method_id, order_status_id) VALUES (31, 300, 31, NULL, 2, 3) ;
INSERT INTO orders (order_id, restaurant_id, table_id, promo_code_id, payment_method_id, order_status_id) VALUES (32, 300, 32, 4, 2, 2) ;
INSERT INTO orders (order_id, restaurant_id, table_id, promo_code_id, payment_method_id, order_status_id) VALUES (33, 300, 33, NULL, 2, 4) ;
INSERT INTO orders (order_id, restaurant_id, table_id, promo_code_id, payment_method_id, order_status_id) VALUES (34, 300, 34, NULL, 3, 1) ;
INSERT INTO orders (order_id, restaurant_id, table_id, promo_code_id, payment_method_id, order_status_id) VALUES (35, 300, 35, 5, 5, 2) ;
select * from tables where restaurant_id =300;

---------------------------------------------------
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (30, 56, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (30, 60, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (30, 72, 1);
---
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (31, 61, 2);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (31, 50, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (31, 69, 2);
----
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (32, 55, 2);
----
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (33, 52, 2);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (33, 50, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (33, 74, 1);
---
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (34, 60, 2);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (34, 54, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (34, 64, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (34, 58, 2);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (34, 68, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (34, 74, 3);
---
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (35, 53, 2);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (35, 51, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (35, 64, 1);
INSERT INTO meals_orders (order_id, meal_id, quantity) VALUES (35, 64, 2);











