create table OTHER_FEE(FEE_TYPE varchar(10) primary key,FEE_AMOUNT int);
insert into OTHER_FEE values('BUS',15000);
insert into OTHER_FEE values('HOSTEL',80000);
insert into OTHER_FEE values('SPORTS',10000);
insert into OTHER_FEE values('PT',20000);
select * from OTHER_FEE;

-- 1
select FID,FNAME,SALARY from Faculty order by SALARY desc;
-- 2
select FID,FNAME,SALARY from Faculty order by SALARY desc limit 1 offset 2;
-- 3
select sum(PRICE*No_of_Copies) from library_books;
-- 4
select a.REGID,s.NAME,avg(CGPA) from Acad_Performance a,Student s 
where s.REGNO = a.REGID and a.YEAR=1 group by s.NAME;
-- 5
select count(CCODE),BRANCH from Course where YEAR = 2 group by BRANCH having count(CCODE) >=2;
-- 6
select s.NAME,l.BTITLE,i.ISSUEDATE from Student s,Library_Books l,ISSUE_REGESTER i 
where i.RegNo = s.REGNO and l.ACCNO = i.ACCNO and ISSUEDATE like '%/05/%';
-- 7
select s.name,s.branch,c.CCODE,c.CNAME,f.FNAME from Student s,Course c,Stu_Reg_Courses st,Faculty f 
where s.REGNO = st.REGNO and c.CCODE = st.COURSECODE and st.FID  = f.FID;
-- 9
select s.name from Student s,Stu_Reg_Courses st 
where s.REGNO = st.REGNO and st.COURSECODE in (select CCODE from Course where CNAME = 'DBMS');
-- 10
select BTITLE,PRICE from Library_Books order by PRICE desc limit 3;
-- 11
create view Student_Details as select s.REGNO,s.NAME,s.MOBILENO,s.BRANCH,c.CNAME,f.FNAME 
from Student s left join stu_reg_courses st on s.REGNO = st.REGNO 
left join Course c on st.COURSECODE = c.CCODE left join Faculty f on st.FID = f.FID;
select *from Student_Details;
-- 12
select count(REGNO) from student_details where cname in (select cname from student_details);
-- 13
create unique index utid on Student(REGNO,NAME,MOBILENO,EMAIL,ADDRESS,BRANCH);
show indexes from Student;