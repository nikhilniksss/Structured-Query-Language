You are given a table with customers information that contains inconsistent and messy data. Your task is to clean the data by writing an SQL query to:

 

1- Trim extra spaces from the customer name and email fields.
2- Convert all email addresses to lowercase for consistency.
3- Remove duplicate records based on email address (keep the record with lower customer id).
4- Standardize the phone number format to only contain digits (remove dashes, spaces, and special characters).
5- Replace NULL values in address with 'Unknown'.

Sort the output by customer id.

 

Table: customers
+---------------+----------+
| COLUMN_NAME   | DATA_TYPE|
+---------------+----------+
| customer_id   | int      |
| customer_name | varchar  | 
| email         | varchar  | 
| phone         | varchar  | 
| address       | varchar  | 
+---------------+----------+
Hints
Expected Output
+-------------+-----------------+-----------------------------+-------------+-------------------+
| customer_id | customer_name   | email                       | phone       | address           |
+-------------+-----------------+-----------------------------+-------------+-------------------+
|           1 | John Doe        | john.doe@gmail.com          | 1234567890  | 123 Elm St        |
|           2 | Jane Smith      | jane.smith@yahoo.com        | 9876543210  | Unknown           |
|           4 | Alex White      | alex.white@outlook.com      | 1112223333  | 456 Pine Ave      |
|           5 | Bob Brown       | bob.brown@gmail.com         | 15558889999 | 789 Oak Dr        |
|           6 | Emily Davis     | emily.davis@gmail.com       | 5556667777  | 321 Cedar St      |
|           7 | Michael Johnson | michael.johnson@hotmail.com | 4445556666  | Unknown           |
|           8 | David Miller    | david.miller@yahoo.com      | 7778889999  | 654 Birch Ln      |
|          10 | William Taylor  | william.taylor@outlook.com  | 11234567890 | 852 Walnut St     |
|          12 | Olivia Brown    | olivia.brown@yahoo.com      | 3332221111  | 369 Pineapple Ave |
|          13 | James Wilson    | james.wilson@gmail.com      | 6667778888  | Unknown           |
|          14 | Emma Thomas     | emma.thomas@gmail.com       | 1231231234  | 123 Fake St       |
|          15 | Noah Anderson   | noah.anderson@yahoo.com     | 3216549870  | 456 Real Ave      |
+-------------+-----------------+-----------------------------+-------------+-------------------+

Solution:

WITH cte AS (
SELECT customer_id,
TRIM(customer_name) AS customer_name,
LOWER(TRIM(email)) AS email,
REGEXP_REPLACE(phone,'[^0-9]','') AS phone,
COALESCE(address,'Unknown') AS address,
ROW_NUMBER() OVER (PARTITION BY LOWER(TRIM(email)) ORDER BY customer_id) AS rn
FROM customers)

SELECT customer_id, customer_name, email, phone, address
FROM cte
WHERE rn = 1
ORDER BY customer_id;