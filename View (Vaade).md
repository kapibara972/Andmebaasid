# SQL Vaated (Views)

## Mis on vaade?

Vaade (**View**) on virtuaalne tabel, mis põhineb ühe või mitme tabeli andmetel. Vaade ise tavaliselt andmeid ei salvesta, vaid kuvab andmeid päringu tulemuse põhjal.

Vaadete eesmärk on:

* lihtsustada keerulisi päringuid;
* peita mittevajalikke andmeid;
* parandada andmete turvalisust;
* muuta SQL-kood loetavamaks.

## Lihtne vaade

See vaade kuvab kõik kasutajad tabelist `Kasutajad`.

```sql
CREATE VIEW VaadeKasutajad AS
SELECT *
FROM Kasutajad;
```

Kasutamine:

```sql
SELECT * FROM VaadeKasutajad;
```

## Vaade valitud veergudega

Sageli ei ole vaja kuvada kõiki andmeid.

```sql
CREATE VIEW KasutajateKontaktid AS
SELECT Nimi, Email
FROM Kasutajad;
```

Kasutamine:

```sql
SELECT * FROM KasutajateKontaktid;
```

## Vaade tingimusega

Näiteks kuvatakse ainult aktiivsed kasutajad.

```sql
CREATE VIEW AktiivsedKasutajad AS
SELECT *
FROM Kasutajad
WHERE Aktiivne = 1;
```

Kasutamine:

```sql
SELECT * FROM AktiivsedKasutajad;
```

## Vaade mitme tabeliga

Näiteks ühendame kasutajate ja tellimuste andmed.

```sql
CREATE VIEW KasutajaTellimused AS
SELECT
    k.Nimi,
    t.TellimuseKuupaev,
    t.Summa
FROM Kasutajad k
JOIN Tellimused t
    ON k.ID = t.KasutajaID;
```

Kasutamine:

```sql
SELECT * FROM KasutajaTellimused;
```

## Vaate muutmine

Olemasolevat vaadet saab muuta.

```sql
ALTER VIEW KasutajateKontaktid AS
SELECT Nimi, Email, Telefon
FROM Kasutajad;
```

## Vaate kustutamine

```sql
DROP VIEW KasutajateKontaktid;
```

## Vaadete eelised

* Lihtsustavad keerulisi päringuid.
* Suurendavad turvalisust.
* Võimaldavad andmeid esitada erineval kujul.
* Vähendavad korduva SQL-koodi kirjutamist.

## Vaadete puudused

* Keerulised vaated võivad olla aeglasemad.
* Mõnda vaadet ei saa otse muuta ega uuendada.
* Suure hulga vaadete haldamine võib muutuda keeruliseks.

## Kokkuvõte

Vaade (View) on virtuaalne tabel, mis põhineb SQL-päringul. Vaated aitavad lihtsustada andmete kasutamist, peita liigseid andmeid ja muuta päringud selgemaks. Neid kasutatakse sageli raportite, kasutajavaadete ja keerukate päringute lihtsustamiseks.
