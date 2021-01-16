create table Student(REGNO int primary key,NAME varchar(10),Mobileno bigint,EMAIL varchar(20),Address varchar(10),Branch varchar(10));
desc Student;
insert into Student values(1000,'Hari',9988776655,'abcd@gmail.com','Vijayawada','CSE');
insert into Student values(2000,'Gopal',7654328998,'pqr@gmail.com','Hyderabad','ECE');
insert into Student values(3000,'Suresh',8067543567,'asdf@gmail.com','Guntur','EEE');
insert into Student values(1001,'Jaya',9876543246,'ptyui@gmail.com','Hyderabad','CSE');
insert into Student values(1002,'Kiran',7864569878,'kjhyu@gmail.com','Hyderabad','CSE');
insert into Student values(2001,'Kalyan',8765498755,'kieee@gmail.com','Hyderabad','ECE');
select * from Student;