## Andmebaasid
Andmebaaisd seotud sql kood ja konspektid

SQL - Structured Query Language - struktureeritud päringukeel
DDL - Data Definitsion Language - andmebaasi struktuuri loomiseks
DML - Data Manipulation Language -andmete lisamine ja uuendamine tabelis -INSERT, UPDATE, DELETE 

## Sisukord
- andmebasisüsteemid
- Põhimõisted
- Andmetüübid
- Piirangud
- Tabelivahelised seaosed


 
### tunnis me kasutame andmebaasisüsteemid
1. SQL server Management Stuudio ( SQL serveri haldamiseks )
   <img width="478" height="507" alt="{B7C0F252-2E27-42C3-B1CB-E83BDA5F13EF}" src="https://github.com/user-attachments/assets/c1d99a84-a236-41c6-8547-8bd78b56dd61" />

3. XAMPP - phpmyAdmin ( MariaDB andmebaas ) -vabavara

### Põhimõisted
Andmebaas- Struktuuritud andmed kogum
Tabel- olem ( entity )
Veerg- väli ( field )
rida- kirja ( record)
Primaarne võti -PK-Primary key - veerg ( tavaliselt nimega id) unikaalnse identifikaatoriga, mis eristab iga kirjet
Välisvõti ( võõrvõti ) -FK Foreign Key - veerg, mis loob seose teise tabeli primaarvõtmega

### Andmetüübid
- INT, float, decimal(6, 2)
- varchare(50), Chare(6)
- boolean, bool, bit - loogiline tüüp
- date, time, datetime - kuupäev

### Piirangud
```
1. primary Key
2. Foreign Key
3. Unique
4. Not Null
5. Check
```


## Tabelivahelised Seosed
üks - ühele ( nt mees --naine)
üks - mitmele (õpilane käib erinevates õppeainetes)
<img width="315" height="292" alt="{48882D87-0444-4831-AFD3-0D2FA425A765}" src="https://github.com/user-attachments/assets/53c6f807-c45b-4fa0-9694-46bcf4e5046b" />

- mitu - mitmele ( nt õpilane - õpetaja)

opetaja ja opetaminen tabelid ül 
<img width="729" height="202" alt="{456F1F08-52D6-4D93-98D8-C8BA4B678341}" src="https://github.com/user-attachments/assets/59f16df6-4e35-4dda-b57e-966df7607600" />





## store procedure
  salvestatud protseduurid - sama mis on funktsioonid programeerimises - mingi tegevus, mida saab automaatselt teha ( insert, select, update, delete) 
 ```sql
select * from categories 
--proceduur, mis täidab tabeli 
create procedure lisaKategooria
@nimi varchar(15)
as
begin
	insert into categories
	values (@nimi);
	select *from categories;
end
--kutse
exec lisaKategooria 'test';


--proceduur, mis kustutab tabelist id järgi
create procedure kustutaIdJargi
@id int 
AS
begin
	select *from categories;
	delete from categories where category_id=@id;
	select *from categories;
end
--kutse
exec kustutaIdJargi 3;

--otsing 
--protseduur mis otsib kõik kategooriad sisestatud 1 tähte järgi
create procedure otsing1taht 
@taht char(1)
as
begin
	select category_name from categories
	where category_name like @taht + '%';
end
--kutse
exec otsing1taht 'a' 


-- proeduur, mis uuendab nimed sisestatud id järgi
create procedure uuendaKategooria 
@id int,
@uuendatudNimi varchar(20)
as
begin
	select *from categories;
	update categories set category_name=@uuendatudNimi
	where category_id=@id;
end

--kutse
exec uuendaKategooria 4, 'jope'
```
<img width="424" height="200" alt="{8E78F98E-0DCF-4491-99D4-E89106FE361A}" src="https://github.com/user-attachments/assets/81d99f5b-dbee-4157-ab0e-7886e2a00340" />

### iseseisev töö ÜL
### --iseseisvalt: vali tabel ja kirjuta 3 protseduuri, käivita!
```sql
--iseseisvalt: vali tabel ja kirjuta 3 protseduuri, käivita!

select * from brands
--1. täidab tabeli 
create procedure lisaBrand
@nimi varchar(15)
as
begin
	insert into brands
	values (@nimi);
	select *from brands;
end
--kutse
exec lisaBrand 'test2.0';

--2. kustutab tabelist
create procedure kustutaBrand
@id int 
AS
begin
	select *from brands;
	delete from brands where brand_id=@id;
	select *from brands;
end
--kutse
exec kustutaBrand 5;

--3. uuendab nimed
create procedure brandNimiuus 
@id int,
@uusNimi varchar(20)
as
begin
	select *from brands;
	update brands set brand_name=@uusNimi
	where brand_id=@id;
	select *from brands;
end

--kutse
exec brandNimiuus 2, 'kukk'
```

