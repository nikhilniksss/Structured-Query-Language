In some poorly designed UI applications, there is often a lack of data input restrictions. For instance, in a free text field for the country, users might input variations such as 'USA,' 'United States of America,' or 'US.'

Suppose we have survey data from individuals in the USA about their job satisfaction, rated on a scale of 1 to 5. Write a SQL query to count the number of respondents for each rating on the scale. Additionally, include the country name in the format that occurs most frequently in that scale, display the output in ascending order of job satisfaction.

 

Table: survey 
+------------------+-------------+
| COLUMN_NAME      | DATA_TYPE   |
+------------------+-------------+
| country          | varchar(20) |
| job_satisfaction | int         |
| name             | varchar(10) |
+------------------+-------------+
Hints
Expected Output
+------------------+---------------+-----------------------+
| job_satisfaction | country       | number_of_respondents |
+------------------+---------------+-----------------------+
|                3 | USA           |                     3 |
|                4 | USA           |                     6 |
|                5 | United States |                     6 |
+------------------+---------------+-----------------------+

solution:

WITH cte AS (
SELECT job_satisfaction,country,COUNT(*) AS number_of_response
FROM survey
GROUP BY job_satisfaction,country)
, cte2 AS (
SELECT *,
SUM(number_of_response) OVER(PARTITION BY job_satisfaction) AS total_res,
MAX(number_of_response) OVER(PARTITION BY job_satisfaction) AS max_res
FROM cte)

SELECT job_satisfaction,country,total_res
FROM cte2 where max_res =  number_of_response;

