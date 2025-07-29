You are tasked with analyzing the sales growth of products over the years 2022, 2023, and 2024. Your goal is to identify months where the sales for a product have consistently increased from 2022 to 2023 and from 2023 to 2024.
Your task is to write an SQL query to generate a report that includes the sales for each product at the month level for the years 2022, 2023, and 2024. However, you should only include product and months combination where the sales have consistently increased from 2022 to 2023 and from 2023 to 2024, display the output in ascending order of product_id.

 

Table: orders
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| order_id    | int       |
| customer_id | int       |
| order_date  | date      |
| product_id  | int       |
| sales       | int       |
+-------------+-----------+
Hints
Expected Output
+------------+-------------+------------+------------+------------+
| product_id | order_month | sales_2022 | sales_2023 | sales_2024 |
+------------+-------------+------------+------------+------------+
|          1 |           2 |        280 |        520 |        730 |
|          2 |           7 |        225 |        325 |        525 |
|          3 |           9 |         90 |        190 |        290 |
+------------+-------------+------------+------------+------------+

solution:

WITH CTE AS (
SELECT product_id,
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sales) As sales
FROM orders
GROUP BY product_id,
YEAR(order_date),MONTH(order_date))
,CTE2 AS (
SELECT product_id,order_month,
SUM(CASE WHEN order_year = '2022' THEN sales ELSE 0 END) AS sales_2022,
SUM(CASE WHEN order_year = '2023' THEN sales ELSE 0 END) AS sales_2023,
SUM(CASE WHEN order_year = '2024' THEN sales ELSE 0 END) AS sales_2024 
FROM CTE
GROUP BY product_id,order_month
)
SELECT * FROM
CTE2 WHERE sales_2024>sales_2023 AND sales_2023>sales_2022
ORDER BY product_id;