There are multiple antivirus software which are running on the system and you have the data of how many malware they have detected in each run.  

 

You need to find out how many malwares each software has detected in their latest run and what is the difference between the number of malwares detected in latest run and the second last run for each software. 

 

Please note that list only the software which have run for at least 2 times and have detected at least 10 malware in the latest run.

 

Table: malware
+------------------+-----------+
| COLUMN_NAME      | DATA_TYPE |
+------------------+-----------+
| software_id      | int       |
| run_date         | datetime  |
| malware_detected | int       |
+------------------+-----------+
Hints
Expected Output
+-------------+------------------+------------------------+
| software_id | latest_run_count | difference_to_previous |
+-------------+------------------+------------------------+
|         101 |               12 |                      2 |
|         102 |               13 |                     -1 |
|         103 |               16 |                      5 |
+-------------+------------------+------------------------+

solution:

WITH cte1 AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY software_id ORDER BY run_date DESC) AS rn
FROM malware)
, cte2 AS (
SELECT software_id,
SUM(CASE WHEN rn = 1 THEN malware_detected END) AS latest_run,
SUM(CASE WHEN rn = 2 THEN malware_detected END) AS second_last_run
FROM cte1
WHERE rn IN (1,2)
GROUP BY software_id
HAVING COUNT(*) = 2)

SELECT software_id,latest_run,
latest_run - second_last_run AS difference
FROM cte2 WHERE latest_run >= 10;