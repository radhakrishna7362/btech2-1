delimiter @@
create procedure mulofn(a int)
begin
	declare c,i int;
    set i=1;
    l1: LOOP
			set c=i*a;
			select a,i,c;
			set i=i+1;
			if i<=10 then
				iterate l1;
			end if;
		LEAVE l1;
	end LOOP;
end @@
delimiter ;

call mulofn(2);