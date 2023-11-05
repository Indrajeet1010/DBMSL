use lab;

CREATE TABLE EMPLOYEEE(
EMPNO INT PRIMARY KEY,
ENAME VARCHAR(20),
JOB VARCHAR(30),
SAKARY INT
);

INSERT INTO EMPLOYEEE VALUES(101,"ASHOK","TL",45000);
INSERT INTO EMPLOYEEE VALUES(1022,"CHINED","SECURITY",5000);
INSERT INTO EMPLOYEEE VALUES(103,"RAED","CLERK",15000);
INSERT INTO EMPLOYEEE VALUES(104,"MF","MANAGER",95000);
INSERT INTO EMPLOYEEE VALUES(105,"KUNAL","TL",55000); 

SELECT AVG(SAKARY) AS AverageSalary FROM EMPLOYEEE;


SELECT COUNT(*) AS EmployeeCount FROM EMPLOYEEE;

SELECT MIN(SAKARY) AS MinimumSalary FROM EMPLOYEEE;

SELECT MAX(SAKARY) AS MaximumSalary FROM EMPLOYEEE;

