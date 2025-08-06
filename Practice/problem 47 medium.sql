Meta (formerly Facebook) is analyzing the performance of Instagram Reels across different states in 
the USA. You have access to a table named REEL that tracks the cumulative views of each reel over time. 
Write an SQL to get average daily views for each Instagram Reel in each state. Round the average to 2 
decimal places and sort the result by average is descending order. 

 

Table: reel 
+-----------------+----------+
| COLUMN_NAME     | DATA_TYPE|
+-----------------+----------+
| reel_id         | int      |    
| record_date     | date     |
| state           | varchar  |
| cumulative_views| int      |
+-------------+--------------+
Hints
Expected Output
+---------+------------+-----------------+
| Reel_id | State      | Avg_Daily_Views |
+---------+------------+-----------------+
|       1 | california |          600.00 |
|       2 | florida    |          542.86 |
|       2 | texas      |          500.00 |
|       1 | nevada     |          457.14 |
+---------+------------+-----------------+

solution:

SELECT reel_id,state,
ROUND(MAX(cumulative_views)/COUNT(*),2) AS daily_average
FROM reel
GROUP BY reel_id,state
ORDER BY daily_average DESC;