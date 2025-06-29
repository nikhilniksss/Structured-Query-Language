Write an SQL query to extract the domain names from email addresses stored in the Customers table.

 

Tables: Customers
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| CustomerID  | int         |
| Email       | varchar(25) |
+-------------+-------------+

Expected Output:

+------------------------+---------------+
| Email                  | domain_name   |
+------------------------+---------------+
| john@gmail.com         | gmail.com     |
| jane.doe@yahoo.org     | yahoo.org     |
| alice.smith@amazon.net | amazon.net    |
| bob@gmail.com          | gmail.com     |
| charlie@microsoft.com  | microsoft.com |
+------------------------+---------------+

Solution:

SELECT email,
SUBSTRING(email,INSTR(email,'@')+1) AS domain_name
FROM customers;