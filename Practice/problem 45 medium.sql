You are given a table named "tickets" containing information about airline tickets sold. Write an SQL query to find the busiest route based on the total number of tickets sold. Also display total ticket count for that route.
oneway_round ='O' -> One Way Trip 
oneway_round ='R' -> Round Trip 
Note: DEL -> BOM is different route from BOM -> DEL

 

Tables: tickets
+----------------+-------------+
| COLUMN_NAME    | DATA_TYPE   |
+----------------+-------------+
| airline_number | varchar(10) |
| origin         | varchar(3)  |
| destination    | varchar(3)  |
| oneway_round   | char(1)     |
| ticket_count   | int         |
+----------------+-------------+
Hints
Expected Output
+--------+-------------+------+
| origin | destination | tc   |
+--------+-------------+------+
| DEL    | NYC         |  350 |
+--------+-------------+------+

Solution:

SELECT origin,destination,SUM(ticket_count) AS tc
FROM
(SELECT origin,destination,ticket_count
FROM tickets
UNION ALL
SELECT destination,origin,ticket_count
FROM tickets
WHERE oneway_round='R') A
GROUP BY origin,destination
ORDER BY tc DESC
LIMIT 1;