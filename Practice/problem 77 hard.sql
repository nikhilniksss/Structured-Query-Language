A pizza eating competition is organized. All the participants are organized into different groups. In a contest , 
A participant who eat the most pieces of pizza is the winner and recieves their original bet plus 30% of all losing participants bets.
In case of a tie all winning participants will get equal share (of 30%) divided among them .Return the winning participants names for
each group and amount of their payout(round to 2 decimal places) . ordered ascending by group_id , participant_name.

 

Tables: Competition
+------------------+-------------+
| COLUMN_NAME      | DATA_TYPE   |
+------------------+-------------+
| group_id         | int         |
| participant_name | varchar(10) |
| slice_count      | int         |
| bet              | int         |
+------------------+-------------+
Hints
Expected Output
+----------+------------------+--------------+
| group_id | participant_name | total_payout |
+----------+------------------+--------------+
|        1 | Bob              |        54.60 |
|        1 | Eve              |        42.60 |
|        2 | Charlie          |        67.20 |
|        2 | David            |        79.20 |
|        2 | Mike             |        61.20 |
|        3 | Grace            |        96.60 |
|        4 | Ivy              |       190.20 |
+----------+------------------+--------------+

Solution:

WITH cte AS (
SELECT *,
RANK() OVER(PARTITION BY group_id ORDER BY slice_count DESC) AS rn
FROM competition)
, cte2 AS (
SELECT group_id,
SUM(CASE WHEN rn = 1 THEN 1 ELSE 0 END) AS no_of_winners,
SUM(CASE WHEN rn > 1 THEN bet ELSE 0 END)*0.30 AS loser_bet
FROM cte
GROUP BY group_id)

SELECT cte.group_id,cte.participant_name,
ROUND(cte.bet + (cte2.loser_bet)/cte2.no_of_winners,2) AS total_payout
FROM cte
INNER JOIN cte2 
ON cte.group_id = cte2.group_id
WHERE rn = 1;