Write a SQL query to identify the users with valid passwords according to the conditions below.

The password must be at least 8 characters long.
The password must contain at least one letter (lowercase or uppercase).
The password must contain at least one digit (0-9).
The password must contain at least one special character from the set @#$%^&*.
The password must not contain any spaces.
 

Table: user_passwords 
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| user_id     | int         |    
| user_name   | varchar(10) |
| password    | varchar(20) |
+-------------+-------------+
 
Hints
Expected Output
+---------+-----------+
| user_id | user_name |
+---------+-----------+
|       1 | Arjun     |
|       3 | Sneha     |
|       4 | Vikram    |
|       5 | Priya     |
|       7 | Neha      |
+---------+-----------+

solution:

SELECT user_id,user_name
FROM user_passwords
WHERE LENGTH(password) >= 8
AND password REGEXP '[a-zA-Z]'
AND password REGEXP '[0-9]'
AND password REGEXP '[@#$%^&*]'
AND password NOT LIKE '% %';