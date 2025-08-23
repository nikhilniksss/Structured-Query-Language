In the Netflix dataset containing information about viewers and their viewing history, devise a query to identify viewers who primarily use mobile devices for viewing, but occasionally switch to other devices. Specifically, find viewers who have watched at least 75% of their total viewing time on mobile devices but have also used at least one other devices such as tablets or smart TVs for viewing. Provide the user ID and the percentage of viewing time spent on mobile devices. Round the result to nearest integer.

 

Table: viewing_history
+-------------+--------------+
| COLUMN_NAME | DATA_TYPE    |
+-------------+--------------+
| user_id     | int          |
| title       | varchar(20)  |
| device_type | varchar(10)  |
| watch_mins  | int          |
+-------------+--------------+
Hints
Expected Output
+---------+------------------------+
| user_id | mobile_percentage_view |
+---------+------------------------+
|       2 |                     78 |
+---------+------------------------+

solution:
WITH CTE AS (
SELECT user_id,COUNT(DISTINCT CASE WHEN device_type != 'Mobile' THEN device_type END) AS cnt_device_type,
SUM(watch_mins) AS total_watch_min,
SUM(CASE WHEN device_type = 'Mobile' THEN watch_mins END) AS mobile_watch_min
FROM viewing_history
GROUP BY user_id)

SELECT user_id,ROUND(mobile_watch_min*100/total_watch_min,0) AS watch_p
