You are given a table Students that stores each student's subject-wise marks. Your task is to calculate the total marks of the top-performing subjects for each student (sname), considering ties in marks.

 

A subject is considered a top-performing subject if its marks are among the top two distinct marks for that student. If multiple subjects share the same marks, they should all be included if their marks fall within the top two distinct values.

 

Return each student's name and the total marks of these top-performing subjects. order by student name.

 

Table: students
+--------------+----------+
| COLUMN_NAME  | DATA_TYPE|
+--------------+----------+
| student_name | VARCHAR  | 
| subject_name | VARCHAR  |
| marks        | INT      | 
+-------------------------+
Hints
Expected Output
+--------------+-----------------+
| student_name | total_top_marks |
+--------------+-----------------+
| Alice        |             260 |
| Bob          |             365 |
| Charlie      |             434 |
| David        |             158 |
| Emma         |             185 |
+--------------+-----------------+

solution:

WITH cte AS (
SELECT student_name,marks,
DENSE_RANK() OVER (PARTITION BY student_name ORDER BY marks DESC) AS rnk
FROM students)

SELECT student_name,SUM(marks) AS total_marks
FROM cte
WHERE rnk <= 2
GROUP BY student_name;