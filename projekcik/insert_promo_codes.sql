INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (1, '10% rabatu', 0.1, 0);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (2, '50% rabatu', 0.5, 0);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (3, '10 zł rabatu', 0, 10);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (4, '20 zł rabatu', 0, 20);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (5, '30 zł rabatu', 0, 30);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (6, '50 zł rabatu', 0, 50);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (7, '25% rabatu', 0.25, 0);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (8,'Posiłek pracowniczy (-100%)', 1, 0);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (9, 'Rabat dla pracownika (33%)', 0.33, 0);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (10,'Student/uczeń (15%)', 0.15, 0);
INSERT INTO promo_codes (promo_code_id, name, percentage_discount, raw_discount) VALUES (11, 'Karta dużej rodziny (20%)', 0.2, 0);
--------------------------------------
INSERT INTO cities (city_id, name) VALUES (1, 'Warszawa');
INSERT INTO cities (city_id, name) VALUES (2, 'Kraków');
INSERT INTO cities (city_id, name) VALUES (3, 'Poznań');
INSERT INTO cities (city_id, name) VALUES (4, 'Łódź');
INSERT INTO cities (city_id, name) VALUES (5, 'Gdańsk');
INSERT INTO cities (city_id, name) VALUES (6, 'Lublin');
INSERT INTO cities (city_id, name) VALUES (7, 'Wrocław');
INSERT INTO cities (city_id, name) VALUES (8, 'Szczecin');
-------------------------------------------
INSERT INTO payment_method (payment_method_id, name) VALUES (1, 'Gotówka');
INSERT INTO payment_method (payment_method_id, name) VALUES (2, 'Karta płatnicza');
INSERT INTO payment_method (payment_method_id, name) VALUES (3, 'BLIK');
INSERT INTO payment_method (payment_method_id, name) VALUES (4, 'Czek');
INSERT INTO payment_method (payment_method_id, name) VALUES (5, 'Przelew');

