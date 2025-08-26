You are working with an employee database where each employee has a department id and a salary. Your task is to find the third highest salary in each department. If there is no third highest salary in a department, then the query should return salary as null for that department. Sort the output by department id.


Assume that none of the employees have same salary in a particular department.

 

Table: employees 
+---------------+----------+
| COLUMN_NAME   | DATA_TYPE|
+---------------+----------+
| employee_id   | int      |
| department_id | int      |
| salary        | int      |
+---------------+----------+
Hints
Expected Output
+---------------+----------------------+
| department_id | third_highest_salary |
+---------------+----------------------+
|             1 |                 3000 |
|             2 |                 NULL |
|             3 |                 3500 |
|             4 |                 NULL |
|             5 |                 4200 |
+---------------+----------------------+

solution:

WITH CTE AS (
SELECT department_id,
        salary,
		RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rn
FROM employees
)

SELECT e.department_id,c.salary AS third_highest
FROM (SELECT DISTINCT department_id FROM employees) e
LEFT JOIN CTE c
ON e.department_id = c.department_id