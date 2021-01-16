create table Faculty(FID int,FNAME varchar(10),Designation varchar(10),Salary int,FMOBILE bigint,FMAIL varchar(20),FADD varchar(10),BRANCH varchar(10),primary key(FID));
insert into Faculty values(5001,'Krishna','Asst.Prof',35000,9988773211,'hhhh@gmail.com','Vijayawada','CSE');
insert into Faculty values(5002,'Hari','Assoc.Prof',75000,7876543334,'kiuyt@gmail.com','Hyderabad','CSE');
insert into Faculty values(5003,'Mohan','Asst.Prof',40000,8678987689,'klptre@gmail.com','Hyderabad','ECE');
insert into Faculty values(5004,'Giri','Asst.Prof',30000,7896578967,'dfgh@gmail.com','Hyderabad','CSE');
select *from Faculty;