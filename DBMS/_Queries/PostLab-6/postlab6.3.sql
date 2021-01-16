create table title(worker_Ref_id int,worker_title varchar(25),affected_from varchar(25),foreign key(worker_ref_id) references worker(worker_id));

insert into title values(1,'Manager','2016-02-20');
insert into title values(2,'Executive','2016-02-11');
insert into title values(8,'Executive','2016-02-11');
insert into title values(5,'Manager','2016-02-11');
insert into title values(4,'Asst.Manager','2016-02-11');
insert into title values(7,'Executive','2016-02-11');
insert into title values(6,'Lead','2016-02-11');
insert into title values(3,'Lead','2016-02-11');

select * from title;
-- 3
select worker_title,count(*)as count_of_emp from title group by worker_title;