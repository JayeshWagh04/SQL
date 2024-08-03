use t201;
create database t201;

create table employee( name varchar(20));

desc employee;

-- add age column (by defailt at the end )
alter table employee add column age int not null;

desc employee;

-- add id column at the begining 
 alter table employee add column id int primary key first;
 
desc employee;

-- add doj column between name and age 
 alter table employee add column doj date after name;
 
 desc employee;
 -- adding mulpiple column 
  alter table employee add column ( salary float, city varchar(10) );
  desc employee;
  
  -- chenging name column size from 20 to 25 
  alter table employee modify column name varchar(25);
  desc employee;
  
-- adding containt unique  on name column 
 alter table employee add constraint unique_name unique(name);
  desc employee;
  
  
  SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE TABLE_NAME= 'employee';
  
    desc employee;
    use t201;
     desc employee;
     -- deliting constraint 
     alter table employee drop constraint unique_name;
  desc employee;
  
  -- deliting column
   alter table employee drop column city;
  desc employee;
  
  -- renamr column 
   alter table employee  rename to emp;
  desc employee;
   --  rename table 
   alter table employee rename column name to empname;
  desc employee;
  
  --  drop table 
  drop table emp;
  
  
  
  