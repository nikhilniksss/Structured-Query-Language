You are working as a data analyst for a large company that tracks employee salaries across multiple departments. The leadership team wants to understand how much each department contributes to the company’s total payroll.


Write a SQL query to calculate the percentage of total salary contributed by each department. Round the result to 2 decimal places.

 

Table: employees
+-------------+----------+
| COLUMN_NAME | DATA_TYPE|
+-------------+----------+
| emp_id      | INT      |
| dept_id     | INT      | 
| salary      | INT      |
+-------------+----------+
Hints
Expected Output
+---------+-------------------------+
| dept_id | salary_contribution_pct |
+---------+-------------------------+
|      10 |                   14.44 |
|      20 |                   24.85 |
|      30 |                   13.49 |
|      40 |                   30.89 |
|      50 |                   16.33 |
+---------+-------------------------+

solution:

SELECT dept_id,
ROUND(SUM(salary)*100/(SELECT SUM(salary) FROM employees),2) AS contribution
FROM employees
GROUP BY dept_id;
