--uue veeru lisamine 
ALTER TABLE opilane ADD telefon varchar(13);

-- tabeli struktuuri muutmine -veeru kustutamine
ALTER TABLE opilane  telefon;

--tabeli muutmine - veeru andmetüübi vahetamine
ALTER TABLE opilane ALTER COLUMN telefon varchar(13);

--store procedure help, mis näitab tabeli struktuuri ja veerude andmetüübid
sp_help opilane;

drop table ryhm

CREATE TABLE ryhm(
ryhmID int not null,
ryhmNimi Varchar(10));
Select * from ryhm;
--muudame tabeli ryhm ja lisame Primary key
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm Primary key (ryhmID);

--muudame tabeli ryhm ja teeme ryhmNimi unikaalseks UNIQUE
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE(ryhmNimi);
sp_help ryhm;

--täidame tabeli ryhm
INSERT INTO ryhm(ryhmID, ryhmNimi)
Values (3, 'LOGITpe24'),(4, 'TITpe24');
Select * FROM ryhm;

--FOREIGN KEY -- opilane tabelis
--lisame opilane tabelisse uus veerg
ALTER TABLE opilane ADD ryhmID int;
Select * from opilane
--lisame ruhmID foreign key
ALTER TABLE opilane ADD CONSTRAINT fk_ryhm
FOREIGN KEY (ryhmID) REFERENCES ryhm(ryhmID) --link tabel(PK veerg)

--kontrollimiseks täidame tabeli opilane
INSERT INTO opilane
VALUES ('Kevin','Allik', '2003-10-23', 0, 'Tartu, Eesti', 4.5, '+35555', 1)
