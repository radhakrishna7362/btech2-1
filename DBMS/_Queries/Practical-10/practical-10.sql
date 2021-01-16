select * from customer;

delimiter $$
create procedure ageOfCustomers()
begin
	select datediff(now(),_dob)/365.25 as age_in_years from customer;
end $$
delimiter ;

call ageOfCustomers();

delimiter @
create function NoOfyears(v_id int) returns float
begin
	declare years float;
	select datediff(now(),_date)/365.25 into years from registration where veh_id = v_id;
    return years;
end @
delimiter ;

select NoOfYears(veh_id) from registration;

create table dealerCenterStats(new_deal_id int,new_deal_name varchar(25),new_city varchar(25),
new_street varchar(25),new_state varchar(25),new_pincode int,new_dno int,new_phno bigint);

delimiter $$
create trigger new_dealer before insert on dealer for each row
begin
	insert into dealerCenterStats values(NEW.deal_id,NEW.deal_name,NEW.city,NEW.street,NEW.state,NEW.pincode,NEW.d_no,NEW.ph_no);
end $$
delimiter ;

insert into dealer values(61,'RK','Vijayawada','Benz Circle','AndhraPradesh',500023,112,7286009239);
select * from dealercenterstats;

create table remainder(before_name varchar(50),after_name varchar(50));

delimiter $$
create trigger Customer_log after update on customer for each row
begin
	insert into remainder values(OLD.cust_name,NEW.cust_name);
end $$
delimiter ;

update customer set cust_name='RK' where cust_id=41;
select * from remainder;