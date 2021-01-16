create table worker(worker_id int,first_name varchar(25),last_name varchar(25),salary int,
joining_date varchar(25),department varchar(25),primary key(worker_id));

insert into worker values(1,'Monika','Arora',100000,'2014-02-20','HR');
insert into worker values(2,'Niharika','Verma',80000,'2014-06-11','Admin');
insert into worker values(3,'Vishal','Singhal',300000,'2014-02-20','HR');
insert into worker values(4,'Amitabh','Singh',500000,'2014-02-20','Admin');
insert into worker values(5,'Vivek','Bhati',500000,'2014-06-11','Admin');
insert into worker values(6,'Vipul','Diwan',200000,'2014-06-11','Account');
insert into worker values(7,'Satish','Kumar',75000,'2014-01-20','Account');
insert into worker values(8,'Geetika','Chauhan',90000,'2014-04-11','Admin');

select * from worker;
-- 1
select * from worker where salary between 300000 and 500000;
-- 2
select department,count(*) as no_of_employees from worker group by department; 