use lab;

CREATE TABLE EMPP(
ID INT PRIMARY KEY,
NAME VARCHAR(20),
SALARY INT,
DEPT_ID INT
);

CREATE VIEW HIGHSALARY AS SELECT * FROM EMPP WHERE SALARY >50000;  -- CREATE VIEW

SELECT * FROM HIGHSALARY;    --  SELECT FROM VIEW

INSERT INTO HIGHSALARY VALUES(1,"ASH",60000,101); --   INSERT USING VIEW

UPDATE HIGHSALARY SET NAME="KELLY" WHERE ID=1;     --  UPDATE USING VIEW
INSERT INTO HIGHSALARY VALUES(2,"ASH",90000,102);   

SELECT * FROM HIGHSALARY;

DELETE FROM HIGHSALARY WHERE ID=2;         -- DELETE USING VIEW