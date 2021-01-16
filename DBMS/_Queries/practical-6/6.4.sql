create table dealer(deal_id int,deal_name varchar(25),city varchar(25),
street varchar(50),state varchar(25),pincode int,d_no int not null unique,ph_no bigint,primary key(deal_id));

insert into dealer values(51,'raju','Guntur','Raju nagar','Andhra Pradesh',612345,555,9988776655);
insert into dealer values(52,'raghu','Hyderabad','Kukatpally','Telangana',678890,666,8765489765);
insert into dealer values(53,'kiran','Hyderabad','Bachupally','Telangana',546789,777,7654312389);
insert into dealer values(54,'ganesh','Hyderabad','Kondapur','Telangana',456789,111,8790076543);
insert into dealer values(55,'hari','Hyderabad','Ameerpet','Telangana',534467,222,7896543245);
insert into dealer values(56,'kiran','Hyderabad','Sanathnagar','Telangana',512334,333,7788996655);
insert into dealer values(57,'kamal','Hyderabad','Miyapur','Telangana',504406,444,9123456789);
insert into dealer values(58,'eswar','Guntur','Mangalagiri','Andhra Pradesh',563456,888,8765456554);
insert into dealer values(59,'david','Guntur','Tullur','Andhra Pradesh',502344,999,7658897333);
insert into dealer values(60,'praveen','Vijayawada','Benz Circle','Andhra Pradesh',500023,122,8897653344);

select * from dealer;