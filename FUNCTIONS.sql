--FUNCTIONS- SET OF OPERATIONS/ACTION

--SYSTEM AND USER-DEFINED

		--USER-DEFINED
		--1. SCALAR
		--2. INLINE TABLE VALUED
--3. MULTI STATEMENT TABLE VALUED

		--SCALAR FUNCTION -- user-defined -- return a single value
		--Can have parameters or not
		--returns int,varchar,date etc
		--@a table variable

--1. SCALAR_CUBE

create function cube_class(@a int)
returns int
as
begin
    return @a*@a*@a
end

--call the function

select dbo.cube_class(2) as Result

--2. SCALAR_AGE

create function calc_age2(@dob date)
returns int
as
begin
    Declare @age int  
    set @age=datediff(year,@dob,getdate()) --12-04-2022 - 15-04-2022
    return @age
end

select dbo.calc_age('20/02/1998') as Age

insert into orders values(0,'01/04/2022',7,1,100),(1,'02/04/2022',7,5,102),(2,'03/04/2022',7,2,100),(3,'04/04/2022',7,1,101)



select * from orders


--User-defined function in the select list
select cno,orderid,orderdate,dbo.calc_age2(orderdate) as Orders_YearDiff from orders


--User-defined function in the select list and the where clause
select cno,orderid,orderdate,dbo.calc_age2(orderdate) as Orders_YearDiff from orders where dbo.calc_age2(orderdate)<15



--TABLE VALUED FUNCTIONS

--INLINE TABLE VALUED - returns table - no begin and end - single query

select * from student

create function fun_getCgpa(@sid int)
returns table
as
return(select * from student where id=@sid)

select * from student

--call the inline table valued function
select * from fun_getCgpa(2)

--MULTI STATEMENT TABLE VALUED
alter function fun_getITdept()

returns @table Table (Sid int,stname varchar(25),stDept varchar(25),stcgpa int)
as
begin
    insert into @table
    select id,name,department,cgpa from student where department = 'CS';
    return
end

--call the multi-statement table valued function
select * from fun_getITdept()

