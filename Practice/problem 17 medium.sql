boAt Lifestyle is focusing on influencer marketing to build and scale their brand. They want to partner with power creators for their upcoming campaigns. The creators should satisfy below conditions to qualify:

 

1- They should have 100k+ followers on at least 2 social media platforms and
2- They should have at least 50k+ views on their latest YouTube video.
Write an SQL to get creator id and name satisfying above conditions.

 

Table: creators

+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| id          | int         |
| name        | varchar(10) |
| followers   | int         |
| platform    | varchar(10) |
+-------------+-------------+

Table: youtube_videos

+--------------+-----------+
| COLUMN_NAME  | DATA_TYPE |
+--------------+-----------+
| id           | int       |
| creator_id   | int       |
| publish_date | date      |
| views        | int       |
+--------------+-----------+

Expected Output:

+------+-------+
| id   | name  |
+------+-------+
|  102 | Dhruv |
|  104 | Neha  |
|  105 | Amit  |
+------+-------+

Solutions:

WITH condition1 AS (
SELECT id,name FROM creators
WHERE followers > 100000
GROUP BY id,name
HAVING COUNT(*) >= 2)
,condition2 AS (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY creator_id ORDER BY publish_date DESC) As rn
FROM youtube_videos)

SELECT c1.id,c1.name
FROM condition1 c1
INNER JOIN condition2 c2
ON c1.id = c2.creator_id
WHERE rn = 1 AND views >50000;