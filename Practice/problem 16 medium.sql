You are given a list of users and their opening account balance along with the transactions done by them. Write a SQL to calculate their account balance at the end of all the transactions. Please note that users can do transactions among themselves as well, display the output in ascending order of the final balance.

 


Table: users
+-----------------+-------------+
| COLUMN_NAME     | DATA_TYPE   |
+-----------------+-------------+
| user_id         | int         |
| username        | varchar(10) |
| opening_balance | int         |
+-----------------+-------------+

Table: transactions:

+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| id          | int       |
| from_userid | int       |
| to_userid   | int       |
| amount      | int       |
+-------------+-----------+

Expected Output:

+----------+---------------+
| username | final_balance |
+----------+---------------+
| Ankit    |          2000 |
| Amit     |          2800 |
| Agam     |          7500 |
| Rahul    |         10200 |
+----------+---------------+

Solutions:

WITH CTE AS (
SELECT from_userid AS user_id, -1*amount AS amount FROM transactions
UNION ALL
SELECT to_userid, amount FROM transactions
UNION ALL
SELECT user_id,opening_balance FROM users)

SELECT u.username,SUM(c.amount) AS final_balance
FROM CTE c
JOIN users u
ON u.user_id = c.user_id
GROUP BY u.username
ORDER BY final_balance;