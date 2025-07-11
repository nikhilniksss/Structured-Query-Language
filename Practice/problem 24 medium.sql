"You are given the table of employee details. Write an SQL to find details of employee with salary more than their manager salary but they joined
the company after the manager joined.
Display employee name, salary and joining date along with their manager's salary and joining date, sort the output in ascending order of employee name.
Please note that manager id in the employee table referring to emp id of the same table."

Table: employee
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| emp_id       | int         |
| emp_name     | varchar(10) |
| joining_date | date        |
| salary       | int         |
| manager_id   | int         |
+--------------+-------------+


Expected Output

+----------+--------+--------------+----------------+----------------------+
| emp_name | salary | joining_date | manager_salary | manager_joining_date |
+----------+--------+--------------+----------------+----------------------+
| Mohit    |  15000 | 2022-05-01   |          12000 | 2021-03-01           |
| Vikas    |  10000 | 2023-06-01   |           5000 | 2022-02-01           |
+----------+--------+--------------+----------------+----------------------+

Solution:

SELECT emp.emp_name,emp.salary,emp.joining_date,
mgr.salary AS manager_salary,mgr.joining_date AS manager_joining_date
FROM employee emp
INNER JOIN employee mgr
ON emp.manager_id = mgr.emp_id
WHERE emp.salary > mgr.salary 
AND emp.joining_date > mgr.joining_date
ORDER BY emp.emp_id;