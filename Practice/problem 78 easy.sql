-- write an sql query to find the id, name,rating of a movies with odd IDs and whose description is not "boring"
-- return the result table ordered by ratings in descending order.

SELECT id,movie,rating
FEOM cinema
WHERE description != "boring"
AND id % 2 != 0
ORDER BY rating DESC;