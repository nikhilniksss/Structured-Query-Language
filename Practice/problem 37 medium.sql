You are a data analyst working for an e-commerce company, responsible for analysing customer orders to gain insights into their purchasing behaviour. Your task is to write a SQL query to retrieve the details of the penultimate order for each customer. However, if a customer has placed only one order, you need to retrieve the details of that order instead, display the output in ascending order of customer name.

 

Table: orders
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| order_id      | int         |
| order_date    | date        |
| customer_name | varchar(10) |
| product_name  | varchar(10) |
| sales         | int         |
+---------------+-------------+
Hints
Expected Output
+----------+------------+---------------+--------------+-------+
| order_id | order_date | customer_name | product_name | sales |
+----------+------------+---------------+--------------+-------+
|        2 | 2023-01-02 | Alexa         | boAt         |   300 |
|        6 | 2023-01-03 | Neha          | Dress        |   100 |
|        4 | 2023-01-01 | Ramesh        | Titan        |   200 |
+----------+------------+---------------+--------------+-------+

solution:

WITH CTE AS (
SELECT *,
row_number() OVER (PARTITION BY customer_name ORDER BY order_date DESC) as rn,
COUNT(*) OVER (PARTITION BY customer_name) as cnt
FROM orders)

SELECT order_id,order_date,customer_name,product_name,sales
FROM CTE
WHERE rn = 2 or cnt = 1;