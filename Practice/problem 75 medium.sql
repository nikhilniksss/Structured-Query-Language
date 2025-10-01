A hotel has accidentally made overbookings for certain rooms on specific dates. Due to this error, some rooms have been assigned to multiple customers for overlapping periods, leading to potential conflicts. The hotel management needs to rectify this mistake by contacting the affected customers and providing them with alternative arrangements.

 

Your task is to write an SQL query to identify the overlapping bookings for each room and determine the list of customers affected by these overlaps. For each room and overlapping date, the query should list the customers who have booked the room for that date. 
 

A booking is check-out date is not inclusive, meaning that if a room is booked from April 1st to April 4th, it is considered occupied from April 1st to April 3rd , another customer can check-in on April 4th and that will not be considered as overlap.
 

Order the result by room id, booking date. You may use calendar dim table which has all the dates for the year April 2024.

 

Table : bookings
+----------------+-----------+
| COLUMN_NAME    | DATA_TYPE |
+----------------+-----------+
| room_id        | int       |
| customer_id    | int       |
| check_in_date  | date      |
| check_out_date | date      |
+----------------+-----------+
Table : calendar_dim
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| cal_date    | date      |
+-------------+-----------+
Hints
Expected Output
+---------+------------+-----------+
| room_id | book_date  | customers |
+---------+------------+-----------+
|       1 | 2024-04-02 | 101,103   |
|       1 | 2024-04-03 | 101,103   |
|       1 | 2024-04-05 | 103,106   |
|       2 | 2024-04-04 | 102,105   |
+---------+------------+-----------+

solution:

with cte as (
select room_id,customer_id,c.cal_date as book_date
from bookings b
inner join calendar_dim c on c.cal_date >= b.check_in_date and c.cal_date < b.check_out_date
)
select room_id,book_date , group_concat(customer_id ORDER BY customer_id)  as customers
from cte 
group by room_id,book_date 
having count(*)>1
order by room_id,book_date ;

