create table Emp11
(
eid INT PRIMARY KEY IDENTITY(1,1),
ename VARCHAR(25) UNIQUE NOT NULL,
age INT CHECK(AGE>21),
designation VARCHAR(25) DEFAULT 'Trainee'
)

INSERT INTO Emp11 VALUES('amulya',22,'se')
INSERT INTO  Emp11 VALUES('thanu',23,'se')
INSERT INTO  Emp11 VALUES('rohan',25,'HR')
INSERT INTO  Emp11(ENAME,AGE) VALUES('krishne',45)
INSERT INTO  Emp11 VALUES('yashwanth',26,'IT')

select * from Emp11

--Working of identity
create table class
(
id int identity(1,1),
name varchar(25)
)
insert into class values('prajwal')
insert into class values('hemanth')
insert into class values('manu')
insert into class values('manju')

select * from class

--To insert explicit values
SET Identity_Insert class ON;
insert into class(id,name) values(4,'a')

--Reset the identity value
DBCC CHECKIDENT(class,RESEED,0);

SET Identity_Insert class OFF;
insert into class values('x')
insert into class values('y')
insert into class values('z')

--To know the current seed value in the identity column of your demo table
Select IDENT_CURRENT('class')
Select IDENT_CURRENT('Emp11')

--DROP Primary key from Employees table
alter table Emp11 drop PK__Employee__C190170B3E96AE83

--ADD A PRIMARY KEY CONSTRAINT WITH OWN CONSTRAINT NAME
alter table Emp11 add constraint pk_eid PRIMARY KEY(eid)

--PRIMARY-FOREIGN
SEQUENCES
------------
---UNIQUE NUMBER - PRIMARY KEY


