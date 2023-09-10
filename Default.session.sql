-- Whenever you create a DB, the first step is to define a schema
-- A colon (;) represents an end to a statement
-- W/O the colon, your code won't run.

-- SCHEMA
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    major VARCHAR(20) 
);

-- VERSION 2 (INCL. CONSTRAINTS)
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT "Undecided"
);

-- USERS SCHEMA
CREATE TABLE users(
    id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    status VARCHAR(20)
);

-- USERS SCHEMA OPT 2
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    status VARCHAR(20)
);


-- DETERMINING THE CONTENTS IN A TABLE
DESCRIBE student;
DESCRIBE users;

-- DELETING TABLES
DROP TABLE student;
DROP TABLE users;

-- ADDING AN EXTRA COLUMN TO AN EXISTING TABLE
ALTER TABLE student ADD gpa DECIMA(3,2);

-- DELETING AN EXISTING COLUMN FROM A TABLE
ALTER TABLE student DROP COLUMN gpa;

-- INSERTING DATA INTO TABLE
INSERT INTO student VALUES (1, "Jack", "English");
INSERT INTO student VALUES (2, "Ben", "Maths");
INSERT INTO student VALUES (3, "Ken", "Physics");
INSERT INTO student VALUES (4, "Joy", "Chemistry");
INSERT INTO student VALUES (5, "Rita", "Csc");

-- SPECIFYING COLUMN TO INSERT DATA INTO
INSERT INTO STUDENT (student_id, student_name, major) VALUES (1, "Jack", "English");
INSERT INTO STUDENT (student_id, student_name) VALUES (2, "Ben");
INSERT INTO STUDENT (student_id, student_name, major) VALUES (3, "Ken", "Physics");
INSERT INTO STUDENT (student_id, student_name, major) VALUES (4, "Joy", "Chemistry");
INSERT INTO STUDENT (student_id, student_name, major) VALUES (5, "Rita", "Csc");

-- INSERTING MULTIPLE ROWS INTO TABLES
INSERT INTO student VALUES
(1, "John", "Chemistry"),
(2, "Ben", "Maths"),
(3, "Ken", "Physics"),	
(4, "Jack", "Biology"),
(5, "Rita", "Csc");

-- INSERTING MULTIPLE ROWS TO A TABLE (2)
INSERT INTO STUDENT (Student_name, major) VALUES 
("Jack", "English"),
("Ben", "Maths"),
("Ken", "Physics"),
("Joy", "Chemistry"),
("Rita", "Csc");

-- INSERTING MULTIPLE ROWS INTO USERS TABLES
INSERT INTO users VALUES
(1, "Ben", "Odoh", 23, "Single"),
(2, "Jane", "Bonnie", 30, "Married"),
(3, "Terry", "Crews", 31, "Married"),
(4, "Aaron", "Savage", 35, "Single"),
(5, "Alice", "Cameron", 24, "Single"),
(6, "Martha", "Anne", 27, "Married");

-- UPDATING SPECIFIC ROWS IN A TABLE
UPDATE student
SET major = "Bio" 
WHERE major = "Biology";

-- DELETING SPECIFIC ROWS IN A TABLE
DELETE FROM student
WHERE major = "undecided";

-- DELETING ALL ROWS IN A TABLE
DELETE FROM student;

-- SELECT STATEMENT
-- RETRIEVING ALL DATA FROM A TABLE
SELECT * FROM student;
SELECT * FROM users;

-- RETRIEVING SPECIFIC COLUMNS FROM A TABLE
SELECT first_name, last_name
FROM users
ORDER BY first_name DESC;