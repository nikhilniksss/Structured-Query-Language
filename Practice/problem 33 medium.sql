You own a small online store, and want to analyze customer ratings for the products that you are selling. After doing a data pull, you have a list of products and a log of purchases. Within the purchase log, each record includes the number of stars (from 1 to 5) as a customer rating for the product.

For each category, find the lowest price among all products that received at least one 4-star or above rating from customers.
If a product category did not have any products that received at least one 4-star or above rating, the lowest price is considered to be 0. The final output should be sorted by product category in alphabetical order.

Table: products

+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| category    | varchar(10) |
| id          | int         |
| name        | varchar(20) |
| price       | int         |
+-------------+-------------+

Table: purchases

+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| id          | int       |
| product_id  | int       |
| stars       | int       |
+-------------+-----------+

Expected Output

+----------+-------+
| category | price |
+----------+-------+
| apple    |     0 |
| cherry   |    36 |
| grape    |     0 |
| orange   |    14 |
+----------+-------+

Solution:

SELECT pro.category,
COALESCE(MIN(CASE WHEN pur.stars IS NOT NULL THEN pro.price END),0) AS lowest_price
FROM products pro
LEFT JOIN purchases pur
ON pro.id = pur.product_id
AND pur.stars >= 4
GROUP BY pro.categ
