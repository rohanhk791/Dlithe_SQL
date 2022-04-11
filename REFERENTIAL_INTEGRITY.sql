---REFERENTIAL INTEGRITY
-DEPT and EMP
--PARENT TABLE(DEPT)
create table Dept
(
dno INT PRIMARY KEY,
dname VARCHAR(25)
)

INSERT INTO DEPT VALUES(1,'HR')

INSERT INTO DEPT VALUES(2,'IT')

INSERT INTO DEPT VALUES(3,'tech')

INSERT INTO DEPT VALUES(4,'testing')

INSERT INTO DEPT VALUES(5,'SE')
SELECT * FROM DEPT


--CHILD TABLE(EMP)
create table emp0
(
eid INT PRIMARY KEY,
ename VARCHAR(25),
dis INT FOREIGN KEY REFERENCES DEPT(dno)
)

INSERT INTO emp0 VALUES(101,'aa',1)
INSERT INTO emp0 VALUES(102,'b',2)
INSERT INTO emp0 VALUES(103,'c',3)
INSERT INTO emp0 VALUES(104,'d',4)
INSERT INTO emp0 VALUES(105,'e',4)
SELECT * FROM emp0

--TABLES-Customer,Products,Orders
--Customer-Parent1
create table Customer
(
CID INT PRIMARY KEY,
CNAME VARCHAR(20)
)
INSERT INTO CUSTOMER VALUES(1,'a')
INSERT INTO CUSTOMER VALUES(2,'b')
INSERT INTO CUSTOMER VALUES(3,'c')
INSERT INTO CUSTOMER VALUES(4,'d')
INSERT INTO CUSTOMER VALUES(5,'e')
SELECT * FROM CUSTOMER

--PRODUCTS-PARENT2
CREATE TABLE PRODUCT
(
PID INT PRIMARY KEY,
PNAME VARCHAR(25),
PRICE MONEY
)
INSERT INTO PRODUCT VALUES(100,'DELL',45000)
INSERT INTO PRODUCT VALUES(101,'HP',35000)
INSERT INTO PRODUCT VALUES(102,'MAC',85000)
SELECT * FROM PRODUCt

--ORDERS-CHILD
CREATE TABLE ORDERS
(
ORDERID INT PRIMARY KEY,
ORDERDATE DATE,
QUANTITY INT,
CNO INT FOREIGN KEY REFERENCES CUSTOMER(CID),
PNO INT FOREIGN KEY REFERENCES PRODUCT(PID)
)
INSERT INTO ORDERS VALUES(011,'2022/04/10',2,5,102)

INSERT INTO ORDERS VALUES(012,'2022/04/10',2,5,101)

INSERT INTO ORDERS VALUES(013,'2022/04/10',1,2,103)

SELECT * FROM ORDERS

--CASCADING REFERENTIAL INTEGRITY CONSTRAINTS
--ON DELETE/ON UPDATE
--BY DEFAULT ON DELETE/ON UPDATE NO ACTION

create table Parent
(
PID INT PRIMARY KEY,
PARENTNAME VARCHAR(30)
)

create table Child
(
CID INT PRIMARY KEY,
CNAME VARCHAR(30),
PID INT CONSTRAINT parentid_fk references PARENT(PID)
)

INSERT INTO PARENT VALUES(101,'P1')
INSERT INTO PARENT VALUES(102,'P2')
INSERT INTO PARENT VALUES(103,'P3')
INSERT INTO PARENT VALUES(105,'P4')
INSERT INTO PARENT VALUES(105,'P5')

select * from parent

INSERT INTO CHILD VALUES(200,'C1',101)
INSERT INTO CHILD VALUES(201,'C2',101)
INSERT INTO CHILD VALUES(202,'C3',102)
INSERT INTO CHILD VALUES(203,'C4',103)
INSERT INTO CHILD VALUES(204,'C5',104)

select * from child

--DELETE THE RECORDS FROM THE PARENT TABLE
DELETE FROM PARENT WHERE PID=105

DELETE FROM PARENT WHERE PARENTNAME=P3

--UPDATE THE RECORDS FROM THE PARENT TABLE
UPDATE PARENT SET PID=1 WHERE PID=001

--OVERCOME THE ABOVE DELETE AND UPDATE CONFLICT
--alter the foreign key in the child table
alter table child drop constraint parentid_fk

alter table child add constraint parentid_fk foreign key(pid) references Parent(PID) on delete cascade;

select * from Parent
select * from Child
--DELETE THE RECORDS FROM THE PARENT TABLE
DELETE FROM PARENT WHERE PID=001

---OVERCOME THE ABOVE ON DELETE CASCADE--
--alter the foreign key in the child table

alter table child drop constraint parentid_fk

alter table child add constraint parentid_fk foreign key(pid) references Parent(PID) on delete set null;
--DELETE THE RECORDS FROM THE PARENT TABLE
DELETE FROM PARENT WHERE PID=101

--OVERCOME THE ABOVE ON DELETE SET NULL WITH A VALUE
--alter the foreign key in the child table
alter table child drop constraint parentid_fk

drop table child

create table Child
(
CID INT PRIMARY KEY,
CNAME VARCHAR(30),
PID INT DEFAULT 101 CONSTRAINT PARENTID_FK REFERENCES PARENT(PID) ON DELETE SET DEFAULT
)

INSERT INTO CHILD VALUES(001,'C1',101)
INSERT INTO CHILD VALUES(002,'C2',102)
INSERT INTO CHILD VALUES(003,'C3',103)

select * from Parent
select * from Child


--DELETE THE RECORDS FROM THE PARENT TABLE
DELETE FROM PARENT WHERE PID=102

--SEQUENCES- UNIQUE NUMBER - PRIMARY KEY
CREATE SEQUENCE dbo.Sequenceclass
as int
start with 1
increment by 1

--sys.sequences->System Databases->master->Views
select * from sys.sequences where name='Sequenceclass'

create table seq_class
(
id int primary key,
name varchar(20)
)

select NEXT VALUE FOR dbo.Sequenceclass

INSERT INTO SEQ_CLASS VALUES(NEXT VALUE FOR dbo.Sequenceclass,'rohan')
INSERT INTO SEQ_CLASS VALUES(NEXT VALUE FOR dbo.Sequenceclass,'mohan')

DELETE FROM SEQ_class

SELECT * FROM SEQ_CLASS

--RESET THE SEQUENCE
ALTER SEQUENCE Sequenceclass RESTART WITH 1

ALTER SEQUENCE Sequenceclass RESTART WITH 2

--DROP SEQUENCE SequenceDemo


--STUDENT TABLE
--clustered index(only one)

create clustered index ind_id on student(id)

create index ind_Cgpa on student(Cgpa)

--unique non clustered index
create unique nonclustered index ind_Name on student(Name)

select * from student where Sgpa>6

--filtered index
create index ind_Cgpa on student(Cgpa) where Cgpa>6


