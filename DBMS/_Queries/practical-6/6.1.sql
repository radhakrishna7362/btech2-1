create table customer(
cust_id int,cust_name varchar(25),dob varchar(10),city varchar(25),
street varchar(100),state varchar(25),pincode int,ph_no bigint,
deal_no int,photo_identity varchar(1),v_id int,primary key(cust_id),
foreign key(v_id) references vehicle(veh_id));

insert into customer values(41,'raju','13-09-1996','Guntur','Ramgopal street','Andhra Pradesh',500213,9123456789,10,'y',3);
insert into customer values(42,'hari','19-06-2016','Perambur','mylapur','Tamil Nadu',500211,1122334455,20,'n',2);
insert into customer values(43,'giri','20-01-1995','Hyderabad','SR Nagar','Telangana',500079,8877665544,30,'y',4);
insert into customer values(44,'ramu','17-07-1996','Vijayawada','Benz circle','Andhra Pradesh',512345,7654564321,40,'y',5);
insert into customer values(45,'rahul','08-12-1995','Guntur','Raju Nagar','Andhra Pradesh',523022,9999999998,50,'y',7);
insert into customer values(46,'gopi','13-08-1979','Hyderabad','Gachibowli','Telangana',567089,787777775,10,'n',1);
insert into customer values(47,'karthik','15-01-2004','Guntur','Chandramouli nagar','Andhra Pradesh',546789,7788776633,20,'n',6);
insert into customer values(48,'gopal','06-12-2000','Hyderabad','Ameerpet','Telangana',500023,6734556345,30,'y',8);
insert into customer values(49,'dinesh','10-12-2001','Hyderabad','Kondapur','Telangana',502033,6794537212,30,'n',10);
insert into customer values(50,'Suresh','25-03-1999','Vijayawada','Poranki','Andhra Pradesh',512022,7896543233,20,'y',9);

select * from customer;