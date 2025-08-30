You are provided with information about students enrolled in various courses at a university. Each student can be enrolled in multiple courses, and for each course, it is specified whether the course is a major or an elective for the student.
Write a SQL query to generate a report that lists the primary (major_flag='Y') course for each student. If a student is enrolled in only one course, that course should be considered their primary course by default irrespective of the flag. Sort the output by student_id.

 

Table: student_courses
+-------------+------------+
| COLUMN_NAME | DATA_TYPE  |
+-------------+------------+
| student_id  | int        |
| course_id   | int        |
| major_flag  | varchar(1) |
+-------------+------------+
Hints
Expected Output
+------------+-----------+
| student_id | course_id |
+------------+-----------+
|          1 |       101 |
|          2 |       101 |
|          3 |       103 |
|          4 |       103 |
|          5 |       104 |
+------------+-----------+

solution:

SELECT student_id, course_id
FROM student_courses
WHERE major_flag = 'Y'
OR student_id IN(
SELECT student_id 
FROM student_courses
GROUP BY student_id
HAVING COUNT(*) = 1)