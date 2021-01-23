DROP TABLE regions CASCADE CONSTRAINTS;
DROP TABLE countries CASCADE CONSTRAINTS;
DROP TABLE addresses CASCADE CONSTRAINTS;
DROP TABLE positions_history CASCADE CONSTRAINTS;
DROP TABLE emp_status CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE positions CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;

 
CREATE TABLE regions
(
  region_id NUMBER (4) GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 2000 CONSTRAINT reg_PK PRIMARY KEY,
  name VARCHAR2 (40) NOT NULL
);
  
CREATE TABLE countries
(
  country_id NUMBER (4) GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 2000  CONSTRAINT countries_pk PRIMARY KEY,
  name VARCHAR2 (40) NOT NULL ,
  region_id NUMBER (4) NOT NULL CONSTRAINT countries_reg_fk REFERENCES regions (region_id)
 );
  
CREATE TABLE addresses
(
  address_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 2000  CONSTRAINT addr_pk PRIMARY KEY,
  street VARCHAR2 (40) NOT NULL ,
  postal_code VARCHAR2 (40 ) NOT NULL ,
  city VARCHAR2 (40 ) NOT NULL ,
  country_id NUMBER (4) NOT NULL CONSTRAINT addr_country_fk REFERENCES countries (country_id)
 );
  
  
CREATE TABLE positions
(
  position_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 2000  CONSTRAINT pos_pk PRIMARY KEY ,
  name VARCHAR2 (40) NOT NULL ,
  min_salary NUMBER (7,2) ,
  max_salary NUMBER (7,2)
);
  
CREATE TABLE departments
(
  department_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 2000  CONSTRAINT dep_pk PRIMARY KEY  ,
  name VARCHAR2 (40) NOT NULL ,
  established DATE NOT NULL,
  year_budget NUMBER, 
  address_id NUMBER (4) NOT NULL CONSTRAINT dep_addr_fk REFERENCES addresses (address_id) ,
  manager_id NUMBER (4)
);

CREATE TABLE emp_status
(
	status_id NUMBER CONSTRAINT emp_status_pk PRIMARY KEY,
	name VARCHAR2 (30) NOT NULL
);
  
CREATE TABLE employees
(
  employee_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 2000  CONSTRAINT emp_pk PRIMARY KEY,
  name VARCHAR2 (40) NOT NULL ,
  surname VARCHAR2 (40) NOT NULL ,
  birth_date DATE NOT NULL,
  gender CHAR (1) CONSTRAINT emp_gender_check CHECK (gender IN ('K', 'M', 'N')),
  status_id CONSTRAINT emp_emp_status_fk REFERENCES emp_status (status_id),
  salary NUMBER (7,2) ,
  date_employed DATE ,
  department_id NUMBER (4) CONSTRAINT emp_dep_fk REFERENCES departments (department_id) ,
  manager_id NUMBER (4) CONSTRAINT emp_emp_fk REFERENCES employees (employee_id),
  position_id NUMBER (4) CONSTRAINT emp_pos_fk REFERENCES positions (position_id)
);
  
CREATE TABLE positions_history
(
  ph_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 2000  CONSTRAINT ph_pk PRIMARY KEY,
  employee_id NUMBER (4) NOT NULL CONSTRAINT ph_emp_fk REFERENCES employees (employee_id),
  position_id NUMBER (4) NOT NULL CONSTRAINT ph_pos_fk REFERENCES positions (position_id),
  date_start DATE NOT NULL,
  date_end DATE
);

ALTER TABLE departments ADD CONSTRAINT dep_emp_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id) ;







