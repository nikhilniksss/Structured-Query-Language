You are planning to list a property on Airbnb. To maximize profits, you need to analyze the Airbnb data for the month of January 2023 to determine the best room type for each location. The best room type is based on the maximum average occupancy during the given month.

Write an SQL query to find the best room type for each location based on the average occupancy days. Order the results in descending order of average occupancy days, rounded to 2 decimal places.

 

Table: listings
+----------------+---------------+
| COLUMN_NAME    | DATA_TYPE     |
+----------------+---------------+
| listing_id     | int           |
| host_id        | int           |
| location       | varchar(20)   |
| room_type      | varchar(20)   |
| price          | decimal(10,2) |
| minimum_nights | int           |
+----------------+---------------+
Table: bookings
+---------------+-----------+
| COLUMN_NAME   | DATA_TYPE |
+---------------+-----------+
| booking_id    | int       |
| checkin_date  | date      |
| checkout_date | date      |
| listing_id    | int       |
+---------------+-----------+
Hints
Expected Output
+----------+-----------------+---------------+
| location | room_type       | avg_book_days |
+----------+-----------------+---------------+
| Midtown  | Private room    |          7.00 |
| Downtown | Entire home/apt |          6.33 |
+----------+-----------------+---------------+

Solution:

WITH CTE1 AS (
SELECT listing_id,
SUM(checkout_date - checkin_date) AS no_of_days
FROM bookings
GROUP BY listing_id)

, CTE2 AS (
SELECT location,room_type,ROUND(AVG(no_of_days),2) AS avg_book_days
FROM CTE1 c
JOIN listings l 
ON c.listing_id = l.listing_id
GROUP BY location,room_type)

SELECT location,room_type,avg_book_days FROM (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY location ORDER BY avg_book_days DESC) AS rn
FROM CTE2) A
WHERE rn = 1
GROUP BY location,room_type,avg_book_days
ORDER BY avg_book_days DESC;