create table contract_permission(
veh_id int,branch_id int,no_of_days int,amount_per_seat int,foreign key(veh_id) references vehicle(veh_id),
foreign key(branch_id) references branch(branch_id));

insert into contract_permission values(4,210,15,200);
insert into contract_permission values(5,210,43,100);
insert into contract_permission values(10,212,15,400);

select * from contract_permission;

-- 1
select customer.cust_name,branch.b_name from branch left join customer on branch.c_id = customer.cust_id;
-- 2
select cust_id,cust_name from customer order by dob asc limit 1;
-- 3
select sum(amount_per_seat) from contract_permission;
-- 4
select distinct veh_type from vehicle;
-- 5
select distinct customer.city,customer.state from customer inner join edu_bus inner join branch inner join Dealer;
-- 6
select count(*) from customer where photo_identity='n';
-- 7
select veh_type from vehicle where veh_id in (select min(veh_id) from vehicle);
-- 9
select * from vehicle where veh_id in (select veh_id from contract_permission where amount_per_seat = (select max(amount_per_seat) from contract_permission));
-- 10
select cust_name,ph_no,city from customer where cust_id in (select c_id from branch where b_name = 'madhapur');
-- 11
create view Present_Customer as select cust_name,ph_no,state,city from customer;
select *from Present_Customer;
-- 12
show indexes from customer;
-- 13
select count(deal_id) from dealer where state = "Andhra Pradesh";
-- 14
select c.state,count(distinct c.city) from customer c join edu_bus e join dealer d group by c.state;
-- 15
Drop view Present_Customer;
select *from Present_Customer;