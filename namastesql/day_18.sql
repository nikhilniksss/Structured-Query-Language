------ Procedure and functions -------
--------------------------------------

-- create procedure

CREATE PROCEDURE spemp()
BEGIN
SELECT * FROM employee;
END

CALL spemp();

-- modify procedure needs to drop first in mysql

DROP PROCEDURE IF EXISTS spemp;

CREATE PROCEDURE spemp(IN sp_salary INT)
BEGIN
SELECT * FROM employee WHERE salary >= sp_salary;
END

CALL spemp(7000);

-- with 2 parameters

DROP PROCEDURE IF EXISTS spemp;

CREATE PROCEDURE spemp(IN sp_salary INT, dept INT)
BEGIN
SELECT * FROM employee WHERE salary >= sp_salary AND dept_id = dept;
END

CALL spemp(7000,100);

-- procedure with insert statement

DROP PROCEDURE IF EXISTS spemp;

CREATE PROCEDURE spemp(IN sp_salary INT, dept INT)
BEGIN
INSERT INTO dept VALUES (800,'Data Scientist');
SELECT * FROM employee WHERE salary >= sp_salary AND dept_id = dept;
SELECT * FROM dept;
END

-- If in procedure with default message


DROP PROCEDURE IF EXISTS spemp;

CREATE PROCEDURE spemp(IN deptid INT)
BEGIN
    DECLARE cnt INT;
    SELECT COUNT(*) INTO cnt FROM employee WHERE dept_id = deptid;
    IF cnt = 0 THEN
        SELECT "There is no employee in the table" AS message;
    ELSE
        SELECT CONCAT('Total Employees are:',cnt) AS message;
    END IF;    
END

CALL spemp(1000);
CALL spemp(100);

--- stored procedure with output variable

DROP PROCEDURE IF EXISTS spemp;

CREATE PROCEDURE spemp(IN deptid INT, OUT cnt INT)
BEGIN
    SELECT COUNT(*) INTO cnt FROM employee WHERE dept_id = deptid;
    IF cnt = 0 THEN
        SELECT "There is no employee in the table" AS message;
    ELSE
        SELECT CONCAT('Total Employees are:',cnt) AS message;
    END IF;    
END


CALL spemp(1000,@cnt);
CALL spemp(100,@cnt);
SELECT @cnt;
