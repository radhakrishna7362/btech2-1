delimiter @
create function sumofn(n int)returns int
begin
	declare sum,i int;
    set sum=0,i=1;
    l1:	REPEAT
			set sum=sum+i;
			set i=i+1;
			until i>n
		end REPEAT l1;
    return sum;
end @
delimiter ;

select sumofn(5);