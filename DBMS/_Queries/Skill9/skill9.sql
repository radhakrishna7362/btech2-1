select * from bill;
select * from quotation;
select * from world;

-- 1
delimiter @
create procedure exp_amount()
begin
	declare exp_amount int;
    declare count int default 0;
    declare q_finished int default 0;
    declare c1 cursor for select exp_amt from quotation;
    declare continue handler for not found set q_finished=1;
open c1;
	q_details:loop
		fetch c1 into exp_amount;
        select exp_amount;
        set count=count+1;
        if count=5 then
		leave q_details;
        elseif q_finished=1 then
        leave q_details;
        end if;
	end loop q_details;
close c1;
end @
delimiter ;

call exp_amount();

-- 2
delimiter $
create procedure Adv_amount()
begin
	select * from quotation where advance_paid in (select max(advance_paid) from quotation);
end $
delimiter ;

call Adv_amount();

-- 3
delimiter $$
create procedure sorted_quotation()
begin
	select cust_id,cust_name,exp_amt from quotation order by exp_amt desc;
end $$
delimiter ;

call sorted_quotation();

-- 4
delimiter @@
create function Customer_name(c_id int) returns varchar(20)
begin
	declare c_name varchar(20);
    select cust_name into c_name from quotation where cust_id=c_id;
    return c_name;
end @@
delimiter ;

select Customer_name(1);

-- 5
delimiter $@$
create function glass(cus_id int) returns varchar(50)
begin
	declare g_type varchar(20);
    declare g_feature varchar(20);
    select glass_type into g_type from quotation where cust_id=cus_id;
    select glass_feature into g_feature from bill where cust_name in (select cust_name from quotation where cust_id=cus_id);
    return concat(g_type,',',g_feature);
end $@$
delimiter ;

select glass(1);

-- 6
delimiter @$
create procedure delete_noadvance()
begin
	delete from quotation where advance_paid is NULL or advance_paid = 0;
end @$
delimiter ;
insert into quotation values(11,'RK',7286009239,'Mirror','4MM','120CM','Blue','Hyd',10000,0);
-- before delete
select * from quotation;
call delete_noadvance();
-- after delete
select * from quotation;