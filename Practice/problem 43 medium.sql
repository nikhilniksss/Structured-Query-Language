In the Netflix viewing history dataset, you are tasked with identifying viewers who have a consistent viewing pattern across multiple devices. Specifically, viewers who have watched the same title on more than 1 device type. 
Write an SQL query to find users who have watched more number of titles on multiple devices than the number of titles they watched on single device. Output the user id , no of titles watched on multiple devices and no of titles watched on single device, display the output in ascending order of user_id.

Table:viewing_history
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| user_id     | int         |
| title       | varchar(20) |
| device_type | varchar(10) |
+-------------+-------------+
 

Hints
Expected Output
+---------+---------------------+-------------------+
| user_id | multiple_device_cnt | single_device_cnt |
+---------+---------------------+-------------------+
|       1 |                   2 |                 1 |
|       3 |                   1 |                 0 |
+---------+---------------------+-------------------+

solution:

WITH CTE AS (
SELECT user_id,title,COUNT(DISTINCT device_type) AS no_of_devices
FROM viewing_history
GROUP BY user_id,title)
, CTE2 AS (
SELECT user_id,
SUM(CASE WHEN no_of_devices = 1 THEN 1 ELSE 0 END) AS one_device,
SUM(CASE WHEN no_of_devices > 1 THEN 1 ELSE 0 END) AS many_device
FROM CTE
GROUP BY user_id)

SELECT user_id,many_device,one_device
FROM CTE2
WHERE many_device > one_device;