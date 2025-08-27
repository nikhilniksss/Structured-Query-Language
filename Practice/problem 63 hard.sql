Sachin Tendulkar - Also known as little master. You are given runs scored by Sachin in his first 10 matches. You need to write an SQL to get match number when he completed 500 runs and his batting average at the end of 10 matches.

Batting Average = (Total runs scored) / (no of times batsman got out)

Round the result to 2 decimal places.

 

Table: sachin
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| match_no    | int         |
| runs_scored | int         |
| status      | varchar(10) |
+-------------+-------------+
Hints
Expected Output
+----------+-----------------+
| match_no | batting_average |
+----------+-----------------+
|        8 |           70.33 |
+----------+-----------------+

solution:

WITH cte AS (
SELECT *,
SUM(runs_scored) OVER()/SUM(CASE WHEN status = "out" THEN 1 END) OVER()AS batting_avg,
SUM(runs_scored) OVER(ORDER BY match_no) as cumsum
FROM sachin)

SELECT match_no,ROUND(batting_avg,2) AS batting_avg  FROM cte
WHERE cumsum >= 515
ORDER BY match_no
LIMIT 1;