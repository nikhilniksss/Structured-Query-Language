---- Aggregation using windows function -----
---------------------------------------------

SELECT * FROM employee;


-- Average
SELECT *, AVG(salary) OVER(PARTITION BY dept_id) AS average_salary
FROM employee;


-- minimum
SELECT *, MIN(salary) OVER(PARTITION BY dept_id) AS min_salary
FROM employee;


-- maximum
SELECT *, MAX(salary) OVER(PARTITION BY dept_id) AS max_salary
FROM employee;


--count
SELECT *, COUNT(salary) OVER(PARTITION BY dept_id) AS count_salary
FROM employee;


--sum with order by 

SELECT *, SUM(salary) OVER(PARTITION BY dept_id) AS sum_salary,
SUM(salary) OVER(PARTITION BY dept_id ORDER BY emp_id) AS running_sum_window,
SUM(salary) OVER(ORDER BY emp_id) AS running_sum
FROM employee;


SELECT *, MAX(salary) OVER(PARTITION BY dept_id) AS max_salary,
MAX(salary) OVER(PARTITION BY dept_id ORDER BY emp_id) AS running_max_window,
MAX(salary) OVER(ORDER BY emp_id) AS running_max
FROM employee;


SELECT *,SUM(salary) OVER(ORDER BY salary) AS running_sum
FROM employee;


SELECT *,SUM(salary) OVER(ORDER BY salary, emp_id DESC) AS running_sum
FROM employee;


-- rolling sum


SELECT *,
SUM(salary) OVER (ORDER BY emp_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_sum
FROM employee;


SELECT *,
SUM(salary) OVER (ORDER BY emp_id ROWS BETWEEN  6 FOLLOWING AND 10 FOLLOWING) AS rolling_sum
FROM employee;


SELECT *,
SUM(salary) OVER (PARTITION BY dept_id ORDER BY emp_id ROWS BETWEEN  2 FOLLOWING AND 4 FOLLOWING) AS rolling_sum
FROM employee;


-- Unbounded

SELECT *,
SUM(salary) OVER (ORDER BY emp_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS rolling_sum
FROM employee;


SELECT *,
SUM(salary) OVER (ORDER BY emp_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS rolling_sum
FROM employee;

-- First value and Last value function

SELECT *,
FIRST_VALUE(salary) OVER(ORDER BY salary) AS first_salary,
LAST_VALUE(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_salary
FROM employee;

SELECT *,
FIRST_VALUE(salary) OVER(ORDER BY salary) AS first_salary,
FIRST_VALUE(salary) OVER(ORDER BY salary DESC) AS last_salary
FROM employee;





