Zomato is planning to offer a premium membership to customers who have placed multiple orders in a single day.

Your task is to write a SQL to find those customers who have placed multiple orders in a single day at least once , total order value generate by those customers and order value generated only by those orders, display the results in ascending order of total order value.

 

Table: orders (primary key : order_id)
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| customer_name | varchar(20) |
| order_date    | datetime    |
| order_id      | int         |
| order_value   | int         |
+---------------+-------------+
Hints
Expected Output
+---------------+-------------------+-------------+
| customer_name | total_order_value | order_value |
+---------------+-------------------+-------------+
| Mudit         |               780 |         550 |
| Rahul         |              1300 |        1150 |
+---------------+-------------------+-------------+

Solutions:

WITH CTE AS (
SELECT customer_name,SUM(order_value) AS order_value
FROM
(SELECT customer_name,CAST(order_date AS date) AS order_day,
COUNT(*) AS order_count,SUM(order_value) AS order_value
FROM orders
GROUP BY customer_name,CAST(order_date AS date)
HAVING order_count > 1) A
GROUP BY customer_name)
, CTE1 AS (
SELECT customer_name, SUM(order_value) AS total_order_value
FROM orders
GROUP BY customer_name)

SELECT CTE1.customer_name,CTE1.total_order_value, 
CTE.order_value
FROM CTE1
INNER JOIN CTE
ON CTE1.customer_name = CTE.customer_name
ORDER BY customer_name;