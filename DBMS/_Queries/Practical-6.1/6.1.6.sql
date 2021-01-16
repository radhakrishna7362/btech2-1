create table Acad_Performance(REGID int,YEAR int,SEMESTER int,CGPA float,foreign key(REGID) references Student(REGNO) on delete cascade);
insert into Acad_performance values(1000,1,1,9.3);
insert into Acad_performance values(1001,1,1,9.2);
insert into Acad_performance values(1002,1,1,9.1);
insert into Acad_performance values(2000,1,2,9.1);
insert into Acad_performance values(2001,1,2,9.3);
insert into Acad_Performance values(3000,1,2,9.2);
select * from Acad_Performance;