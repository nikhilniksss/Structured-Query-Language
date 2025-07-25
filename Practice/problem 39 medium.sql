You are analyzing the efficiency of food delivery on Zomato, focusing on the time taken by restaurants to prepare orders. Total food delivery time for an order is a combination of food preparation time + time taken by rider to deliver the order. 
Write an SQL to calculate average food preparation time(in minutes) for each restaurant . Round the average to 2 decimal points and sort the output in increasing order of average time.

 

Table: orders
+------------------------+-----------+
| COLUMN_NAME            | DATA_TYPE |
+------------------------+-----------+
| order_id               | int       |
| restaurant_id          | int       |
| order_time             | time      |
| expected_delivery_time | time      |
| actual_delivery_time   | time      |
| rider_delivery_mins    | int       |
+------------------------+-----------+
Hints
Expected Output
+---------------+--------------------+
| restaurant_id | avg_food_prep_mins |
+---------------+--------------------+
|           103 |              27.67 |
|           102 |              28.67 |
|           101 |              29.50 |
+---------------+--------------------+

solution:

SELECT restaurant_id,
ROUND(AVG(TIMESTAMPDIFF(MINUTE,order_time,actual_delivery_time) - rider_delivery_mins),2) AS food_prepration_time
FROM orders
GROUP BY restaurant_id