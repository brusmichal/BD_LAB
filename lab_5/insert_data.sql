INSERT INTO regions VALUES (101, 'EUROPA');
INSERT INTO regions VALUES (102, 'AFRYKA');
INSERT INTO regions VALUES (103, 'AMERYKA PN');
INSERT INTO regions VALUES (104, 'AMERYKA PŁN');
INSERT INTO regions VALUES (105, 'AMERYKA PD');
INSERT INTO regions VALUES (106, 'BLISKI WSCHÓD');
INSERT INTO regions VALUES (107, 'DALEKI WSCHÓD');
INSERT INTO regions VALUES (108, 'AUSTRALIA');
commit;

-------------------

INSERT INTO countries VALUES (101, 'WIELKA BRYTANIA', 66.6, 'angielski', 'GBP', 101);
INSERT INTO countries VALUES (102, 'NIEMCY', 83.02, 'niemiecki', 'EUR', 101);
INSERT INTO countries VALUES (103, 'FRANCJA', 66.99, 'francuski', 'EUR', 101);
INSERT INTO countries VALUES (104, 'POLSKA', 37.97, 'polski', 'PLN', 101);
INSERT INTO countries VALUES (105, 'CZECHY', 10.69, 'czeski', 'CZK', 101);
INSERT INTO countries VALUES (106, 'LITWA', 2.79, 'litewski', 'EUR', 101);
INSERT INTO countries VALUES (107, 'UKRAINA', 41.98, 'ukraiński', 'UAH', 101);
INSERT INTO countries VALUES (108, 'SLOWACJA', 5.45, 'słowacki', 'EUR', 101);
INSERT INTO countries VALUES (109, 'NORWEGIA', 5.43, 'norweski', 'NOK', 101);
INSERT INTO countries VALUES (110, 'SZWECJA', 10.23, 'szwedzki', 'SEK', 101);
INSERT INTO countries VALUES (111, 'FINLANDIA', 5.58, 'fiński', 'EUR', 101);
INSERT INTO countries VALUES (112, 'HISZPANIA', 46.94, 'hiszpański', 'EUR', 101);
INSERT INTO countries VALUES (113, 'RPA', 57.78, 'angielski', 'ZAR', 102);
INSERT INTO countries VALUES (114, 'EGIPT', 98.42, 'arabski', 'EGP', 102);
INSERT INTO countries VALUES (115, 'IZRAEL', 8.88, 'hebrajski', 'ILS', 106);
INSERT INTO countries VALUES (116, 'IRAK', 38.43, 'arabski', 'IQD', 106);
INSERT INTO countries VALUES (117, 'TURCJA', 82 ,'turecki' , 'TRY', 106);
INSERT INTO countries VALUES (118, 'USA', 328.2, 'angielski', 'USD', 103);
INSERT INTO countries VALUES (119, 'KANADA', 37.59, 'angielski', 'CAD', 103);
INSERT INTO countries VALUES (120, 'BRAZYLIA', 209.5, 'portugalski', 'BRL', 105);
INSERT INTO countries VALUES (121, 'ARGENTYNA', 44.49, 'hiszpański', 'ARS', 105);
INSERT INTO countries VALUES (122, 'CHINY', 1393, 'chiński', 'CNY', 107);
INSERT INTO countries VALUES (123, 'JAPONIA', 126.5, 'japoński', 'JPY', 107);
INSERT INTO countries VALUES (124, 'KOREA PD', 51.64, 'koreański', 'KRW', 107);
commit;

----------------

