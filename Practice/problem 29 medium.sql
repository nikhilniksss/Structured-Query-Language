"A company record its employee's movement In and Out of office in a table. Please note below points about the data:

 

1- First entry for each employee is “in”
2- Every “in” is succeeded by an “out”
3- Employee can work across days
Write a SQL to find the number of employees inside the Office at “2019-04-01 19:05:00".

 

Table: employee_record
+-------------+------------+
| COLUMN_NAME | DATA_TYPE  |
+-------------+------------+
| emp_id      | int        |
| action      | varchar(3) |
| created_at  | datetime   |
+-------------+------------+
Hints
Expected Output
+------------------+
| no_of_emp_inside |
+------------------+
|                3 |
+------------------+

Solution :

WITH CTE AS (
SELECT *,
LEAD(created_at,1) OVER(PARTITION BY emp_id ORDER BY created_at) AS next_created_at
FROM employee_record)

SELECT COUNT(*) AS number_of_employee FROM CTE
WHERE action = "in"
AND "2019-04-01 19:05:00" BETWEEN created_at AND next_created_at;