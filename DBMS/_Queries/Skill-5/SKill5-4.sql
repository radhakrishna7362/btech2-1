CREATE TABLE RENTER(RENTER_NO INT,NAME VARCHAR(25),TYPE_OF_BUSINESS VARCHAR(50),CITY VARCHAR(25),STATE VARCHAR(25),PHONE BIGINT,EMAIL VARCHAR(50),PRIMARY KEY(RENTER_NO));

INSERT INTO RENTER VALUES(9802,'ram','private employee','Hyderabad','Telangana',6074331464,'ram@gmail.com');
INSERT INTO RENTER VALUES(9803,'sham','software engineer','Banglore','Karnataka',6158984565,'sham@gmail.com');
INSERT INTO RENTER VALUES(9804,'sundhar','private employee','Vijayawada','Andhra Pradesh',6243637666,'sundhar@gmail.com');
INSERT INTO RENTER VALUES(9805,'raghu','clerk','chennai','Tamil nadu',6328290767,'raghu@gmail.com');
INSERT INTO RENTER VALUES(9806,'raja','jr jornalist','kochi','kerala',6412943868,'raja@gmail.com');
INSERT INTO RENTER VALUES(9807,'anthony','teacher','Hyderabad','Telangana',6497596969,'anthony@gmail.com');
INSERT INTO RENTER VALUES(9808,'ismail','coal mining ceo','Banglore','Karnataka',6582250070,'ismaile@gmail.com');
INSERT INTO RENTER VALUES(9809,'farah','business','Vijayawada','Andhra Pradesh',6666903171,'farahl@gmail.com');
INSERT INTO RENTER VALUES(9810,'zoya','business','chennai','Tamil nadu',6751556272,'zoya@gmail.com');
INSERT INTO RENTER VALUES(9811,'adam','software engineer','mumbai','maharastra',6836209373,'adam@gmail.com');
INSERT INTO RENTER VALUES(9812,'ricky','software engineer','pune','maharastra',6920862474,'ricky@gmail.com');

SELECT * FROM RENTER;

-- 3
SELECT DISTINCT * FROM RENTER; 

-- 4
SELECT EMAIL,RENTER_NO FROM RENTER WHERE TYPE_OF_BUSINESS='private employee' ORDER BY RENTER_NO;