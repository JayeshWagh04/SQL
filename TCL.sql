use t201;
show tables ;

drop table employee;

create table employee(
id int primary key ,
name varchar(20) not null default 'NA' ,
salary float not null default 0
);

start transaction;
insert into employee
(id  , name , salary)
values
(1 , "raj" , 35000),
(2 , "rani" , 45000);

 select * from employee;
 
 savepoint insertion_step;
 
 delete from employee where id=1;
  
 select * from employee;
  -- for undo -- 
 rollback to   insertion_step;
 select * from employee;
   
 update employee set name="vijay" where id=2;
   
 select * from employee;
    
 rollback to   insertion_step;
 select * from employee;
    
 delete from employee where id=1;
 select * from employee;
       
 commit;
 select * from employee;
  
 rollback to   insertion_step;
 select * from employee;

     
     
     
   