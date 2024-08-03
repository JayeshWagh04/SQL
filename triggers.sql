use t201;
drop table employe;

create table employee (
id int primary key ,
name varchar(20),
age int,
salary float
);

insert into employee values 
(1 , 'raj', 30,30000 ),
(2, 'rani',25, 25000);

select * from employee;
drop view emp_avg;
create table emp_avg (avg_age float , avg_salary float);

insert into emp_avg values(
(select avg (age) from employee),
(select avg(salary)from employee));


select * from emp_avg;

-- without triggaer we can insert values inside employee but it will 
-- not reflect  in emp_avg
 insert into employee values (4, 'rajat' ,40,40000);
 select * from employee;
 select * from emp_avg;
 
 -- with triggaer we can insert values inside employee but it will 

 create trigger emp_avg_after_insert
 after insert on  employee
 for each row 
 update emp_avg 
 set 
 avg_age=(select avg(age) from employee),
 avg_salary=(select avg(salary)from employee );
 
 insert into employee values (5, 'rajat' ,45,45000);
 select * from employee;
 select * from emp_avg;
 
 insert into employee values (6, 'amit' ,21,5000);
 select * from employee;
 select * from emp_avg;
 

 -- create trigger befor inserting record into employee
 delimiter $$
 create trigger age_cheking_befor_insert
 before insert on employee 
 for each row
 if new.age<18 then set new.age=0;
 end if$$
 delimiter ;
 
  set sql_safe_updates = 0;
 insert into employee values (7, 'sunita' ,11,5000);
 select * from employee;
 select * from emp_avg;
 
 
 create table employee_backup (
id int primary key ,
name varchar(20),
age int,
salary float
);

create trigger backup_befor_delete
before delete on employee 
for each row 
insert into employee_backup
values (old.id, old.name, old.age, old.salary);

delete from employee where id=2;
select * from employee_backup;
select * from employee;
 
 