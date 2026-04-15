create database BossiBass;
use BossiBass;

--Loome uue Category (idCategory, Category_Name)
create table Category(
idCategory int Primary key identity(1,1),
Category_Name varchar(25) UNIQUE)

INSERT INTO Category
VALUES ('Auto'), ('Jook'),('Toit')
SELECT *FROM Category;

-- loome uue Product (idProduct, Name, idCategory, Price)
CREATE TABLE Product(
idProduct int Primary key identity(1,1),
Name varchar(25),
idCategory int, 
Foreign key (idCategory) references Category(idCategory),
Price money)

INSERT INTO Product
Values ('Coca-Cola', 2, 1.0)
SELECT * FROM Product

INSERT INTO Product
Values ('BMW m4', 1, 30.000)
SELECT * FROM Product

INSERT INTO Product
Values ('Juustujurger', 3, 2.0)
SELECT * FROM Product


--loome uue Sale  (idSale, idProduct, idCustomer, Count_pr, Date_of_sale)
CREATE TABLE Sale(
idSale int Primary Key identity(1,1),
idProduct int,
Foreign key (idProduct) references Product(idProduct),
idCustomer int,
Count_pr int,
Date_of_sale date,)

--loome uue tabeli Customer  (idCustomer, Name, contact) ja siduda tabeliga Sale.
CREATE TABLE Customer(
idCustomer int primary key identity (1,1),
Name varchar(25) UNIQUE,
Contact varchar(100))

ALTER TABLE SALE add foreign key (idCustomer) references Customer(idCustomer)
INSERT INTO Customer
VALUES ('Kevin', '+37264587'),('Robin', '+84788567')
Select * from Customer;

INSERT INTO Sale
VALUES (1, 1, 5, '2026-04-15')


SELECT * FROM Sale;
Select * from Product;
Select * from Customer;












