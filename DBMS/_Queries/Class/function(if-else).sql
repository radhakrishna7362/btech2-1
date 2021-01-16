delimiter @$
create function grade_stud(per float) returns varchar(5)
begin
	declare grade varchar(5);
    if per>=90 then
		set grade='X';
	elseif per>=75 and per<90 then
		set grade='A';
	elseif per>=60 and per<75 then
		set grade='B';
	elseif per>=40 and per<60 then
		set grade='C';
	else
		set grade='Fail';
	end if;
	return grade;
end @$
delimiter ;

select grade_stud(80);