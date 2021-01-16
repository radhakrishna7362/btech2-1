CREATE TABLE OWNER(OWNER_NO INT,NAME VARCHAR(25),TYPE_OF_BUSINESS VARCHAR(50),CITY VARCHAR(25),STATE VARCHAR(25),PHONE BIGINT,EMAIL VARCHAR(50),PRIMARY KEY(OWNER_NO));

INSERT INTO OWNER VALUES(8892,'shiva','private employee','Hyderabad','Telangana',6074331464,'shiva@gmail.com');
INSERT INTO OWNER VALUES(8893,'ishwar','software engineer','Banglore','Karnataka',6158984565,'ish@gmail.com');
INSERT INTO OWNER VALUES(8894,'gopi','private employee','Vijayawada','Andhra Pradesh',6243637666,'gopi@gmail.com');
INSERT INTO OWNER VALUES(8895,'gopal','clerk','chennai','Tamil nadu',6328290767,'gopal@gmail.com');
INSERT INTO OWNER VALUES(8896,'sneha','jr jornalist','kochi','kerala',6412943868,'sneha@gmail.com');
INSERT INTO OWNER VALUES(8897,'latha','teacher','Hyderabad','Telangana',6497596969,'latha@gmail.com');
INSERT INTO OWNER VALUES(8898,'gorge','coal mining ceo','Banglore','Karnataka',6582250070,'gorge@gmail.com');
INSERT INTO OWNER VALUES(8899,'samuel','business','Vijayawada','Andhra Pradesh',6666903171,'samuel@gmail.com');
INSERT INTO OWNER VALUES(8900,'roberts','business','chennai','Tamil nadu',6751556272,'roberts@gmail.com');
INSERT INTO OWNER VALUES(8901,'sonu','software engineer','mumbai','maharastra',6836209373,'sonu@gmail.com');
INSERT INTO OWNER VALUES(8902,'raju','software engineer','pune','maharastra',6920862474,'raju@gmail.com');

SELECT * FROM OWNER;