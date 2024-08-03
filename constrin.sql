use t201;

create table book(
id int primary key,
book_name varchar(20) not null unique,
author_name varchar(20) not null default 'NA',
price int check (price>99 and price<999) not null,
genre enum('comedy','horror','scifi'),
available_in set('online','offline','audiobook')
);

show tables;
desc book;

insert into book 
(id,book_name,author_name,price,genre,available_in)
values
(1,'sql','jayesh',299,'horror','online,offline');

select * from book;

-- voileting pk constraint by passing same id
insert into book 
(id,book_name,author_name,price,genre,available_in)
values
(1,'sql','jayesh',299,'horror','online,offline');
-- Error Code: 1062. Duplicate entry '1' for key 'book.PRIMARY'


-- voileting pk constraint by not passing id
insert into book 
(book_name,author_name,price,genre,available_in)
values
('sql','tejas k',299,'horror','online,offline');

-- checking default constraint by not passing author_name
insert into book 
(id,book_name,price,genre,available_in)
values
(2,'java',299,'horror','online,offline');

select * from book;

-- voileting check constraint
insert into book 
(id,book_name,author_name,price,genre,available_in)
values
(3,'python','tejas k',2000,'horror','online,offline');

-- violeting enum and set by passing value other than given values
insert into book 
(id,book_name,author_name,price,genre,available_in)
values
(4,'html','tejas k',299,'fiction','online,offline');

insert into book 
(id,book_name,author_name,price,genre,available_in)
values
(4,'html','tejas k',299,'horror','online');

select * from book;