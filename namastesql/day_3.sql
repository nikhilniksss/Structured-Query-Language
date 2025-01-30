USE namastesql;

CREATE TABLE Orders (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country_Region VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    Profit DECIMAL(10, 4)
);

SELECT * FROM Orders;

INSERT INTO Orders (
    Row_ID, Order_ID, Order_Date,
    Ship_Date, Ship_Mode, Customer_ID,
    Customer_Name, Segment, 
    Country_Region, City,
    State, Postal_Code,
    Region, Product_ID,
    Category, Sub_Category, 
    Product_Name, Sales,
    Quantity, Discount,
    Profit
) VALUES
(1,"US-2020-105578","2020-05-30",
"2020-06-04","Standard Class",
"MY-17380","Maribeth Yedwab","Corporate",
"United States","Parker","Colorado",
"80134","West","OFF-BI-10001670",
"Office Supplies","Binders",
"Vinyl Sectional Post Binders",
22.62,2,0.7,-15.08);

-- Alter table

SELECT * FROM amazon_orders;

DESC amazon_orders;

-- Want to alter order_date to capture time as well

ALTER TABLE amazon_orders MODIFY COLUMN order_date DATETIME;

DESC amazon_orders;

-- now order_date will capture time as well

INSERT INTO amazon_orders VALUES (7,'2025-01-28 17:32:00','Cup',300.5,'emi');

SELECT * FROM amazon_orders;

-- Add new column to the existing table 

ALTER TABLE amazon_orders ADD COLUMN user_name VARCHAR(30);

ALTER TABLE amazon_orders ADD COLUMN category VARCHAR(30);

-- Drop column from the table without deleting the table

ALTER TABLE amazon_orders DROP COLUMN category;

DESC amazon_orders;

-- Constraints in SQL is setting up a condition to a column in which it is going to accept the value

CREATE TABLE a_orders(
    order_id INT NOT NULL,
    order_date DATE,
    product_name VARCHAR(30),
    total_price DECIMAL(6,2),
    payment_method VARCHAR(20)
);

INSERT INTO a_orders VALUES(null,'2024-01-28','iphone','9999.20','cash');
-- 1048 (23000): Column 'order_id' cannot be null