INSERT INTO addresses VALUES (1001, 'Miodowa', '00-123', 'WARSZAWA', 104);
INSERT INTO addresses VALUES (1002, 'Koszykowa', '12-234', 'KRAKOW', 104);
INSERT INTO addresses VALUES (1003, 'Czechowa', '32-112', 'TORUN', 104);
INSERT INTO addresses VALUES (1004, 'Hoża', '55-123', 'POZNAN', 104);
INSERT INTO addresses VALUES (1005, 'Oxford Street', '23AB1', 'LONDYN', 101);
INSERT INTO addresses VALUES (1006, 'Kreisfreie Stat', '10115', 'BERLIN', 102);
INSERT INTO addresses VALUES (1007, 'Rue Foobar', '75722', 'PARYZ', 103);
INSERT INTO addresses VALUES (1008, 'Obchodni', 'CZ251', 'PRAGA', 105);
INSERT INTO addresses VALUES (1009, 'Vienuolio', '00004', 'WILNO', 106);
INSERT INTO addresses VALUES (1010, 'Zythomyra', '03000-123' ,'KIJOW', 107);
INSERT INTO addresses VALUES (1011, 'Chester Road', '09622', 'MANCHESTER', 101);
INSERT INTO addresses VALUES (1012, 'Spadina Ave', 'm5V 2L7', 'TORONTO', 119);
INSERT INTO addresses VALUES (1013, 'Boxwood St', 'm56 2k1', 'TORONTO', 119);
INSERT INTO addresses VALUES (1014, 'ALBERTA ST', 'm66 24a', 'TORONTO', 119);
INSERT INTO addresses VALUES (1015, 'Back ST', '23A123', 'Sao Paulo' , 118);
INSERT INTO addresses VALUES (1016, '2014 Jabberwocky Rd', '26192', 'Southlake', 118);
INSERT INTO addresses VALUES (1017, '2011 Interiors Blvd', '99236', 'South San Francisco', 118);
INSERT INTO addresses VALUES (1018, '2007 Zagora St', '50090', 'South Brunswick', 118);
INSERT INTO addresses VALUES (1019, '2004 Charade Rd', '98199', 'Seattle', 118);
INSERT INTO addresses VALUES (1020, '2017 Shinjuku-ku', '1689', 'Tokyo', 123);
commit;
------------------


ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

INSERT INTO departments VALUES (101, 'Administracja', '01/02/2004', 2000000, 1001, null);
INSERT INTO departments VALUES (102, 'Marketing', '01/02/2004', 6900000, 1001, null);
INSERT INTO departments VALUES (103, 'Kadry', '01/02/2004', 4200000,1002, null);
INSERT INTO departments VALUES (104, 'Wsparcie IT', '01/02/2006', 5500000, 1002, null);
INSERT INTO departments VALUES (105, 'Sprzedaż', '01/02/2004', 8005000, 1013, null);
INSERT INTO departments VALUES (106, 'Produkcja', '01/02/2004', 10007000, 1013, null);
INSERT INTO departments VALUES (107, 'Kierownictwo', '01/02/2004', 20000000, 1014, null);
INSERT INTO departments VALUES (108, 'Finanse', '01/02/2004', 1900000, 1015, null);
INSERT INTO departments VALUES (109, 'Benefity', '01/02/2008', 900000, 1016, null);
INSERT INTO departments VALUES (110, 'Helpdesk', '01/02/2006', 4700000,1018, null);
INSERT INTO departments VALUES (111, 'Kontrakty', '01/02/2004', 2500000, 1019, null);
INSERT INTO departments VALUES (112, 'Techniczny', '01/02/2004', 3300000, 1019, null);
INSERT INTO departments VALUES (113, 'Rekrutacja', '01/02/2007', 100000, 1007, null);
INSERT INTO departments VALUES (114, 'Operacyjny', '01/02/2004', 980000, 1008, null);
INSERT INTO departments VALUES (115, 'Planistyczny', '01/02/2007', 2300000, 1008, null);
INSERT INTO departments VALUES (116, 'Kontrolny', '01/02/2004', 800000, 1005, null);
INSERT INTO departments VALUES (117, 'Produkcja IT', '01/02/2007', 10000000, 1002, null);
INSERT INTO departments VALUES (118, 'Grafika', '01/02/2008', 4600000, 1005, null);
INSERT INTO departments VALUES (119, 'Wdrożenia', '01/02/2008', 3200000, 1009, null);
commit;
---------------------

