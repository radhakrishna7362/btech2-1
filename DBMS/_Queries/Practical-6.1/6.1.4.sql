create table Stu_Reg_Courses(REGNO int,YEAR int,SEMESTER int,COURSECODE varchar(10),BRANCH varchar(10),FID int,foreign key(REGNO) references Student(REGNO) on delete cascade,foreign key(COURSECODE) references Course(CCODE),foreign key(FID) references Faculty(FID));
insert into Stu_Reg_Courses values(1000,2,1,'18CS2101','CSE',5002);
insert into Stu_Reg_Courses values(1001,2,1,'18CS2102','CSE',5001);
insert into Stu_Reg_Courses values(1002,2,1,'18CS2103','CSE',5001);
select * from Stu_Reg_Courses;