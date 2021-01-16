create table renewal(branch_id int,c_id int,check_license_period int,
foreign key(branch_id) references branch(branch_id),foreign key(c_id) references customer(cust_id));

insert into renewal values(210,41,4);
insert into renewal values(210,42,6);
insert into renewal values(212,43,4);
insert into renewal values(213,44,4);
insert into renewal values(211,45,9);
insert into renewal values(211,46,10);
insert into renewal values(215,47,4);
insert into renewal values(216,48,6);
insert into renewal values(217,49,7);
insert into renewal values(217,50,8);

select * from renewal;
-- 8
select b.b_name,c.ph_no from branch b left join customer c on b.c_id=c.cust_id 
where b.c_id in (select c_id from renewal where check_license_period=2);