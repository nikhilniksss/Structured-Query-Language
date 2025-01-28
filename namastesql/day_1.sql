-- create database --

CREATE DATABASE namastesql;

USE namastesql;

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

SELECT * FROM amazon_orders;

-- selecting top 1 values from table

SELECT * FROM amazon_orders LIMIT 1;

---------------- sorting the data ------------------

-- Descending order
SELECT * FROM amazon_orders ORDER BY order_date DESC;

-- Ascending order
SELECT * FROM amazon_orders ORDER BY order_date ASC;

-- by product name
SELECT * FROM amazon_orders ORDER BY product_name ASC;












