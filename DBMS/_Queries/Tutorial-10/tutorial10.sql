delimiter @
create procedure classdetails(class_id int)
begin
	select * from examclass where CLID=class_id;
end @
delimiter ;

call classdetails(102);

delimiter $
create procedure facdetails()
begin
	declare fac_id int;
    declare fac_name varchar(25);
    declare fac_address varchar(25);
    declare fac_phone int;
    declare fac_emgPN int;
    declare fac_duties int;
    declare fac_finished int default 0;
    declare c1 cursor for select * from fac;
	declare continue handler for not found set fac_finished=1; 
    open c1;
		fac_det:loop
			fetch c1 into fac_id,fac_name,fac_address,fac_phone,fac_emgPN;
			if fac_finished=1 then
				leave fac_det;
			end if;
            select count(FID) into fac_duties from examt where FID=fac_id;
			select fac_id,fac_name,fac_address,fac_phone,fac_emgPN,fac_duties;
		end loop;
	close c1;
end $
delimiter ;

call facdetails();

delimiter $@
create procedure fac_exam_details(fac_id int)
begin
	declare fac_name varchar(25);
    declare fac_examtype varchar(25);
    declare fac_examdate date;
    declare fac_examcoursecode int;
    declare fac_finished int default 0;
    declare c1 cursor for select CID,examtype,dte from examt where FID=fac_id;
    declare continue handler for not found set fac_finished=1;
    open c1;
		fac_ext:loop
			fetch c1 into fac_examcoursecode,fac_examtype,fac_examdate;
            if(fac_finished=1) then
				leave fac_ext;
			end if;
            select name into fac_name from fac where FID=fac_id;
            select fac_id,fac_name,fac_examtype,fac_examdate,fac_examcoursecode;
		end loop;
	close c1;
end $@
delimiter ;

call fac_exam_details(3012);