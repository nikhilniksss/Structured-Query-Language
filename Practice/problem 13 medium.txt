TCS wants to award employees based on number of projects completed by each individual each month.  Write an SQL to find best employee for each month along with number of projects completed by him/her in that month, display the output in descending order of number of completed projects.

Table: projects
+-------------------------+-------------+
| COLUMN_NAME             | DATA_TYPE   |
+-------------------------+-------------+
| project_id              | int         |
| employee_name           | varchar(10) |
| project_completion_date | date        |
+-------------------------+-------------+
 
Expected Output

+---------------+--------------------------+-----------+
| employee_name | no_of_completed_projects | yearmonth |
+---------------+--------------------------+-----------+
| Shilpa        |                        3 | 202301    |
| Mukesh        |                        2 | 202302    |
| Ankit         |                        1 | 202212    |
+---------------+--------------------------+-----------+

Solution:

WITH CTE AS (
SELECT employee_name,date_format(project_completion_date,"%Y%m") AS yearmonth,
COUNT(*) AS no_of_completed_projects
FROM projects
GROUP BY employee_name,yearmonth)

SELECT employee_name,no_of_completed_projects,yearmonth FROM (
SELECT *,
row_number() OVER (PARTITION BY yearmonth ORDER BY no_of_completed_projects DESC) AS employee_rank
FROM CTE ) A
WHERE employee_rank = 1
ORDER BY no_of_completed_projects DESC;