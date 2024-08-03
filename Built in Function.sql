use t201;
drop table employee;
create table employee(
id int primary key, 
fname varchar(20), 
lname varchar(20),
 salary float , 
 leaves int ,
 bouns float);
 
 insert into employee values 
(1, "raj", "kumar", 25000,5,500 ),
(2  , "rani", "dube", 35000,10,null ),
(3, "aniket", "chavan", 50000,7,200 );

  select * from   employee;
  
  -- string function
  select concat("sql", "-", "java" ,"-","python");
  
  select lname,fname from employee;
  
  select concat(lname, " : " , fname) as full_name from employee;
  
  select concat_ws( "-" , fname, lname)as full_name from employee;
  
  select upper(fname) as uppercase  from employee;
  
  select lower("TEJA") as lower;
  
  select reverse(fname) as reverse  from employee;
  
  select insert("Java", 1,3,"-");
  
  select insert(fname, 1,2,"#") from employee;
  
  -- aggregate funcation
  -- min max avg sum count 
  select min(salary) from employee;
  select max(salary) from employee;
  select min(bouns) from employee;
  select avg(salary) from employee;
  select sum(salary) from employee;  
  select count(id) from employee;
      
      -- show me salary getting salary more than avg salary
      select avg (salary)from employee;
      select * from employee where salary>( select avg (salary)from employee);
       -- show me salary getting salary 35000
       select fname from employee where salary = 35000;
   
   -- mach function 
    select abs (-56);  -- absoulte value( remove  - sign)
	select abs (56);
	select floor(52.99); -- toward small integer value
	select ceil(52.10); -- toward large integer value
	select round(52.51); -- 
	select round(52.45);
	select round(52.125, 2); 
	select round(52.124, 2); 
	select truncate(52.129, 2);
   
   
   select curdate(); -- to get current date
   select now();  -- to get current date with time
   
   select year (curdate());
   
   select year ("23-11-08");
   
   select month(curdate());
   
   select month("23-11-08");
   
   select day (curdate());
   
   select day("23-11-08");
   
   select dayofweek(curdate());
   
   select dayofweek("23-11-08");
   
   select last_day(curdate());  -- get last day of given day
   select datediff("2024-07-31","2024-07-23");
   select datediff( last_day(curdate()),curdate());
   
   -- formating date
    select date_format(curdate(), "%Y");
    select date_format(curdate(), "%y");
   select date_format(curdate(), "%b");
   select date_format(curdate(), "%m");
    
	select date_format(curdate(), "%D");
    select date_format(curdate(), "%d");
	select date_format(curdate(), "%W"); -- week day name 
	select date_format(curdate(), "%w"); -- sunday = 0
    select date_format(curdate(), "%a"); -- 3 characters of week 
    select curdate();
    select date_format(curdate(), "%d/%M/%Y");
    
    
         
    
   
       
       
  
  