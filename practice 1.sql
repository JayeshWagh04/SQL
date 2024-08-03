-- 1)Write a query to create a database named as Company.
create database company;

-- 2)Write a query to view all databases.
show databases;

-- 3)Write a query to create a table with following Schema.
use company;
create table employee(
id int, 
first_name varchar(50),
last_name varchar(50),
date_of_joining date
);

-- 4) Write a query to view all tables in the database Company.
show tables;

-- 5) Write a query to add a column salary with datatype float on the existing table employee.
alter table employee add column salary float;
select * from employee;

-- 6)Write a query to drop a column date_of_joining from the existing table employee.
alter table employee drop column date_of_joining ;
select * from employee;
-- 7)Write a query to add primary key to column id on existing table employee.
alter table employee add primary key(id);



create table user (uid int primary key, name varchar(20));
create table product(pid int primary key, name varchar(20), price int);

create table orders (
oid int primary key,
pid int,
uid int,
foreign key (pid) references product(pid),
foreign key (uid) references user(uid)
);
   
 insert into user values (11, 'raj'),(22,'aniket'),(33, 'puja'), (44,'rupali'); 
 insert into product values (1 ,'shirt',999),(2, 'mobile',1599);
 insert into orders values (101,1,11), (102,1,22),(103,1,22),(104,2,33),(105,2,11);
 
-- Retrieve user with uid = 11:
 select*from user where uid = 11;
 
 -- Retrieve users with names starting with 'r':
 select * from user where name like "r%";
 
 -- Retrieve users with names ending with 'a':
 select* from user where name like "%a";
 
 -- Retrieve users whose names contain 'a':
 select* from user where name like "%a%";
 
 -- Retrieve users with uid greater than 20
select * from user where uid>20; 

-- Count the number of users:
 select count(uid) from user;
 
 -- Retrieve the maximum uid:
 select max(uid) from user;
 
 -- Retrieve the minimum uid:
 select min(uid) from user;
 
 -- Retrieve the average uid:
 select avg(uid) from user;
 
-- Retrieve product with pid = 1:
select * from product where pid = 1;

-- Retrieve products with price greater than 1000:
select * from product where price>1000;

-- Retrieve products with names starting with 'm':
select * from product where name like "m%";

-- Retrieve products with names containing 'e':
select * from product where name like "%e%";
 
-- Retrieve all orders for a specific user (e.g., user with uid = 11):
select*from orders where  uid= 11;

-- Retrieve all orders for a specific product (e.g., product with pid = 1):
select* from orders where pid=1;

-- Count the total number of users:
select count(*) from user;

-- Count the total number of products:
select count(*) from product;

-- Find the user with the highest uid:
select * from user order by uid desc limit 1;

-- Find the product with the highest pid:
select*from product order by pid desc limit 1;

-- Find the most expensive product:
select * from product order by price desc limit 1;

-- Find the least expensive product:
select * from product order by price asc limit 1;
 
 -- Retrieve all users with names starting with 'a':
 select* from user where name like 'a%';
 
 -- Retrieve orders with an oid greater than 102:
 select * from orders where oid >102;
 
 -- Retrieve the total price of all products:
 select sum(price) from product;
 
 -- Retrieve the number of distinct users who have placed orders:
 SELECT COUNT(DISTINCT uid) FROM orders;

-- Retrieve the number of distinct products that have been ordered:
select count(distinct pid) from orders;

-- Retrieve users with a specific name (e.g., 'raj')
select*
from user where name = 'raj';

-- Retrieve products with a specific name (e.g., 'shirt'):
select * from product where name = 'shirt';

-- Retrieve orders for a specific combination of uid and pid (e.g., uid = 11 and pid = 1):
select * from orders where uid = 11 and pid= 1;

-- Retrieve orders placed by user with uid = 22:
select * from orders where uid = 22;

-- Retrieve orders for product with pid = 2:
select * from product where pid = 2;

-- Retrieve user information for user with uid = 33:
select * from user where uid = 33;

-- Retrieve orders with oid less than 104:
select * from orders where oid<104;

-- Retrieve the total number of users named 'aniket':
select count(*) from user where name = 'aniket';

-- Retrieve the order with the smallest oid:
select min(oid), min(pid) from orders ;
SELECT * FROM orders ORDER BY oid ASC LIMIT 1;

-- Retrieve the second most expensive product:
select* from product order by  price limit 1;
SELECT * FROM product ORDER BY price DESC LIMIT 1 OFFSET 1;

