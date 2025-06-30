Amazon is expanding their pharmacy business to new cities every year. You are given a table of business operations where you have information about cities where Amazon is doing operations along with the business date information.

Write a SQL to find year wise number of new cities added to the business, display the output in increasing order of year.

 

Table: business_operations
+---------------+-----------+
| COLUMN_NAME   | DATA_TYPE |
+---------------+-----------+
| business_date | date      |
| city_id       | int       |
+---------------+-----------+

Expected Output

+----------------------+------------------+
| first_operation_year | no_of_new_cities |
+----------------------+------------------+
|                 2020 |                2 |
|                 2021 |                1 |
|                 2022 |                1 |
+----------------------+------------------+

Solution:

WITH CTE AS
(SELECT city_id,YEAR(MIN(business_date)) AS first_operation_year
FROM business_operations
GROUP BY city_id)

SELECT first_operation_year,COUNT(*) AS no_of_new_cities
FROM CTE
GROUP BY first_operation_year;