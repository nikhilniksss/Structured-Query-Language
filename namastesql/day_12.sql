------ SELF JOIN ----

SELECT * FROM employee;

SELECT e1.emp_id,e1.emp_name,e2.emp_name AS manager_name FROM employee e1
INNER JOIN employee e2
ON e1.manager_id = e2.emp_id;


SELECT e1.emp_id,e1.emp_name,e2.emp_name AS manager_name FROM employee e1
INNER JOIN employee e2
ON e1.manager_id = e2.emp_id
WHERE e1.salary > e2.salary;

----- String aggregate function ----

-- get list of employees from each department

SELECT dept_id, GROUP_CONCAT(emp_name) AS list_of_employees
FROM employee
GROUP BY dept_id;

-- changing the seperator

SELECT dept_id, GROUP_CONCAT(emp_name SEPARATOR '| ') AS list_of_employees
FROM employee
GROUP BY dept_id;

-- order before the listing

SELECT dept_id, GROUP_CONCAT(emp_name ORDER BY salary DESC SEPARATOR '| ') AS list_of_employees
FROM employee
GROUP BY dept_id;

SELECT * FROM employee;

-- Date functions --

SELECT order_id,order_date FROM Orders;

-- 1. YEAR function 

SELECT order_id,order_date,YEAR(order_date) AS year_of_date 
FROM Orders;

-- let's use with where condition

SELECT order_id,order_date,YEAR(order_date) AS year_of_date 
FROM Orders
WHERE YEAR(order_date) = 2019;

-- 2. MONTH function

SELECT order_id,order_date,MONTH(order_date) AS month_of_date 
FROM Orders;

-- let's use with where condition

SELECT order_id,order_date,MONTH(order_date) AS month_of_date 
FROM Orders
WHERE MONTH(order_date) = 12;

-- 3. WEEK function

SELECT order_id,order_date,WEEK(order_date) AS week_of_date 
FROM Orders;

-- let's use with where condition

SELECT order_id,order_date,WEEK(order_date) AS week_of_date 
FROM Orders
WHERE WEEK(order_date) = 30; -- 30th week of the year

-- 4. DAY of WEEK function

SELECT order_id,order_date,DAYOFWEEK(order_date) AS week_of_date 
FROM Orders;

-- let's use with where condition

SELECT order_id,order_date,DAYOFWEEK(order_date) AS day_of_date 
FROM Orders
WHERE DAYOFWEEK(order_date) = 1; -- 1 is for SUNDAY and like wise


-- using sys date

SELECT order_id,order_date,YEAR(CURRENT_DATE) AS year_of_date 
FROM Orders;


SELECT order_id,order_date,MONTHNAME(order_date) AS year_of_date 
FROM Orders;

-- add something to date

-- add day

SELECT order_id,order_date,DATE_ADD(order_date, INTERVAL 5 DAY) AS order_date_5
FROM Orders;

-- add WEEK

SELECT order_id,order_date,DATE_ADD(order_date, INTERVAL 1 WEEK) AS order_date_5
FROM Orders;

-- add month

SELECT order_id,order_date,DATE_ADD(order_date, INTERVAL 1 MONTH) AS order_date_5
FROM Orders;

-- subtract month

SELECT order_id,order_date,DATE_SUB(order_date, INTERVAL 1 MONTH) AS order_date_5
FROM Orders;


-- date difference

SELECT order_id,order_date,ship_date,DATEDIFF(ship_date,order_date) AS shipping_time
FROM Orders;

-- Time stamp diff

SELECT order_id,order_date,ship_date,TIMESTAMPDIFF(DAY,ship_date,order_date) AS shipping_time
FROM Orders;

SELECT order_id,order_date,ship_date,TIMESTAMPDIFF(MONTH,ship_date,order_date) AS shipping_time
FROM Orders;

SELECT order_id,order_date,ship_date,TIMESTAMPDIFF(DAY,ship_date,order_date) AS shipping_time
FROM Orders;


---- CASE WHEN ----

SELECT order_id,profit,
CASE
WHEN profit < 100 THEN 'Low Profit'
WHEN profit < 500 THEN 'Medium Profit'
WHEN profit < 1000 THEN 'High Profit'
ELSE 'Very High Profit'
END AS 'Profit_Category'
FROM Orders;