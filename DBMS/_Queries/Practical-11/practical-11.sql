create table Employee(wid int primary key,fname varchar(10),lname varchar(10),email varchar(20),
phno bigint,address varchar(20));

insert into Employee values(100,'Arun','Kumar','abcd@gmail.com',9988776655,'Hyderabad');
insert into Employee values(101,'David','Raju','ghij@gmail.com',9987634567,'Secunderabad');
insert into Employee values(102,'Harish','Reddy','klmn@gmail.com',9986492479,'Bowenpally');
insert into Employee values(103,'John','Samuel','pqrt@gmail.com',9985350391,'Hyderabad');
insert into Employee values(104,'Kira','Kumar','ghjk@gmail.com',9984208303,'Amaravathi');
insert into Employee values(105,'Aravind','Babu','ghhjk@gmail.com',9983066215,'Guntur');
insert into Employee values(106,'Praveen','Kumar','qwert@gmail.com',9981924127,'Tullur');
insert into Employee values(107,'Ramesh','Kumar','poiu@gmail.com',9980782039,'Mangalagiri');
insert into Employee values(108,'Jayanth','Kumar','poutu@gmail.com',9979639951,'Vijayawada');
insert into Employee values(109,'Eswar','Raju','vghj@gmail.com',9978497863,'Hyderabad');
select *from Employee;

create table Receptionist(rid int,foreign key(rid) references Employee(wid));

insert into Receptionist values(104);
insert into Receptionist values(106);
insert into Receptionist values(108);

create table doctor(did int,speci varchar(20),foreign key(did) references Employee(wid));

insert into doctor values(100,'Anesthecian');
insert into doctor values(101,'Dentist');
insert into doctor values(102,'Cardiologist');
insert into doctor values(105,'Neurosurgeon');

create table Nurse(nid int,foreign key(nid) references Employee(wid));

insert into Nurse values(103);
insert into Nurse values(107);
insert into Nurse values(109);
select *from Nurse;

create table Prescription(name varchar(10),dose varchar(10),qtyperday varchar(10));

insert into Prescription values('bacd','once','2ml');
insert into Prescription values('xyz','twice','4ml');
insert into Prescription values('pqr','thrice','100mg');

create table Patient(pid int primary key,fname varchar(10),lname varchar(10),email varchar(20),
phno bigint,address varchar(20),Date_admn date);

insert into Patient values(200,'David','Samson','aaa@gmail.com',7654328976,'Mumbai',STR_TO_DATE('13-10-2016','%d-%m-%Y'));
insert into Patient values(201,'Bharath','Kumar','bbb@gmail.com',8765438907,'Hyderabad',STR_TO_DATE('22-01-2020','%d-%m-%Y'));
insert into Patient values(202,'Eswar','Prasad','ccc@gmail.com',9876548838,'Vijayawada',STR_TO_DATE('15-03-2020','%d-%m-%Y'));
insert into Patient values(203,'Jaya','Laxmi','ddd@gmail.com',8765489765,'Delhi',STR_TO_DATE('06-07-2020','%d-%m-%Y'));
insert into Patient values(204,'Laxmi','Devi','eee@gmail.com',7654430692,'Mumbai',STR_TO_DATE('12-03-2020','%d-%m-%Y'));
insert into Patient values(205,'Pramod','Reddy','fff@gmail.com',6543371619,'Hyderabad',STR_TO_DATE('05-02-2020','%d-%m-%Y'));
insert into Patient values(206,'Charan','Kumar','ggg@gmail.com',5432312546,'Vijayawada',STR_TO_DATE('22-04-2020','%d-%m-%Y'));
insert into Patient values(207,'Kalyan','Reddy','hhh@gmail.com',4321253473,'Delhi',STR_TO_DATE('10-07-2020','%d-%m-%Y'));
insert into Patient values(208,'Rajesh','Yadav','iklmn@gmail.com',3210194400,'Chennai',STR_TO_DATE('03-03-2020','%d-%m-%Y'));
insert into Patient values(209,'Naveen','Kumar','jghfr@gmail.com',2099135327,'Hyderabad',STR_TO_DATE('22-04-2020','%d-%m-%Y'));
select *from Patient;

create table Shift(triagedoctor int,day date,starttime int,endtime int,
foreign key(triagedoctor) references Employee(wid));

insert into Shift values(100,STR_TO_DATE('12-04-2020','%d-%m-%Y'),9,5);
insert into Shift values(101,STR_TO_DATE('20-06-2020','%d-%m-%Y'),4,8);
insert into Shift values(102,STR_TO_DATE('01-08-2020','%d-%m-%Y'),6,12);
insert into Shift values(105,STR_TO_DATE('05-08-2020','%d-%m-%Y'),13,18);
select *from Shift;

create table PCASE(bednum int primary key,pid int,foreign key(pid) references Patient(pid));

insert into PCASE values(20,200);
insert into PCASE values(21,201);
insert into PCASE values(22,202);
insert into PCASE values(23,203);
insert into PCASE values(24,204);
insert into PCASE values(25,205);
insert into PCASE values(26,206);
insert into PCASE values(27,207);
insert into PCASE values(28,208);
insert into PCASE values(29,209);
select *from PCASE;

create table APPOINTMENT(pid int,amt int,foreign key(pid) references Patient(pid));

insert into APPOINTMENT values(200,200);
insert into APPOINTMENT values(201,200);
insert into APPOINTMENT values(202,300);
insert into APPOINTMENT values(203,600);
insert into APPOINTMENT values(204,200);
insert into APPOINTMENT values(205,300);
insert into APPOINTMENT values(206,200);
insert into APPOINTMENT values(207,200);
insert into APPOINTMENT values(208,200);
insert into APPOINTMENT values(209,600);
select *from APPOINTMENT;

delimiter $$
create procedure proc_amt()
begin
	select amt as doctor_appointment_amount from APPOINTMENT;
end $$
delimiter ;

call proc_amt();

delimiter $$
create procedure proc_delete()
begin
	delete from APPOINTMENT where amt = 200;
end $$
delimiter ;
call proc_delete();
select *from APPOINTMENT;

delimiter $$
create trigger trig_patient before insert on Patient
for each row
begin
	if new.pid not in  (select pid from Patient) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Patient ID';
	end if;
end $$
delimiter ;

insert into Patient values(210,'Naveen','Kumar','jghfr@gmail.com',2099135327,'Hyderabad',STR_TO_DATE('22-04-2020','%d-%m-%Y'));

delimiter $@
create function Q12() returns varchar(100)
deterministic
begin
	declare city varchar(45);
    select address into city from Patient group by address order by count(*) desc limit 1;
    return city;
end $@
delimiter ;

select Q12();