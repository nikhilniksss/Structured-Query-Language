You are given a table of list of lifts , their maximum capacity and people along with their weight who wants to enter into it. You need to make sure maximum people enter into the lift without lift getting overloaded.

For each lift find the comma separated list of people who can be accommodated. The comma separated list should have people in the order of their weight in increasing order, display the output in increasing order of id.

 

Table: lifts
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| capacity_kg | int       |
| id          | int       |
+-------------+-----------+
Table: lift_passengers
+----------------+-------------+
| COLUMN_NAME    | DATA_TYPE   |
+----------------+-------------+
| passenger_name | varchar(10) |
| weight_kg      | int         |
| lift_id        | int         |
+----------------+-------------+
Hints
Expected Output
+------+---------------------------+
| id   | passenger_list            |
+------+---------------------------+
|    1 | Adarsh,Dheeraj,Rahul      |
|    2 | Priti,Neha,Vimal,Himanshi |
+------+---------------------------+

Solution:

WITH cte AS (
SELECT *,
SUM(weight_kg) OVER(PARTITION BY lift_id ORDER BY weight_kg) AS run_wt
FROM lift_passengers)

SELECT l.id,GROUP_CONCAT(passenger_name ORDER BY weight_kg) AS pax_list
FROM cte
INNER JOIN lifts l
ON cte.lift_id = l.id
WHERE run_wt <= capacity_kg
GROUP BY l.id;