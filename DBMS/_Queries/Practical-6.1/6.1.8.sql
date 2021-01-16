create table FEE(BRANCH varchar(10) primary key,Fee_Type varchar(10),YEAR int,SEMESTER int,FEEAMOUNT int);
insert into FEE values('CSE','TuitionFee',1,1,125000);
insert into FEE values('ECE','TuitionFee',1,1,100000);
insert into FEE values('ME','TuitionFee',1,1,80000);
insert into FEE values('EEE','TuitionFee',1,1,70000);
select * from FEE;