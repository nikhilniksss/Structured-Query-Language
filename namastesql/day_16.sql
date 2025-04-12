----------------------- WINDOWS functions ------------------------
------------------------------------------------------------------

SELECT * FROM employee;

SELECT dept_id,MAX(salary) FROM employee
GROUP BY dept_id;

-- row_number, over, partition by functions

WITH rank_table AS (
SELECT *, ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank
FROM employee)

SELECT * FROM rank_table WHERE salary_rank <= 2;

-- rank function

SELECT *,RANK() OVER(ORDER BY salary DESC) AS rank_fun FROM employee;

SELECT *,RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS rank_fun FROM employee;


SELECT *,RANK() OVER(ORDER BY salary DESC) AS rank_fun_1,
RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS rank_fun_2,
ROW_NUMBER() OVER(PARTITION BY dept_id,salary ORDER BY salary DESC) AS rank_fun_3
FROM employee;


-- dense rank --

SELECT *,
RANK() OVER(ORDER BY salary DESC) AS rank_fun,
DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS dense_rank_fun
FROM employee;

-- Top 5 selling product from each category by sales

SELECT * FROM Orders;

WITH sum_sales AS
(SELECT Product_ID,Category,SUM(Sales) As total_sales
FROM Orders
GROUP BY Category,Product_ID),

ranking_table AS
(SELECT *, RANK() OVER(PARTITION BY Category ORDER BY total_sales DESC) AS ranking
FROM sum_sales)

SELECT * FROM ranking_table WHERE ranking <= 5;

-- Lead function --

SELECT *,
LEAD(emp_name,1) OVER (ORDER BY salary DESC) AS lead_fun
FROM employee;

-- if no value then default value

SELECT *,
LEAD(emp_name,1,'unknown') OVER (ORDER BY salary DESC) AS lead_fun
FROM employee;

SELECT *,
LEAD(emp_name,1,emp_name) OVER (ORDER BY salary DESC) AS lead_fun
FROM employee;

-- lead with partition

SELECT *,
LEAD(emp_name,1) OVER (PARTITION BY dept_id ORDER BY salary DESC) AS lead_fun
FROM employee;


-- LAG function

SELECT *,
LAG(emp_name,1) OVER (ORDER BY salary DESC) AS lag_fun
FROM employee;


SELECT *,
LAG(emp_name,1,'unknown') OVER (ORDER BY salary DESC) AS lag_fun
FROM employee;




