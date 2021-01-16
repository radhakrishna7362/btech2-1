create table student(SID int not null,name varchar(50),
address varchar(50),phone int not null,emgPN int,primary key(SID));

insert into student(sid,name,address,phone,emgPN)
values(2,'rk','vjy',123456,111213),(3,'ajay','vjy',15689944,264445);
insert into student(sid,name,address,phone,emgPN) values(1,'pavan','vjy',987654,111231);
select * from student;

create table course(CID int not null auto_increment,name varchar(50),
coursecode varchar(50),dept varchar(50),primary key(CID));
insert into course(name,coursecode,dept) values('dbms','19sc1230','cse'),('os','19cs1200','cse'),('qp','19sc166','ece');
select * from course;

create table cregd(
dept varchar(50) not null check (dept='cse'or dept='ece'),sid int not null,
foreign key(sid) references student(sid));
insert into cregd(dept,sid) values ('cse',2),('ece',3),('cse',1);
select * from cregd;

create table creg(
sno int not null auto_increment,SID int not null,CID int not null,primary key(sno),
foreign key(SID) references cregd(SID),foreign key(CID) references Course(CID));
insert into creg(SID,CID) values(1,1),(1,2); 
select * from creg;

create table fac(FID int not null,name varchar(50),
address varchar(50),phone int not null,emgPN int,primary key(FID));
insert into fac(FID,name,address,phone,emgPN) 
values(3012,'raj','vjy',13456,1113),(3013,'kevin','vjy',15515,1115);
select * from fac;

create table examclass(sno int not null auto_increment ,
CLID int not null,St int not null,SID int not null,
primary key (sno),foreign key(SID) references student(SID));
insert into examclass(CLID,st,sid) value(102,24,1);
select * from examclass;

create table examf(FID int not null,staffrole varchar(20) 
not null check (staffrole='proctor' or staffrole='squad'));
insert into examf(FID,staffrole) values(3012,'proctor'),(3013,'squad');
select * from examf;

create table examt(t int not null auto_increment,CID int not null,
examtype varchar(20) not null check (examtype='detained' or examtype='regular' or examtype='supply'),
dte date not null,FID INT NOT NULL,primary key(t),foreign key (FID) references fac(FID));
insert into examt(CID,examtype,dte,FID) values(1,'regular','2020-09-08',3012)
,(1,'supply','2020-09-08',3012),(1,'detained','2020-09-08',3012),
(1,'regular','2020-09-08',3013),(1,'supply','2020-09-08',3013),
(1,'detained','2020-09-08',3013),(2,'regular','2020-09-09',3013);
select * from examt;

-- 1
select * from creg;
-- 3
select count(*) as no_stud_dbms from creg where cid in (select cid from course where name='dbms');
-- 4
select * from fac where fid in (select fid from examt group by fid having count(*)>=3);
-- 5
select * from fac where fid in (select fid from examf where staffrole='squad');
-- 6(here the cid of dbms is 1)
select * from fac where fid in (select fid from examt where CID in (select cid from course where name='DBMS'));
-- 7
select * from examt where weekday(dte)=1;
-- 8
update examt set dte='2020-09-11' where cid=2 and t=7;
select * from examt where t=7;
-- 9
insert into creg(SID,CID) values(3,1);
select d.dept,course.name,count(*)as students_count from creg c inner join 
cregd d on c.SID=d.sid inner join course on c.cid=course.cid group by d.dept,c.cid;
-- 10
select * from creg group by cid having count(*) > (select count(*) from creg where cid in (select cid from course where name='DBMS'));