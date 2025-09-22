Find users who have made exactly three purchases, such that:


1. Their second purchase occurred within 7 days of the first, 
2. Their third purchase occurred at least 30 days after the second, and
3. There is no more purchase after that

 

Return all user_ids that match the above pattern along with their first_order_date, second_order_date, and third_order_date.

 

Table: orders
+-------------+----------+
| COLUMN_NAME | DATA_TYPE|
+-------------+----------+
| order_id    | INT      |
| user_id     | INT      | 
| order_date  | DATE     |
+-------------+----------+
Hints
Expected Output
+---------+------------------+-------------------+------------------+
| user_id | first_order_date | second_order_date | third_order_date |
+---------+------------------+-------------------+------------------+
|       1 | 2024-01-01       | 2024-01-05        | 2024-02-10       |
|       5 | 2024-02-01       | 2024-02-07        | 2024-03-15       |
|       8 | 2024-08-11       | 2024-08-11        | 2024-12-01       |
+---------+------------------+-------------------+------------------+

Solution:

WITH table1 AS (
SELECT user_id,order_date,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date) AS rn,
COUNT(*) OVER (PARTITION BY user_id) AS total_orders
FROM orders)

,pivoted AS (
SELECT user_id,
  MAX(CASE WHEN rn = 1 THEN order_date END) AS first_order_date,
  MAX(CASE WHEN rn = 2 THEN order_date END) AS second_order_date,
  MAX(CASE WHEN rn = 3 THEN order_date END) AS third_order_date
  FROM table1
  WHERE total_orders = 3
  GROUP BY user_id)

SELECT * FROM pivoted
WHERE DATEDIFF(second_order_date,first_order_date) <= 7
AND DATEDIFF(third_order_date,second_order_date) >= 30;

