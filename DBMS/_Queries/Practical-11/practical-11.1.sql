create table Login(log_id int primary key,log_name varchar(25),log_pwd varchar(25));

insert into Login values(100,'Hello','abcd1234');
insert into Login values (101,'welcome','pqrs3456');
insert into Login values (102,'Good','xyzw1234');
insert into Login values (103,'Honesty','qwerty5678');

create table Person(id int primary key,name varchar(20),city varchar(25),state varchar(30),
phone bigint,dob date,age int);

insert into Person values(200,'Kiran','Hyderabad','Telangana',9876543218,STR_TO_DATE('12-10-2000','%d-%m-%Y'),19);
insert into Person values(201,'hari','Vijayawada','Andhra Pradesh',7865489765,STR_TO_DATE('25-06-1980','%d-%m-%Y'),39);
insert into Person values(202,'Raju','Hyderabad','Telangana',8976543352,STR_TO_DATE('01-01-1970','%d-%m-%Y'),49);
insert into Person values(203,'Eswar','Guntur','Andhra Pradesh',8765467800,STR_TO_DATE('15-04-1985','%d-%m-%Y'),35);
insert into Person values(204,'David','Vijayawada','Andhra Pradesh',8554392248,STR_TO_DATE('28-07-2000','%d-%m-%Y'),20);
insert into Person values(205,'Devi','Mangalagiri','Andhra Pradesh',8343316696,STR_TO_DATE('10-11-1975','%d-%m-%Y'),45);
insert into Person values(206,'Rani','Hyderabad','Telangana',8132241144,STR_TO_DATE('22-02-1998','%d-%m-%Y'),22);
insert into Person values(207,'Jaya','Vijayawada','Andhra Pradesh',7921165592,STR_TO_DATE('06-06-2001','%d-%m-%Y'),19);
insert into Person values(208,'Kalyan','Guntur','Andhra Pradesh',7710090040,STR_TO_DATE('18-09-1990','%d-%m-%Y'),30);
insert into Person values(209,'Gopal','Hyderabad','Telangana',7499014488,STR_TO_DATE('31-12-1992','%d-%m-%Y'),28);
select *from Person;

create table Customer(cust_id int,c_name varchar(25),c_addr varchar(25),c_mobile bigint);

insert into Customer values(300,'Raju','Hyd',8765467800);
insert into Customer values(301,'Hari','Delhi',8554392248);
insert into Customer values(302,'Kiran','Mumbai',8343316696);
insert into Customer values(303,'Giri','Kolkata',8139241144);
insert into Customer values(304,'Devi','Goa',7935165592);
insert into Customer values(305,'jaya','Chennai',7731090040);
insert into Customer values(306,'Kalyan','Mysore',7527014488);
insert into Customer values(307,'Kiran','Guntur',7322938936);
select *from Customer;

delimiter $$
create procedure tourist_details()
begin
	declare c_id int;
    declare cust_name varchar(25);
    declare cust_addr varchar(25);
    declare c_ph bigint;
    declare c_finished int default 0;
    declare c1 cursor for select *from Customer;
	declare continue handler for not found set c_finished=1;
    open c1;
    c_details: loop
		fetch c1 into c_id,cust_name,cust_addr,c_ph;
        if c_finished = 1 then
			leave c_details;
		end if;
        select *from Customer where cust_id = c_id and cust_name = c_name and cust_addr = c_addr and c_mobile = c_ph;
	end loop c_details;
    close c1;
end $$
delimiter ;
 
call tourist_details();