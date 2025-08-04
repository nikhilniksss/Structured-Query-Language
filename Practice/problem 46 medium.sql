You are given a history of credit card transaction data for the people of India across cities as below. Your task is to find out highest spend card type and lowest spent card type for each city, display the output in ascending order of city.

 

Table: credit_card_transactions
+------------------+-------------+
| COLUMN_NAME      | DATA_TYPE   |
+------------------+-------------+
| transaction_id   | int         |
| city             | varchar(10) |
| transaction_date | date        |
| card_type        | varchar(12) |
| gender           | varchar(1)  |
| amount           | int         |
+------------------+-------------+
Hints
Expected Output
+-----------+----------------------+---------------------+
| city      | highest_expense_type | lowest_expense_type |
+-----------+----------------------+---------------------+
| Bengaluru | Platinum             | Silver              |
| Delhi     | Gold                 | Platinum            |
| Mumbai    | Platinum             | Gold                |
+-----------+----------------------+---------------------+

solution:

WITH CTE AS (
SELECT city,card_type,SUM(amount) AS total_spend
FROM credit_card_transactions
GROUP BY city,card_type)
, CTE2 AS (
SELECT *,
RANK() OVER(PARTITION BY city ORDER BY total_spend DESC) AS high_exp,
RANK() OVER(PARTITION BY city ORDER BY total_spend) AS low_exp
FROM CTE)

SELECT city,
MAX(CASE WHEN high_exp = 1 THEN card_type END) AS highest_expense,
MAX(CASE WHEN low_exp = 1 THEN card_type END) AS lowest_expense
FROM CTE2
GROUP BY city
ORDER BY city;