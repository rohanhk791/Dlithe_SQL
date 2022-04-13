--TEMPORARY TABLES
	--#tablename-local-single server
	--##tablename-global-across connections/servers

--1. SELECT INTO

Select * from student

--#tablename- local temporary table
SELECT id,name,department INTO #studentdetails from student

select * from #studentdetails

--2. CREATE TABLE
CREATE TABLE #Stu
(
id int,
name varchar(25),
project_code int
)
--Select * from student -> #Stud_prj
--INSERT INTO SELECT

INSERT INTO #Stu SELECT id,name,projectcode from student

select * from #Stu

select * from #studentdetails