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
