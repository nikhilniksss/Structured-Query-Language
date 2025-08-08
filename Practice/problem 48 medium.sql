You have a table named numbers containing a single column n. You are required to generate an output that expands each number n into a sequence where the number appears n times.

 

Table: numbers 
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| n           |   int     |    
+-------------+-----------+
Hints
Expected Output
+-----------------+
| expanded_number |
+-----------------+
|               1 |
|               2 |
|               2 |
|               3 |
|               3 |
|               3 |
|               4 |
|               4 |
|               4 |
|               4 |
|               7 |
|               7 |
|               7 |
|               7 |
|               7 |
|               7 |
|               7 |
+-----------------+

solution:

WITH RECURSIVE seq AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM seq
    WHERE num < (SELECT MAX(n) FROM numbers)
)
SELECT n AS expanded_number
FROM numbers
JOIN seq
  ON seq.num <= numbers.n
ORDER BY n;