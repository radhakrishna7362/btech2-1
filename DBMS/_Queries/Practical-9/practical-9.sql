delimiter @
create procedure cust_veh_details()
begin
	declare ve_id int;
    declare v_finished int default 0;
    declare c1 cursor for select veh_id from contract_permission;
    declare continue handler for not found set v_finished=1;
open c1;
	v_details:loop
		fetch c1 into ve_id;
        if v_finished=1 then
        leave v_details;
        end if;
        select * from customer c,vehicle v where v.veh_id=ve_id and c.v_id=ve_id;
	end loop v_details;
close c1;
end @
delimiter ;

call cust_veh_details();

delimiter $@
create procedure branch_cust_details()
begin
	declare cus_id int;
    declare b_finished int default 0;
    declare c1 cursor for select c_id from branch;
    declare continue handler for not found set b_finished=1;
open c1;
	b_c_details:loop
		fetch c1 into cus_id;
        if b_finished=1 then
        leave b_c_details;
        end if;
        select * from customer where cust_id=cus_id;
	end loop b_c_details;
close c1;
end $@
delimiter ;

call branch_cust_details();

delimiter $$
create procedure branch_details(in st varchar(20))
begin
	select * from branch where state=st;
end $$
delimiter ;

call branch_details('Andhra pradesh');

delimiter $$
create procedure cust_details_under_dealer()
begin
	declare cust_id int;
    declare cust_name varchar(10);
    declare cust_dob varchar(10);
    declare cust_city varchar(25);
    declare cust_street varchar(100);
    declare cust_state varchar(25);
    declare pincode numeric;
    declare cust_phno bigint;
    declare deal_no int;
    declare photo_identity varchar(1);
    declare v_id int;
    declare deal_id int;
    declare deal_name varchar(10);
    declare c_finished integer default 0;
    declare c1 cursor for select c.*,d.deal_id,d.deal_name from Customer c inner join registration r on r.cust_id = c.cust_id inner join Dealer d on r.deal_id = d.deal_id;
	declare continue handler for NOT FOUND set c_finished = 1;
    open c1;
    get_customer: LOOP
		fetch c1 into cust_id,cust_name,cust_city,cust_street,cust_state,pincode,cust_phno,deal_no,photo_identity,v_id,cust_dob,deal_id,deal_name;
        if c_finished = 1 then
			leave get_customer;
		end if;
		select concat(cust_id,',',cust_name,',',cust_dob,',',cust_street,',',cust_state,',',pincode,',',cust_phno,',',photo_identity,',',v_id,',',deal_id,',',deal_name);
	end loop get_customer;
    close c1;
end $$
delimiter ;

call cust_details_under_dealer();

delimiter $$
create procedure proc_edu()
begin
	select e.*,b.branch_id,b.b_name from EDU_BUS e inner join Branch b on e.edu_id = b.e_id;
end $$
delimiter ;

call proc_edu();