use t201;

create table doctor(
did int primary key,
dname varchar(20),
dphone varchar(20)
);

create table patient (
pid int primary key,
pname varchar(20),
pphone varchar(20),
did int,
constraint did_fk foreign key(did) references doctor(did)
);

insert into doctor values
(1, "dr.raj", "9623590364"),
(2, "dr.rani" ,"7058872664"),
(3, "dr.amit" ,"4569871235");
drop table doctor;

insert into  patient values
(11, "Lalu", "3216549872",1),
(22, "Jaggu", "4561136547",1),
(33, "Mannu", "4561136545",1),
(44, "Babu", "4561536547",2),
(55, "Pappu", "4661136547",null);

drop table patient;
select* from doctor;
select* from patient;


-- show patient name with dovtor name who treate him
-- select cloumn_name from both tables
-- from table1
-- inner join table2
-- on table1.column_name = table2.cloumn_name

select pname as patient_name, dname as doctor_name
from doctor
inner join patient
on doctor.did = patient.did;

-- show me all  doctor wether thay have treated a patient or not
select dname as doctor_name,pname as patient_name
from doctor
left join patient
on doctor.did = patient.did;

-- show mr all  patient wether thay got  treated  or not
select pname as patient_name , dname as doctor_name
from doctor
right join patient
on doctor.did = patient.did;

-- self join
drop table employee;

create table emp(
id int primary key,
name  varchar(20),
phone varchar(20),
manager_id int);

select * from emp;

insert into emp values
(1, "raj", "123",2),
(2, "rani", "456",3),
(3,  "amit",  "789", null);

-- emp - employee
-- emp - manader
select employee.id as  employee_id,  employee.name as  employee_name, manager.name as manager_name
from emp  employee
inner join emp manager
on  employee.manager_id = manager.id;

-- union
select dname as doctor_name,pname as patient_name
from doctor
left join patient
on doctor.did = patient.did
union
select pname as patient_name , dname as doctor_name
from doctor
right join patient
on doctor.did = patient.did;


-- natural join 
-- no need of ON while using natural jion. it wiil automaticaliy find the comun cloumn 
 select pname as patient_name, dname  as doctor_name
 from doctor
 natural join patient;
 
 select * from doctor natural join patient;
 
 select dname,dphone, pname , pphone from doctor natural join patient; 
 
 
 -- euui join
 create table sql_marks
 (
 id int primary key,
 name varchar(20),
 marks int
 );
 
  create table java_marks
 (
 id int primary key,
 name varchar(20),
 marks int
 );
 
 
 insert into  sql_marks values
 (1, 'raj', 96),
  (2, 'rani', 90),
 (3, 'aniket', 92);
 
  insert into  java_marks values
 (1, 'raj', 96),
  (2, 'rani', 87),
 (3, 'aniket', 95);
 
 
 select sql_marks.name from sql_marks,java_marks
 where sql_marks.marks=java_marks.marks;
 
 select sql_marks.name from sql_marks,java_marks 
 where sql_marks.marks>java_marks.marks;
  
