--TRANSACTION

	--ACID PROPERTIES
	--ATOMICITY - SUCCESS/FAIL
	--CONSISTENCY -
	--ISOLATION
	--DURABILITY

	--TRANSACTION MODES
	--AUTO-COMMIT
	--EXPLICIT-BEGIN AND END,COMMIT,ROLLBACK,SAVEPOINT
	--IMPLICIT

--EXPLICIT TRANSACTION

select * from student

BEGIN TRANSACTION

    insert into student values(12,'dell','CS',8,7,105);
    update student set department='CS' where id=29;

	select * from student

COMMIT TRANSACTION

--ROLLBACK

BEGIN TRANSACTION
--SQL STATEMENTS
    insert into student values(11,'hp','IS',8,8,106);
    update student set department='IS' where id=42;

	select * from student
--Undo changes
ROLLBACK TRANSACTION


BEGIN TRANSACTION

    insert into student values(13,'mac','CV',7,6,105);

    --Savepoint is applied to your insert statement--

		select * from student

    SAVE TRANSACTION Insert_Student
    update student set department='EE' where id=101;
  
    ROLLBACK TRANSACTION Insert_Student
	  select * from student;
--Commit
COMMIT TRANSACTION

SELECT * FROM STUDENT

--IMPLICIT TRANSACTIO
SET IMPLICIT_TRANSACTIONS ON


--@@-global variable

Select iif(@@options & 2=2,'Implicit Transaction Mode ON',
        'Implicit Transaction Mode OFF') AS Transaction_Mode