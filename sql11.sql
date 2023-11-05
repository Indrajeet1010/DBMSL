	-- currssor problem
    -- Cursors: (All types: Implicit, Explicit, Cursor FOR Loop,
-- Parameterized Cursor) Write a PL/SQL block of code using parameterized
-- Cursor, that will merge the data available in the newly created table
-- N_RollCall with the data available in the table O_RollCall. If the data in the
-- first table already exist in the second table then that data should be
-- skipped.Frame the separate problem statement for writing PL/SQL block to
-- implement all types of Cursors inline with above statement. The problem
-- statement should clearly state the requirements.
-- -------------------------------------------------------------------------------------

CREATE DATABASE ASS6;

USE ASS6;

CREATE TABLE O_ROLLCALL(
RNO INT PRIMARY KEY,
NAME VARCHAR(20),
ADDR VARCHAR(30)
);

DESC O_ROLLCALL;

CREATE TABLE N_ROLLCALL(
RNO INT ,
NAME VARCHAR(20),
ADDR VARCHAR(30)
);
DESC N_ROLLCALL;
+
INSERT INTO O_ROLLCALL VALUES(1,"SUNNY","WABLETOWN"); 
INSERT INTO O_ROLLCALL VALUES(2,"HARSHIT","FOREST"); 
INSERT INTO O_ROLLCALL VALUES(3,"VIVEK","POND"); 
INSERT INTO O_ROLLCALL VALUES(4,"SAHIL","FLOOD");
INSERT INTO O_ROLLCALL VALUES(5,"JACK","MOUNT");

SELECT * FROM O_ROLLCALL;

INSERT INTO N_ROLLCALL VALUES(1,"SUNNY","WABLETOWN"); 
INSERT INTO N_ROLLCALL VALUES(2,"HARSHIT","FOREST"); 
INSERT INTO N_ROLLCALL VALUES(3,"VIVEK","POND"); 

SELECT * FROM N_ROLLCALL;

delimiter //
CREATE PROCEDURE N1(IN RNO1 INT)
begin
declare RNO2 INT;
declare exit_cond boolean;
declare c1 cursor for select RNO from O_ROLLCALL WHERE RNO>RNO1;
declare continue handler for not found set exit_cond=TRUE;
open c1;
l1: loop
fetch c1 into RNO2;
if not exists(select * from N_ROLLCALL WHERE RNO>RNO2) then
insert into N_ROLLCALL SELECT * FROM O_ROLLCALL WHERE RNO=RNO2;
end if;
if exit_cond then
close c1;
leave l1;
end if;
end loop l1;
end;
// 
delimiter ;
call n1(4);

select * from N_ROLLCALL;
 