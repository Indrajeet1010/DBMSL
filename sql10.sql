-- PL/SQL Stored Procedure and Stored Function.
-- Write a Stored Procedure namely proc_Grade for the categorization of
-- student. If marks scored by students in examination is <=1500 and
-- marks>=990 then student will be placed in distinction category if marks
-- scored are between 989 and900 category is first class, if marks 899 and
-- 825 category is Higher Second Class. Write a PL/SQL block for using
-- procedure created with above requirement.
-- Stud_Marks(name, total_marks)
-- Result(Roll,Name, Class)
-- Frame the separate problem statement for writing PL/SQL Stored
-- Procedure and function, inline with above statement. The problem
-- statement should clearly state the requirements.

CREATE DATABASE ASS7;

USE ASS7;

CREATE TABLE STUD_MARKS(
NAME VARCHAR(20),
MARKS INT
);

INSERT INTO STUD_MARKS VALUES ("HARSHIT",1400);
INSERT INTO STUD_MARKS VALUES ("VIVEK",950);
INSERT INTO STUD_MARKS VALUES ("BIT",850); 

SELECT * FROM STUD_MARKS;

CREATE TABLE RESULT(
ROLL INT PRIMARY KEY auto_increment,
NAME VARCHAR(20),
CLASS VARCHAR(30)
);



delimiter //
create procedure proc_Grad(IN RNO INT,OUT GRADE VARCHAR(25))
BEGIN
DECLARE M INT;
SELECT MARKS INTO M FROM STUD_MARKS WHERE NAME = (SELECT NAME FROM RESULT WHERE ROLL=RNO);
IF M>=990 AND M<=1500 THEN
SELECT 'DISTINCTION' INTO GRADE;
UPDATE RESULT SET CLASS='DISTINCTION' WHERE ROLL=RNO;
ELSE IF M>=900 AND M<=989 THEN
SELECT 'FIRST CLASS' INTO GRADE;
UPDATE RESULT SET CLASS='FIRST CLASS' WHERE ROLL=RNO;
ELSEIF M>=825 AND M<=899 THEN
SELECT 'HIGHER SECOND CLASS' INTO GRADE;
UPDATE RESULT SET CLASS='HIGHER SECIND CLASS' WHERE ROLL=RNO;
ELSE
SELECT '--' INTO GRADE;
UPDATE RESULT SET CLASS='--' WHERE ROLL=RNO;
END IF;
END;
// 