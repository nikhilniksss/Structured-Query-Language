/* See databases */

SHOW DATABASES;

/* Drop database */

DROP DATABASE pet_shop;

/* use the database */

CREATE DATABASE pet_shop;

/* Check the current selected datbase */

SELECT database();

/* Change the working database */

USE pet_shop;

/* Check again */

SELECT database();

/* Creating table */

CREATE TABLE cats (name VARCHAR(10),age INT);

SHOW TABLES;

/* looking at columns of table */

SHOW COLUMNS FROM cats;

DESC cats;


-- Dropping tables

DROP TABLE cats;

SHOW TABLES;

-- Insert into TABLE

INSERT INTO cats (name, age) VALUES ('Jetson',7); 

SELECT * FROM cats;

-- mutiple insert

INSERT INTO cats (name, age) 
VALUES ('Tom',8),
       ('Dick',9),
       ('Harry',10);

-- Now What

SELECT * FROM cats LIMIT 5;


