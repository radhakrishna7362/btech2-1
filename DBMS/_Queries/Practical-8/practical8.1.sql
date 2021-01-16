create table employee(eno int primary key,ename varchar(10));
create table manager(eno int,foreign key(eno) references employee(eno));
create table worker(eno int,mno int,foreign key(eno) references employee(eno),foreign key(mno) references employee(eno));
create table address(eno int,street varchar(20),city varchar(20),state varchar(20),foreign key(eno) references employee(eno));
create table part(partno int primary key);
create table subpart(partno int,assmno int,foreign key(partno) references part(partno));
create table warehouse(warehouseid int primary key);
create table bin(warehouseid int,binno int primary key,capacity int,foreign key(warehouseid) references warehouse(warehouseid));
create table batch(partno int,batchno int,size int,date_in date,mgrno int,warehouseid int,binno int,foreign key(partno) references part(partno),foreign key(mgrno) references manager(eno),foreign key(warehouseid) references warehouse(warehouseid),foreign key(binno) references bin(binno));
create table current_backorder(partno int,orgqty int,remqty int,bodate date,backorder varchar(10),foreign key(partno) references part(partno));
create table old_backorder(partno int,orgqty int,bodate date,backorder varchar(10),fulfilled varchar(10),foreign key(partno) references part(partno));
create table phone(eno int,area_code int,number bigint,foreign key(eno) references employee(eno));

insert into employee values(100,'Hari');
insert into employee values(101,'Giri');
insert into employee values(102,'Arun');
insert into employee values(103,'Verma');
insert into employee values(104,'Jaya');
insert into employee values(105,'Kalyan');
insert into employee values(106,'Krishna');
insert into employee values(107,'Mohan');
insert into employee values(108,'Bhasker');
insert into employee values(109,'Arjun');
select * from employee;

insert into manager values(102);
insert into manager values(103);
insert into manager values(105);
insert into manager values(107);
insert into manager values(109);
select * from manager;

insert into worker values(101,102);
insert into worker values(104,103);
insert into worker values(106,102);
insert into worker values(108,105);
select *from worker;

insert into address values(100,'Ameerpet','Hyderabad','Telangana');
insert into address values(101,'Raju Nagar','Guntur','Andhra Pradesh');
insert into address values(102,'Chowadavaram','Guntur','Andhra Pradesh');
insert into address values(103,'Kukatpally','Hyderabad','Telangana');
insert into address values(104,'BHEL','Hyderabad','Telangana');
insert into address values(105,'Poranki','Vijayawada','Andhra Pradesh');
insert into address values(106,'Bachupally','Hyderabad','Telangana');
insert into address values(107,'Nizampet','Hyderabad','Telangana');
insert into address values(108,'ECIL X Road','Hyderabad','Telangana');
insert into address values(109,'Benz Circle','Vijayawada','Andhra Pradesh');
select *from address;

insert into part values(1000);
insert into part values(1001);
insert into part values(1002);
insert into part values(1003);
insert into part values(1004);
insert into part values(1005);
insert into part values(1006);
insert into part values(1007);
insert into part values(1008);
insert into part values(1009);
select *from part;

insert into subpart values(1000,2001);
insert into subpart values(1001,2000);
insert into subpart values(1002,2001);
insert into subpart values(1003,2000);
insert into subpart values(1004,2000);
insert into subpart values(1005,2002);
insert into subpart values(1006,2002);
insert into subpart values(1007,2001);
insert into subpart values(1008,2000);
insert into subpart values(1009,2002);
select *from subpart;

insert into warehouse values(5000);
insert into warehouse values(5001);
insert into warehouse values(5002);
insert into warehouse values(5003);
insert into warehouse values(5004);
insert into warehouse values(5005);
select *from warehouse;

insert into bin values(5000,6000,100);
insert into bin values(5001,6001,150);
insert into bin values(5002,6002,200);
insert into bin values(5003,6003,250);
insert into bin values(5004,6004,300);
insert into bin values(5005,6005,200);
select *from bin;

