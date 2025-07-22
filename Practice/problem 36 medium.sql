You are working for a marketing agency that manages multiple Instagram influencer accounts. Your task is to analyze the engagement performance of these influencers before and after they join your company.
Write an SQL query to calculate average engagement growth rate percent for each influencer after they joined your company compare to before. Round the growth rate to 2 decimal places and sort the output in decreasing order of growth rate.

Engagement = (# of likes + # of comments on each post)
 

Table: influencers
+---------------+-------------+
| COLUMN_NAME   | DATA_TYPE   |
+---------------+-------------+
| influencer_id | int         |
| join_date     | date        |
| username      | varchar(10) |
+---------------+-------------+
Table: posts
+---------------+-----------+
| COLUMN_NAME   | DATA_TYPE |
+---------------+-----------+
| comments      | int       |
| influencer_id | int       |
| likes         | int       |
| post_date     | date      |
| post_id       | int       |
+---------------+-----------+
Hints
Expected Output
+----------+-------------------+------------------+--------+
| username | before_engagement | after_engagement | growth |
+----------+-------------------+------------------+--------+
| Ankit    |          150.0000 |         195.0000 |  30.00 |
| Rahul    |          202.5000 |         250.0000 |  23.46 |
+----------+-------------------+------------------+--------+

Solutions:

WITH cte AS (
SELECT i.username,
AVG(CASE WHEN post_date < join_date THEN likes+comments END) AS before_engagement,
AVG(CASE WHEN post_date > join_date THEN likes+comments END) AS after_engagement
FROM influencers i
INNER JOIN posts p
ON i.influencer_id = p.influencer_id
GROUP BY i.username)

SELECT *,
ROUND((after_engagement-before_engagement)*100/before_engagement,2) AS growth
FROM cte;