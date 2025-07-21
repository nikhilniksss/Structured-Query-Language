You are given orders data of an online ecommerce company. Dataset contains order_id , order_date and ship_date. Your task is to find lead time in days between order date and ship date using below rules:
 
1- Exclude holidays. List of holidays present in holiday table. 
2- If the order date is on weekends, then consider it as order placed on immediate next Monday 
and if the ship date is on weekends, then consider it as immediate previous Friday to do calculations.
For example, if order date is March 14th 2024 and ship date is March 20th 2024. Consider March 18th is a holiday then lead time will be (20-14) -1 holiday = 5 days.

Table: orders
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| order_date  | date      |
| order_id    | int       |
| ship_date   | date      |
+-------------+-----------+
Table: holidays
+--------------+-----------+
| COLUMN_NAME  | DATA_TYPE |
+--------------+-----------+
| holiday_date | date      |
| holiday_id   | int       |
+--------------+-----------+
Hints
Expected Output
+----------+-----------+
| order_id | lead_time |
+----------+-----------+
|        1 |         5 |
|        2 |         4 |
|        3 |         7 |
|        4 |         2 |
|        5 |         4 |
|        6 |        12 |
+----------+-----------+

Solution:

WITH CTE AS (
SELECT *,
CASE WHEN WEEKDAY(order_date) = 5 THEN DATE_ADD(order_date,INTERVAL 2 DAY)
WHEN WEEKDAY(order_date) = 6 THEN DATE_ADD(order_date,INTERVAL 1 DAY)
ELSE order_date END AS order_date_new,
CASE WHEN WEEKDAY(ship_date) = 5 THEN DATE_ADD(ship_date,INTERVAL -1 DAY)
WHEN WEEKDAY(ship_date) = 6 THEN DATE_ADD(ship_date,INTERVAL -2 DAY)
ELSE ship_date END AS ship_date_new
FROM orders)

, CTE2 AS (
SELECT order_id,order_date_new,ship_date_new,
ship_date_new - order_date_new AS lead_days
FROM CTE)

SELECT order_id,lead_days - COUNT(holiday_date) AS final_lead_days
FROM CTE2 c
LEFT JOIN holidays h
ON holiday_date BETWEEN order_date_new AND ship_date_new
GROUP BY order_id,lead_days;