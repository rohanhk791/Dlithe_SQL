--JOINS-COMBINE ROWS FROM TWO OR MORE TABLES-COMMON COLUMN
--TYPES OF JOINS
--INNER JOIN,RIGHT JOIN,LEFT JOIN,FULL JOIN,CROSS JOIN,SELF JOIN
use DLithe
select * from Customer

select * from Orders

select * from Product

--INNER JOIN(2 tables)(CUSTOMER AND ORDERS)-common values

select customer.cid,customer.cname,orders.orderid,orders.orderdate,
orders.quantity from customer inner join orders on customer.cid =orders.cno

--INNER JOIN(3 tables)(CUSTOMER,ORDERS,PRODUCTS)-common values
select c.cid,c.cname,o.orderid,o.pno,p.pname,p.price
from customer as c inner join orders as o on c.cid=o.cno
inner join product as p on o.pno=p.pid

select * from Customer

select * from Orders

select * from Product


--LEFT JOIN
select customer.cid,customer.cname,orders.orderid,orders.orderdate,
orders.quantity from customer left join orders on customer.cid =orders.cno

select * from Customer

select * from Orders

--RIGHT JOIN
select customer.cid,customer.cname,orders.orderid,orders.orderdate,
orders.quantity from customer right join orders on customer.cid =orders.cno

--FULL JOIN
select customer.cid,customer.cname,orders.orderid,orders.orderdate,
orders.quantity from customer full join orders on customer.cid =orders.cno

select c.cid,c.cname,o.orderid,o.pno,p.pname,p.price
from customer as c full join orders as o on c.cid=o.cno
right join product as p on o.pno=p.pid

--CAST() - converts a value into the specified datatype
select cast(3.14 as int)
select cast(2.12 as varchar)
select cast('2022-04-11' as datetime)

--CONVERT()
select convert(int,3.1)
select convert(varchar,3.14)
select convert(datetime,'2022-04-11')

--COALESCE()-RETURNS THE FIRST NOT NULL VALUE FROM THE LIST
select coalesce(NULL,1,2,'WELCOME')
select coalesce(NULL,NULL,1,2,NULL,'india')

--CURRENT_USER()
SELECT CURRENT_USER;

--IIF()
--iif(condition,true,false)
select iif(10<50,'10 IS LESS','50 IS GREATER')
select iif(10<50,10,50)

select * from student

select id,name,Cgpa,iif(Cgpa>7,'Distinction','Merit') as Remarks from student