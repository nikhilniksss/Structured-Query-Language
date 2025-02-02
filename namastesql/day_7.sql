-- Checking null

SELECT * FROM Orders;

UPDATE Orders SET city = null WHERE Order_ID IN ('CA-2020-152156','CA-2020-152156');

SELECT * FROM Orders WHERE City = null;
-- 0 records found

SELECT * FROM Orders WHERE City IS NULL;

SELECT * FROM Orders WHERE City IS NOT NULL;

/******** Aggregation ***********/

-- Count 

SELECT COUNT(*) AS Total_Count FROM Orders;

-- SUM

SELECT SUM(Sales) AS Total_Sales FROM Orders; 

-- MAX | MIN | AVG

SELECT MAX(Sales),MIN(Sales),AVG(Sales) FROM Orders;

-- Region wise max sales

SELECT Region,MAX(Sales) AS Max_Sales, MIN(Sales) AS Min_Sales FROM Orders GROUP BY Region;

-- Group by with Where

SELECT Region,MAX(Sales) AS Max_Sales, MIN(Sales) AS Min_Sales FROM Orders WHERE Profit > 50 GROUP BY Region;

-- Having clause

SELECT Sub_Category,SUM(Sales) AS Total_Sales FROM Orders
GROUP BY Sub_Category
HAVING Total_Sales > 100000
ORDER BY Total_Sales DESC;







