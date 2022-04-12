--STORED PROCEDURES
	--PRE-COMPILED SQL STATEMENTS
	--SAVES TIME ( AVOIDS WRITING THE QUERY AGAIN AND AGAIN)

	--System-defined
	--User-defined

--Advantages- Improves Performance,Reusable,easy to maintain,security,reduced traffic

--No parameters

select * from student

create procedure proc_projectcode
as
begin
    select * from student where projectcode=103;
end

execute proc_projectcode
exec proc_projectcode

--Input Parameters
create procedure sp_studentdept (@dept varchar(25))
as
begin
    select * from student where department=@dept --IT
end

exec sp_studentdept 'cs'
--or
exec sp_studentdept @dept='EC'

--Output Parameter
create procedure sp_mincgpa(@mincgpa int OUTPUT)
as
begin
    select @mincgpa=min(cgpa) from student --91
end

Declare @result int
exec sp_mincgpa @result OUTPUT --85
print @result --85