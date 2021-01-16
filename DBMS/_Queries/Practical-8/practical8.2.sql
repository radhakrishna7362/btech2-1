create table Customer(cid int primary key,cname varchar(10),address varchar(10),phone bigint,category varchar(10));
create table Artist(aid int primary key,name varchar(10),address varchar(10),phone bigint);
create table Painting(pid int primary key,aid int,rental_cost int,type varchar(10),foreign key(aid) references Artist(aid));
create table Owner(pid int,oid int,name varchar(10),address varchar(10),phone bigint,foreign key(pid) references Painting(pid));
create table Rent(cid int,pid int,rental_date date,rental_period int,foreign key(cid) references Customer(cid),foreign key(pid) references Painting(pid));

insert into Customer values(100,'Raju','Hyderabad',9876045789,'Bronze');
insert into Customer values(101,'Hari','Vijayawada',8877678956,'Gold');
insert into Customer values(102,'Devi','Guntur',7879312123,'Silver');
insert into Customer values(103,'Rani','Delhi',8780945290,'Platinum');
insert into Customer values(104,'Jaya','Mumbai',9612578457,'Gold');
insert into Customer values(105,'Haritha','Kolkata',9611665513,'Silver');
insert into Customer values(106,'Kalyan','Vijayawada',9610752569,'Bronze');
insert into Customer values(107,'Roja','Hyderabad',9609839625,'Platinum');
insert into Customer values(108,'Amar','Vijayawada',9608926681,'Gold');
insert into Customer values(109,'Padma','Vijayawada',9608013737,'Bronze');
select *from Customer;

insert into Artist values(200,'John','Delhi',7786549803);
insert into Artist values(201,'Samuel','Mumbai',7123458790);
insert into Artist values(202,'Samson','Lucknow',9460367777);
insert into Artist values(203,'David','Hyderabad',9797276764);
insert into Artist values(204,'Raghu','Hyderabad',8134185751);
insert into Artist values(205,'Ravi','Mumbai',7471094738);
insert into Artist values(206,'Kiran','Delhi',9808003725);
select *from Artist;
insert into Painting values (300,201,4500,'Hired');
insert into Painting values (301,202,3500,'Not hired');
insert into Painting values (302,203,7500,'Hired');
insert into Painting values (303,205,2500,'Not hired');
insert into Painting values (304,202,10000,'Not hired');
insert into Painting values (305,201,8000,'Not hired');
insert into Painting values (306,203,6500,'Not hired');
select *from Painting;
insert into Owner values(300,500,'Raju','Hyderabad',9460367777);
insert into Owner values(301,500,'Hari','Vijayawada',8134185751);
insert into Owner values(302,501,'Giri','Hyderabad',7808003725);
insert into Owner values(303,501,'Gopi','Delhi',9481821699);
insert into Owner values(304,503,'Krishna','Mumbai',7155639673);
insert into Owner values(305,502,'Verma','Delhi',8829457647);
insert into Owner values(306,502,'Guna','Delhi',7503275621);
select *from Owner;
insert into Rent values(104,300,str_to_date('10-06-2020','%d-%m-%Y'),6);
insert into Rent values(105,302,str_to_date('05-07-2020','%d-%m-%Y'),10);
insert into Rent values(108,304,str_to_date('15-07-2020','%d-%m-%Y'),3);
insert into Rent values(109,305,str_to_date('25-06-2020','%d-%m-%Y'),6);
select *from Rent;
-- 3
select *from Customer where category = 'Gold';
-- 4
select *from Artist where address = 'Hyderabad';
-- 5
select *from Painting where type = "Not hired";
-- 6
update Painting set rental_cost = 1000 where type = "Not hired";
select *from Painting;
-- 7
select a.* from Artist a,Painting p where a.aid = p.aid and p.type = "Hired";