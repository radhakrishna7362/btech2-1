create table employees(id int primary key,name varchar(25),salary int);

insert into employees values(1,'Kristeen',1420);
insert into employees values(2,'Ashley',2006);
insert into employees values(3,'Julia',2210);
insert into employees values(4,'Maria',3000);

select round(avg(salary))-round(avg(replace(salary,'0',''))) from employees;