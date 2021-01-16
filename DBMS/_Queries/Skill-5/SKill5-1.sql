CREATE TABLE STAFF(STAFF_NO INT,NAME VARCHAR(25),SALARY INT,CITY VARCHAR(25),STATE VARCHAR(25),PHONE BIGINT,EMAIL VARCHAR(25),PRIMARY KEY(STAFF_NO));

INSERT INTO STAFF VALUES(50012,'Surya',45000,'Hyderabad','Telangana',6074331464,'sj@gmail.com');
INSERT INTO STAFF VALUES(50013,'raju',50000,'Banglore','Karnataka',6158984565,'raju@yahoo.co.in');
INSERT INTO STAFF VALUES(50014,'virat',55000,'Vijayawada','Andhra Pradesh',6243637666,'v@yahoo.com');
INSERT INTO STAFF VALUES(50015,'laya',60000,'Chennai','Tamil nadu',6328290767,'pooja@tcs.com');
INSERT INTO STAFF VALUES(50016,'pooja',65000,'kochi','kerala',6412943868,'ab@gmail.com');
INSERT INTO STAFF VALUES(50017,'anil',70000,'Hyderabad','Telangana',6497596969,'anil@gmail.com');
INSERT INTO STAFF VALUES(50018,'sunil',75000,'Banglore','Karnataka',6582250070,'sunil@gmail.com');
INSERT INTO STAFF VALUES(50019,'rohit',35000,'Vijayawada','Andhra Pradesh',6666903171,'rohit@gmail.com');
INSERT INTO STAFF VALUES(50020,'sowmya',42000,'Chennai','Tamil nadu',6751556272,'sowmya@gmail.com');
INSERT INTO STAFF VALUES(50021,'robert',90000,'mumbai','maharastra',6836209373,'robert@gmail.com');
INSERT INTO STAFF VALUES(50022,'mujahed',95000,'pune','maharastra',6920862474,'mujahed@gmail.com');
INSERT INTO STAFF VALUES(50023,'rakesh',100000,'pune','maharastra',6863209733,'rakesh@gmail.com');
SELECT * FROM STAFF;
-- 14
SELECT * FROM STAFF WHERE SALARY BETWEEN 100000 AND 500000;
-- 13
SELECT * FROM STAFF WHERE NAME LIKE '_____h';
-- 8
SELECT branch.BRANCH_NO,branch.CITY,count(staff.city) as staff_count from STAFF inner join branch 
on branch.city=staff.city group by staff.city;

-- 11
SELECT STAFF.* from STAFF inner join BRANCH on STAFF.city=BRANCH.city and BRANCH.CITY='chennai';

-- 12
SELECT * from staff where salary in (select MAX(SALARY) from staff where salary not in (select MAX(salary) from staff));

-- 15
INSERT INTO STAFF VALUES(50024,'RK',45000,'Hyderabad','Telangana',6074331446,'rk@gmail.com');
select s.* from staff s,staff s1 where s.SALARY=s1.SALARY and s.NAME!=s1.NAME;