CREATE DEFINER=`root`@`localhost` PROCEDURE `name_cursor_sp`()
BEGIN
declare is_finished int default 0;
declare name_list varchar(50);
declare single_name varchar(50);
declare name_cursor cursor for select name from employee;
declare continue handler for not found set is_finished=1;

open name_cursor;
myloop : while 10 > 2 do 
fetch name_cursor into single_name;

if  is_finished=1 then leave myloop;
end if;

set name_list = concat_ws(',' ,name_list,single_name);
end while myloop;
close name_cursor;
select name_list;


END