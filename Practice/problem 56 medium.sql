In professional tennis, there are four major tournaments that make up the Grand Slam: Wimbledon, French Open, US Open, and Australian Open. Each year, these tournaments declare one winner, and winning any of them is a major achievement for a tennis player. In championships table the wimbledon, fr_open, us_open and au_open columns have the winner player id.


You are given data from a tennis database. Your task is to write a query to report the total number of Grand Slam tournaments won by each player. The result should include all players, even those who have never won a tournament. For such players, the count should be 0.


Return the result with columns: player_id, player_name, and grand_slams_count. The result should be sorted by grand_slams_count in descending order.

 

Table: players
+--------------+----------+
| COLUMN_NAME  | DATA_TYPE|
+--------------+----------+
| player_id    | INT      |
| player_name  | varchar  | 
+-------------------------+

Table: championships
+-------------+---------+
| COLUMN_NAME |DATA_TYPE|
+-------------+---------+
| year        | INT     | 
| wimbledon   | INT     |
| fr_open     | INT     | 
| us_open     | INT     | 
| au_open     | INT     | 
+-----------------------+
Hints
Expected Output
+-----------+-----------------+-------------------+
| player_id | player_name     | grand_slams_count |
+-----------+-----------------+-------------------+
|         1 | Novak Djokovic  |                12 |
|         2 | Rafael Nadal    |                 6 |
|         3 | Roger Federer   |                 2 |
|         5 | Daniil Medvedev |                 2 |
|         4 | Carlos Alcaraz  |                 1 |
|         6 | Jannik Sinner   |                 1 |
|         7 | Andy Murray     |                 0 |
+-----------+-----------------+-------------------+

solution:

SELECT p.player_id,p.player_name,COUNT(c.player_id) AS grand_slam
FROM players p
LEFT JOIN (
SELECT wimbledon AS player_id FROM championships
UNION ALL
SELECT fr_open FROM championships
UNION ALL
SELECT us_open FROM championships
UNION ALL
SELECT au_open FROM championships) c
ON p.player_id = c.player_id
GROUP BY p.player_id,p.player_name
ORDER BY grand_slam DESC;