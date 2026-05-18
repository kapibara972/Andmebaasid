use MovieBase

-- 1. movies tabeli vaatamine (PEAB töötama)
SELECT * FROM movies;

-- 2. movieCost muutmine (PEAB töötama)
UPDATE movies
SET movieCost = 300
WHERE id = 1;

-- 3. movieDir muutmine (PEAB töötama)
UPDATE movies
SET movieDir = 'Nolan'
WHERE id = 2;

-- 4. Uue filmi lisamine (PEAB töötama)
INSERT INTO movies(moviesNimi, moviesYear, movieDir, movieCost)
VALUES ('Batman', 2022, 'Matt Reeves', 150);

select *from movies



-- 5. guest tabeli vaatamine (PEAB töötama)
SELECT * FROM guest;

-- 6. guest tabelisse lisamine (PEAB töötama)
INSERT INTO guest(name)
VALUES ('Karl');

-- 7. DELETE kontroll (EI TOHI töötada)
DELETE FROM movies
WHERE id = 1;

-- 8. Vale UPDATE kontroll (EI TOHI töötada)
UPDATE movies
SET moviesYear = 2025
WHERE id = 2;


tunni töö 
create database kasutajaBaas
use kasutajaBaas


create table puhkus(
puhkusId int primary key identity (1,1),
nimetus varchar (25) not null,
algus date,
lopp date,
kirjeldus text);
insert into puhkus(nimetus, algus, lopp)
values('lisapuhkus','2026-02-15','2026-02-25')

select *from puhkus;

--Security -> logins -> new login

--grant - õiguste määramine
--deny - õiguste keelamine

-- anname kasutajatel direktorNicolas õigus 
-- ainult kustutada ja uuendada tabelit ( DELETE, UPDATE, SELECT)

grant delete on puhkus to direktorNicolas;
grant update on puhkus to direktorNicolas;
grant Select on puhkus to direktorNicolas;


-- keelame INSERT
deny insert on puhkus to direktorNicolas;

update puhkus set kirjeldus='test'
delete from puhkus where puhkusId=1
