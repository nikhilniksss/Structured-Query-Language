You have a table named ott_viewership. Write an SQL query to find the top 2 most-watched shows in each
genre in the United States. Return the show name, genre, and total duration watched for each of the top
2 most-watched shows in each genre. sort the result by genre and total duration.

 

Tables: ott_viewership

+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| viewer_id    | int         |
| show_id      | int         |
| show_name    | varchar(20) |
| genre        | varchar(10) |
| country      | varchar(15) |
| view_date    | date        |
| duration_min | int         |
+--------------+-------------+

Expected Output

+-----------------+---------+----------------+
| show_name       | genre   | total_duration |
+-----------------+---------+----------------+
| Friends         | Comedy  |             60 |
| The Office      | Comedy  |             70 |
| Breaking Bad    | Drama   |            110 |
| Stranger Things | Drama   |            115 |
| Game of Thrones | Fantasy |            105 |
| The Witcher     | Fantasy |            115 |
| The Mandalorian | Sci-Fi  |             85 |
+-----------------+---------+----------------+

Solution:

WITH CTE AS (
SELECT show_name,genre,
SUM(duration_min) OVER(PARTITION BY show_name) AS top_watched
FROM ott_viewership
WHERE country = "United States"
ORDER BY genre,top_watched DESC)

SELECT show_name,genre,top_watched FROM (
SELECT show_name,genre,top_watched,
ROW_NUMBER() OVER(PARTITION BY genre) AS rn
FROM CTE
GROUP BY show_name,genre,top_watched) A
WHERE rn IN (1,2)
ORDER BY genre,show_name;