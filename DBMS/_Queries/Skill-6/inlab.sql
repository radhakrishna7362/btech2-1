create table quotation(
cust_id int primary key,cust_name varchar(30),cust_phone bigint,glass_type varchar(30),glass_thick varchar(10),
glass_measure varchar(10),glass_color varchar(10),address varchar(50),exp_amt int,advance_paid int);

create table bill(bill_id int primary key,cust_name varchar(30),cust_phone bigint,
address varchar(50),glass_feature varchar(20),mode_pay varchar(20));

insert into quotation values(1,'Raju',8767895698,'Clear glass','4MM','140CM','Black','Hyd',10000,2000);
insert into quotation values(2,'Hari',9999887766,'Mirror','5MM','150CM','Blue','Delhi',11000,2500);
insert into quotation values(3,'Arun',7567896546,'Clear glass','6MM','120CM','Black','Mumbai',9000,1000);
insert into quotation values(4,'Kiran',6754567890,'Mirror','3MM','200CM','Blue','Hyd',20000,5000);
insert into quotation values(5,'Chand',7164567897,'Mirror','4MM','120CM','Blue','Hyd',10000,6000);
insert into quotation values(6,'Sudheer',1122334455,'Clear glass','4MM','140CM','Black','Hyd',10000,2000);
insert into quotation values(7,'Mohith',9988556644,'Mirror','5MM','150CM','Blue','Delhi',11000,2500);
insert into quotation values(8,'Pavan',9856423183,'Clear glass','6MM','120CM','Black','Mumbai',9000,1000);
insert into quotation values(9,'Navneet',7894561233,'Mirror','3MM','200CM','Blue','Hyd',20000,5000);
insert into quotation values(10,'Rithik',9874563910,'Mirror','4MM','120CM','Blue','Hyd',10000,6000);

select * from quotation;

insert into bill values(100,'Raju',8767895698,'Hyd','Good','Cash');
insert into bill values(101,'Hari',9999887766,'Delhi','Good','Credit');
insert into bill values(102,'Arun',7567896546,'Mumbai','Good','Cash');
insert into bill values(103,'Kiran',6754567890,'Hyd','Good','Cash');
insert into bill values(104,'Chand',6754567890,'Hyd','Good','Cash');
insert into bill values(105,'Sudheer',1122334455,'Hyd','Good','Cash');
insert into bill values(106,'Mohith',9988556644,'Delhi','Good','Credit');
insert into bill values(107,'Pavan',9856423183,'Mumbai','Good','Cash');
insert into bill values(108,'Navneet',7894561233,'Hyd','Good','Cash');
insert into bill values(109,'Rithik',9874563910,'Hyd','Good','Cash');

select * from bill;
-- 3
select * from quotation order by cust_name,cust_id asc;
-- 4
select distinct cust_name from quotation;
-- 5
-- 6
select cust_name,exp_amt-advance_paid as amt_to_be_paid from quotation;
-- 7
select * from quotation where cust_name like 'A%';
-- 8
select * from bill where cust_phone like '%910';
-- 9
select * from quotation where cust_name like '%C';
-- 10
select * from quotation where advance_paid between 1000 and 2000;
-- 11
select cust_name from bill where mode_pay in 
(select mode_pay from bill group by mode_pay having count(mode_pay)>1);
-- 12
select distinct * from bill;
select distinct * from quotation;