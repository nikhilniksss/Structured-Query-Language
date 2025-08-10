You are given a table named employees with the following structure:

 

Table: employees
+--------------+----------+
| COLUMN_NAME  | DATA_TYPE|
+--------------+----------+
| employee_id  | INT      |
| name         | VARCHAR  |  
| manager_id   | INT      |
+--------------+----------+
Each row represents an employee. The manager_id column references the employee_id of their manager. The top-level manager(s) (e.g., CEO) will have NULL as their manager_id.

Write a SQL query to find employees who do not manage any other employees, ordered in ascending order of employee id.

Hints
Expected Output
+-------------+--------+------------+
| employee_id | name   | manager_id |
+-------------+--------+------------+
|           9 | Ivy    |          1 |
|          11 | Lily   |          4 |
|          13 | Nina   |          5 |
|          14 | Oscar  |          6 |
|          16 | Quincy |          7 |
|          17 | Rachel |          7 |
|          18 | Steve  |         20 |
+-------------+--------+------------+

Solution:

SELECT * FROM employees
WHERE employee_id NOT IN
(SELECT DISTINCT manager_id
FROM employees
WHERE manager_id IS NOT NULL)
ORDER BY employee_id;