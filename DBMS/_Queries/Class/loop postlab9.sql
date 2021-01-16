delimiter $
create procedure loops()
begin
	declare i,j int;
    set i=1;
    l1:loop
		set j=1;
        l2:loop
			select concat('i is:',i,' j is:',j);
            set j=j+1;
            if j>3 then
				leave l2;
			end if;
		end loop l2;
        set i=i+1;
        if i>3 then
			leave l1;
		end if;
	end loop l1;
end $
delimiter ;

call loops();

delimiter @@
create function least_(i float,j float,k float) returns float
begin
    return least(i,j,k);
end @@
delimiter ;

select least_(1,2,3);

delimiter $@
create function floor_(f float) returns int
begin
	declare r int;
    set r=floor(f);
    return r;
end $@
delimiter ;

select floor_(2.6);