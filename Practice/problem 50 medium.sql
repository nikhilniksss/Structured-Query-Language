You are given a table named students with the following structure:

 

Table: students
+--------------+----------+
| COLUMN_NAME  | DATA_TYPE|
+--------------+----------+
| student_id   | INT      |
| skill        | VARCHAR  |  
+--------------+----------+
Each row represents a skill that a student knows. A student can appear multiple times in the table if they have multiple skills.

Write a SQL query to return the student_ids of students who only know the skill 'SQL'.  Sort the result by student id.
 

Hints
Expected Output
+------------+
| student_id |
+------------+
|          2 |
|          5 |
|          8 |
+------------+

Solution:

WITH cte AS (
SELECT student_id,COUNT(skill) as skill_count
FROM students
GROUP BY student_id
HAVING COUNT(skill) = 1)

SELECT c.student_id
FROM cte c
INNER JOIN students s
ON s.student_id = c.student_id
WHERE skill = LOWER('SQL');