INSERT INTO positions VALUES (101, 'Programista', 2000, 7000);
INSERT INTO positions VALUES (102, 'Konsultant', 1000, 5500);
INSERT INTO positions VALUES (103, 'Kadrowy', 1000, 4000);
INSERT INTO positions VALUES (104, 'Manager marketingowy', 1000, 3000);
INSERT INTO positions VALUES (105, 'Reprezentant', 1500, 4500);
INSERT INTO positions VALUES (106, 'Techniczny', 1300, 3000);
INSERT INTO positions VALUES (107, 'Wdrozeniowiec', 1400, 5000);
INSERT INTO positions VALUES (108, 'Pracownik RD', 2400, 9000);
INSERT INTO positions VALUES (109, 'Rekruter', 3000, 7000);
INSERT INTO positions VALUES (110, 'Public Relations', 3000, 7000);
INSERT INTO positions VALUES (111, 'Lider zespolu', 4000, 9000);
INSERT INTO positions VALUES (112, 'Kierowca', 1000, 2500);
INSERT INTO positions VALUES (113, 'Administracyjny', 2000, 4000);
INSERT INTO positions VALUES (114, 'Grafik', 2000, 7000);
INSERT INTO positions VALUES (115, 'Szkoleniowiec', 1500, 4000);
INSERT INTO positions VALUES (116, 'Analityk', 2500, 9000);
INSERT INTO positions VALUES (117, 'Projektant', 2500, 9000);
commit;

-------------------------


INSERT INTO emp_status VALUES (301, 'Zatrudniony');
INSERT INTO emp_status VALUES (302, 'Zwolniony');
INSERT INTO emp_status VALUES (303, 'Emeryt');
INSERT INTO emp_status VALUES (304, 'Kandydat');
INSERT INTO emp_status VALUES (305, 'Urlop macierzyński');
commit;


