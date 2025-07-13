Suppose you are a data analyst working for ride-sharing platform Uber. Uber is interested in analyzing
the performance of drivers based on their ratings and wants to categorize them into different performance
tiers. 

Write an SQL query to categorize drivers equally into three performance tiers (Top, Middle, and Bottom) 
based on their average ratings. Drivers with the highest average ratings should be placed in the top 
tier, drivers with ratings below the top tier but above the bottom tier should be placed in the middle
tier, and drivers with the lowest average ratings should be placed in the bottom tier. Sort the output
in decreasing order of average rating.

 

Table : driver_ratings
+-------------+--------------+
| COLUMN_NAME | DATA_TYPE    |
+-------------+--------------+
| driver_id   | int          |
| avg_rating  | decimal(3,2) |
+-------------+--------------+
Hints
Expected Output
+-----------+------------+------------------+
| driver_id | avg_rating | performance_tier |
+-----------+------------+------------------+
|         7 |       4.90 | Top              |
|         1 |       4.80 | Top              |
|         5 |       4.70 | Top              |
|        12 |       4.60 | Top              |
|         2 |       4.50 | Middle           |
|         9 |       4.40 | Middle           |
|         4 |       4.20 | Middle           |
|        11 |       4.10 | Middle           |
|         3 |       3.90 | Bottom           |
|         8 |       3.80 | Bottom           |
|         6 |       3.60 | Bottom           |
|        10 |       3.50 | Bottom           |
+-----------+------------+------------------+

Solution:

WITH CTE AS (
SELECT *,
NTILE(3) OVER( ORDER BY avg_rating DESC) AS category
FROM driver_ratings)

SELECT driver_id,avg_rating,
CASE 
WHEN category = 1 THEN 'Top'
WHEN category = 2 THEN 'Middle'
ELSE 'Bottom'
END AS performance_tier
FROM CTE;