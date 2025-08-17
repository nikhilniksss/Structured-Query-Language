You are given an employees table containing information about employees salaries across different departments. Your task is to calculate the difference between the highest and second-highest salaries for each department.


Conditions:
If a department has only one employee, return NULL for that department.
If all employees in a department have the same salary, return NULL for that department.


The final output should include Department Name and Salary Difference. Order by Department Name.


Table: employees
+-------------+----------+
| COLUMN_NAME | DATA_TYPE|
+-------------+----------+
| id          | int      |
| name        | VARCHAR  | 
| department  | VARCHAR  | 
| salary      | int      | 
+-------------+----------+
Hints
Expected Output
+-------------+------------------+
| Department  | SalaryDifference |
+-------------+------------------+
| Analytics   |             5000 |
| Engineering |             5000 |
| Finance     |             NULL |
| HR          |             NULL |
| Marketing   |            20000 |
| Sales       |             1000 |
+-------------+------------------+

solutions:

WITH rankedSalaries AS (
SELECT department,Salary,
DENSE_RANK() OVER(PARTITION BY department ORDER BY Salary Desc) AS rn
FROM employees)

SELECT department,
MAX(CASE WHEN rn = 1 THEN Salary END) -
MAX(CASE WHEN rn = 2 THEN Salary END) AS salary_difference
FROM rankedSalaries
GROUP BY department
ORDER BY department;