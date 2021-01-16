create table country(cid int primary key,cname varchar(20),population bigint);

create table covid_test_center(cid int,centercode int,centerlocation varchar(20),foreign key(cid) references country(cid));

create table person(ssn int primary key,cid int,name varchar(20),result varchar(20),date varchar(20),status varchar(20),foreign key(cid) references country(cid));

create table worldstatistics(cid int,cname varchar(20),infected int,died int,recoverd int,foreign key(cid) references country(cid));

insert into country values(91,'India',150000000);
insert into country values(92,'USA',12000000);
insert into country values(93,'UK',20500250);
insert into country values(94,'Australia',2005205);
insert into country values(95,'NewZealand',25142683);

insert into person values(1,91,'Ram','Positive','12-10-2020','alive');
insert into person values(2,91,'Raju','negative','11-10-2020','dead');
insert into person values(3,92,'Ravi','Positive','12-9-2020','alive');
insert into person values(4,92,'Kiran','negative','11-9-2020','dead');
insert into person values(5,93,'Kamal','Positive','12-8-2020','alive');
insert into person values(6,93,'Vijay','negative','11-8-2020','dead');
insert into person values(7,94,'Suraj','Positive','12-7-2020','alive');
insert into person values(8,94,'Rahul','negative','11-7-2020','dead');
insert into person values(9,95,'Pavan','Positive','12-6-2020','alive');
insert into person values(10,95,'Avinash','negative','11-6-2020','dead');

insert into worldstatistics values(91,'India',15000,1000,2000);
insert into worldstatistics values(92,'USA',20000,2000,1500);
insert into worldstatistics values(93,'UK',25000,1500,1500);
insert into worldstatistics values(94,'Australia',18000,2000,1000);
insert into worldstatistics values(95,'NewZealand',5000,500,1000);