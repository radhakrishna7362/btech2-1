-- 1
delimiter @
create procedure countryDetails()
begin
	select c.cid,c.cname,c.population,w.infected,w.died,w.recoverd from country c,worldstatistics w where w.cid=c.cid;
end @
delimiter ;

call countryDetails();

-- 2
delimiter $$
create procedure CasesDetails()
begin
	declare ctyname varchar(20);
    declare cases int;
    declare death int;
    declare c_finished int default 0;
    declare c1 cursor for select cname,infected,died from worldstatistics;
	declare continue handler for not found set c_finished=1;
open c1;
	c_details:loop
		fetch c1 into ctyname,cases,death;
		if c_finished=1 then
		leave c_details;
		end if;
        select concat(ctyname,',',cases,',',death) as country_Details;
	end loop c_details;
close c1;
end $$
delimiter ;
            
call CasesDetails();

-- 3
create table cases(ssn int,cid int,name varchar(20),result varchar(20),date varchar(20),status varchar(20),changed_At TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

delimiter @@
create trigger addPatientLog after update on person
for each row
begin
	if OLD.result='Negative' and NEW.result='Positive' then 
	insert into cases values(OLD.ssn,OLD.cid,OLD.name,NEW.result,OLD.date,OLD.status,current_timestamp);
    end if;
end @@
delimiter ;

update person set result="positive" where ssn=2;
select * from cases;

-- 4
create table personlog(ssn int,cid int,name varchar(20),result varchar(20),date varchar(20),status varchar(20),changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP); 

delimiter $
create trigger addPersonLog after insert on person
for each row
begin
	if NEW.status = 'dead' then
	insert into personlog values(NEW.ssn,NEW.cid,NEW.name,NEW.result,NEW.date,NEW.status,current_timestamp());
    end if;
end $
delimiter ;

insert into person values(13,95,'akhil','positive','12-10-2020','dead');
select * from personlog;