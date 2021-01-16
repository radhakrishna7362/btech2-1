-- 1
delimiter $$
drop procedure if exists proc_stu;
create procedure proc_stu()
begin
	declare regno int;
    declare name varchar(10);
    declare Mobileno bigint;
    declare email varchar(20);
    declare address varchar(10);
    declare branch varchar(10);
    declare year int;
    declare semester int;
    declare course_code varchar(10);
    declare fid int;
    declare s_finished integer default 0;
    declare c1 cursor for select s.REGNO,s.NAME,s.Mobileno,s.EMAIL,s.Address,s.Branch,st.YEAR,st.SEMESTER,st.COURSECODE,st.FID from Student s inner join Stu_Reg_Courses st on st.REGNO = s.REGNO;
    declare continue handler  for NOT FOUND set s_finished = 1;
    open c1;
    get_stu: LOOP
		fetch c1 into regno,name,Mobileno,email,address,branch,year,semester,course_code,fid;
        if s_finished = 1 then
			leave get_stu;
		end if;
        select concat(regno,',',name,',',Mobileno,',',email,',',address,',',branch,',',year,',',semester,',',course_code,',',fid) as student_course_details;
	end loop get_stu;
    close c1;
end $$
delimiter ;
call proc_stu();

-- 2
delimiter $$
create procedure fee_details()
begin
	select s.*,f.Fee_Type,f.YEAR,f.SEMESTER,f.FEEAMOUNT from Student s inner join FEE f on s.Branch = f.BRANCH;
end $$
delimiter ;
call fee_details();

-- 3
create table student_log(deleted_regno int,deleted_name varchar(10),deleted_mobile_no bigint,deleted_stu_email varchar(20),deleted_stu_address varchar(20),deleted_stu_branch varchar(10));

delimiter $$
create trigger trig_stu_delete after delete on Student
for each row
begin
		insert into student_log values(old.REGNO,old.NAME,old.Mobileno,old.EMAIL,old.Address,old.Branch);
end $$
delimiter ;
delete from student where REGNO = 1001;
select *from student_log;

-- 4
delimiter $$
create procedure update_Faculty_salary()
begin
	declare F_ID int;
    declare f_finished integer default 0;
    declare c1 cursor for select FID from Faculty;
    declare continue handler for NOT FOUND set f_finished = 1;
    open c1;
    get_Faculty: LOOP
		fetch c1 into F_ID;
        if f_finished = 1 then
			leave get_Faculty;
		end if;
        update Faculty set Salary = Salary + 1500 where FID = F_ID;
	end loop get_Faculty;
    close c1;
end $$
delimiter ;
-- before update
select * from Faculty;
call update_Faculty_salary();
-- after update
select * from Faculty;