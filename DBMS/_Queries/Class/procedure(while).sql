delimiter @@
create procedure mulofnwhile(a int)
begin
	declare c,i int;
    set i=1;
    l1: WHILE i<=10 do
			set c=i*a;
			select a,i,c;
			set i=i+1;
	end WHILE l1;
end @@
delimiter ;

call mulofnwhile(2);