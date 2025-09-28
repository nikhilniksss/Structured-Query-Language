An IT company pays its employees on hourly basis. You are given the database of employees along with their department id.

 

Table: employees
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| emp_id      | int         |
| emp_name    | varchar(20) |
| dept_id     | int         |
+-------------+-------------+
Department table which consist of hourly rate for each department.

 

Table: dept
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| dept_id     | int       |
| hourly_rate | int       |
+-------------+-----------+

Given the daily entry_time and exit_time of each employee, calculate the total amount payable to each employee.

 

Table: daily_time
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| emp_id      | int       |
| entry_time  | datetime  |
| exit_time   | datetime  |
+-------------+-----------+
Please note that company also pays overtime to employees who work for more than 8 hours a day which is 1.5 times of hourly rate. So for example if hourly rate is 10 and a employee works for 9 hours then total payable will be 10*8+15*1 = 95 for that day. In this example 95 is total payout and 15 is overtime payout.  Round the result to 2 decimal places and sort the output by decreasing order of total payout.
 

Hints
Expected Output
+----------+--------------+-----------------+
| emp_name | total_payout | overtime_payout |
+----------+--------------+-----------------+
| Jane     |       234.00 |           54.00 |
| Alice    |       212.50 |           52.50 |
| Bob      |       210.00 |            0.00 |
| Emily    |       204.00 |           36.00 |
| John     |       160.00 |            0.00 |
+----------+--------------+-----------------+

Solution:

WITH cte AS (
SELECT e.emp_name,d.hourly_rate,
TIMESTAMPDIFF(MINUTE,entry_time,exit_time)/60 AS time_spent
FROM daily_time dt
INNER JOIN employees e ON dt.emp_id = e.emp_id
INNER JOIN dept d ON e.dept_id = d.dept_id)
, cte2 AS (
SELECT *,
CASE WHEN time_spent <= 8 THEN time_spent * hourly_rate
ELSE 8 * hourly_rate + (time_spent - 8) * 1.5 * hourly_rate
END AS total_pay,
CASE WHEN time_spent <= 8 THEN 0
ELSE (time_spent - 8) * 1.5 * hourly_rate
END AS overtime_pay
FROM cte)

SELECT emp_name,ROUND(SUM(total_pay),2) AS total_pay,
ROUND(SUM(overtime_pay),2) AS overtime_pay
FROM cte2
GROUP BY emp_name
ORDER BY total_pay DESC;