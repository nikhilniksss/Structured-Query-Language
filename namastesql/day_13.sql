-------------- String Functions ---------------
-----------------------------------------------

-- LENGTH function

SELECT order_id,customer_name,LENGTH(customer_name) AS length_of_customer
FROM Orders;

-- Characters from left or right

SELECT order_id,customer_name,LEFT(customer_name,4) AS left_4
FROM Orders;

-- Characters from left or right

SELECT order_id,customer_name,RIGHT(customer_name,4) AS right_4
FROM Orders;

-- Substring

-- Characters from left or right

SELECT order_id,customer_name,SUBSTRING(customer_name,4,5) AS substring_char
FROM Orders;

SELECT order_id,customer_name,SUBSTRING(order_id,4,4) AS year
FROM Orders;

-- return the character position

SELECT order_id,customer_name,INSTR(Customer_Name,' ') AS space_position
FROM Orders;

SELECT order_id,customer_name,INSTR(Customer_Name,'u') AS u_position
FROM Orders;

-- concat

SELECT order_id,customer_name,CONCAT(order_id,'-',customer_name) AS ID
FROM Orders;


-- Replace function

SELECT order_id,customer_name,REPLACE(order_id,'CA','#') AS new_id
FROM Orders;


-- Reverse function

SELECT order_id,customer_name,REVERSE(Customer_Name) AS reversed_string
FROM Orders;

-- TRIM function

SELECT order_id,customer_name,TRIM('  Nikhil  ') AS trimmed
FROM Orders;

-- Handling null function

SELECT order_id,city,IFNULL(city,'unknown') as new_city
FROM Orders
WHERE city IS NULL;


-- coalese function

SELECT order_id,city,COALESCE(city,state,region,'unknown') as new_city
FROM Orders
WHERE city IS NULL;

-- CAST function

SELECT order_id,sales,CAST(sales AS SIGNED) AS sales_int 
FROM Orders 
LIMIT 5;

-- SET functions

--union all, union
create table orders_west
(
order_id int,
region varchar(10),
sales int
);


create table orders_east
(
order_id int,
region varchar(10),
sales int
);

SELECT * FROM orders_east;

insert into orders_west values(1,'west',100),(2,'west',200);
insert into orders_east values(3,'east',100),(4,'east',300);
insert into orders_east values(1,'west',100)
insert into orders_west values(3,'east',100)
insert into orders_west values(1,'west',100)
insert into orders_west values(1,'west',100)



SELECT * FROM orders_east
UNION ALL
SELECT * FROM orders_west;

-- UNION will remove duplicates

SELECT * FROM orders_east
UNION
SELECT * FROM orders_west;

-- To see the common records

SELECT * FROM orders_east
INTERSECT
SELECT * FROM orders_west;



SELECT * FROM orders_east
EXCEPT
SELECT * FROM orders_west;