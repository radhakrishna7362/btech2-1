create table edu_bus(edu_id int,edu_name varchar(25),ph_no bigint,city varchar(25)
,street varchar(50),state varchar(25),pincode int,deal_no int,primary key(edu_id),foreign key(deal_no) references dealer(d_no));

insert into edu_bus values(31,'dps',1122334455,'Hyderabad','sanathnagar','Telangana',512345,444);
insert into edu_bus values(32,'klu',4455667788,'guntur','vaddeswaram','Andhra Pradesh',567432,111);
insert into edu_bus values(33,'dav',1234567896,'Hyderabad','jubilee hills','Telangana',500897,333);
insert into edu_bus values(34,'surya',4356789321,'Hyderabad','bachupally','Telangana',512098,111);
insert into edu_bus values(35,'vit',7788996578,'Hyderabad','kukatpally','Telangana',500078,444);
insert into edu_bus values(36,'rvrrjc',2233445566,'guntur','guntur','Andhra Pradesh',523087,222);
insert into edu_bus values(37,'vnr',7766554322,'Hyderabad','miyapur','Telangana',512312,333);
insert into edu_bus values(38,'klh',66178765777,'Hyderabad','aziznagar','Telangana',502303,222);
insert into edu_bus values(39,'bvrit',8899776655,'Hyderabad','nizampet','Telangana',506078,111);
insert into edu_bus values(40,'cbit',6547976543,'Hyderabad','gandipet','Telangana',500064,111);

select * from edu_bus;
