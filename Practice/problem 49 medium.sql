Netflix’s analytics team wants to identify the Top 3 most popular shows based on the viewing patterns of its users. The definition of "popular" is based on two factors:


Unique Watchers: The total number of distinct users who have watched a show.
Total Watch Duration: The cumulative time users have spent watching the show.


In the case of ties in the number of unique watchers, the total watch duration will serve as the tie-breaker.


Write an SQL query to determine the Top 3 shows based on the above criteria. The output should be sorted by show_id and should include: show_id , unique_watchers, total_duration.

 

Table: watch_history 
+---------------+----------+
| COLUMN_NAME   | DATA_TYPE|
+---------------+----------+
| user_id       | int      |
| show_id       | int      |
| watch_date    | int      |
| watch_duration| int      |
+--------------+-----------+
Hints
Expected Output
+---------+-----------------+----------------+
| show_id | unique_watchers | total_duration |
+---------+-----------------+----------------+
|     106 |               3 |            420 |
|     107 |               3 |            420 |
|     108 |               4 |           1150 |
+---------+-----------------+----------------+

solution:

WITH cte1 AS (
SELECT show_id,COUNT(DISTINCT user_id) AS unique_user,
SUM(watch_duration) AS total_duration
FROM watch_history
GROUP BY show_id),
cte2 AS (
SELECT show_id,unique_user,total_duration,
RANK() OVER (ORDER BY unique_user DESC,total_duration DESC) As rn
FROM cte1
)
SELECT show_id,unique_user,total_duration
FROM cte2
WHERE rn <= 3
ORDER BY show_id;