--GROUPING SETS -- 2008
--EXTENSION TO GROUP BY

select * from student
   
select sum(Cgpa) from student

select department,COUNT(Cgpa) as TotalCgpa from student group by department

select department,COUNT(cgpa) as TotalScore from student
group by GROUPING SETS
(
(DEPARTMENT,Cgpa)
)

select * from student

--ROLL UP AND CUBE FUNCTIONS - EXTENSION OF GROUP BY

Select department,sum(cgpa) from student group by department;
Select department,sum(cgpa) from student group by rollup(department);

Select department as Student_Department,sum(cgpa) as TotalScore from student group by rollup(department);

--coalesce(replaces the NULL with an Actual Value)
Select coalesce(department,'Overall_Totalcgpa') as Student_Department,sum(cgpa) as Totalcgpa from student group by rollup(department);

--coalesce(replaces the NULL with an Actual Value)
Select coalesce(department,'Overall_Totalcgpa') as Student_Department,sum(cgpa) as Totalcgpa from student group by cube(department);

select * from student

alter table student add projectcode int

update student set projectcode =103 where cgpa<9
update student set projectcode =100 where cgpa>8
update student set projectcode =102 where cgpa=7
update student set projectcode =101 where cgpa=6

select * from student

Select coalesce(department,'Overall_Totalcgpa') as Student_Department,sum(cgpa) as Totalcgpa,Projectcode
from student group by rollup(department,projectcode) order by department,projectcode

Select coalesce(department,'Overall_Totalcgpa') as Student_Department,sum(cgpa) as Totalcgpa,Projectcode
from student group by cube(department,Projectcode) order by department,Projectcode

select * from student order by department