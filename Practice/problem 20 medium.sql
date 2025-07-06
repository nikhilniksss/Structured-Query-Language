You are given the details of employees of a new startup. Write an SQL query to retrieve number of Software Engineers , Data Professionals and Managers in the team to separate columns. Below are the rules to identify them using Job Title. 
1- Software Engineers  :  The title should starts with “Software”
2- Data Professionals :  The title should starts with “Data”
3- Managers : The title should contain "Manager"

 

Tables: Employees

+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| EmployeeID  | int         |
| Name        | varchar(20) |
| JoinDate    | date        |
| JobTitle    | varchar(20) |
+-------------+-------------+

Expected Output

+--------------------+--------------------+----------+
| Software_Engineers | Data_Professionals | Managers |
+--------------------+--------------------+----------+
|                  9 |                  3 |        3 |
+--------------------+--------------------+----------+

Solution:

SELECT 
COUNT(CASE WHEN JobTitle LIKE "Software%" THEN 1 ELSE NULL END) AS Software_Engineers,
COUNT(CASE WHEN JobTitle LIKE "Data%" THEN 1 ELSE NULL END) AS Data_Professionals,
COUNT(CASE WHEN JobTitle LIKE "%Manager%" THEN 1 ELSE NULL END) AS Managers
FROM employees;