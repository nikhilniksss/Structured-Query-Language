Write an SQL query to determine the transaction date with the lowest average order value (AOV) 
among all dates recorded in the transaction table. Display the transaction date, its corresponding AOV,
and the difference between the AOV for that date and the highest AOV for any day in the dataset. 
Round the result to 2 decimal places.

 

Table: transactions 

+--------------------+--------------+
| COLUMN_NAME        | DATA_TYPE    |
+--------------------+--------------+
| order_id           | int          |
| transaction_amount | decimal(5,2) |
| transaction_date   | date         |
| user_id            | int          |
+--------------------+--------------+


Expected Output:

+------------------+-------+-----------------------+
| transaction_date | aov   | diff_from_highest_aov |
+------------------+-------+-----------------------+
| 2024-02-26       | 30.00 |                103.33 |
+------------------+-------+-----------------------+

Solution:

WITH CTE AS (
SELECT transaction_date,
AVG(transaction_amount) AS aov
FROM transactions
GROUP BY transaction_date
ORDER BY aov)

SELECT transaction_date,ROUND(aov,2)
,ROUND(MAX(aov) OVER() - AOV,2) AS diff_from_highest_aov
FROM CTE
GROUP BY transaction_date,aov
LIMIT 1;

