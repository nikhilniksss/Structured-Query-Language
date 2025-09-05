Write a query to find workaholics employees.  Workaholics employees are those who satisfy at least one of the given criterions:

 

1- Worked for more than 8 hours a day for at least 3 days in a week. 
2- worked for more than 10 hours a day for at least 2 days in a week. 
You are given the login and logout timings of all the employees for a given week. Write a SQL to find all the workaholic employees along with the criterion that they are satisfying (1,2 or both), display it in the order of increasing employee id

 

Table: employees
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| emp_id      | int       |
| login       | datetime  |
| logout      | datetime  |
+-------------+-----------+
Hints
Expected Output
+--------+-----------+
| emp_id | criterian |
+--------+-----------+
|    100 | 1         |
|    200 | 2         |
|    300 | both      |
+--------+-----------+

solution:

WITH cte AS (
SELECT emp_id,COUNT(*) AS days_8,
COUNT(CASE WHEN TIMESTAMPDIFF(minute,login,logout)/60.0 > 10 THEN 1 END) AS days_10
FROM employees
WHERE TIMESTAMPDIFF(minute,login,logout)/60.0 > 8
GROUP BY emp_id)

SELECT emp_id,
CASE WHEN days_8 >= 3 AND days_10 >= 2 THEN 'both'
WHEN days_10 >=2 THEN '2'
ELSE '1' END 