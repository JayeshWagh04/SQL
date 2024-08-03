use t201;

create table employee(
id int primary key ,
name varchar(20) not null default 'NA' ,
salary float not null default 0
);

-- insert operation
-- one record at a time (with column name)
insert into employee
(id  , name , salary)
values
(3 , 'ajay' , 45000);

select * from employee;

use t201;
insert into employee values
(4 , 'amit' , 35000);

select * from employee;

insert into employee (id,name) values (5,'ajit');

select * from employee;

-- update-------------------------------------
-- updated raj name to raju
update employee set name='raju' where id='1';

select * from employee;

-- updating multiple column at a time
update employee set name='raj' , salary='20000' where id='1';

select * from employee;

-- updating multiple row ar a time
update employee set name='aniket' where salary=35000;

select * from employee;
SET SQL_SAFE_UPDATES = 0;

UPDATE employee SET name = 'aniket' WHERE salary = 35000;

-- passing id which does not exist
update employee set name = 'kaushik' where  id='100';

-- delete --------------------------------------------
delete from employee where id=1;
select * from employee;

delete from employee where salary=35000;
select * from employee;

-- deleting without where 
delete from employee;
select * from employee;

-- delete vs truncate-------------
drop table employee;

create table employee(
id int primary key auto_increment,
name varchar(20) not null default 'NA' ,
salary float not null default 0
);

insert into employee
(id  , name , salary)
values
(1 , "raj" , 35000),
(2 , "rani" , 20000);

delete from employee;
insert into employee
( name , salary)
values
( "raj" , 35000),
( "rani" , 20000);

select * from employee;

-- trucnate -------------
truncate table employee;
insert into employee
( name , salary)
values
( "raj" , 35000),
( "rani" , 20000);

select * from employee;


