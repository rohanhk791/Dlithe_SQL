--TRIGGERS
	--DML TRIGGER - INSERT UPDATE AND DELETE
	--DDL TRIGGER - CREATE ALTER DROP
	--CLR TRIGGER - CLR(.NET FRAMEWORK-COMMON LANGUAGE RUNTIME)
	--LOGON TRIGGERS

use DLithe

create table class_trigger
(
id int,
name varchar(25))

insert into class_trigger values(1,'rohan')

select * from class_trigger

--1.DML TRIGGER -INSERT UPDATE DELETE
--FOR INSERT

create trigger trigger_insert
on class_trigger
FOR INSERT
as
BEGIN
    print 'You cannot insert into class_trigger table'
    ROLLBACK TRANSACTION
END

insert into class_trigger values(2,'mohan')
update class_trigger set name='mohan' where id=1

select * from class_trigger

--FOR UPDATE
create trigger trigger_update
on class_trigger
FOR UPDATE
as
BEGIN
    print 'You cannot update into class_trigger table'
    ROLLBACK TRANSACTION
END

update class_trigger set name='rohan' where id=1

--FOR DELETE
create trigger trigger_delete
on class_trigger
FOR DELETE
as
BEGIN
    print 'You cannot delete from class_trigger table'
    ROLLBACK TRANSACTION
END

delete from class_trigger where id=1 --error

drop trigger trigger_delete --deleted
drop trigger trigger_insert
drop trigger trigger_update



--FOR DML

create trigger trigger_DML
on class_trigger
FOR INSERT,UPDATE,DELETE
as
BEGIN
    print 'You cannot PERFORM DML OPERATIONS ON class_trigger table'
    ROLLBACK TRANSACTION
END

--FOR DML (PARTICULAR PERIOD OF TIME)

alter trigger trigger_DML
on class_trigger
FOR INSERT,UPDATE,DELETE
as
BEGIN
    IF DATEPART(DW,GETDATE())=3
        BEGIN
            PRINT 'DML OPERATIONS CANNOT BE PERFORMED'
            ROLLBACK TRANSACTION
        END
END

alter trigger trigger_DML
on class_trigger
FOR INSERT,UPDATE,DELETE
as
BEGIN
    IF DATEPART(HH,GETDATE())<10
        BEGIN
            PRINT 'DML OPERATIONS CANNOT BE PERFORMED NOW'
            ROLLBACK TRANSACTION
        END
END

select * from class_trigger


insert into class_trigger values(4,'raj')

select * from class_trigger

drop trigger trigger_DML

--INSERTED AND DELETED TABLE

create trigger trginsert_demo
ON class_trigger
FOR INSERT
AS
    BEGIN
        select * from inserted
    END

select * from class_trigger


insert into class_trigger values(2,'rohan')

select * from class_trigger

---DELETED TABLE

create trigger trgdelete_demo
ON class_trigger
FOR DELETE
AS
    BEGIN
        select * from deleted
    END

select * from class_trigger

delete from class_trigger where id=4

create trigger trgupdate_demo
ON class_trigger
FOR UPDATE
AS
    BEGIN
        select * from INSERTED
        select * from DELETED
    END

update class_trigger set name='krishna' where id=1

select * from class_trigger

---------------------------------------------------------------------------DDL

--DDL TRIGGERS
	--CREATE ALTER DROP - DATABASE

		--DATABASE SCOPE
		--SERVER SCOPE

				--DATABASE-SCOPE
				--Restrict Create Table


create trigger tg_restrictcreatetable
ON DATABASE
FOR CREATE_TABLE
AS
    BEGIN
        PRINT 'CANNOT CREATE TABLE IN THIS DATABASE'
        ROLLBACK TRANSACTION
    END

create table class1(id int)

select * from class


alter table class add Cgpa int

--Restrict Alter Table
create trigger tg_restrictaltertable
ON DATABASE
FOR ALTER_TABLE
AS
    BEGIN
        PRINT 'CANNOT ALTER TABLE IN THIS DATABASE'
        ROLLBACK TRANSACTION
    END

alter table class add AGE int


--Restrict Drop Table
create trigger tg_restrictdroptable
ON DATABASE
FOR DROP_TABLE
AS
    BEGIN
        PRINT 'CANNOT DROP TABLE IN THIS DATABASE'
        ROLLBACK TRANSACTION
    END


DISABLE TRIGGER tg_restrictdroptable ON DATABASE

ENABLE TRIGGER tg_restrictdroptable ON DATABASE


--Restrict Rename

create trigger tg_restrictrename
ON DATABASE
FOR RENAME
AS
    BEGIN
        PRINT 'CANNOT RENAME THE TABLE IN THIS DATABASE'
        ROLLBACK TRANSACTION
    END

select * from class_trigger

sp_rename 'class_trigger','d_trg'

alter trigger tg_restrictrename
ON DATABASE
FOR RENAME
AS
    BEGIN
        PRINT 'An Object has been renamed in this database'
    END

sp_rename 'class_trigger','d_trg'

select * from d_trg


--SERVER SCOPED DDL TRIGGERS

create trigger trg_ServerDDL
ON ALL SERVER
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
    BEGIN
        PRINT 'CANNOT PERFORM DDL IN THIS SERVER'
        ROLLBACK TRANSACTION
    END

create table demo(id int)

--INSTEAD OF TRIGGER
create trigger trg_insteadof
ON d_trg
INSTEAD OF INSERT
AS
SELECT * FROM d_trg

insert into d_trg values(4,'rotty')

alter trigger trg_insteadof
ON d_trg
INSTEAD OF INSERT
AS
SELECT name FROM d_trg