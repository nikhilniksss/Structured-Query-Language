-- Working with AUTO INCREMENT

SHOW DATABASES;

USE pet_shop;

SHOW TABLES;

DROP TABLE unique_cats;

-- Create unique_cats table with Auto increment key

CREATE TABLE unique_cats(
    cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    age INT
);

DESC unique_cats;

INSERT INTO unique_cats(name,age) VALUES ('kitty',30);
INSERT INTO unique_cats(name,age) VALUES ('kitty',30);
INSERT INTO unique_cats(name,age) VALUES ('kitty',30);
INSERT INTO unique_cats(name,age) VALUES ('kitty',30);
INSERT INTO unique_cats(name,age) VALUES ('kitty',30);
INSERT INTO unique_cats(name,age) VALUES ('kitty',30);

SELECT * FROM unique_cats;

-- Exercise for practice --

CREATE TABLE employees(
    id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(30) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    middle_name VARCHAR(30),
    age INT NOT NULL,
    current_status VARCHAR(30) NOT NULL DEFAULT 'employed'
);

INSERT INTO employees(last_name,first_name,age)
VALUES ('Kumar','Nikhil',32);

SELECT * FROM employees;

-- CRUD Operations --

-- Create
-- Read
-- Update
-- Delete

SHOW TABLES;

CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- READ in CRUD
-- SELECT is a way to Read from database

-- read all the columns
SELECT * FROM cats;

-- read selected one

SELECT name FROM cats;

SELECT name, age FROM cats;

