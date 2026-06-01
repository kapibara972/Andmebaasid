### Triger - Trigger - päästik

[Select lause](Select.md), 
[kasutajad](kasutaja.md), 
[keys](keys.md), 
[küsimused](kysimused.md), 
[Triggerid](trigerid.md), 

### Triger - andmebaasi objekt, mis käivitub automaatselt, Kui toimubteatud sündmus (nt: insert, update, delete).
trigerite loomineautomatiseerub protsessid SQL Serveris.

tabelid mis tuleb luua enne trigerit
```sql
create database trigerLogitpe24
use trigerLogitpe24


create table linnad(
linnId int primary key identity(1,1),
linnanimi varchar(30) unique,
maakond varchar(50),
rahvaarv int);

select *from linnad

insert into linnad (linnanimi, maakond, rahvaarv)
values ('Tallinn','Harjumaa',600000)



-- tabel logi - tabel, mis täidab triger!!! Kui kasutaja täidab tabeli linn
create table logi(
id int primary key identity(1,1),
kasutaja varchar(50),
aeg datetime,
andmed text);
```


### 1. triger lisatud andmete jälgimiseks tabelis linnad.
Jälgib linna sisestamine tabelisse ja teeb vastava kirje logi-tabelise 

```sql
create trigger linnaLisamine
on linnad -- tabel, mida triger jälgib
for insert
as
insert into logi(kasutaja, aeg, andmed)
select 
SYSTEM_USER, -- siselogitud user
GETDATE(), 
concat('lisatud: ',inserted.linnanimi, ', ',
inserted.maakond,', ', inserted.rahvaarv)
from inserted;

--kontrollimiseks tuleb lisada linna tabelise linnad
insert into linnad (linnanimi, maakond, rahvaarv)
values ('Viljandi','Viljandimaa',50000)

select *from linnad;
select *from logi
```
<img width="519" height="307" alt="{27CEA6CD-DD6F-4633-9A84-F59F62E4F8A9}" src="https://github.com/user-attachments/assets/cef70cff-f8c7-48d2-8269-1c1f268017a0" />




### 2. delete triger - jägib kustutamine tabelis linnad ja teeb vastava kirje logi tabelisse 
```sql
create trigger linnaKustutamine
on linnad 
for delete
as
insert into logi(kasutaja, aeg, andmed)
select 
SYSTEM_USER, 
GETDATE(), 
concat('kustutatud: ',deleted.linnanimi, ', ',
deleted.maakond,', ', deleted.rahvaarv)
from deleted;

--kontrollimine 
delete from linnad where linnId=2;

select *from linnad;
select *from logi
```
<img width="497" height="269" alt="{24BD08D6-6FD9-4CCE-8786-7F28F43245C4}" src="https://github.com/user-attachments/assets/a348c80b-3761-4bf7-b05f-fc4dcb4da7d0" />




### 3. Update triger - jälgib uuendused tabelis linnad ja teeb vastava kirje tabelis logi
```sql
create trigger linnaUuendamine
on linnad 
for update
as
insert into logi(kasutaja, aeg, andmed)
select 
SYSTEM_USER, 
GETDATE(), 
concat('vana andmed: ',deleted.linnanimi, ', ',
deleted.maakond,', ', deleted.rahvaarv, 
'|||uued andmed',
inserted.linnanimi,', ', inserted.maakond,', ', inserted.rahvaarv)
from deleted inner join inserted
on deleted.linnId=inserted.linnId;

--kontrollimine 
update linnad set linnanimi='Tallinn22', rahvaarv=700000
where linnId=1;

select *from linnad;
select *from logi
```
<img width="585" height="294" alt="{20F65510-8DD8-4C96-A86A-17BD56B2764E}" src="https://github.com/user-attachments/assets/d8250c1f-16ce-44ff-98fd-86ae8a725586" />

### 4. 1 ja 2  Ühine triger mis jälgib kas lisamine või kustutamine tabelisse linnad
```sql
create trigger linnaLisamineKustutamine
on linnad 
for insert, delete
as
begin
set nocount on;
	insert into logi(kasutaja, aeg, andmed)
	select 
	SYSTEM_USER, 
	GETDATE(), 
	concat('lisatud: ',inserted.linnanimi, ', ',
	inserted.maakond,', ', inserted.rahvaarv)
	from inserted

	union all 

	select 
	SYSTEM_USER, 
	GETDATE(), 
	concat('kustutatud: ',deleted.linnanimi, ', ',
	deleted.maakond,', ', deleted.rahvaarv)
	from deleted;
end;

--deleted kontroll 
delete from linnad where linnId=3;

select *from linnad;
select *from logi

--lisamine kontroll
insert into linnad (linnanimi, maakond, rahvaarv)
values ('Viljandi','Viljandimaa',50000)

select *from linnad;
select *from logi
```



### XAMPP / päästik / trigerid
<img width="683" height="704" alt="{54760442-D152-4E75-94D9-00D64441E612}" src="https://github.com/user-attachments/assets/95545751-52fc-4442-9169-0bc988ffb819" />

