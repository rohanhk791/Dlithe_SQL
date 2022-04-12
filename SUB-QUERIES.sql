--SUB-QUERIES
--A subquery-query within a SQL statement
--SELECT,INSERT,UPDATE,DELETE

--CORRELATED SUB QUERY
--NON CORRELATED SUB QUERY

select * from Customer

select * from orders

select * from product

--1. where IN(ONE TABLE)
select * from Customer where cid in --MAIN QUERY/OUTER QUERY
(select cid from Customer where cname='b') --SUB QUERY/INNER QUERY

select * from Customer where cid in 
(select cid from Customer where cname='d') 

--2. where IN(ONE TABLE)
select * from Customer where cid in 
(select cid from Customer where cname LIKE 'a%')

--3. where IN(TWO TABLES)
select * from Orders where pno in 
(select pid from Product)


--4. where IN(TWO TABLES)

select * from Orders where pno in 
(select pid from Product where price>30000) 

--5. SELECT SUBQUERY
select orderid,orderdate,
(select cid from customer where customer.cid=orders.cno)Customer_No from orders


insert into orders values(202,'2022-04-12',4,1,100)
select * from Customer
select * from orders
select * from product

--6. FROM SUBQUERY
select c.cid,c.cname from
(select count(cno) as Count_CustomerID from orders) as o,Customer as c
where c.CID > o.Count_CustomerID --Count_CustomerID=3

--7. INSERT SUBQUERY--Matching columns

select * from Customer

create table Customers_backup
(
c_no int,
c_type varchar(25))

select * from Customers_backup

--where subquery in the insert statement

insert into Customers_backup select * from customer where cid in--(3,4,5)
(select cid from customer where cname like '_a%');--(3,4,5)

--8. UPDATE SUBQUERY
select * from Customer
select * from orders

update orders set quantity=10 where cno in
(select cid from customer where cname='a')

update orders set quantity=5 where cno in --(1,5)
(select cid from customer where cname in('x','y'))

--9. DELETE SUBQUERY
delete from orders where cno in --(1,5)
(select cid from customer where cname in('a','x'))

--ANY AND ALL OPERATOR

select * from emp
select * from dept

--10. ANY
select eid,ename,age from emp where eid=ANY(select dno from dept) --(1,2,3,4)
select eid,ename,age from emp where eid=ANY(select AVG(DNO) from dept) --(2)

--11. ALL
select eid,ename,age from emp where eid=ALL(select dno from dept) --(1,2,3,4)
select eid,ename,age from emp where eid=ALL(SELECT dno from dept where dno<5) --1,2

--12. EXISTS
Select * from emp where exists(select dno,dname from dept where dept.dno=emp.eid and dname='HR')
