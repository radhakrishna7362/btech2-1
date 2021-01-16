create table mission(mid int,name varchar(25),m_spot varchar(25),t_id int,sol_id int,com_officer int,primary key(mid));

create table navy(nid int,name varchar(30),Rank_ varchar(1),city varchar(25),mid int,primary key(nid),foreign key(mid) references mission(mid));

create table army(aid int,name varchar(25),Rank_ varchar(1),city varchar(25),mid int,primary key(aid),foreign key(mid) references mission(mid));

create table airforce(afid int,name varchar(25),Rank_ varchar(1),city varchar(25),mid int,primary key(afid),foreign key(mid) references mission(mid));

create table pantry(id int primary key,year int,loc varchar(25),dept varchar(25),service_cap int);

create table stores(sid int primary key,sname varchar(25),area varchar(50),category varchar(50),itemcapacity int,holdcapacity int);

insert into mission values(600,'AAP','Delhi',701,1,301);
insert into mission values(601,'GID','Lahore',702,2,302);
insert into mission values(602,'CID','Mumbai',703,3,201);
insert into mission values(603,'VIP','Bangalore',704,4,206);
insert into mission values(604,'HIG','Kolkata',705,5,207);
insert into mission values(605,'BBC','Shimla',706,6,106);
insert into mission values(606,'ORA','Kashmir',707,7,104);
insert into mission values(607,'XYZ','Lucknow',708,8,103);
insert into mission values(608,'ABC','Chennai',709,9,102);

select * from mission;

insert into navy values(100,'Raju','C','Hyderbad',600);
insert into navy values(101,'Rahul','A','Lahore',601);
insert into navy values(102,'Bharath','B','Delhi',600);
insert into navy values(103,'David','A','Mumbai',600);
insert into navy values(104,'Kishore','C','Hyderbad',602);
insert into navy values(105,'Kumar','C','Mumbai',602);
insert into navy values(106,'Eswar','A','Delhi',603);
insert into navy values(107,'Praveen','C','Hyderbad',604);
insert into navy values(108,'Lohith','B','Delhi',601);
insert into navy values(109,'Mohan','C','Delhi',601);


select * from navy;

insert into army values(200,'Arun','A','Delhi',601);
insert into army values(201,'Hari','B','Hyderabad',601);
insert into army values(202,'Gopi','C','Lahore',602);
insert into army values(203,'Jayanth','A','Delhi',601);
insert into army values(204,'Deepak','B','Mumbai',600);
insert into army values(205,'Nandu','C','Hyderabad',600);
insert into army values(206,'Mohan','A','Lahore',603);
insert into army values(207,'Kamal','B','Hyderabad',605);
insert into army values(208,'Gopal','A','Delhi',602);
insert into army values(209,'Raju','C','Delhi',601);

select * from army;

insert into airforce values(300,'Kalyan','B','Lahore',601);
insert into airforce values(301,'David','A','Delhi',603);
insert into airforce values(302,'Gagan','C','Hyderabad',602);
insert into airforce values(303,'Kiran','B','Delhi',602);
insert into airforce values(304,'Ramu','A','Lahore',603);
insert into airforce values(305,'Pramod','C','Mumbai',601);
insert into airforce values(306,'Amar','C','Delhi',603);
insert into airforce values(307,'Verma','C','Delhi',604);
insert into airforce values(308,'Naveen','B','Hyderabad',602);
insert into airforce values(309,'Charan','A','Hyderabad',601);

select * from airforce;

insert into pantry values(900,2016,'Mumbai','Medical',10);
insert into pantry values(901,2015,'Delhi','Logistics',20);
insert into pantry values(902,2014,'Hyderabad','Stores',30);
insert into pantry values(903,2018,'Darjeeling','Sports',40);
insert into pantry values(904,2019,'Cuttack','Kitchen',50);
insert into pantry values(905,2011,'Kolkata','House Keeping',15);

select * from pantry;

insert into stores values(1111	,'NAVY'	,'NAVY CAMP'	,'WEAPON'	,25,	50);
insert into stores values(1112	,'ARMY'	,'ARMY CAMP'	,'GENERAL'	,100,	150);
insert into stores values(1113	,'AIRFORCE'	,'AIRFORCE CAMP'	,'WEAPON'	,200,	250);
select * from stores;

-- 2
select * from navy where Rank_='C';
select * from army where Rank_='C';
select * from airforce where Rank_='C';

-- 3
select count(*) from navy where city!='Chennai';

-- 4
select distinct m.mid,m.name from mission m, army a,navy n where a.mid=m.mid and a.mid=n.mid;
-- 5
select * from mission;

-- 6
select *from stores where itemcapacity>=100 or holdcapacity>=100;

-- 7
select distinct mission.mid,mission.name from navy left join mission on navy.mid = mission.mid order by mission.mid;

-- 8
select * from pantry where dept='Medical';

-- 9
select * from pantry;
delete from pantry where id=905;
select * from pantry;

-- 11
select sum(itemcapacity) from stores where category="WEAPON";

-- 12
select * from mission;