"Ankur Warikoo, an influential figure in Indian social media, shares a guideline in one of his videos called the 20-6-20 rule 
for determining whether one can afford to buy a phone or not. The rule for affordability entails three conditions:

1. Having enough savings to cover a 20 percent down payment.
2. Utilizing a maximum 6-month EMI plan (no-cost) for the remaining cost.
3. Monthly EMI should not exceed 20 percent of one's monthly salary.
Given the salary and savings of various users, along with data on phone costs, the task is to write an SQL to generate a
list of phones (comma-separated) that each user can afford based on these criteria, display the output in ascending order
of the user name."

 

Table: users

+----------------+-------------+
| COLUMN_NAME    | DATA_TYPE   |
+----------------+-------------+
| user_name      | varchar(10) |
| monthly_salary | int         |
| savings        | int         |
+----------------+-------------+

Table: phones

+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| cost        | int         |
| phone_name  | varchar(15) |
+-------------+-------------+

Expected Output

+-----------+----------------------+
| user_name | affordable_phones    |
+-----------+----------------------+
| Rahul     | iphone-12,oneplus-12 |
| Vivek     | oneplus-12           |
+-----------+----------------------+

solution:

SELECT user_name, GROUP_CONCAT(phone_name) AS affordable_phones 
FROM users CROSS JOIN phones
WHERE savings >= cost*0.20 AND monthly_salary*0.20 >= cost*0.80/6
GROUP BY user_name
ORDER BY user_name;