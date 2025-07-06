Given two tables: income_tax_dates and users, write a query to identify users who either filed their income tax returns late 
or completely skipped filing for certain financial years.
A return is considered late if the return_file_date is after the file_due_date.
A return is considered missed if there is no entry for the user in the users table for a given financial year 
(i.e., the user did not file at all).
Your task is to generate a list of users along with the financial year for which they either filed late or missed filing, 
and also include a comment column specifying whether it is a 'late return' or 'missed'. The result should be sorted by financial year in ascending order.

 

Table: income_tax_dates

+-----------------+------------+
| COLUMN_NAME     | DATA_TYPE  |
+-----------------+------------+
| financial_year  | varchar(4) |
| file_start_date | date       |
| file_due_date   | date       |
+-----------------+------------+

Table: users

+------------------+------------+
| COLUMN_NAME      | DATA_TYPE  |
+------------------+------------+
| user_id          | int        |
| financial_year   | varchar(4) |
| return_file_date | date       |
+------------------+------------+

Expected Output

+---------+----------------+-------------+
| user_id | financial_year | comment     |
+---------+----------------+-------------+
|       1 | FY21           | late return |
|       1 | FY22           | missed      |
|       2 | FY23           | late return |
+---------+----------------+-------------+

Solutions:

WITH CTE AS (
SELECT u.user_id,itr.financial_year,itr.file_due_date 
FROM users u
CROSS JOIN income_tax_dates itr
GROUP BY u.user_id,itr.financial_year,itr.file_due_date)

SELECT cte.user_id,cte.financial_year,
CASE WHEN users.return_file_date IS NULL THEN 'missed'
ELSE 'late return'
END AS comments
FROM CTE
LEFT JOIN users on cte.user_id = users.user_id 
AND cte.financial_year = users.financial_year
WHERE users.return_file_date IS NULL OR
return_file_date > file_due_date
ORDER BY financial_year;