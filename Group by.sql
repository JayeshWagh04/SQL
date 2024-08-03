use t201;
create table customer(
customer_id int,
name varchar(20),
amout int,
mode varchar(50)

);

insert into customer values
(1, "raj",50, "cash"),
(2, "raju",60, "online"),
(3, "rajat",30, "cash"),
(4, "rani",90, "card"),
(5, "rutik",20, "cash"),
(6, "rupesh",0, "card"),
(7, "rakesh",50, "online"),
(8, "rupali",40, "online");

select * from  customer;

select name, mode from  customer;

select mode from customer group by mode;

select amout, mode from customer group by mode;  -- NO error nut unless

select sum(amout) from customer group by mode; -- no error but you cant guess what

select sum(amout), mode from customer group by mode; -- best one

select max(amout), mode from customer group by mode;

-- show total transaction according to mode
select count(amout), mode from customer group by mode;

-- show total transaction according to mode greter than 2 transaction
select count(amout), mode from customer group by mode having  count(amout)>2;

-- using order by in group by
select count(amout), mode from customer group by mode having count(amout)>2 order by mode desc;

-- using order by, limit  in group by
select count(amout), mode from customer group by mode having count(amout)>2 order by mode desc limit 1 ;

-- ODER - select, where, group by, having, order by, limit


-- group by cloumn name must br there with select
-- do not use single column name always use aggrugate function in select
-- always use aggregate function wuth having




