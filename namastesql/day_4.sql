/* Check constraint to accept value from the provided list

- first drop existing table
- Check constraints can be added using Alter statement

*/

USE namastesql;

DROP TABLE a_orders;

-- CHeck constraints on payment_method

CREATE TABLE a_orders(
    order_id INT NOT NULL,
    order_date DATE,
    product_name VARCHAR(30),
    total_price DECIMAL(6,2),
    payment_method VARCHAR(20) CHECK (payment_method IN ('upi','emi','cash','card'))
);

SELECT * FROM a_orders;

INSERT INTO a_orders VALUES(1,'2024-01-30','iphone 16','99.20','delivery');
--3819 (HY000): Check constraint 'a_orders_chk_1' is violated.

INSERT INTO a_orders VALUES(1,'2024-01-30','iphone 16','99.20','cash');

-- Unique constraints : this will not allow the value to repeat in column

CREATE TABLE a_orders(
    order_id INT NOT NULL UNIQUE,
    order_date DATE,
    product_name VARCHAR(30),
    total_price DECIMAL(6,2),
    payment_method VARCHAR(20) CHECK (payment_method IN ('upi','emi','cash','card'))
);

INSERT INTO a_orders VALUES(1,'2024-01-30','iphone 16','99.20','cash');
INSERT INTO a_orders VALUES(1,'2024-01-30','iphone 17','99.20','cash');
--1062 (23000): Duplicate entry '1' for key 'a_orders.order_id'

-- Default Constraints

CREATE TABLE a_orders(
    order_id INT NOT NULL UNIQUE,
    order_date DATE,
    product_name VARCHAR(30),
    total_price DECIMAL(6,2),
    payment_method VARCHAR(20) CHECK (payment_method IN ('upi','emi','cash','card')),
    discount INT CHECK (discount <= 20),
    category VARCHAR(30) DEFAULT 'Mens wear'
);

SELECT * FROM a_orders;

-- for default constraints we need to add the column name in insert statement

INSERT INTO a_orders (order_id,order_date,product_name,total_price,payment_method,discount) 
VALUES(2,'2024-01-30','cloth','99.20','cash',20);

INSERT INTO a_orders VALUES(3,'2024-01-30','cloth','9.20','emi',20,DEFAULT);

-- Primary Key Constraints
-- It can't be null and always unique
-- Primary Key can be applied on more than 1 column

CREATE TABLE a_orders(
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_name VARCHAR(30),
    total_price DECIMAL(6,2),
    payment_method VARCHAR(20) CHECK (payment_method IN ('upi','emi','cash','card')),
    discount INT CHECK (discount <= 20),
    category VARCHAR(30) DEFAULT 'Mens wear'
);

INSERT INTO a_orders VALUES(1,'2024-01-30','cloth','9.20','emi',20,DEFAULT);

INSERT INTO a_orders VALUES(null,'2024-01-30','cloth','9.20','emi',20,DEFAULT);
-- Column 'order_id' cannot be null

INSERT INTO a_orders VALUES(1,'2024-01-30','cloth','9.20','emi',20,DEFAULT);
--Duplicate entry '1' for key 'a_orders.PRIMARY'

-- Update statement

UPDATE a_orders SET category = 'Kids Wear';

UPDATE a_orders SET category = 'Mens wear', payment_method = 'cash' WHERE order_id =1;

SELECT * FROM a_orders;
