-- Whenever you create a DB, the first step is to define a schema
-- A colon (;) represents an end to a statement
-- W/O the colon, your code won't run.

-- SCHEMA
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    major VARCHAR(20) 
);

-- VERSION 2
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20) NOT NULL,
    major VARCHAR(20) 
);

-- DELETING TABLES
DROP TABLE student;

-- KNOWING THE CONTENTS IN A TABLE
DESCRIBE student;

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
INSERT INTO STUDENT (student_id, student_name, major) VALUES (2, "Ben", "Maths");
INSERT INTO STUDENT (student_id, student_name, major) VALUES (3, "Ken", "Physics");
INSERT INTO STUDENT (student_id, student_name, major) VALUES (4, "Joy", "Chemistry");
INSERT INTO STUDENT (student_id, student_name, major) VALUES (5, "Rita", "Csc");

-- INSERTING MULTIPLE ROWS INTO TABLES
INSERT INTO student VALUES
(1, "John", "Chemistry"),
(2, "Ben", "Physics"),
(3, "Ken", "Maths"),	
(4, "Jack", "Biology"),
(5, "Rita", "Csc");

-- INSERTING MULTIPLE ROWS TO A TABLE (2)
INSERT INTO STUDENT (student_id, student_name, major) VALUES 
(1, "Jack", "English"),
(2, "Ben", "Maths"),
(3, "Ken", "Physics"),
(4, "Joy", "Chemistry"),
(5, "Rita", "Csc");

-- UPDATING SPECIFIC ROWS IN A TABLE
UPDATE student
SET major = "Bio" 
WHERE major = "Biology";

-- DELETING SPECIFIC ROWS IN A TABLE
DELETE FROM student
WHERE student_id = 5;

-- RETRIEVING ALL DATA FROM A TABLE
SELECT * FROM student;