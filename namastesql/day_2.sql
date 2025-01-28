-- To delete a table we use drop function

DROP TABLE amazon_orders;

DESC amazon_orders;
--Table 'namastesql.amazon_orders' doesn't exist

CREATE TABLE amazon_orders(
    order_id INT,
    order_date DATE,
    product_name VARCHAR(100),
    total_price DECIMAL(6,2),
    payment_method VARCHAR(20)
);

INSERT INTO amazon_orders VALUES (1,'2025-01-26','Milk',30.5,'card');
INSERT INTO amazon_orders VALUES (2,'2025-01-25','Powder',130.5,'upi');
INSERT INTO amazon_orders VALUES (3,'2025-01-23','Rog Ally',3700,'card');
INSERT INTO amazon_orders VALUES (4,'2024-12-20','Nintendo',2800,'upi');
INSERT INTO amazon_orders VALUES (5,'2024-05-26','ps5',5300,'card');
INSERT INTO amazon_orders VALUES (6,'2023-08-25','XBOX',3000,'upi');

-- Let delete a single record from the table.

DESC amazon_orders;

SELECT * FROM amazon_orders;

-- Delete all records at once

DELETE FROM amazon_orders;

DELETE FROM amazon_orders WHERE order_id = 6;

CREATE TABLE employees (
    employee_id VARCHAR(10),
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

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

INSERT INTO Orders (Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode, Customer_ID, Customer_Name, Segment, Country_Region, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name, Sales, Quantity, Discount, Profit)
VALUES
(1, 'CA-2020-152156', '44143', '44146', 'Second Class', 'CG-12520', 'Claire Gute', 'Consumer', 'United States', 'Henderson', 'Kentucky', '42420', 'South', 'FUR-BO-10001798', 'Furniture', 'Bookcases', 'Bush Somerset Collection Bookcase', 261.96, 2, 0, 41.9136),
(2, 'CA-2020-152156', '44143', '44146', 'Second Class', 'CG-12520', 'Claire Gute', 'Consumer', 'United States', 'Henderson', 'Kentucky', '42420', 'South', 'FUR-CH-10000454', 'Furniture', 'Chairs', 'Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Back', 731.94, 3, 0, 219.582),
(3, 'CA-2020-138688', '43994', '43998', 'Second Class', 'DV-13045', 'Darrin Van Huff', 'Corporate', 'United States', 'Los Angeles', 'California', '90036', 'West', 'OFF-LA-10000240', 'Office Supplies', 'Labels', 'Self-Adhesive Address Labels for Typewriters by Universal', 14.62, 2, 0, 6.8714),
(4, 'US-2019-108966', '43749', '43756', 'Standard Class', 'SO-20335', "Sean O'Donnell", 'Consumer', 'United States', 'Fort Lauderdale', 'Florida', '33311', 'South', 'FUR-TA-10000577', 'Furniture', 'Tables', 'Bretford CR4500 Series Slim Rectangular Table', 957.5775, 5, 0.45, -383.031),
(5, 'US-2019-108966', '43749', '43756', 'Standard Class', 'SO-20335', "Sean O'Donnell", 'Consumer', 'United States', 'Fort Lauderdale', 'Florida', '33311', 'South', 'OFF-ST-10000760', 'Office Supplies', 'Storage', "Eldon Fold 'N Roll Cart System", 22.368, 2, 0.2, 2.5164),
(6, 'CA-2018-115812', '43260', '43265', 'Standard Class', 'BH-11710', 'Brosina Hoffman', 'Consumer', 'United States', 'Los Angeles', 'California', '90032', 'West', 'FUR-FU-10001487', 'Furniture', 'Furnishings', 'Eldon Expressions Wood and Plastic Desk Accessories, Cherry Wood', 48.86, 7, 0, 14.1694),
(7, 'CA-2018-115812', '43260', '43265', 'Standard Class', 'BH-11710', 'Brosina Hoffman', 'Consumer', 'United States', 'Los Angeles', 'California', '90032', 'West', 'OFF-AR-10002833', 'Office Supplies', 'Art', 'Newell 322', 7.28, 4, 0, 1.9656),
(8, 'CA-2018-115812', '43260', '43265', 'Standard Class', 'BH-11710', 'Brosina Hoffman', 'Consumer', 'United States', 'Los Angeles', 'California', '90032', 'West', 'TEC-PH-10002275', 'Technology', 'Phones', 'Mitel 5320 IP Phone VoIP phone', 907.152, 6, 0.2, 90.7152),
(9, 'CA-2018-115812', '43260', '43265', 'Standard Class', 'BH-11710', 'Brosina Hoffman', 'Consumer', 'United States', 'Los Angeles', 'California', '90032', 'West', 'OFF-BI-10003910', 'Office Supplies', 'Binders', 'DXL Angle-View Binders with Locking Rings by Samsill', 18.504, 3, 0.2, 5.7825),
(10, 'CA-2018-115812', '43260', '43265', 'Standard Class', 'BH-11710', 'Brosina Hoffman', 'Consumer', 'United States', 'Los Angeles', 'California', '90032', 'West', 'OFF-AP-10002892', 'Office Supplies', 'Appliances', 'Belkin F5C206VTEL 6 Outlet Surge', 114.9, 5, 0, 34.47);