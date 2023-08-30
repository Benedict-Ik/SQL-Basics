-- Schema
CREATE TABLE student(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    major VARCHAR(20)
);

-- Option 2
CREATE TABLE student(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20) NOT NULL,
    major VARCHAR(20)
);

-- Determining contents in a table
DESCRIBE student;

-- Deleting Table
DROP TABLE student;

-- Adding an extra column to an existing table
ALTER TABLE student ADD gpa DECIMAL(10,2);

-- Deleting an existing column in a Table
ALTER TABLE student DROP COLUMN gpa;

-- Inserting data into Tables
INSERT INTO student VALUES(
    1, "John", "Chemistry"
);

INSERT INTO student VALUES(
    2, "Ben", "Physics"
);

INSERT INTO student VALUES(
    3, "Ken", "Maths"
);

-- Inserting multiple data into Tables
INSERT INTO student VALUES
(1, "John", "Chemistry"),
(2, "Ben", "Physics"),
(3, "Ken", "Maths"),
(4, "Jack", "Biology"),
(5, "Rita", "Csc");

-- Inserting multiple data into Tables (Option 2)
INSERT INTO table_name (column1, column2, column3,etc)
VALUES 
	(value1, value2, value3, etc),
    (value1, value2, value3, etc),
    (value1, value2, value3, etc);

-- Inserting multiple data into Tables
INSERT INTO student (student_id, student_name, major)
VALUES 
    (1, "John", "Chemistry"),
    (2, "Ben", "Physics"),
    (3, "Ken", "Maths"),
    (4, "Jack", "Biology"),
    (5, "Rita", "Csc");

-- Retrieving all data from table
SELECT * FROM student;