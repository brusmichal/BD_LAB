create table Pracownicy
    (
    ID_Pracownika number (4),
    Imię varchar (20) not null,
    Nazwisko varchar(30) not null,
    Data_urodzenia date,
    Płeć char (1 char),
    Zarobki number (10, 5),
    Data_zatrudnienia date,
    ID_Zakładu number (4) not null,
    Status_ID number, 
    ID_Kierownika number (4),
    ID_Stanowiska number (4) not null
    );
    
create table Historia_zatrudnienia
(
    HZ_ID number,
    ID_Pracownika number (4),
    ID_Stanowiska number (4),
    Data_rozpoczęcia date,
    Data_zakończenia date
    );

alter table Pracownicy add constraint Pracownicy_PK primary key (ID_Pracownika);
select * from pracownicy;

alter table Historia_zatrudnienia
    add CONSTRAINT HZ_Pracownik_FK
    foreign key (ID_Pracownika )
    REFERENCES Pracownicy(ID_Pracownika);
create table Regiony(
    ID_Regionu number (4) constraint Regiony_PK primary key,
    Nazwa VARCHAR2 (20)
    );
drop table Kraje;
create table Kraje(
    ID_Kraju number (4) constraint Kraje_PK primary key,
    Nazwa varchar2 (40 byte),
    ID_Regionu constraint Kraj_Region_FK references Regiony(ID_regionu)
    );
create table Adresy(
    ID_Adresu number not null constraint Adresy_PK primary key,
    Ulica varchar2 (40 byte) not null,
    Kod_pocztowy varchar2 (40 byte) not null,
    Miasto varchar2 (40 byte)not null,
    ID_Kraju number (4) not null constraint Adres_Kraj_FK references Kraje(ID_Kraju)
    );
create table Zakłady(
    ID_Zakładu number not null constraint Zakład_ID primary key,
    Nazwa varchar2 (40 byte) not null,
    Data_założenia date,
    Budżet_roczny number not null,
    ID_Adresu number (4) not null constraint Zakład_Adres_FK references Adresy(ID_Adresu)
    );
drop table Stanowiska;
create table Status_pracownika(
    Status_ID number not null constraint Status_PK primary key,
    Nazwa varchar2 (30 byte)
    );
create table Stanowiska(
    ID_Stanowiska number not null constraint Stanowiska_PK primary key,
    Nazwa varchar2 (40 byte) not null,
    Min_zarobki number (7,2),
    Max_zarobki number (7,2)
    );
select * from pracownicy;

alter table Historia_zatrudnienia add constraint HZ_FK primary key (HZ_ID);
alter table Historia_zatrudnienia add constraint HZ_Pracownika foreign key (ID_Pracownika) references Pracownicy(ID_Pracownika);
alter table Historia_stanowiska
    add constraint HZ_Stanowisko
    foreign key (ID_Stanowiska)
    references Stanowiska(ID_Stanowiska);
alter table Pracownicy 
    add constraint Pracownik_Zakład_FK
    foreign key (ID_Zakładu)
    references Zakłady(ID_Zakładu);
alter table Pracownicy
    add constraint Pracownik_Kierownik_FK
    foreign key (ID_Kierownika)
    references Pracownicy(ID_Pracownika);
alter table Pracownicy
    add constraint Pracownik_Status_FK
    foreign key (Status_ID)
    references Status_pracownika(Status_ID);
    alter table Pracownicy
        add constraint Pracownik_Stanowisko
        foreign key (ID_Stanowiska
        references Stanowiska(ID_Stanowiska);
        
alter table Zakłady add (ID_Kierownika number (4) not null constraint Zakład_Kierownik_FK references Pracownicy(ID_Pracownika));

rename Historia_zatrudnienia to Historia_stanowiska;

alter table Pracownicy
    add constraint Pracownik_Zakład_FK
    foreign key (ID_Zakładu)
    references Zakłady(ID_Zakładu);
alter table Historia_stanowiska drop constraint HZ_Stanowisko;
