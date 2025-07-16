You are given a history of credit card transaction data for the people of India across cities. Write an SQL to find percentage contribution of spends by females in each city.  Round the percentage to 2 decimal places. Display city, total spend , female spend and female contribution in ascending order of city.

 

Table: credit_card_transactions
+------------------+-------------+
| COLUMN_NAME      | DATA_TYPE   |
+------------------+-------------+
| amount           | int         |
| card_type        | varchar(10) |
| city             | varchar(10) |
| gender           | varchar(1)  |
| transaction_date | date        |
| transaction_id   | int         |
+------------------+-------------+
Hints
Expected Output
+-----------+-------------+--------------+---------------------+
| city      | total_spend | female_spend | female_contribution |
+-----------+-------------+--------------+---------------------+
| Bengaluru |        3450 |          300 |                8.70 |
| Delhi     |        1630 |         1430 |               87.73 |
| Mumbai    |        4150 |         4150 |              100.00 |
+-----------+-------------+--------------+---------------------+

Solution:

WITH CTE1 AS (
SELECT city,SUM(amount) AS total_spend
FROM credit_card_transactions
GROUP BY city)
, CTE2 AS (
SELECT city,gender,SUM(amount) AS female_spend
FROM credit_card_transactions
GROUP BY city,gender
HAVING gender = 'F')

SELECT c1.city,c1.total_spend,c2.female_spend,
ROUND((c2.female_spend/c1.total_spend)*100,2) AS f_conti
FROM CTE1 c1
JOIN CTE2 c2
ON c1.city = c2.city
ORDER BY c1.city;