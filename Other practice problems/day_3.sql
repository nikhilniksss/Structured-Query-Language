-- Exercise
-- Create people table

SELECT database();

USE pet_shop;

CREATE TABLE people (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
)

INSERT INTO people(first_name,last_name,age) VALUES ('Tina','Belcher',13);

SELECT * FROM people;

-- Multiple Insert

INSERT INTO people (first_name,last_name,age)
VALUES ('Linda','Belcher',10),
       ('Philip','Frond',30),
       ('Calvin','Klien',70);

-- Working with NULL

DESC cats; -- NULL saying 'Yes' which means null value is allowed for name and age.

SELECT * FROM cats;

INSERT INTO cats(name) VALUES ('New age');

INSERT INTO cats(name,age) VALUES ();

-- To avoid NULL inserting in the table

CREATE TABLE cats_2 (
    name VARCHAR(20) NOT NULL,
    age INT NOT NULL
)

-- Now let's try to insert with NULL value

INSERT INTO cats_2(name,age) VALUES ('Kitty',NULL);

DESC cats_2;

SELECT * FROM cats_2;

-- Adding Default value in column

CREATE TABLE cats_3(
    name VARCHAR(20) DEFAULT 'Unknown',
    age INT NOT NULL
)

INSERT INTO cats_3(age) VALUES (22);

INSERT INTO cats_3(name,age) VALUES (NULL,10);

INSERT INTO cats_3() VALUES ();

SELECT * FROM cats_3;

-- Primary Key --

CREATE TABLE unique_cats(
    catid INT NOT NULL PRIMARY KEY,
    name VARCHAR(20) DEFAULT 'unknown',
    age INT DEFAULT 99
)

DESC unique_cats;

INSERT INTO unique_cats(catid) VALUES (1);
INSERT INTO unique_cats(catid,name,age) VALUES (1,'test',10);
-- Duplicate entry '1' for key 'unique_cats.PRIMARY'

SELECT * FROM unique_cats;
