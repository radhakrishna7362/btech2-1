-- SKILL-8
-- 1
delimiter $$
create procedure staffdetails()
begin
	declare s_city varchar(50);
    declare s_state varchar(50);
    declare s_finished integer default 0;
    declare c1 cursor for select city,state from staff;
    declare continue handler for not found set s_finished=1;
open c1;
	staffdetails:loop
		fetch c1 into s_city,s_state;
        if s_finished=1 then
		leave staffdetails;
        end if;
		select concat(s_city,",",s_state);
	end loop staffdetails;
close c1;
end $$
delimiter ;

call staffdetails();

-- 2
delimiter @
create procedure renterdetails()
begin
	select * from renter;
end @
delimiter ;

call renterdetails();

-- 3
delimiter @@
create procedure salary_update(a varchar(50))
begin
	declare new_salary int;
    declare s_finished integer default 0;
	declare c cursor for select salary from staff where name=a for update;
	declare continue handler for not found set s_finished=1;
open c;
	salary:loop
		fetch c into new_salary;
        if s_finished=1 then
		leave salary;
        end if;
        update staff set salary=new_salary+200 where name=a;
	end loop salary;
    select * from staff where name=a;
close c;
end @@
delimiter ;

call salary_update("Surya");

-- 4
create table Staff_Log(before_staff_no int,updated_staff_no int,before_name varchar(25),updated_name varchar(25),before_sal int,updated_sal int,before_city varchar(25),updated_city varchar(25),before_state varchar(25),updated_state varchar(25),before_phno bigint,updated_phno bigint,before_email varchar(25),updated_email varchar(25),changed_At TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

delimiter $$
create trigger staff_update after update on STAFF
for each row
begin
	insert into Staff_Log values(OLD.STAFF_NO,NEW.STAFF_NO,OLD.NAME,NEW.NAME,OLD.SALARY,NEW.SALARY,OLD.CITY,NEW.CITY,OLD.STATE,NEW.STATE,OLD.PHONE,NEW.PHONE,OLD.EMAIL,NEW.EMAIL,current_timestamp);
end $$
delimiter ;

update STAFF set NAME = "surya" where STAFF_NO = 50012;
update STAFF set Salary=46400 where STAFF_NO = 50012;
update STAFF set Salary=46500 where STAFF_NO = 50012;
update STAFF set Salary=46500 where STAFF_NO = 50013;

select *from Staff_Log;