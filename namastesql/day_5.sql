/*********** SELECT Statement ***********/
/****************************************/

-- Select top 5 records

SELECT * FROM Orders LIMIT 5;

SELECT * FROM Orders ORDER BY Order_Date DESC LIMIT 10;

-- Distinct value in ship mode

SELECT DISTINCT Ship_Mode FROM Orders;

SELECT DISTINCT Order_Date FROM Orders;

SELECT DISTINCT Ship_Mode, Segment FROM Orders;

-- FILTER

SELECT * FROM Orders WHERE Ship_Mode = 'First Class';

SELECT * FROM Orders WHERE quantity < 5;

SELECT * FROM Orders WHERE Order_date < '2020-12-08';

SELECT * FROM Orders WHERE Order_date BETWEEN '2020-12-08' AND '2020-12-09';

SELECT * FROM Orders WHERE Ship_Mode IN ('First Class','Same Day');

SELECT * FROM Orders WHERE Ship_Mode NOT IN ('First Class','Same Day');

SELECT * FROM Orders WHERE Ship_Mode > 'Second Class';
-- sorting based on ASCII value of alphabets.ACCESSIBLE

SELECT * FROM Orders WHERE Ship_Mode = 'First Class' AND Segment = 'Consumer';

SELECT * FROM Orders WHERE Ship_Mode = 'First Class' OR Segment = 'Consumer';

-- Creating new column on the run

SELECT *,Profit/Sales AS Ratio FROm Orders;

SELECT *,Profit/Sales AS Ratio, Profit + Sales AS Total  FROM Orders;

/******** Pattern Matching **********/

SELECT Order_ID,Order_Date,Customer_Name FROM Orders LIMIT 10;

-- name starting with

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name LIKE 'C%';

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name LIKE 'Chris%';

-- name ending with

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name LIKE '%Schild';

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name LIKE '%t';

-- name inbetween text

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name LIKE '%even%';

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name LIKE 'A%a';

-- some character at 1st position and "l" at second position followed by anything

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name LIKE '_l%';

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name LIKE '_l_e%';

-- first character is C then 2nd character can be "a" or "l" and then anything

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name REGEXP '^C[a|l]';

SELECT Order_ID,Order_Date,Customer_Name FROM Orders WHERE Customer_Name REGEXP '^C[a-h]';





















