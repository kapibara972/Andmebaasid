
create database NikUl
use NikUl

-- teeme tabeli
create table Puustik(
ID int primary key,
Nimi varchar(30),
Pikkus int,
KasvamiseKoht varchar(30),
Vanus int,
PuuTuub varchar(30))

--täidame tabel
INSERT INTO Puustik (ID, Nimi, Pikkus, KasvamiseKoht, Vanus, PuuTuub) 
VALUES (6, 'Mänd', 10.0, 'Park', 20, 'Okaspuu')

Select *from Puustik

--ptotseduur
--protseduur mis näitab kindla puu tüüpi 
CREATE PROCEDURE NaitaPuuTuup
    @tuup VARCHAR(50)
AS
BEGIN
    SELECT * FROM puustik
    WHERE PuuTuub = @tuup;
END;

--käivitame
EXEC NaitaPuuTuup @tuup = 'Lehtpuu';


--2. protseduur: protseduur, mis uuendab puu vanust
create procedure UusVAnus 
@id int,
@uusVAnus int
as
begin
   select * from Puustik;
   update Puustik set Vanus=@uusVAnus
   where ID=@id;
end

--käivitame 
exec UusVAnus 3, 40

--Select
--Puud, mis on 10–20 aastat vanad
SELECT *FROM puustik
WHERE vanus BETWEEN 10 AND 20;


-- Mitu puud on ühes kasvamise kohas
SELECT KasvamiseKoht, COUNT(*) AS puudeArv
FROM puustik
GROUP BY KasvamiseKoht;

-- Puud, mille pikkus on 10 meetrit
SELECT * FROM puustik
WHERE pikkus = 10;
