delimiter $$
create function grades(per float) returns varchar(5)
begin
	declare grade varchar(5);
    case
    when per>=90 then
		set grade='X';
	when per>=75 and per<90 then
		set grade='A';
	when per>=60 and per<75 then
		set grade='B';
	when per>=40 and per<60 then
		set grade='C';
	else
		set grade='Fail';
	end case;
	return grade;
end $$
delimiter ;

select grades(70);