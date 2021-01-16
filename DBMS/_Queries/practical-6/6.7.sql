create table registration(
cust_id int,veh_id int,deal_id int,_date date,foreign key(cust_id) references customer(cust_id),
foreign key(veh_id) references vehicle(veh_id),foreign key(deal_id) references dealer(deal_id));

insert into registration values(41,3,55,str_to_date('04-04-2014',"%d-%m-%Y"));
insert into registration values(42,2,54,str_to_date('02-09-2016',"%d-%m-%Y"));
insert into registration values(43,4,55,str_to_date('03-12-2015',"%d-%m-%Y"));
insert into registration values(44,5,52,str_to_date('29-09-2016',"%d-%m-%Y"));
insert into registration values(45,7,55,str_to_date('18-11-2013',"%d-%m-%Y"));
insert into registration values(46,1,51,str_to_date('10-06-2014',"%d-%m-%Y"));
insert into registration values(47,6,52,str_to_date('11-07-2011',"%d-%m-%Y"));
insert into registration values(48,8,52,str_to_date('12-06-2015',"%d-%m-%Y"));
insert into registration values(49,10,53,str_to_date('02-03-2014',"%d-%m-%Y"));
insert into registration values(50,9,53,str_to_date('11-10-2015',"%d-%m-%Y"));

select * from registration;