At Spotify, we track user activity to understand their engagement with the platform. One of the key metrics we focus on is how consistently a user listens to music each day. A user is considered "consistent" if they have login session every single day since their first login.

Your task is to identify users who have logged in and listened to music every single day since their first login date until today.


Note: Dates are as per UTC time zone.

 


Table: user_sessions
+-----------------+----------+
| COLUMN_NAME     | DATA_TYPE|
+-----------------+----------+
| user_id         | int      |
| login_timestamp | datetime | 
+-----------------+----------+
Hints
Expected Output
+---------+
| user_id |
+---------+
|       1 |
|       4 |
|       6 |
+---------+

solution:

SELECT user_id
FROM user_sessions
GROUP BY user_id
HAVING COUNT(DISTINCT DATE(login_timestamp)) = DATEDIFF(CURDATE(),MIN(login_timestamp)) + 1;