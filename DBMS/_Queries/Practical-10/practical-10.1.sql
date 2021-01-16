create table faculty_Log(operation_id int primary key auto_increment,FID int,
FNAME varchar(10),Designation varchar(10),Salary int,FMOBILE bigint,
FMAIL varchar(20),FADD varchar(10),Branch varchar(10),changed_at DATETIME NOT NULL,
operation varchar(3) NOT NULL,CHECK(operation = 'INS' or operation = 'DEL'));

delimiter $$
create trigger trig_faculty_insert after insert on faculty
for each row
begin
	 insert into faculty_Log(FID,FNAME,Designation,Salary,FMOBILE,FMAIL,FADD,Branch,changed_at,operation) values(NEW.FID,NEW.FNAME,NEW.Designation,NEW.Salary,NEW.FMOBILE,NEW.FMAIL,NEW.FADD,NEW.BRANCH,current_timestamp,'INS');
end $$
delimiter ;

insert into faculty values(5005,'Surya','Assoc.Prof',50000,8328130161,'klu@kluniversity.in','Mumbai','CSE');

select *from faculty_Log;

delimiter $$
create trigger trig_faulty_delete after delete on faculty
for each row
begin
	insert into faculty_Log(FID,FNAME,Designation,Salary,FMOBILE,FMAIL,FADD,Branch,changed_at,operation) values(OLD.FID,OLD.FNAME,OLD.Designation,OLD.Salary,OLD.FMOBILE,OLD.FMAIL,OLD.FADD,OLD.BRANCH,current_timestamp,'DEL');
end $$
delimiter ;

delete from faculty where FID = 5005;
select *from faculty_Log;

create table faculty_update_Log(before_FID int,updated_FID int,before_FNAME varchar(10),
updated_FNAME varchar(10),before_Designation varchar(25),updated_Designation varchar(25),
old_salary int,new_salary int,before_FMOBILE bigint,updated_FMOBILE bigint,before_FMAIL varchar(30),
before_FADD varchar(20),updated_FADD varchar(20),before_Branch varchar(15),updated_branch varchar(15),
sal_diff int,updated_At DATETIME NOT NULL);

delimiter $$
create trigger trig_faculty_update after update on faculty
for each row
begin
	insert into faculty_update_Log values (old.FID,NEW.FID,OLD.FNAME,NEW.FNAME,OLD.Designation,NEW.Designation,old.Salary,new.Salary,old.FMOBILE,new.FMOBILE,OLD.FMAIL,old.FADD,new.FADD,old.BRANCH,new.BRANCH,old.Salary - new.Salary,current_timestamp);
end $$
delimiter ;

update faculty set Salary = 70000 where FID = 5005;
select *from faculty;

select *from faculty_update_Log;

create table library_Log(operation_id int primary key auto_increment,ACCNO int,
updated_accno int default NULL,BTITLE varchar(30),updated_btitle varchar(30) default 'No Updation',
AUTHOR varchar(30),updated_author varchar(30) default 'No Updation',PUBLISHER varchar(25),
updated_publisher varchar(25) default 'No updation',EDITION int,updated_edition int default null,
PRICE int,updated_price int default null,No_of_Copies int,updated_copies int  default null,
changed_at DATETIME NOT NULL,operation varchar(20) NOT NULL,
CHECK(operation = 'Inserted' or operation = 'Deleted' or operation = 'Updated'));

delimiter $$
create trigger trig_library_insert after insert on library_Books
for each row
begin
	insert into library_Log(ACCNO,BTITLE,AUTHOR,PUBLISHER,EDITION,PRICE,No_of_Copies,changed_at,operation) values(new.ACCNO,NEW.BTITLE,NEW.AUTHOR,NEW.PUBLISHER,NEW.EDITION,NEW.PRICE,NEW.No_of_Copies,current_timestamp,'Inserted');
end $$
delimiter ;

insert into library_books values(105,'MSWD','Radha','Krishna',10,1000,50);
select *from library_Log;

delimiter $$
create trigger trig_library_delete after delete on library_Books
for each row
begin
	insert into library_Log(ACCNO,BTITLE,AUTHOR,PUBLISHER,EDITION,PRICE,No_of_Copies,changed_at,operation) values(old.ACCNO,old.BTITLE,old.AUTHOR,old.PUBLISHER,old.EDITION,old.PRICE,old.No_of_Copies,current_timestamp,'Deleted');
end $$
delimiter ;

delete from library_Books where ACCNO = 105;
select *from library_Log;

delimiter $$
create trigger trig_library_update after update on library_Books
for each row
begin
	insert into library_Log(ACCNO,updated_accno,BTITLE,updated_btitle,AUTHOR,updated_author,PUBLISHER,updated_publisher,EDITION,updated_edition,PRICE,updated_price,No_of_Copies,updated_copies,changed_at,operation) values(old.ACCNO,new.ACCNO,old.BTITLE,new.BTITLE,old.AUTHOR,new.AUTHOR,old.PUBLISHER,new.PUBLISHER,old.EDITION,new.EDITION,old.PRICE,new.PRICE,old.No_of_Copies,new.No_of_Copies,current_timestamp,'Updated');
end $$
delimiter ;

update library_Books set BTITLE = 'OSD' where ACCNO = 105;
select *from library_Log;

delimiter $$
create function faculty_tax(Salary int) returns integer
deterministic
begin
	declare tax int;
    if Salary >= 0 and Salary < 30000 then
    set tax = 10/100 * Salary;
    elseif Salary >= 30001 and Salary < 50000 then
    set tax = 15/100 * Salary;
    elseif Salary >= 50001 then
    set tax = 25/100 * Salary;
    end if;
    return (tax);
END $$
delimiter ;

select faculty_tax(Salary) from faculty;

delimiter $@
create function annual_salary(Salary int) returns integer
deterministic
begin
	declare anu_sal int;
    set anu_sal=Salary*12;
    return anu_sal;
end $@
delimiter ;

select annual_salary(Salary) from faculty;
