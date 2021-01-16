create table world (name varchar(50),contient varchar(50),area int,population bigint,gdp bigint);

insert into world values('Afghanistan','Asia',652230,2500100,20343000000);
insert into world values('Albania','Europe',28748,2831741,12960000000);
insert into world values('Algeria','Africa',2381741,37100000,188681000000);
insert into world values('Andorra','Europe',468,78115,3712000000);
insert into world values('Angola','Africa',1246700,20609294,100990000000);

-- 1
select sum(population) from world;
-- 2
select contient,count(name) from world group by contient,population>10000000;
-- 3
select contient,sum(population) from world group by contient having sum(population)>=100000000; 
-- 4
select distinct contient from world;