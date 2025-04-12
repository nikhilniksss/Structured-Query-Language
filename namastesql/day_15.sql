SELECT * FROM Orders;

----- Sub query ----

SELECT * FROM Orders;

SELECT AVG(Sales) FROM Orders;

SELECT AVG(order_sales) FROM 
(SELECT order_id,SUM(Sales) AS order_sales
FROM Orders
GROUP BY order_id) AS aggregated_sales


-- sales greater than average value

SELECT order_id
FROM Orders
GROUP BY order_id
HAVING SUM(sales) > (SELECT AVG(order_sales) FROM 
(SELECT order_id,SUM(Sales) AS order_sales
FROM Orders
GROUP BY order_id) AS aggregated_sales)

SELECT * FROM Orders WHERE order_id = 'CA-2019-111164'

------------------------------------------------------

SELECT * FROM employee;
SELECt * FROM dept;

-- get employees who's dep_id is not present in department table 

SELECT * FROM employee
WHERE dept_id NOT IN (SELECT dep_id FROM dept);

-- sub query in select

SELECT AVG(salary) FROM employee;

SELECT *,(SELECT AVG(salary) FROM employee) AS avg_salary 
FROM employee WHERE dept_id NOT IN (SELECT dep_id FROM dept);


-- department wise average salary

SELECT e.*,d.average_salary FROM employee e
INNER JOIN
(SELECT dept_id, AVG(salary) AS average_salary
FROM employee
GROUP BY dept_id) d
on e.dept_id = d.dept_id

----------------------------------------------------------------

CREATE TABLE icc_world_cup(
    team_1 VARCHAR(20),
    team_2 VARCHAR(20),
    winner VARCHAR(20)
);

INSERT INTO icc_world_cup VALUE('India','SL','India');
INSERT INTO icc_world_cup VALUE('SL','Australia','Australia');
INSERT INTO icc_world_cup VALUE('South Africa','England','England');
INSERT INTO icc_world_cup VALUE('England','New Zealand','New Zealand');
INSERT INTO icc_world_cup VALUE('Australia','India','India');

SELECT * FROM icc_world_cup;

-- get all the teams first


SELECT team_name,COUNT(*) AS matches_played,SUM(win_flag) AS matches_won,COUNT(1) - SUM(win_flag) AS matched_lost
FROM
(SELECT team_1 AS team_name,CASE WHEN team_1 = winner THEN 1 ELSE 0 END AS win_flag FROM icc_world_cup
UNION ALL
SELECT team_2 AS team_name,CASE WHEN team_2 = winner THEN 1 ELSE 0 END AS win_flag FROM icc_world_cup) A
GROUP BY team_name;


------ same problem with CTE ------

WITH A AS 
(SELECT team_1 AS team_name,CASE WHEN team_1 = winner THEN 1 ELSE 0 END AS win_flag FROM icc_world_cup
UNION ALL
SELECT team_2 AS team_name,CASE WHEN team_2 = winner THEN 1 ELSE 0 END AS win_flag FROM icc_world_cup)

SELECT team_name,COUNT(*) AS matches_played,SUM(win_flag) AS matches_won,COUNT(1) - SUM(win_flag) AS matched_lost
FROM A
GROUP BY team_name;


WITH dep AS
(SELECT dept_id, AVG(salary) AS average_salary
FROM employee
GROUP BY dept_id)

SELECT e.*,d.* FROM employee e 
INNER JOIN dep d 
ON e.dept_id = d.dept_id;




