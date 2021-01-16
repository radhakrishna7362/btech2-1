create table Course(CCODE varchar(10) primary key,CNAME varchar(10),BRANCH varchar(10),YEAR int,SEMESTER int);
desc Course;
insert into Course values('18CS2101','DBMS','CSE',2,1);
insert into Course values('18CS2102','EP','CSE',2,1);
insert into Course values('18CS2103','Os','CSE',2,1);
insert into Course values('18CS3101','WE','CSE',3,1);
select * from Course;