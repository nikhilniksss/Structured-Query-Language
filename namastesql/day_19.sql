-------------------------- Functions in SQL ----------------------------
------------------------------------------------------------------------

DROP FUNCTION IF EXISTS fun_product;

DROP FUNCTION IF EXISTS fun_product;CREATE FUNCTION fun_product(a INT , b INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN a * b;
END

SELECT fun_product(10,20);

SELECT * FROM Orders;

---- using user defined function in select statement

SELECT row_id, Quantity, fun_product(row_id, Quantity) AS product_col FROM Orders;


---------------------------- pivot and unpivot -------------------------------

SELECT * FROM Orders;

SELECT * FROM
(SELECT Category,YEAR(Order_Date) AS sales_year, Sales FROM Orders) AS t1
PIVOT 
(SUM(Sales) FOR sales_year IN ([2020,2021]))  AS t2


--- create new table on the go

CREATE TABLE orders_west_table 
AS
SELECT * FROM Orders WHERE Region = 'West';

SELECT * FROM orders_west_table;