### insert - lisamine
1. kontrollimiseks
2. <img width="443" height="185" alt="{32F47447-F47D-418B-A490-B71F6E8FF36B}" src="https://github.com/user-attachments/assets/efd8a939-4fb2-4910-afa5-449657ccd7e7" />
3. tulemus logi tabelis
<img width="753" height="76" alt="{89A25C87-8685-4348-A571-97876D0D57ED}" src="https://github.com/user-attachments/assets/9a5ce176-717d-448c-b138-838d5a4575f9" />



### update 
1. <img width="629" height="626" alt="{0E08066A-5934-461D-9A58-04806C3C088C}" src="https://github.com/user-attachments/assets/403f23ae-b917-480a-aa40-12ccabef7922" />

2. <img width="786" height="52" alt="{D985FEC7-ADE3-4FEF-9C81-118EFD7DB3A9}" src="https://github.com/user-attachments/assets/c583f14d-a559-464d-aa4b-178ee9173ff2" />



### SQL lõpp ül kood 

```sql
use trigerLogitpe24

--tabel logi
create table logi2(
    logiId int identity(1,1) primary key,
    kasutaja varchar(50),
    aeg datetime,
    andmed varchar(255)
);

--tabel puustik
create table puustik(
väljadId int primary key identity(1,1),
nimi varchar (33),
pikkus int,
kasvamiseKoht varchar(33),
vanus int,
puuTyyp varchar (33));

--insert triger
create trigger puuLisamine
on puustik
for insert
as
insert into logi2(kasutaja, aeg, andmed)
select
SYSTEM_USER,
GETDATE(),
concat(
'Lisatud puu: ',
inserted.nimi, ', ',
inserted.pikkus, ' m, ',
inserted.kasvamiseKoht, ', ',
inserted.vanus, ' aastat, ',
inserted.puuTyyp )
from inserted;

--kontroll
insert into puustik(nimi, pikkus, kasvamiseKoht, vanus, puuTyyp)
values ('kask2', 17.5, 'Tartu', 25, 'lehtpuu');


select * from puustik;
select * from logi2;

DELETE FROM puustik
WHERE väljadId = 5; 

--delete trigger
create trigger puuKustutamine
on puustik
for delete
as
insert into logi2(kasutaja, aeg, andmed)
select
SYSTEM_USER,
GETDATE(),
concat(
'Kustutatud puu: ',
deleted.nimi, ', ',
deleted.pikkus, ' m, ',
deleted.kasvamiseKoht, ', ',
deleted.vanus, ' aastat, ',
deleted.puuTyyp
)
from deleted;

--kontroll
delete from puustik
where väljadId = 6;

select * from puustik;
select * from logi2;


--update trigger

create trigger puuUuendamine
on puustik
for update
as
insert into logi2(kasutaja, aeg, andmed)
select
SYSTEM_USER,
GETDATE(),
concat(
'Vanad andmed: ',
deleted.nimi, ', ',
deleted.pikkus, ' m, ',
deleted.kasvamiseKoht, ', ',
deleted.vanus, ' aastat, ',
deleted.puuTyyp,

' ||| Uued andmed: ',

inserted.nimi, ', ',
inserted.pikkus, ' m, ',
inserted.kasvamiseKoht, ', ',
inserted.vanus, ' aastat, ',
inserted.puuTyyp
)
from deleted
inner join inserted
on deleted.väljadId = inserted.väljadId;


--kontroll
update puustik
set nimi = 'Kuusk',
    pikkus = 15.2,
    vanus = 30
where väljadId = 7;

select * from puustik;
select * from logi2;


-- välja lülitamine 
disable TRIGGER puuLisamine on puustik;
disable trigger puuKustutamine on puustik;
enable trigger puuUuendamine on puustik;


--Ühine trigger

create trigger puuLisamineKustutamine
on puustik
for insert, delete
as
begin
set nocount on;

    insert into logi2(kasutaja, aeg, andmed)

    select
    SYSTEM_USER,
    GETDATE(),
    concat(
    'Lisatud puu: ',
    inserted.nimi, ', ',
    inserted.pikkus, ' m, ',
    inserted.kasvamiseKoht, ', ',
    inserted.vanus, ' aastat, ',
    inserted.puuTyyp
    )
    from inserted

    union all

    select
    SYSTEM_USER,
    GETDATE(),
    concat(
    'Kustutatud puu: ',
    deleted.nimi, ', ',
    deleted.pikkus, ' m, ',
    deleted.kasvamiseKoht, ', ',
    deleted.vanus, ' aastat, ',
    deleted.puuTyyp
    )
    from deleted;

end;

-- lisamise kontroll

insert into puustik(nimi, pikkus, kasvamiseKoht, vanus, puuTyyp)
values ('Tamm', 18.7, 'Tartu', 40, 'Lehtpuu');

select * from puustik;
select * from logi2;

-- kustutamise kontroll
delete from puustik
where väljadId = 8;

select * from puustik;
select * from logi2;


--kasutaja
grant select, insert, delete on puustik to sekretarNicolas2;
deny select on logi2 to sekretarNicolas2;
```


