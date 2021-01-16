create table bonus(worker_ref_id int,bonus_Date varchar(25),bonus_amount int,foreign key(worker_ref_id) references worker(worker_id));

insert into bonus values(1,'2016-02-20',5000);
insert into bonus values(2,'2016-06-11',3000);
insert into bonus values(3,'2016-02-20',4000);
insert into bonus values(1,'2016-02-20',4500);
insert into bonus values(2,'2016-06-11',3500);

select * from bonus;