Suppose you are a manager of a data analytics company. You are tasked to build a new team consists of senior and junior data analysts. The total budget for the salaries is 70000.  You need to use the below criterion for hiring:

 

1- Keep hiring the seniors with the smallest salaries until you cannot hire anymore seniors.
2- Use the remaining budget to hire the juniors with the smallest salaries until you cannot hire anymore juniors.
Display employee id, experience and salary. Sort in decreasing order of salary.

 

Table: candidates
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| emp_id      | int         |
| experience  | varchar(6) |
| salary      | int         |
+-------------+-------------+
Hints
Expected Output
+--------+------------+--------+
| emp_id | experience | salary |
+--------+------------+--------+
|      5 | Senior     |  20000 |
|      4 | Senior     |  16000 |
|      2 | Junior     |  15000 |
|      1 | Junior     |  10000 |
+--------+------------+--------+

Solutions:

WITH cte AS

(SELECT *,
SUM(salary) OVER (PARTITION BY experience ORDER BY salary) AS running_sal
FROM candidates)
, cte_senior AS

(SELECT * FROM cte
WHERE experience = 'Senior' AND running_sal <= 70000)

SELECT emp_id,experience,salary FROM cte
WHERE experience = 'Junior' 
AND running_sal <= 70000 - (SELECT SUM(salary) FROM cte_senior)

UNION ALL

SELECT emp_id,experience,salary FROM cte_senior ORDER BY salary DESC;