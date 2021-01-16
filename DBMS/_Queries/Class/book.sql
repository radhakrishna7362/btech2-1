create table book(title varchar(50),price int);

insert into book values('DBMS',100);
insert into book values('OS',500);
insert into book values('AI',400);
insert into book values('SE',700);
insert into book values('RPA',650);
insert into book values('MSWD',550);
insert into book values('JAVA',450);
insert into book values('QP',350);
insert into book values('MP1',425);

Select title From book as B Where (Select count(*) from book as T Where T.price > B.price) < 5;

select title from book order by price DESC LIMIT 5;