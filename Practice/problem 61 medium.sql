Write an SQL to retrieve the top 5 customers who have spent the most on their single purchase. Sort the result by max single purchase in descending order.

 

Table: purchase
+-------------+------------+
|COLUMN_NAME  | DATA_TYPE  |
+-------------+------------+
|customer_id  | int        |
|purchase_date| date       |
|amount       | int        |
+-------------+------------+
Hints
Expected Output
+-------------+------------+
| customer_id | max_amount |
+-------------+------------+
|           5 |       6000 |
|           7 |       5400 |
|          10 |       5100 |
|           2 |       5000 |
|           8 |       4400 |
+-------------+------------+

solution:

SELECT customer_id,MAX(amount) as max_purchase
FROM purchase
GROUP BY customer_id
ORDER BY max_purchase DESC
LIMIT 5;