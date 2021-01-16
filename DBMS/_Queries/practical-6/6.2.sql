create table branch(
branch_id int,b_name varchar(25),state varchar(25),city varchar(25),pincode int,street varchar(100),
d_no int,phone1 bigint,phone2 bigint,c_id int,v_id int,e_id int,primary key(branch_id),
foreign key(c_id) references customer(cust_id),
foreign key(v_id) references vehicle(veh_id),
foreign key(e_id) references edu_bus(edu_id));

insert into branch values(210,'kukatpally','Telangana','Hyderabad',521010,'jntu',53,9786543211,8765432189,41,1,31);
insert into branch values(211,'madhapur','Telangana','Hyderabad',521011,'kondapur',52,8877665544,8765987654,41,2,32);
insert into branch values(212,'hitech city','Telangana','Hyderabad',521012,'gachibowli',55,7968787877,8766543119,42,3,33);
insert into branch values(213,'miyapur','Telangana','Hyderabad',520011,'bachupally',51,7059910210,8767098584,43,1,34);
insert into branch values(214,'raju nagar','Andhra Pradesh','Guntur',523456,'raju nagar',53,6151032543,8767654049,44,4,35);
insert into branch values(215,'pnbs','Andhra Pradesh','Guntur',526901,'pnbs',55,9786543211,8768209514,44,5,36);
insert into branch values(216,'bachupally','Telangana','Hyderabad',530346,'miyapur',52,4333277209,8768764979,42,1,37);
insert into branch values(217,'ameerpet','Telangana','Hyderabad',533791,'ameerpet',52,3424399542,8769320444,46,7,38);
insert into branch values(218,'sanathnagar','Telangana','Hyderabad',537236,'erragadda',52,5215521875,8769875909,47,8,39);
insert into branch values(219,'punjagutta','Telangana','Hyderabad',540681,'punjagutta',53,1606644208,8770431374,43,9,40);

select * from branch;
-- select distinct cust_name from customer,branch where customer.cust_id = branch.c_id;