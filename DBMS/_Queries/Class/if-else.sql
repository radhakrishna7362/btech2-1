delimiter @
create procedure set_bvalue(in a int,out b int)
begin
	declare c int;
    set c=100;
    if a<20 then
		set b=c+a;
	else
		set b=c-a;
	end if;
end @
delimiter ;

call set_bvalue(20,@b);
select @b;