create table vehicle(veh_id int,veh_type varchar(15),veh_name varchar(25),
veh_number varchar(25),primary key(veh_id));

insert into vehicle values(1,'2-Wheeler','royal_enfield','AP1234');
insert into vehicle values(2,'3-Wheeler','auto','AP3421');
insert into vehicle values(3,'2-Wheeler','royal_enfield','TS213');
insert into vehicle values(4,'4-Wheeler','fiat','AP2346');
insert into vehicle values(5,'4-Wheeler','benz','TS1256');
insert into vehicle values(6,'3-Wheeler','auto','TN5544');
insert into vehicle values(7,'2-Wheeler','splendor','AP3214');
insert into vehicle values(8,'2-Wheeler','bajaj','AP3214');
insert into vehicle values(9,'2-Wheeler','royal_enfield','AP3214');
insert into vehicle values(10,'4-Wheeler','ambassador','AP3214');

select * from vehicle;

-- select distinct veh_type from vehicle;