-- Retrieve the second least expensive product:
select * from product order by price asc limit 1;

-- Retrieve the average price of products that cost more than 1000:
select avg(price) from product where pid>1000;

-- Retrieve the sum of prices for products that cost less than 1500:
select sum(price) from product where pid<1500;

-- Retrieve the count of orders with oid greater than 100:
select count(*) from orders where oid >100;

-- Retrieve users with uids between 20 and 40:
select * from user where uid between 20 and 40;

-- Retrieve products with prices between 900 and 1600:
select * from product where price between 900 and 1600;

-- Find the maximum price of products:
select max(price) from product;

-- Find the total amount spent by a specific user (e.g., uid = 11):
SELECT SUM(price) 
FROM product 
WHERE pid IN (SELECT pid FROM orders WHERE uid = 11);

-- Find the names of users who have placed at least one order:

SELECT name 
FROM user 
WHERE uid IN (SELECT DISTINCT uid FROM orders);

-- Find the names of products that have been ordered at least once:
select name from product 
where pid in (select distinct pid from orders);

-- List all users along with a flag indicating if they have placed any orders:
SELECT name, 
       CASE WHEN uid IN (SELECT DISTINCT uid FROM orders) THEN 'Yes' ELSE 'No' END AS has_orders 
FROM user;

-- List all products along with a flag indicating if they have been ordered:
select name ,
     case when pid in (select distinct pid ordres) THEN 'Yes' ELSE 'No' END AS has_orders 
     from product;

-- Find the total number of distinct users who have placed orders:
select count(distinct uid) from orders;

-- Find the total number of distinct products that have been ordered:
select count(distinct pid) from orders;

-- Find the product that has been ordered the most number of times:

SELECT pid 
FROM orders 
GROUP BY pid 
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- Find the user who has placed the most number of orders:
select  uid from orders
group by uid
order by count(*) desc
limit 1;

-- Find the user with the highest total spending:
SELECT uid, SUM(price) AS total_spent 
FROM orders 
WHERE pid IN (SELECT pid FROM product) 
GROUP BY uid 
ORDER BY total_spent DESC 
LIMIT 1;
-- Find the average price of products ordered by a specific user (e.g., uid = 11):
select avg(price) from product 
where pid in (select pid from user where uid = 11);
 
-- Find all products with a price greater than 1000:
select * from product where price >1000;

-- Find all users whose name starts with 'r':
select* from user where name like 'r%';

-- Find the number of orders placed for product with pid = 1:
select count(*) from orders where pid=1;

-- Find the total amount spent on each product:
select pid,sum(price) from product
where pid in (SELECT pid FROM orders) GROUP BY pid;

-- Retrieve the names of users who have placed orders for 'shirt':
select name from user
where uid in (select uid from orders where pid in (select pid from product where name = 'shirt')); 

-- Find the most expensive product:
select*from product where price in (select max(price) from product);

-- Find the cheapest product:
select*from product where price in (select min(price) from product);

-- Calculate the total amount spent by user 'raj':
SELECT SUM(price) FROM product WHERE pid IN (SELECT pid FROM orders WHERE uid IN (SELECT uid FROM user WHERE name = 'raj'));

-- List all users who have not placed any orders:
select*from user where uid not in (select distinct uid from orders);

-- List all products that have not been ordered:
select* from product where pid not in (select distinct pid from orders);

-- Find the average price of all products:
SELECT COUNT(DISTINCT pid) FROM orders WHERE uid = (SELECT uid FROM user WHERE name = 'aniket');

-- Retrieve the names of products that cost more than the average price:
select name from product where price > (select avg(price) from product );

-- List the names of users who have placed more than one order:
SELECT name FROM user WHERE uid IN (SELECT uid FROM orders GROUP BY uid HAVING COUNT(*) > 1);

-- Find the total number of orders placed for each product:
select  sum(oid),pid from orders group by pid;

-- Find the total revenue generated from orders for each product:
SELECT pid, SUM(price) FROM product WHERE pid IN (SELECT pid FROM orders) GROUP BY pid;

-- Retrieve the details of the order with the highest total price:
SELECT * FROM orders WHERE pid = (SELECT pid FROM product ORDER BY price DESC LIMIT 1);

-- Find the number of orders placed for products costing more than 1000:
select count(*) from orders where pid in (select pid from product where price>1000);

-- Find the number of users who have ordered each product:
SELECT pid, COUNT(DISTINCT uid) FROM orders GROUP BY pid;

