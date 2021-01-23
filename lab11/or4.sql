select * from employees;
select sysdate from dual;
select * from employees where employee_id > 130;
select * from employees where surname = 'Himuro';
select * from employees where salary between 1000 and 5000;
select department_id, count(*) from employees group by department_id;
select department_id, count(*) from employees where manager_id is not null group by department_id;
select department_id, count(*) from employees where manager_id is not null group by department_id having count (*) > 2;

SELECT * FROM ALL_INDEXES where owner ='HR' and table_name = 'EMPLOYEES';
SELECT * FROM USER_INDEXES where table_name = 'EMPLOYEES';
SELECT * FROM USER_INDEXES;

--1.Załóż indeks na kolumnie surname w tabeli employees. DONE

--2.Przeanalizuj plan zapytania z warunkiem równościowym na tej kolumnie. 
--Przeanalizuj zapytanie z warunkiem równościowym na kluczu głównym tabeli employees. Porównaj uzyskane plany.

select * from employees where surname = 'Hunold'; --Dla warunku równościowego wykorzystanie utworzonego indeksu oraz range scan, bo indeksy sa nieunikalne, bo nazwiska mogą się powtarzać
select * from employees where employee_id = 104; --Dla klucza głównego też wykorzystanie indeksu oraz unique scan, bo klucze są unikalne

--3.Zaindeksuj kolumnę tabeli zawierającą NULL-e i sprawdź plan wykonania przy zapytaniu z warunkiem „kolumna IS NULL” oraz „kolumna IS NOT NULL”.

create index manager_index on employees (manager_id);
select * from employees where manager_id is null; --Full scan
select * from employees where manager_id is not null;--Full scan
select /*+ INDEX(employees manager_index) */ * from employees where manager_id is not null;--index, rangescan
select * from employees where manager_id is not null and manager_id = 105; --index and ranged scan
select * from employees where manager_id < 110; -- index

--4.Utwórz indeks B-tree na dwóch kolumnach (np. w tabeli positions na min_salary i max_salary)
--i sprawdź plan wykonania dla wszystkich kombinacji występowania kolumn indeksujących w klauzuli WHERE. Kiedy wykorzystany jest indeks?

create index salary_index on positions (min_salary, max_salary);
select * from positions where min_salary = 2000; --Full scan
select /*+ index(positions salary_index) */ * from positions where min_salary = 2000; --index
select min_salary from positions where min_salary = 2000; --index, range scan
select * from positions order by min_salary;-- fullscan
select /*+ index(positions salary_index) */ * from positions order by min_salary; --fullscan
select * from positions order by max_salary;-- fullscan
select * from positions where max_salary = 5000; --Full scan
SELECT * FROM USER_INDEXES;

select * from positions where min_salary = 2000 and max_salary=5000; --full scan
select * from positions where max_salary = 5000 and min_salary=2000; --full scan
select * from positions where min_salary >1000 and max_salary <5000; --full scan



--5.Sprawdź plany wykonania zapytań z frazą ORDER BY dotyczącą kolumn zaindeksowanych null/not null.

select * from employees where manager_id is null order by manager_id; --full scan
select * from employees where manager_id is not null order by manager_id; --index and full scan
select * from employees where manager_id is not null and manager_id = 103 order by manager_id; --index and range scan

--6.Sprawdź plany wykonania zapytań z/bez fraz(ą/y) ORDER BY dotyczącą kolumn zaindeksowanych indeksami unikalnymi 
--i nieunikalnymi, przy czym lista selekcji ma być ograniczona wyłącznie do tych kolumn.

select employee_id, surname from employees where surname ='Kowalski' order by employee_id, surname; --index and full scan

select employee_id, surname from employees where surname ='Kowalski'; --index rand range scan



--1.Wykonaj zapytanie na tabeli employees z warunkiem
--	surname = ’Himuro’
--oraz z warunkiem
--	UPPER(surname) = ’HIMURO’.
--Kiedy jest wykorzystany indeks?
select * from employees where surname = 'Himuro'; -- index and range scan
select * from employees where upper(surname) = 'HIMURO'; -- full scan
--Korzystanie z funkcji w warunku powoduje, że ta funkcja musi zostać użyta na każdym nazwisku, więc i tak dochodzi do full scanu

--2.Stwórz indeks funkcyjny na tabeli employees na kolumnie surname poddanej działaniu funkcji upper.
create index upp_sur_index on employees (upper(surname));

--3.Wykonaj zapytanie z warunkiem upper(surname) = ‘HIMURO’.
--Czy jest wykorzystany indeks?
select * from employees where upper(surname) = 'HIMURO'; -- index and range scan



select * from employees e inner join departments d on e.department_id = d.department_id; --full scan

--1.Jak zmieni się plan wykonania, jeśli w poprzednim przykładzie w definicji złączenia zastosujemy frazę USING?

select * from employees inner join departments using (department_id); --fullscan, card:184, cost:12
-- Nic się nie zmienia

--2.Dodaj indeks B-tree na kolumnie klucza obcego z poprzedniego przykładu i sprawdź plan wykonania.
--Jakiego rodzaju musi być to indeks (unikalny, nieunikalny)?
--Czy wydajność złączenia uległa poprawie?
create index dep_index on employees (department_id);
drop index dep_index;
--indeks nieunikalny, bo wiele pracowników może mieć to samo department_id

select * from employees e inner join departments d on e.department_id = d.department_id;
--hash join
-- (55, 4) wydajność taka sama

--3.Za pomocą wskazówek zmień typ złączenia tabel.
select /*+ use_merge (employees dep_index)*/ * from employees inner join departments using (department_id);

--4.Zmień warunek złączenia na nierównościowy, zweryfikuj jak zmienił się plan wykonania.
select * from employees e inner join departments d on e.department_id > d.department_id;
--użyty merge join, koszt (468,5)

--
--1.Wykonaj ćwiczenia z przebiegu laboratorium
--2.Co to jest klastrowanie tabel?

--Dane z tabeli są zapisane w fizycznych klastrach i chociaż w tabeli dane mogą wyglądać na położone blisko siebie, to w rzeczywistośći znajdują się w oddzielnych blokach. 
--Operacja klastrowania służy takiemu rozłożeniu danych w tabeli, by wiersze mające te same wartości w wybranej zaindeksowanej kolumnie leżały obok siebie. 
--Dzięki temu że dane są bliżej siebie, również odczytywanie ich będzie się odbywało szybciej.


--3.Do schematu bazy danych dodaj klaster tabel EMPLOYEES_CL oraz DEPARTMENTS_CL o strukturze odpowiadającej tabelom EMPLOYEES oraz DEPARTMENTS.
--4.Przekopiuj dane z tabel EMPLOYEES oraz DEPARTMENTS do odpowiednich tabel w klastrze.
--5.Sprawdź plany wykonania zapytań do pojedynczych tabel klastra z warunkami do różnych kolumn.
--6.Sprawdź plan wykonania operacji złączenia sklastrowanych tabel.
--7.Stwórz indeks bitmapowy na kolumnie status_id w tabeli pracownicy. Wykonaj zapytania na tej tabeli i sprawdź, czy indeks jest wykorzystywany.

