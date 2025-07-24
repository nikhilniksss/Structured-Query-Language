As an analyst at Amazon, you are responsible for ensuring the integrity of product ratings on the platform. Fake ratings can distort the perception of product quality and mislead customers. To maintain trust and reliability, you need to identify potential fake ratings that deviate significantly from the average ratings for each product.
Write an SQL query to identify the single rating that is farthest (in absolute value) from the average rating value for each product, display rating details in ascending order of rating id.

 

Table : product_ratings
+-------------+--------------+
| COLUMN_NAME | DATA_TYPE    |
+-------------+--------------+
| rating_id   | int          |
| product_id  | int          |
| user_id     | int          |
| rating      | decimal(2,1) |
+-------------+--------------+
Hints
Expected Output
+-----------+------------+---------+--------+
| rating_id | product_id | user_id | rating |
+-----------+------------+---------+--------+
|         5 |        101 |    1005 |    3.2 |
|         6 |        102 |    1006 |    4.7 |
+-----------+------------+---------+--------+

Solutions:

WITH CTE AS
(SELECT *,
AVG(rating) OVER(PARTITION BY product_id) AS avg_rating,
ABS(rating - AVG(rating) OVER(PARTITION BY product_id)) AS difference
FROM product_ratings)

SELECT rating_id,product_id,user_id,rating FROM
(SELECT *,
ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY difference DESC) as rn
FROM CTE) A