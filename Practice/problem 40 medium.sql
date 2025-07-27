You’re analyzing late deliveries on Zomato. Each order’s total delivery time is split equally:

50% for food preparation (restaurant)
50% for the riders trip
Goal: Find orders that were late ONLY because the rider took longer than expected. In other words, food was ready on time, but the rider was slow.

Display the following for each such order:

order_id
expected_delivery_mins
rider_delivery_mins
food_prep_mins
Sort the results by order_id in ascending order.

 

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
+----------+------------------------+---------------------+----------------+
| order_id | expected_delivery_mins | rider_delivery_mins | food_prep_mins |
+----------+------------------------+---------------------+----------------+
|        2 |                     25 |                  30 |             10 |
|        6 |                     30 |                  29 |             14 |
+----------+------------------------+---------------------+----------------+

Solutions:

WITH CTE AS

(SELECT *,
TIMESTAMPDIFF(MINUTE,order_time,expected_delivery_time) AS expected_minutes,
TIMESTAMPDIFF(MINUTE,order_time,actual_delivery_time) AS actual_minutes
FROM orders
WHERE actual_delivery_time > expected_delivery_time)

, CTE2 AS
(SELECT *,
actual_minutes - rider_delivery_mins AS actual_food_time,
expected_minutes/2 AS expected_food_prep_time 
FROM CTE)

SELECT order_id,expected_minutes,rider_delivery_mins,actual_food_time
FROM CTE2
WHERE actual_food_time < expected_food_prep_time;