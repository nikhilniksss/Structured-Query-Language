A profit ride for a Uber driver is considered when the start location and start time of a ride exactly match with the previous ride is end location and end time. 

Write an SQL to calculate total number of rides and total profit rides by each driver, display the output in ascending order of id.

 

Table: drivers
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| id          | varchar(10) |
| start_loc   | varchar(1)  |
| start_time  | time        |
| end_loc     | varchar(1)  |
| end_time    | time        |
+-------------+-------------+
Hints
Expected Output
+-------+-------------+--------------+
| id    | total_rides | profit_rides |
+-------+-------------+--------------+
| dri_1 |           5 |            1 |
| dri_2 |           2 |            0 |
+-------+-------------+--------------+

Solution:

WITH cte AS (
SELECT *,
LAG(end_loc,1) OVER(PARTITION BY id ORDER BY start_time) AS prev_end_loc,
LAG(end_time,1) OVER(PARTITION BY id ORDER BY start_time) AS prev_end_time
FROM drivers)

SELECT id,COUNT(*) AS total_ride,
SUM(CASE WHEN start_loc = prev_end_loc AND start_time = prev_end_time THEN 1 ELSE 0 END) AS profit_rides
FROM cte
GROUP BY id;


