select * from student

--a. String functions
--displays ASCII code for first character

SELECT ASCII(NAME) AS firstcharcode
FROM student;

--Char returns the ASCII number based on the given character
SELECT CHAR(51) AS chrval;

--Adds two String

SELECT CONCAT('rohan', 'h k') AS name;

--or use +

SELECT 'rohan' + 'h k'

--concats the string and adds the given seperator symbol to seperate the values

SELECT CONCAT_WS('*', 'html','Bootstrap','css');

--Displays the length of a given string

SELECT DATALENGTH('booking.com');

--Displays the diffrence between 2 string by an int value ranging from 0 to 4 o being the weak similarity and 4 being the highest similarity
SELECT DIFFERENCE('rohan', 'mohan');

SELECT DIFFERENCE('mohan', 'Rohan');

--Extract the stings from the left for a given value
SELECT LEFT('datalyzer', 6) AS Company;

--Formats the given string to lower case
SELECT LOWER('INDIA') as country;

--Formats the given string to upper case
SELECT upper('india') as country;


--Returns string inside sqr brackets
SELECT QUOTENAME('karnataka')AS state;

--Replaces the a char or a string
SELECT REPLACE('rohan', 'r', 'm')AS Alias;

SELECT REPLACE('mohan', 'mohan','rohan')As 'new name'

--replicates the given string with the given number of times
SELECT REPLICATE('tataipl ', 10)as duplicate;


--prints the given string in Reverse order
SELECT REVERSE('tataipl')as inverse;

--Extract the stings from the Right for a given value

SELECT RIGHT('coding', 8) AS Program;

--Rtrim,Ltrim and trim will trim the extra white spaces in a string

SELECT rtrim('india      ')AS name;

SELECT ltrim('       india')AS name;

SELECT ltrim('       india       ')AS name;