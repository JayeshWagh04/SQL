use t201;
drop table employee;

create table employee(
id int primary key,
name varchar (20),
parday int,
leaves int,
bouns int);

desc employee;

insert into employee values
(1, "raj" , 1200,10,200),
(2, "rani", 900,1,500),
(3,"ajay", 1500,15,100);

-- getting all columns with all records from table
select * from employee;

-- getting perticular columns with all records from table
select id,name from employee;

-- show name and salary of each employee (for 30 days)
select name, parday, parday*30 as salary from employee;

-- show name, salary and incremented salary after bonus
select name , parday*30 as salary, parday*30+bouns as increment from employee;

-- show  salary after deducting leaves
select name , parday*(30-leaves) as final_salary from employee;

-- make salary half due to COVID
select name , parday*15 as COVID_salary from employee;
select name, (perday*30)/2 as covid_salary from employee;

-- show employee getting salary more than 30k
select name, parday*30 as salary from employee where parday*30>30000;

-- show employee getting salary less than 30k
select name, parday*30 as salary from employee where parday*30<30000;

-- show employees getting perday more than 1000
select name, parday from employee where parday>1000;

-- show employees getting perday 900
select name, perday from employee where perday=900;

-- show employees who are not getting perday 900
select name, perday from employee where perday!=900;
select name, perday from employee where perday<>900;

-- >,<,=, >=, <=, !=

-- string comparision
-- show employee whos name starts with r
select name from employee where name like 'r%' ;

-- show employee whos name ends with i
select name from employee where name like '%i' ;

-- show employee whos name starts with r and has exactly 2 charcters after r
select name from employee where name like 'r__' ;

--  and or not LOGICAL OPRETORS
-- Show employee whos name sart with r and has parday more thane 1000
select * from employee where name like 'r%' and parday >1000;

-- Show employee whos name either sart with r or  has parday more thane 1000
select * from employee where name like 'r%' or parday >1000;

-- show all employee 
select * from employee where name not like 'a%';

-- MULTIPLE OR use 
 select * from employee where parday=900 or parday=1200 or parday=1000;
  select * from employee where parday   in (900,1200);
  
  select* from employee where parday not in (900,1200);
 
 -- data between given rang
 select * from employee where bouns between 50 and 250;
  select * from employee where bouns between 150 and 250;
  
 select * from employee where bouns not between 50 and 250;
 
 -- sorting using order by
 select * from employee order by leaves;
  select * from employee order by leaves desc;
  select * from employee where bouns>150 order by parday;
  
  -- employee with max leaves 
  select * from employee order by leaves desc limit 1;
  
  -- employee with second max leaves
    select * from employee order by leaves desc limit 1 offset 1;
    
    --  getting record with null values
    insert into employee(id, parday, leaves , bouns) values (4,  1200,10,200);
     insert into employee(id, name,parday, leaves ) values (5,  'rani',1200,10);
select * from employee ;

select * from employee where name is null;
select * from employee where bonus is null;
select * from employee where name is not null;
select * from employee where name = null; -- wrong
  
 





