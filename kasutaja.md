## SQL Server – Kasutajate autentimine ja õiguste haldamine

[Select lause](Select.md), 
[kasutajad](kasutaja.md), 
[keys](keys.md), 
[küsimused](kysimused.md), 
[Triggerid](trigerid.md), 

Mis on autentimine SQL Serveris?
## Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.

SQL Serveris kasutatakse kahte peamist autentimise tüüpi:

## 1. Windows Authentication
Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.

Kasutajanimi ja parool on seotud Windowsiga
Turvalisem lahendus
Paroole haldab Windows
Kasutaja ei pea eraldi SQL Serveri parooli teadma

## 2. SQL Server Authentication
Selle puhul luuakse kasutaja otse SQL Serverisse.

Kasutaja ei ole seotud Windowsiga
Määratakse eraldi kasutajanimi ja parool
Sobib veebirakenduste jaoks
Näide kasutajast: DirectorNimi
Parool: director
Kasutaja loomine SQL Serveris

## Mäide kasutaja DirectorNicolas 

## 1. Serveritaseme kasutaja loomine (Login)
Sammud
Ava:

Security → Logins
Tee paremklikk ja vali:

New Login...

<img width="712" height="681" alt="{D2C1C3DA-3DFA-4A0A-9113-957500724953}" src="https://github.com/user-attachments/assets/c26c4e43-fa29-40d7-af2e-ecb7cc1ee9aa" />

Harjutamiseks võib eemaldada linnukese:  User must change password at next login
Server Roles
Menüüst Server Roles saab määrata serveri üldised õigused.

Tavaliselt piisab rollist: public


<img width="717" height="673" alt="{EF83293E-48A6-45B1-966E-CF4E96E5921E}" src="https://github.com/user-attachments/assets/f7bf4c9e-e7b8-444c-9ad1-19384185b06c" />

## 2. Andmebaasi kasutaja loomine (User)
Ava:

Database → Security → Users
Tee paremklikk:  New User...

Seosta kasutaja loginiga
<img width="250" height="437" alt="{4F7F5F82-5E4D-49A8-BB93-68D70C66CDA8}" src="https://github.com/user-attachments/assets/184708f1-a407-4bd5-911d-2093c7359a6e" />

## Membership ja õigused
Menüüst Membership saab määrata kasutaja rollid.

> db_datareader → võib lugeda  SELECT
> db_datawriter → võib kirjutada  INSERT, UPDATE, DELETE
<img width="733" height="702" alt="{49CF101A-159B-4864-B5C5-9B711B332399}" src="https://github.com/user-attachments/assets/77310e34-e5c1-431c-861f-59a0d5b69535" />

## KASUTAJA ÕIHUSTE KONTROLL
1. tuleb sisselogida kasutajana directoNicolas. Connect -> Database Engine 
<img width="572" height="573" alt="{EF3A61E0-9431-489D-AE04-7392E49B90AB}" src="https://github.com/user-attachments/assets/5efbcd9b-c425-4495-8782-05d46b583a22" />

2. Saab tabelit sisu näha ja sisestada uusi kirju
<img width="610" height="617" alt="{4EBC0011-C8C4-418C-B22A-6CF3870F35F3}" src="https://github.com/user-attachments/assets/a9ce4ce6-5c63-436d-bf34-2dc2d5b6d0a4" />

3. kontrollime tegevus, mis ei ole lupatud kasutajale, nt: tabeli loomin
<img width="605" height="587" alt="{5225FE72-FC33-4083-84F9-8EF07967E4D5}" src="https://github.com/user-attachments/assets/6c1f0478-a636-497d-a5b6-a36fccf22e8a" />


SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
Lahendus
Server → Properties
Security
Vali: SQL Server and Windows Authentication mode
GRANT käsud õiguste jagamiseks
GRANT käsuga antakse kasutajale õigused.

Käsk	Tähendus
SELECT	Lugemine
INSERT	Lisamine
UPDATE	Muutmine
DELETE	Kustutamine

>>>>>pilt
```sql
-- anname kasutajatel direktorNicolas õigus 
-- ainult kustutada ja uuendada tabelit ( DELETE, UPDATE, SELECT)

grant delete on puhkus to direktorNicolas;
grant update on puhkus to direktorNicolas;
grant Select on puhkus to direktorNicolas;


-- keelame INSERT
deny insert on puhkus to direktorNicolas;
```

    
## Ülesanne 1:
Luua andmebaas: MovieBase

Luua tabelid: 

movies (id, moviesNimi, moviesYear, movieDir и movieCost).
guest (id, name)
Lisada vähemalt 7 kirjet.

Luua kasutaja Produtsent parooliga director, kellel on järgmised õigused:
Õigus vaadata ja uuendada tabeli movies välju movieDir ja movieCost + lisada üks enda valitud privileeg.
Õigus vaadata ja lisada kirjeid tabelisse guest.
Keela andmete kustutamine tabelis.
Vihje! UPDATE õigused parem lubada SQL käsuga
GRANT UPDATE (movieCost, movieDir)
ON movies
TO Produtsent;