INSERT INTO employees VALUES (101, 'Piotr', 'Maciejewski', '20/08/1982', 'M', 301, 3000, '01/01/2009', 101, NULL, 101);
INSERT INTO employees VALUES (102, 'Piotr', 'Janowski', '15/04/1980', 'M', 301, 3000, '01/01/2009', 102, 101, 102);
INSERT INTO employees VALUES (103, 'Andrzej', 'King', '10/01/1989', NULL, 301,1500, '01/01/2009', 102, 101, 103);
INSERT INTO employees VALUES (104, 'Lex', 'Kochhar', '11/11/1985', NULL, 301, 2000, '15/04/2009', 102, 101, 104);
INSERT INTO employees VALUES (105, 'Alexander', 'Hunold', '11/11/1987', 'M', 301, 3000, '15/04/2009', 103, 101, 105);
INSERT INTO employees VALUES (106, 'Tracy', 'Hunold', '11/12/1986', 'M', 305, 2000, '15/04/2009', 103, 102, 106);
INSERT INTO employees VALUES (107, 'David', 'Ernst', '03/02/1980', 'M', 301, 4500, '15/04/2009', 104, NULL, 107);
INSERT INTO employees VALUES (108, 'Valli', 'Austin', '11/09/1987', 'K', 301, 4000, '15/04/2009', 104, 107, 108);
INSERT INTO employees VALUES (109, 'Diana', 'Pataballa', '19/10/1986', 'K', 301, 6000, '15/04/2009', 104, 107, 109);
INSERT INTO employees VALUES (110, 'Nancy', 'Lorentz', '10/07/1983', 'K', 301, 5000, '16/05/2009', 105, 107, 110);
INSERT INTO employees VALUES (111, 'Daniel', 'Greenberg', '11/11/1986', 'M', 301, 7000, '16/05/2009', 104, 107, 111);
INSERT INTO employees VALUES (112, 'John', 'Faviet', '09/06/1987', 'M', 301, 1200, '11/11/2010', 105, NULL, 112);
INSERT INTO employees VALUES (113, 'Ismael', 'Chen', '06/11/1988', 'K', 301, 3300, '11/11/2010', 105, 112, 113);
INSERT INTO employees VALUES (114, 'Jose Manuel', 'Sciarra', '02/01/1981', 'M', 301, 3036, '11/11/2010', 101, 112, 114);
INSERT INTO employees VALUES (115, 'Luis', 'Urman', '31/12/1979', 'M', 301, 2700, '11/11/2010', 112, 112, 115);
INSERT INTO employees VALUES (116, 'Luis', 'Popp', '04/10/1978', NULL, 301, 5000, '11/11/2010', 112, NULL, 116);
INSERT INTO employees VALUES (117, 'Den', 'Raphaely', '07/05/1987', 'M', 301, 4000, '11/11/2010', 113, 116, 117);
INSERT INTO employees VALUES (118, 'Alex', 'Khoo', '10/10/1990', 'K', 301, 3000, '11/11/2010', 113, 116, 101);
INSERT INTO employees VALUES (119, 'Shelli', 'Baida', '12/08/1991', 'K', 301,2500, '20/11/2011', 114, 116, 102);
INSERT INTO employees VALUES (120, 'Sigal', 'Tobias', '01/03/1990', 'K', 301, 1500, '20/11/2011', 114, 116, 103);
INSERT INTO employees VALUES (121, 'Guy', 'Himuro', '18/01/1977', 'M', 301, 1500, '20/11/2011', 111, NULL, 104);
INSERT INTO employees VALUES (122, 'Karen', 'Himuro', '09/10/1976', 'K', 301,  2100, '02/02/2012', 110, 121, 105);
INSERT INTO employees VALUES (123, 'Matthew', 'Colmenares', '16/07/1983', 'N', 301, 2200, '02/02/2012', 111, 121, 106);
INSERT INTO employees VALUES (124, 'Adam', 'Weiss', '07/05/1976', 'M', 301, 2300, '02/02/2012', 108, 121, 107);
INSERT INTO employees VALUES (125, 'Adam', 'Fripp', '03/12/1978', 'M', 301, 4200, '14/03/2012', 109, NULL, 108);
INSERT INTO employees VALUES (126, 'Kevin', 'Kaufling', '05/08/1990', 'M', 301, 4300, '14/03/2012', 107, 126, 109);
INSERT INTO employees VALUES (127, 'Julia', 'Vollman', '20/11/1988', 'K', 301,4500, '14/06/2012', 107, 126, 110);
INSERT INTO employees VALUES (128, 'Irene', 'Janowski', '11/01/1990', 'K', 305,4200, '14/06/2012', 107, 126, 111);
INSERT INTO employees VALUES (129, 'Steven', 'Mourgos', '06/04/1985', 'M', 301, 2300, '14/06/2012', 115, 128, 112);
INSERT INTO employees VALUES (130, 'Steven', 'Janowski', '29/10/1988', 'M', 301,3100, '01/09/2012', 115, 128, 113);
INSERT INTO employees VALUES (131, 'Mozhe', 'Nayer', '30/08/1978', NULL, 301, 3250, '01/09/2012', 116, 128, 114);
INSERT INTO employees VALUES (132, 'James', 'Mikkilineni', '30/11/1987', 'M', 301, 4100, '01/09/2012', 116, 128, 111);
INSERT INTO employees VALUES (133, 'Jason', 'Landry', '31/01/1980', 'M', 301, 1200, '01/09/2012', 117, 128, 112);
INSERT INTO employees VALUES (134, 'Michael', 'Markle', '12/04/1987', 'M', 301, 3000, '01/10/2012', 116, 128, 113);
INSERT INTO employees VALUES (135, 'Ki', 'Bissot', '27/09/1980', 'K', 301, 3000, '01/10/2012', 116, 128, 114);
INSERT INTO employees VALUES (136, 'Renske', 'Atkinson', '25/03/1980', 'M', 301, 4200, '01/10/2012', 116, NULL, 111);
INSERT INTO employees VALUES (137, 'Stephen', 'Atkinson', '29/11/1986', 'M', 301, 2200, '01/10/2012', 117, 137, 102);
INSERT INTO employees VALUES (138, 'John', 'Marlow', '11/11/1980', 'N', 301, 2300, '01/01/2013', 111, 137, 103);
INSERT INTO employees VALUES (139, 'Joshua', 'Olson', '31/08/1977', 'M', 301, 3000, '01/01/2013', 113, 137, 103);
INSERT INTO employees VALUES (141, 'Trenna', 'Mallin', '15/07/1979', 'K', 301, 2900, '01/01/2013', 112, 137, 104);
INSERT INTO employees VALUES (142, 'Randall', 'Rogers', '28/01/1987', 'M', 301,3000, '01/04/2013', 112, 137, 105);
INSERT INTO employees VALUES (143, 'Peter', 'Gee', '30/10/1980', 'M', 301, 2090, '04/04/2013', 105, 137, 104);
INSERT INTO employees VALUES (144, 'John', 'Philtanker', '28/09/1979', 'M', 301, 3000, '01/04/2014', 116, 137, 102);

