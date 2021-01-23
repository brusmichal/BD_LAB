CREATE TABLE Pracownicy
 (
    ID_Pracownika     NUMBER (4) CONSTRAINT Pracownicy_PK PRIMARY KEY,
    Imie              VARCHAR2 (40 BYTE) NOT NULL ,
    Nazwisko          VARCHAR2 (40 BYTE) NOT NULL ,
    Zarobki           NUMBER (7,2) ,
    Data_zatrudnienia DATE ,
    ID_zakladu        NUMBER (4) NOT NULL ,
    ID_kierownika     NUMBER (4) ,
    Kod_stanowiska    NUMBER (4) NOT NULL
  ) ;
  describe Pracownicy;
  select * from USER_TABLES;
  drop table Pracownicy;
  
  CREATE TABLE Pracownicy
  (
    ID_Pracownika     NUMBER (4) NOT NULL ,
    Imie              VARCHAR2 (40 BYTE) NOT NULL ,
    Nazwisko          VARCHAR2 (40 BYTE) NOT NULL ,
    Zarobki           NUMBER (7,2) ,
    Data_zatrudnienia DATE ,
    ID_zakladu        NUMBER (4) NOT NULL ,
    ID_kierownika     NUMBER (4) ,
    Kod_stanowiska    NUMBER (4) NOT NULL
  ) ;

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownicy_PK PRIMARY KEY ( ID_Pracownika ) ;
ALTER TABLE Pracownicy 
ADD CONSTRAINT Pracownicy_Stanowiska_FK 
FOREIGN KEY ( Kod_stanowiska) 
REFERENCES Stanowiska ( ID_Stanowiska );

CREATE TABLE    Stanowiska
(
ID_Stanowiska NUMBER (4)  PRIMARY KEY,
Nazwa VARCHAR2 (40 char) NOT NULL
);



