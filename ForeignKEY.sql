--Teine tabel
CREATE table opilaneTunnis(
opilaneTunnisID int Primary Key identity(1,1),
kuupaev date not null,
opilaneID int, 
Foreign Key (opilaneID) References opilane(opilaneID), --tabel(pk veerg)
oppeaine varchar(25),
hinne int)
Select * from opilane;
select * from opilaneTunnis;

-- lisamine andmeid opilaneTunnis tabelisse
insert into opilaneTunnis

-- Test tabel
Create table testTabel(
id int primary key);
--tabeli kustutamine
DROP TABLE testTabel;
DROP Database  TARpv23

-- Tabelirida kustutamine
select * from opilane
delete from opilane where opilaneID=4;



--Ül tabelitega opetaja ja opetamine
CREATE TABLE Opetaja (
    opetajaID INT PRIMARY KEY,
    nimi VARCHAR(50),
    ruum VARCHAR(20)
);

CREATE TABLE Opetamine (
    opetamineID INT PRIMARY KEY,
    opetajaID INT,
    opeaine VARCHAR(50),
    maht INT,
    FOREIGN KEY (opetajaID) REFERENCES Opetaja(opetajaID)