INSERT INTO employees VALUES (145, 'Mateusz', 'Mikke', '15/07/1999', 'M', 304, NULL, NULL, 101, NULL, NULL);
INSERT INTO employees VALUES (146, 'Adam', 'Bosak', '28/01/2000', 'M', 304,NULL, NULL, 101, NULL, NULL);
INSERT INTO employees VALUES (147, 'Łukasz', 'Budka', '30/10/1990', 'M', 304, NULL, NULL, 105, NULL, NULL);
INSERT INTO employees VALUES (148, 'Jadwiga', 'Nowacka', '28/09/1981', 'K', 304, NULL, NULL, 116, NULL, NULL);
INSERT INTO employees VALUES (149, 'Beata', 'Mucha', '15/07/1989', 'K', 304, NULL, NULL, 112, NULL, NULL);
INSERT INTO employees VALUES (150, 'Bartosz', 'Pawlak', '28/01/1991', 'M', 304,NULL, NULL, 112, NULL, NULL);
INSERT INTO employees VALUES (151, 'Jarosław', 'Miller', '30/10/2001', 'M', 304, NULL, NULL, 105, NULL, NULL);
INSERT INTO employees VALUES (152, 'Krzysztof', 'Schetyna', '28/09/1999', 'M', 304, NULL, NULL, 116, NULL, NULL);

INSERT INTO employees VALUES (153, 'Ludwik', 'Wiśniewski', '28/01/1951', 'M', 303, NULL, '01/01/2005', NULL, NULL, NULL);
INSERT INTO employees VALUES (154, 'Teofil', 'Hemingway', '30/10/1946', 'M', 303, NULL, '01/01/2004', NULL, NULL, NULL);
INSERT INTO employees VALUES (155, 'Ludmiła', 'Stachurska', '28/09/1943', 'K', 303, NULL, '01/01/2001', NULL, NULL, NULL);
INSERT INTO employees VALUES (156, 'Ziemowit', 'Szpak', '28/01/1942', 'M', 303, NULL, '01/05/2000', NULL, NULL, NULL);
INSERT INTO employees VALUES (157, 'Konstanty', 'Cugowski', '30/10/1946', 'M', 303, NULL, '01/02/2005', NULL, NULL, NULL);
INSERT INTO employees VALUES (158, 'Grzegorz', 'Bednarek', '28/09/1951', 'M', 303, NULL, '01/06/2009', NULL, NULL, NULL);
commit;

-----------------

UPDATE departments SET manager_id = 101 WHERE department_id = 101;
UPDATE departments SET manager_id = 101 WHERE department_id = 102;
UPDATE departments SET manager_id = 101 WHERE department_id = 103;
UPDATE departments SET manager_id = 101 WHERE department_id = 104;
UPDATE departments SET manager_id = 107 WHERE department_id = 105;
UPDATE departments SET manager_id = 107 WHERE department_id = 106;
UPDATE departments SET manager_id = 107 WHERE department_id = 107;
UPDATE departments SET manager_id = 112 WHERE department_id = 108;
UPDATE departments SET manager_id = 112 WHERE department_id = 109;
UPDATE departments SET manager_id = 112 WHERE department_id = 110;
UPDATE departments SET manager_id = 112 WHERE department_id = 111;
UPDATE departments SET manager_id = 116 WHERE department_id = 112;
UPDATE departments SET manager_id = 116 WHERE department_id = 113;
UPDATE departments SET manager_id = 116 WHERE department_id = 114;
UPDATE departments SET manager_id = 116 WHERE department_id = 115;
UPDATE departments SET manager_id = 121 WHERE department_id = 116;
UPDATE departments SET manager_id = 121 WHERE department_id = 117;
UPDATE departments SET manager_id = 136 WHERE department_id = 118;
UPDATE departments SET manager_id = 136 WHERE department_id = 119;
commit;

