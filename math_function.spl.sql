select * from student
select * from emp
--b. Math functions

--Returns the absolute value of a given number:

SELECT Abs(100.1) AS value;

--Trigonometric functions

SELECT sin(0.01);
SELECT cos(0.21);
SELECT tan(0.05);
SELECT cot(0.15);


--Displays avg value from a given column
SELECT AVG(AGE) AS AVGAGE FROM emp;

--converts radian values into degree

SELECT DEGREES(21);

--Exponent value
SELECT EXP(2);

--Returns largest int value i.e., less than the given value

SELECT FLOOR(40.25) AS equi;


--Returns largest int value i.e., greater than the given value

SELECT CEILING(41.95) AS CeilValue;

--Return the base-10 logarithm of a given number:

SELECT LOG10(9);

--counts the number of employees
SELECT count(EID) AS LargestPrice FROM emp;

-- displays top performer
SELECT MAX(Cgpa) AS TOPperformer FROM student;

-- displays poor performer
SELECT Min(Cgpa) AS POORperformer FROM student;

--returns pi value
select pi()

--power function
SELECT POWER(4, 4);

--return the square of a number:

SELECT SQUARE(10);

--calc the total sum
SELECT SUM(Cgpa) AS TotalItemsOrdered FROM student;
