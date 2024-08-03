show databases; -- checking all database 
use mysql; -- selecting defailt database mysql
show tables; -- getting all table from mysql database
select * from user; -- selecting all cloumn from user table 
select User from user; -- selecting only uder cloumn from user table

-- creating new user 
create user 'jayesh'@'localhost' identified by 'admin@1234';
create user ' jay'@'localhost' identified by 'admin@123';

-- cheking permissions for above users
show grants for 'root'@'localhost';
show grants for 'jay'@'localhost';

-- given permission to perticular user
grant insert on t201.book to 'jay'@'localhost';
grant insert on t201.book to 'jayesh'@'localhost';

show grants for 'jayesh'@'localhost';
show grants for 'jay'@'localhost';
grant insert on t201.book to 'ajay'@'localhost';
use mysql;
create user 'ajay'@'localhost' identified by 'admin@1234';
create user ' atul'@'localhost' identified by 'admin@123';
grant insert on t201.book to 'ajay'@'localhost';
grant insert on t201.book to 'atul'@'localhost';
create user ' atul1'@'localhost' identified by 'admin@123';
grant select on t201.book to 'atul'@'localhost';


-- remove permission 
revoke select on t201.book from 'atul'@'localhost';
show grants for 'atul'@'localhost';

													