insert into batch values(1000,7000,10,str_to_date('13-03-2020',"%d-%m-%Y"),102,5000,6000);
insert into batch values(1001,7000,20,str_to_date('25-02-2020',"%d-%m-%Y"),103,5000,6001);
insert into batch values(1002,7001,30,str_to_date('03-07-2020',"%d-%m-%Y"),105,5000,6002);
insert into batch values(1003,7002,40,str_to_date('15-04-2020',"%d-%m-%Y"),107,5001,6002);
insert into batch values(1004,7002,50,str_to_date('20-04-2020',"%d-%m-%Y"),109,5001,6003);
insert into batch values(1005,7003,60,str_to_date('07-08-2019',"%d-%m-%Y"),102,5002,6004);
insert into batch values(1006,7003,10,str_to_date('02-02-2020',"%d-%m-%Y"),105,5003,6001);
insert into batch values(1007,7004,20,str_to_date('10-02-2020',"%d-%m-%Y"),107,5003,6000);
insert into batch values(1008,7005,30,str_to_date('17-05-2020',"%d-%m-%Y"),105,5000,6003);
insert into batch values(1009,7005,30,str_to_date('20-07-2020',"%d-%m-%Y"),105,5004,6000);
select *from batch;

insert into current_backorder values(1000,1000,500,str_to_date('10-03-2020','%d-%m-%Y'),'arun');
insert into current_backorder values(1005,500,300,str_to_date('15-02-2020','%d-%m-%Y'),'kiran');
insert into current_backorder values(1007,700,400,str_to_date('12-03-2020','%d-%m-%Y'),'raju');
insert into current_backorder values(1008,800,600,str_to_date('11-04-2020','%d-%m-%Y'),'david');
insert into current_backorder values(1009,600,400,str_to_date('20-06-2020','%d-%m-%Y'),'eswar');
select *from current_backorder;

insert into old_backorder values(1000,1000,str_to_date('10-03-2020','%d-%m-%Y'),'arun','yes');
insert into old_backorder values(1005,500,str_to_date('15-02-2020','%d-%m-%Y'),'kiran','no');
insert into old_backorder values(1007,700,str_to_date('12-03-2020','%d-%m-%Y'),'raju','yes');
insert into old_backorder values(1008,800,str_to_date('11-04-2020','%d-%m-%Y'),'david','yes');
insert into old_backorder values(1009,600,str_to_date('20-06-2020','%d-%m-%Y'),'eswar','yes');
select *from old_backorder;

insert into phone values(100,91,9678897435);
insert into phone values(101,81,9743523134);
insert into phone values(102,61,9808148833);
insert into phone values(103,91,9872774532);
insert into phone values(104,91,9937400231);
insert into phone values(105,91,9675453111);
insert into phone values(106,81,9413505991);
insert into phone values(107,81,9151558871);
insert into phone values(108,91,8889611751);
insert into phone values(109,91,8627664631);
select *from phone;

-- 3
select w.eno from worker w,employee e where w.eno = e.eno and e.ename like 'S%';
-- 4
select *from employee order by ename asc;
-- 5
select p.* from phone p,manager m where p.eno = m.eno;
-- 6
select partno from subpart group by assmno order by partno asc;
-- 7
select b.mgrno,c.* from current_backorder c,batch b where c.partno = b.partno;
-- 8
create view manager_view as select mno,count(eno) as no_workers from worker group by mno order by no_workers;
select *from manager_view limit 1;
-- 9
select partno,batchno from batch;
-- 10
select w.eno,e.ename as emp_name,w.mno,e.ename as man_name from worker w,employee e where w.eno = e.eno;
-- 11
select w.eno,e.ename,w.mno,e1.ename as mname from worker w join employee e on w.eno = e.eno join employee e1 on w.mno = e1.eno;