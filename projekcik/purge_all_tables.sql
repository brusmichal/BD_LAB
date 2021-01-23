select 'drop table ', table_name, 'cascade constraints;' from user_tables;

drop table 	FOOD_CATEGORIES	cascade constraints;
drop table 	ORDER_STATUSES	cascade constraints;
drop table 	ADDRESSES	cascade constraints;
drop table 	RESTAURANTS	cascade constraints;
drop table 	TABLES	cascade constraints;
drop table 	MEALS	cascade constraints;
drop table 	ORDERS	cascade constraints;
drop table 	MEALS_ORDERS	cascade constraints;
drop table 	PROMO_CODES	cascade constraints;
drop table 	PAYMENT_METHOD	cascade constraints;
drop table 	ALLERGENS	cascade constraints;
drop table 	CITIES	cascade constraints;
drop table 	MEALS_ALLERGENS	cascade constraints;
drop table 	USERS	cascade constraints;
drop table 	USER_ROLES	cascade constraints;