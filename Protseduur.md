# SQL Protseduurid (Stored Procedures)

## Mis on protseduur?

Protseduur (Stored Procedure) on SQL-käskude kogum, mis salvestatakse andmebaasi ja mida saab hiljem nime järgi käivitada.

Protseduuride eesmärk on:

* vältida sama SQL-koodi kordamist;
* muuta rakendused kiiremaks;
* lihtsustada andmebaasi haldamist.

## Lihtne protseduur

See protseduur kuvab kõik kasutajad tabelist `Kasutajad`.

```sql
CREATE PROCEDURE KuvaKasutajad
AS
BEGIN
    SELECT * FROM Kasutajad;
END;
```

Käivitamine:

```sql
EXEC KuvaKasutajad;
```

## Protseduur parameetriga

See protseduur otsib kasutaja ID järgi.

```sql
CREATE PROCEDURE LeiaKasutaja
    @ID INT
AS
BEGIN
    SELECT *
    FROM Kasutajad
    WHERE ID = @ID;
END;
```

Käivitamine:

```sql
EXEC LeiaKasutaja @ID = 1;
```

## Andmete lisamine protseduuriga

```sql
CREATE PROCEDURE LisaKasutaja
    @Nimi VARCHAR(50),
    @Email VARCHAR(100)
AS
BEGIN
    INSERT INTO Kasutajad (Nimi, Email)
    VALUES (@Nimi, @Email);
END;
```

Käivitamine:

```sql
EXEC LisaKasutaja
    @Nimi = 'Karl',
    @Email = 'karl@email.ee';
```

## Andmete uuendamine

```sql
CREATE PROCEDURE UuendaEmail
    @ID INT,
    @Email VARCHAR(100)
AS
BEGIN
    UPDATE Kasutajad
    SET Email = @Email
    WHERE ID = @ID;
END;
```

Käivitamine:

```sql
EXEC UuendaEmail
    @ID = 1,
    @Email = 'uus@email.ee';
```

## Protseduuride eelised

* Vähem korduvat SQL-koodi.
* Lihtsam hooldada.
* Parem jõudlus.
* Turvalisem andmete kasutamine.

## Kokkuvõte

SQL protseduur on andmebaasis salvestatud SQL-käskude kogum. Protseduure kasutatakse korduvate tegevuste automatiseerimiseks, näiteks andmete otsimiseks, lisamiseks, muutmiseks ja kustutamiseks.
