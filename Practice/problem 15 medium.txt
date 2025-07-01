Flipkart an ecommerce company wants to find out its top most selling product by quantity in each category. In case of a tie when quantities sold are same for more than 1 product, then we need to give preference to the product with higher sales value.

Display category and product in output with category in ascending order.

 

Table: orders

+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| category    | varchar(10) |
| order_id    | int         |
| product_id  | varchar(20) |
| quantity    | int         |
| unit_price  | int         |
+-------------+-------------+

Expected Output:

+-----------+---------------+
| category  | product_id    |
+-----------+---------------+
| Footwear  | floaters-3421 |
| Furniture | Table-3421    |
+-----------+---------------+

Solution:

WITH CTE AS (
SELECT category,product_id,SUM(quantity) as total_qty,
SUM(quantity * unit_price) AS total_sales
FROM orders
GROUP BY category,product_id)

SELECT category,product_id FROM( 
SELECT *,
ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_qty DESC,total_sales DESC) AS rn
FROM CTE ) A
WHERE rn = 1
ORDER BY category;