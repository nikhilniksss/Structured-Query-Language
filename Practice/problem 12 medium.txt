Suppose you are a data analyst working for a travel company that offers vacation rentals similar to Airbnb. Your company wants to identify the top hosts with the highest average ratings for their listings. This information will be used to recognize exceptional hosts and potentially offer them incentives to continue providing outstanding service.

 

Your task is to write an SQL query to find the top 2 hosts with the highest average ratings for their listings. However, you should only consider hosts who have at least 2 listings, as hosts with fewer listings may not be representative.

Display output in descending order of average ratings and round the average ratings to 2 decimal places.

 

Table: listings
+----------------+---------------+
| COLUMN_NAME    | DATA_TYPE     |
+----------------+---------------+
| host_id        | int           |
| listing_id     | int           |
| minimum_nights | int           |
| neighborhood   | varchar(20)   |
| price          | decimal(10,2) |
| room_type      | varchar(20)   |
+----------------+---------------+
Table: reviews
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| listing_id  | int       |
| rating      | int       |
| review_date | date      |
| review_id   | int       |
+-------------+-----------+

Expected Output:

+---------+----------------+------------+
| host_id | no_of_listings | avg_rating |
+---------+----------------+------------+
|     103 |              2 |       5.00 |
|     102 |              3 |       4.50 |
+---------+----------------+------------+

Solution:

WITh CTE AS
(SELECT host_id,listing_id,
COUNT(*) OVER (PARTITION BY host_id) AS no_of_listings
FROM listings)

SELECT c.host_id,c.no_of_listings,
ROUND(AVG(r.rating),2) AS avg_rating
FROM CTE c
INNER JOIN reviews r
ON c.listing_id = r.listing_id
WHERE c.no_of_listings >= 2
GROUP BY c.host_id,c.no_of_listings
ORDER BY avg_rating desc
LIMIT 2;