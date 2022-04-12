--SYNONYM

select * from emp11
select * from emp0
create synonym empl for dbo.emp11

drop synonym if exists emp1

--CHOOSE()
select choose(5,'HTML','CSS','JQUERY','BOOTSTRAP','SQL') AS RESULT;

select choose(2,'HTML','CSS','JQUERY','BOOTSTRAP','SQL') AS RESULT;

select choose(4,'HTML','CSS','JQUERY','BOOTSTRAP','SQL') AS RESULT;


select * from orders

select orderdate,choose(month([orderdate]),'Jan','Feb','Mar','April') as OrderMonth from orders

select orderdate,choose(day([orderdate]),'Sun','Mon','Tue','Wed','Thur','Fri','Sat') as OrderMonth from orders

--CASE
select * from student
--Searched Case

select Name,cgpa,
CASE
    WHEN cgpa=6 THEN 'MERIT'
    WHEN cgpa=7 THEN 'DISTINCTION'
    ELSE 'GOOD'
END AS REMARKS from student

--Simple Case
select Name,Department,
CASE Department    
    WHEN 'IT' THEN 'INFORMATION TECHNOLOGY'
    WHEN 'DEV' THEN 'DEVELOPER'
    ELSE 'DESIGNER'
END AS 'DEPARTMENT DETAILS'
FROM STUDENT