use t201;
show tables;
select * from employee;
select avg(parday) from employee;
select * from employee where parday >(select avg(parday) from employee);
-- shoe me less parday earning
select min(parday) from employee;
select *  from employee where parday =  (select min(parday) from employee);

-- who has more leaves than raj
select leaves  from employee where name = "raj" ;
select * from employee where leaves>(select leaves from employee where name = "raj");

-- single row subquery 
-- when chi/ subqurey inside()


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
 
  select* from orders;
  
  select uid from user where name = 'raj';
  select count(oid) from  orders where uid=( select uid from user where name = 'raj');
  
  select pid from product where name = 'shirt';
  select count(oid) from  orders where pid = 1;
  
  select * from user where uid not in (select uid from orders);

 -- which product sold more 
select pid , count(pid) from orders group by pid;
select pid , count(pid) from orders group by pid order by count(pid) desc;
select pid , count(pid) from orders group by pid order by count(pid) desc limit 1;
select pid from orders group by pid order by count(pid) desc limit 1;
select name from product where pid = (select pid from orders group by pid order by count(pid) desc limit 1);


  
  
  
   