-------------------------------

INSERT INTO positions_history VALUES (null, 101, 101, '01/01/2005', '03/03/2005');
INSERT INTO positions_history VALUES (null, 101, 102, '03/03/2005', '01/11/2005');
INSERT INTO positions_history VALUES (null, 101, 103, '01/11/2005', '01/12/2005');
INSERT INTO positions_history VALUES (null, 102, 104, '01/01/2004', '11/10/2003');
INSERT INTO positions_history VALUES (null, 102, 105, '15/10/2004', '01/01/2005');
INSERT INTO positions_history VALUES (null, 102, 106, '20/11/2005', '01/12/2006');
INSERT INTO positions_history VALUES (null, 102, 107, '11/12/2006', '01/05/2007');
INSERT INTO positions_history VALUES (null, 104, 108, '03/03/2005', '04/04/2005');
INSERT INTO positions_history VALUES (null, 104, 101, '12/12/2005', '12/12/2006');
INSERT INTO positions_history VALUES (null, 104, 102, '12/12/2006', '03/03/2007');
INSERT INTO positions_history VALUES (null, 104, 103, '03/03/2007', '11/11/2007');
INSERT INTO positions_history VALUES (null, 105, 104, '01/01/2005', '11/11/2005');
INSERT INTO positions_history VALUES (null, 105, 105, '12/11/2005', '10/10/2006');
INSERT INTO positions_history VALUES (null, 105, 106, '11/10/2006', '11/11/2007');
INSERT INTO positions_history VALUES (null, 106, 107, '01/01/2005', '01/01/2008');
INSERT INTO positions_history VALUES (null, 107, 108, '01/01/2005', '11/11/2005');
INSERT INTO positions_history VALUES (null, 107, 107, '12/06/2006', '12/12/2007');
INSERT INTO positions_history VALUES (null, 107, 106, '01/01/2007', '10/10/2008');
INSERT INTO positions_history VALUES (null, 111, 105, '01/01/2005', '01/01/2006');
INSERT INTO positions_history VALUES (null, 111, 104, '01/01/2006', '01/11/2007');
INSERT INTO positions_history VALUES (null, 111, 103, '01/11/2007', '01/01/2008');
INSERT INTO positions_history VALUES (null, 111, 102, '01/01/2008', '01/12/2008');
INSERT INTO positions_history VALUES (null, 112, 101, '01/01/2008', '01/06/2008');
INSERT INTO positions_history VALUES (null, 112, 102, '01/06/2008', '01/12/2008');
INSERT INTO positions_history VALUES (null, 113, 103, '01/01/2005', '01/01/2007');
INSERT INTO positions_history VALUES (null, 153, 112, '01/01/2005', '31/12/2007');
INSERT INTO positions_history VALUES (null, 153, 107, '01/01/2008', '15/04/2009');
INSERT INTO positions_history VALUES (null, 154, 106, '01/01/2004', '30/06/2004');
INSERT INTO positions_history VALUES (null, 154, 113, '01/07/2004', '31/08/2007');
INSERT INTO positions_history VALUES (null, 155, 103, '01/01/2001', '31/12/2007');
INSERT INTO positions_history VALUES (null, 156, 115, '01/05/2000', '31/12/2010');
INSERT INTO positions_history VALUES (null, 157, 117, '01/02/2005', '31/12/2007');
INSERT INTO positions_history VALUES (null, 158, 113, '01/06/2009', '31/07/2011');
commit;

