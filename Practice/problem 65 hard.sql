Flipkart wants to build a very important business metrics where they want to track on daily basis how many new and repeat customers are purchasing products from their website. A new customer is defined when he purchased anything for the first time from the website and repeat customer is someone who has done at least one purchase in the past.

 

Display order date , new customers , repeat customers  in ascending order of repeat customers.

 

Table: customer_orders
+--------------+-----------+
| COLUMN_NAME  | DATA_TYPE |
+--------------+-----------+
| order_id     | int       |
| customer_id  | int       |
| order_date   | date      |
| order_amount | int       |
+--------------+-----------+
Hints
Expected Output
+------------+---------------+------------------+
| order_date | new_customers | repeat_customers |
+------------+---------------+------------------+
| 2022-01-01 |             3 |                0 |
| 2022-01-02 |             2 |                1 |
| 2022-01-03 |             1 |                2 |
+------------+---------------+------------------+

solution:

WITH first_purchase AS (
SELECT customer_id, MIN(order_date) AS first_purchase
FROM customer_orders
GROUP BY customer_id)

SELECT c.order_date,
SUM(CASE WHEN order_date = first_purchase THEN 1 ELSE 0 END) AS new_user,
SUM(CASE WHEN order_date > first_purchase THEN 1 ELSE 0 END) AS repeat_user
FROM customer_orders c
INNER JOIN first_purchase f
ON c.customer_id = f.customer_id
GROUP BY order_date;