You're working for a financial analytics company that specializes in analyzing credit card expenditures. You have a dataset containing information about users' credit card expenditures across different card companies.
Write an SQL query to find the total expenditure from other cards (excluding Mastercard) for users who hold Mastercard.  Display only the users(along with Mastercard expense and other expense) for which expense from other cards together is more than Mastercard expense.


Table: expenditures
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| user_name    | varchar(10) |
| expenditure  | int         |
| card_company | varchar(15) |
+--------------+-------------+
Hints
Expected Output
+-----------+--------------------+---------------+
| user_name | mastercard_expense | other_expense |
+-----------+--------------------+---------------+
| user1     |               1000 |          2500 |
+-----------+--------------------+---------------+

Solutions:

WITH ms_user AS
(SELECT user_name,SUM(expenditure) AS mastercard_expense
FROM expenditures
WHERE card_company = "Mastercard"
GROUP BY user_name)
, non_msuser AS
(SELECT user_name,SUM(expenditure) AS other_expense
FROM expenditures
WHERE card_company != "Mastercard"
GROUP BY user_name)

SELECT ms_user.user_name,ms_user.mastercard_expense,non_msuser.other_expense
FROM ms_user
INNER JOIN non_msuser
ON ms_user.user_name = non_msuser.user_name
WHERE non_msuser.other_expense > ms_user.mastercard_expense
GROUP BY ms_user.user_name;