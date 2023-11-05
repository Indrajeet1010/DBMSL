
-- /Unnamed PL/SQL code block: Use of Control structure and
-- Exception handling is mandatory. Write a PL/SQL block of code for the
-- following requirements:-
-- Schema:
-- 1. Borrower(Rollin, Name, DateofIssue, NameofBook, Status)

CREATE DATABASE ASS5;

USE ASS5;

CREATE TABLE BORROWER(
ROLLIN INT PRIMARY KEY,
NAME VARCHAR(20),
BOOK VARCHAR(20),
STATUS CHAR(1)
);
DESC BORROWER;

CREATE TABLE FINE(
ROLL_NO INT, FOREIGN KEY(ROLL_NO) REFERENCES BORROWER(ROLLIN),
FDATE DATE,
AMOUNT INT
);
DESC FINE;

ALTER TABLE BORROWER ADD DATEOFISSUE DATE;

DESC BORROWER;

INSERT INTO BORROWER VALUES(1,"ABC","JAVA","I",'2020-11-01');
INSERT INTO BORROWER VALUES(2,"DEF","PYTHON","I",'2020-10-15');
INSERT INTO BORROWER VALUES(3,"XYZ","DBMS","I",'2020-10-01');
INSERT INTO BORROWER VALUES(4,"LMN","CNS","I",'2020-09-22');

SELECT * FROM BORROWER;

SELECT * FROM FINE;

UPDATE BORROWER SET DATEOFISSUE='2023-10-5' WHERE ROLLIN=1;
UPDATE BORROWER SET DATEOFISSUE='2023-09-25' WHERE ROLLIN=2;
UPDATE BORROWER SET DATEOFISSUE='2023-10-10' WHERE ROLLIN=3;
UPDATE BORROWER SET DATEOFISSUE='2023-08-30' WHERE ROLLIN=4;
SELECT * FROM BORROWER;

delimiter $
CREATE PROCEDURE FINE_CALC(IN RNO INT(3),BOOK CHAR(20))
begin
declare i_date date;
declare diff int;
declare fine_amt int;
declare exit handler for sqlexception select 'table not found';
select DATEOFISSUE into i_date from BORROWER where ROLLIN = RNO and BOOK = BOOK;
select datediff(curdate(),i_date) into diff;
if(diff>15 and diff<=30) then
set fine_amt = diff*5;
insert into FINE values (RNO,curdate(),fine_amt);
elseif(diff>30) then
set fine_amt = 15*5 + (diff-30)*50;
insert into FINE values(RNO,curdate(),fine_amt);
end if;
update BORROWER set STATUS='R' where ROLLIN = RNO AND BOOK = BOOK;
end;
$
delimiter ;
call FINE_CALC(3,'DBMS');


SELECT * FROM FINE;

SELECT * FROM BORROWER;


















