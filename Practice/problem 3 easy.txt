Write an SQL query to retrieve the total sales amount in each category. Include all categories, if no products were sold in a category display as 0. Display the output in ascending order of total_sales.

Tables: sales
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| amount      | int       |
| category_id | int       |
| sale_date   | date      |
| sale_id     | int       |
+-------------+-----------+
Tables: Categories
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| category_id   | int         |
| category_name | varchar(12) |
+---------------+-------------+

Expected Output:

+---------------+-------------+
| category_name | total_sales |
+---------------+-------------+
| Clothing      |           0 |
| Books         |         350 |
| Home Decor    |        1000 |
| Electronics   |        1300 |
+---------------+-------------+

Solution:

SELECT category_name, COALESCE(SUM(amount),0) AS total_sales FROM categories c
LEFT JOIN sales s
ON c.category_id = s.category_id
GROUP BY category_name
ORDER BY total_sales;
