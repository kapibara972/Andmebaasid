
create database LOGITpe24baas
use LOGITpe24baas
-- Tabeli loomine
create table opilane(
opilaneID int Primary Key identity(1,1),
eesnimi varchar(25),
perekonnanimi varchar(30) not null,
synniaeg date,
pohitoetus bit,
aadress TEXT,
keskmineHinne decimal(2, 1));

SELECT * FROM opilane

--andmete lisamine tabelisse
INSERT INTO opilane(perekonnanimi, eesnimi, synniaeg)
VALUES ('Valge','Sall', '2000-10-23'),
('Roheline','Pall', '2001-10-1')

--uuendame tabeliandmedid
update opilane set aadress='Tallinn, Eesti'
update opilane set pohitoetus=1 --1 on true
update opilane set keskmineHinne=4.5;

-- kui soovime kõik veerud täita- ei pea neid nimetama 
INSERT INTO opilane
VALUES ('Nimi','perenimi', '2000-10-23', 0, 'Tartu, Eesti', 3.5),
