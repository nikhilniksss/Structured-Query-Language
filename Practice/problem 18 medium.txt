You are given a products table where a new row is inserted every time the price of a product changes. Additionally, there is a transaction table containing details such as order_date and product_id for each order.
Write an SQL query to calculate the total sales value for each product, considering the cost of the product at the time of the order date, display the output in ascending order of the product_id.

Table: products

+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| product_id  | int       |
| price       | int       |
| price_date  | date      |
+-------------+-----------+
Table: orders 

+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| order_id    | int       |
| order_date  | date      |
| product_id  | int       |
+-------------+-----------+

Expected Output

+------------+-------------+
| product_id | total_sales |
+------------+-------------+
|        100 |         510 |
|        101 |        4700 |
+------------+-------------+

Solution:

WITH CTE AS
(SELECT product_id,price_date AS valid_from,price
,LEAD(price_date,1,'9999-12-31') OVER(PARTITION BY product_id ORDER BY price_date) AS valid_till
FROM products)

SELECT p.product_id,SUM(price) AS total_price
FROM cte p
INNER JOIN orders o
ON p.product_id = o.product_id
AND o.order_date >= p.valid_from AND 
o.order_date < p.valid_till
GROUP BY p.product_id;