--1) write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909

SELECT * FROM Orders LIMIT 50;

UPDATE Orders SET City = NULL WHERE Order_ID IN ('CA-2020-161389' ,'US-2021-156909');

SELECT * FROM Orders WHERE Order_ID IN ('CA-2020-161389' ,'US-2021-156909');

--2) write a query to find orders where city is null (2 rows)

SELECT * FROM Orders WHERE City IS NULL;

--3) write a query to get total profit, first order date and latest order date for each category

SELECT Category,SUM(Profit) AS Total_Profit,
MIN(Order_Date) AS First_Order,
MAX(Order_Date) AS Latest_Order FROM Orders
GROUP BY Category;


--4) write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category

SELECT Sub_Category,AVG(Profit) AS Avg_Profit, MAX(Profit) AS Max_Profit
FROM Orders
GROUP BY Sub_Category
HAVING Avg_Profit > Max_Profit;

--5) create the exams table with below script;

create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

--write a query to find students who have got same marks in Physics and Chemistry.

SELECT * FROM exams

SELECT student_id , marks
FROM exams
WHERE subject IN ('Physics','Chemistry')
GROUP BY student_id , marks
HAVING count(*)=2;

--6) write a query to find total number of products in each category.

SELECT Category,COUNT(distinct product_id) AS Total_Product 
FROM Orders 
GROUP BY Category;

--7) write a query to find top 5 sub categories in west region by total quantity sold

SELECT Region,Sub_Category,SUM(Quantity) AS Quantity_Sold FROM Orders
WHERE Region = 'West'
GROUP BY Sub_Category
ORDER BY Quantity_Sold DESC
LIMIT 5;

--8) write a query to find total sales for each region and ship mode combination for orders in year 2020

SELECT Region,Ship_Mode, SUM(Sales) AS Total_Sales 
FROM Orders
WHERE Order_Date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY Region,Ship_Mode;



