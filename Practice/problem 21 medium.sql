"You are given the data of employees along with their salary and department. Write an SQL to find list of employees who have salary greater than average employee salary of the company.  However, while calculating the company average salary to compare with an employee salary do not consider salaries of that employee's 
department, display the output in ascending order of employee ids."

 

Table: employee

+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| emp_id      | int         |
| salary      | int         |
| department  | varchar(15) |
+-------------+-------------+

Expected Output

+--------+--------+-------------+
| emp_id | salary | department  |
+--------+--------+-------------+
|    102 |  50000 | Analytics   |
|    103 |  45000 | Engineering |
|    104 |  48000 | Engineering |
|    105 |  51000 | Engineering |
|    106 |  46000 | Science     |
|    110 |  55000 | Engineering |
|    112 |  47000 | Analytics   |
|    113 |  43000 | Engineering |
+--------+--------+-------------+

solution:

SELECT * FROM employee e1
WHERE salary > (SELECT AVG(salary) FROM employee e2
WHERE e1.department != e2.department);