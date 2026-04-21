
create database Nicolas_veebipood;
use Nicolas_veebipood;


--Tabel Brands
create table brands(
brand_id int primary key identity(1,1),
brand_name varchar(25) UNIQUE)

insert into brands 
values ('Abibas')

Select * from brands

-- Tabel Categories
create table categories(
category_id int Primary key identity(1,1),
category_name VARCHAR(25) UNIQUE)

insert into categories
values ('jalanõud')

select *from categories


-- Tabel products
create table products(
product_id int Primary key identity(1,1),
product_name VARCHAR(25) UNIQUE,
brand_id int,  
foreign key (brand_id) references brands(brand_id),
category_id int,
foreign key (category_id) references categories(category_id),
model_year int,
list_price money)

insert into products
values ('jooksu püksid',2,1,2021,10.99)

select *from products
select *from brands
select *from categories 

--tabel customers
create table customers(
customers_id int Primary key identity(1,1),
first_name VARCHAR(25) Not Null,
Last_name varchar(25) Not Null,
phone char(13),
email varchar(25) Not Null,
street varchar(25),
city varchar(25),
state varchar (25),
zip_code char(5))

select *from customers

insert into customers
Values ('Priit', 'mets', '348956', 'Priit.mets@gmail.com','Mingi tänav', 'linnutee', 'Eesti', '54876')

-- Tabel stores
create table stores(
store_id int primary key identity(1, 1),
store_name varchar(25) unique Not Null,
phone char(13),
email varchar(25) Not Null,
street varchar(25),
city varchar(25),
state varchar (25),
zip_code char(5))

Select *from stores

insert into stores
values ('Sportland','985376', 'sportland@gmail.com', 'Priisele', 'lasnamäe', 4398) 

--Tabel Staff
create table staff(
staff_id int primary key identity(1, 1),
first_name varchar (25) Not Null,
last_name varchar(25) Not Null,
email varchar(25) Not Null,
phone char(13),
active bit,
store_id int,
Foreign key (store_id) references stores(store_id),
manager_id bit)

select *from staff

insert into staff
values ('Mia', 'Raud', 'Mia.raud@gmail.com', 958476 ,1, 1, 0)

--Tabel stocks
create table stocks(
sore_id int,
product_id int,
primary key(store_id, product_id),
foreign key (store_id) references stores(store_id),
foreign key (product_id) references products(product_id),
quantity int)

select *from stores
select *from products

insert into stocks
values(1, 1, 100), (1, 2, 30)
select *from stocks

--tabel orders
create table orders(
order_id int primary key identity(1, 1),
customer_id int, 
foreign key (customer_id) references customers(customers_id),
order_status varchar(10) check(order_status = 'tehtud' or order_status = 'tegematta'),
order_date date,
required_date date,
shipped_date date,
store_id int,
foreign key (store_id) references stores(store_id),
staff_id int,
foreign key (staff_id) references staff(staff_id))

select *from orders
select *from stores
select *from staff
select *from customers

insert into orders
values (1, 'tehtud', '2026-04-21', '2026-05-10', '2026-05-01', 1, 1,)

--tabel order_items
create table order_items(
order_id int,
foreign key (order_id) references orders(order_id),
item_id int,
product_id int,
foreign key (product_id) references products(product_id),
primary key (order_id, item_id),
quantity int,
list_price money,
discount int)

insert into order_items
values (1, 1, 2, 100, 20)












