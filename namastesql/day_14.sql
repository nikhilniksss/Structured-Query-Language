----- Sub query ----

SELECT * FROM Orders;

SELECT AVG(Sales) FROM Orders;

SELECT AVG(order_sales) FROM 
(SELECT order_id,SUM(Sales) AS order_sales
FROM Orders
GROUP BY order_id) AS aggregated_sales


-- sales greater than average value

SELECT order_id
FROM Orders
GROUP BY order_id
HAVING SUM(sales) > (SELECT AVG(order_sales) FROM 
(SELECT order_id,SUM(Sales) AS order_sales
FROM Orders
GROUP BY order_id) AS aggregated_sales)

SELECt * FROm Orders WHERE order_id = 'CA-2019-111164'


