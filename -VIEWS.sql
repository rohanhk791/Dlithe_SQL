--VIEWS-VIRTUAL TABLES
--SYSTEM-DEFINED VIEWS
--USER-DEFINED VIEWS - SIMPLE(SINGLE TABLE) AND COMPLEX(MULTIPLE TABLES)

--1 SIMPLE VIEW

select * from student

create view View_Studentcgpa
as
select id,name,cgpa,iif(cgpa>6,'Distinction','Merit') as Remarks from student

select * from View_Studentcgpa

--2. COMPLEX VIEW
create view View_amazon
as
select c.cid,c.cname,o.orderid,o.pno,p.pname,p.price
from customer as c full join orders as o on c.cid=o.cno
full join product as p on o.pno=p.pid

select * from View_amazon