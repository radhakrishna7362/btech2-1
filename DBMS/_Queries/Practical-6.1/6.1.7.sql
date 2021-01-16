create table ISSUE_REGESTER(RegNo int,ACCNO int,ISSUEDATE varchar(10),foreign key(RegNo) references Student(REGNO) on delete cascade,foreign key(ACCNO) references Library_Books(ACCNO));
insert into ISSUE_REGESTER values(2000,101,'01/05/2020');
insert into ISSUE_REGESTER values(1001,102,'05/06/2020');
insert into ISSUE_REGESTER values(1002,101,'09/05/2020');
select * from ISSUE_REGESTER;