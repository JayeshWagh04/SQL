use t201;
select * from student;
call `new_procedure`();
 show procedure  status where db= 't201';
 
 call getStudentcount();
 
 -- input paremetter to SP
 call getStudentcountById(1);
 
 -- output from SP
 call returnStudentCount(@count);
 select @count;
 
 call inAndOut('pune', @count);
 select @count;
 
 call conditionalSP(1);
  call conditionalSP(10);
  
  drop procedure test;
  show procedure  status where db= 't201';
  
  -- loop in SP
  
  call loopSpP();
  
  select `sum_1_to_5`();
  
  
 
 