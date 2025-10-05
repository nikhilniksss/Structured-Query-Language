In the Indian Premier League (IPL), each team plays two matches against every other team: one at their home venue and one at their opponent's venue. We want to identify team combinations where each team wins the away match but loses the home match against the same opponent. Write an SQL query to find such team combinations, where each team wins at the opponent's venue but loses at their own home venue.

 

Table: Matches
+-------------+-------------+
| COLUMN_NAME | DATA_TYPE   |
+-------------+-------------+
| away_team   | varchar(10) |
| home_team   | varchar(10) |
| match_id    | int         |
| winner_team | varchar(10) |
+-------------+-------------+
Hints
Expected Output
+-------+-------+
| team1 | team2 |
+-------+-------+
| DD    | KKR   |
+-------+-------+

Solution:

SELECT m1.home_team,m1.away_team FROM matches m1
INNER JOIN matches m2
ON m1.home_team = m2.away_team
AND m1.away_team = m2.home_team
WHERE m1.match_id < m2.match_id
AND m1.away_team = m1.winner_team
AND m2.away_team = m2.winner_team;