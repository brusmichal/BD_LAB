INSERT INTO addresses (address_id, city_id, flat_number, street) VALUES (300, 1, 43, 'Niepodległości');
INSERT INTO restaurants (restaurant_id, address_id, name) VALUES (300, 300, 'Thai Way');
-------------------
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (50, 15, 'Mango sticky rice', 15, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (51, 15, 'Naleśniki z papają', 13, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (52, 4, 'Pad thai', 25, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (53, 1, 'Zielone curry z kurczakiem', 27, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (54, 5, 'Zupa Tom Yam', 13, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (55, 4, 'Smażony makaron', 20, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (56, 2, 'Sping Rolls', 10, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (57, 5, 'Zupa-krem z marchwi z imbirem', 17, 300, 'N');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (58, 1, 'Krewetki w sosie pomarańczowym z limonką', 22, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (59, 2, 'Sałatka z krewetkami', 18, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (60, 1, 'Ryż smażony', 24, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (61, 1, 'Czerwone curry', 15, 300, 'N');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (62, 1, 'Wołowina w sosie ostrygowym', 30, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (63, 1, 'Kurczak w ziołach', 26, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (64, 1, 'Wieprzowina w sosie słodko-kwaśnym', 28, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (65, 13, 'Woda kokosowa', 8, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (66, 13, 'Fruit Shake', 10, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (67, 13, 'Iced Tea', 12, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (68, 13, 'Zielona herbata', 7, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (69, 13, 'Czerwona herbata', 7, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (70, 13, 'Biała herbata', 7, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (71, 13, 'Coca cola', 5, 300, 'N');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (72, 13, 'Sprite', 5, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (73, 13, 'Mirinda', 5, 300, 'Y');
INSERT INTO meals (meal_id, food_category_id, name, price, restaurant_id, is_available) VALUES (74, 13, 'Pepsi', 5, 300, 'Y');
------------------------------------------
INSERT INTO tables (table_id, restaurant_id, seats_number) VALUES (30, 300, 2);
INSERT INTO tables (table_id, restaurant_id, seats_number) VALUES (31, 300, 2);
INSERT INTO tables (table_id, restaurant_id, seats_number) VALUES (32, 300, 2);
INSERT INTO tables (table_id, restaurant_id, seats_number) VALUES (33, 300, 2);
INSERT INTO tables (table_id, restaurant_id, seats_number) VALUES (34, 300, 4);
INSERT INTO tables (table_id, restaurant_id, seats_number) VALUES (35, 300, 4);
INSERT INTO tables (table_id, restaurant_id, seats_number) VALUES (36, 300, 6);
INSERT INTO tables (table_id, restaurant_id, seats_number) VALUES (37, 300, 10);
--------------------------------------------
INSERT INTO users (user_id, restaurant_id, name, surname, mail, user_role_id) VALUES (31, 300, 'Wojciech', 'Radomski', 'w.radomski@gmail.com', 1);
INSERT INTO users (user_id, restaurant_id, name, surname, mail, user_role_id) VALUES (32, 300, 'Barbara', 'Więcławska', 'basiaw_90@onet.pl', 2);
INSERT INTO users (user_id, restaurant_id, name, surname, mail, user_role_id) VALUES (33, 300, 'Olga', 'Fekula', 'fekula.olga@outlook.com', 3);
INSERT INTO users (user_id, restaurant_id, name, surname, mail, user_role_id) VALUES (34, 300, 'Maciej', 'Borowski', 'borowmaciek@yahoo.com', 2);
INSERT INTO users (user_id, restaurant_id, name, surname, mail, user_role_id) VALUES (35, 300, 'Jakub', 'Rydz', 'Jakub_r79@interia.pl', 3);
INSERT INTO users (user_id, restaurant_id, name, surname, mail, user_role_id) VALUES (36, 300, 'Franciszek', 'Przywar', 'f.przywar@gmail.com', 4);
INSERT INTO users (user_id, restaurant_id, name, surname, mail, user_role_id) VALUES (37, 300, 'Katarzyna', 'Upocka', 'upocka_kasia@icloud.com', 2);
INSERT INTO users (user_id, restaurant_id, name, surname, mail, user_role_id) VALUES (38, 300, 'Stanisław', 'Lewicki', 'stas_lewi@gmail.com', 6);
-----------------------------------------------

