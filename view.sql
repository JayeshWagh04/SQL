drop table student;
use t201;
create table student 
(
id int primary key, 
name varchar(20),
city varchar(20)
);

create table marks
(
sid int primary key,
sql_marks int,
java_marks int,
constraint sid_fk foreign key(sid) references student(id)
);


insert into student values
(1 ,'raj', 'pune'),
(2, 'rani', ' pune'),
(3, 'amit', ' mumabai'),
(4, 'sumit', ' mumabai'),
(5, 'tejas', ' thane'),
(6, 'arti', ' thane');

insert into  marks values
(1,95,92),
(2,85,65),
(3,30,86),
(4,80,30),
(5,75,56),
(6,32,83);

-- ctreate view with student name and their  sql and java marks
create view student_marks as select id, name , sql_marks, java_marks 
from student , marks
where student.id = marks.sid;

 select * from student_marks;
 
  select * from student_marks order by sql_marks;
  select * from student_marks;
  update  student_marks set sql_marks=96 where id=1;
    select * from student_marks;
      select * from marks;
      
      -- avg view with city wise avg sql marks
create view students_marks as
select city , sql_marks
from student , marks
where student.id = marks.sid;


select * from students_marks;

select avg(sql_marks) as avgMarks , city 
from students_marks
group by city;


  
    
  
  
