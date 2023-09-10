-- NOTE THAT QUERIES BELOW DO NOT RUN SEQUENTIALLY BUT ARE EXECUTED ONE AT A TIME AND AT TIMES RANDOMLY

-- COMPANY DB SCHEMA
-- EMPLOYEES SCHEMA
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(40),
    age INT,
    sex VARCHAR(1),
    salary DECIMAL(10,2),
    super_id INT,
    branch_id INT
);

-- BRANCH SCHEMA
CREATE TABLE branch(
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(40),
    manager_id INT,
    FOREIGN KEY(manager_id) REFERENCES employees(emp_id) ON DELETE SET NULL
);

-- CLIENT SCHEMA
CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id)
    REFERENCES branch(branch_id)
    ON DELETE SET NULL
);

-- WORKS_WITH SCHEMA
CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales DECIMAL(10,2),
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supplier_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id)
    REFERENCES branch(branch_id)
    ON DELETE CASCADE
);

-- DETERMINING THE CONTENTS IN A TABLE
DESCRIBE employees;
DESCRIBE branch;
DESCRIBE client;
DESCRIBE works_with;
DESCRIBE branch_supplier;

-- DELETING TABLES
DROP TABLE employees;
DROP TABLE branch;
DROP TABLE client;
DROP TABLE works_with;
DROP TABLE branch_supplier;

-- ADDING BRANCH ID AS FOREIGN KEY TO EMPLOYEE TABLE
ALTER TABLE employees
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

-- ADDING SUPER ID AS FOREIGN KEY TO EMPLOYEE TABLE
ALTER TABLE employees
ADD FOREIGN KEY(super_id)
REFERENCES employees(emp_id)
ON DELETE SET NULL;

-- INSERTING DATA INTO TABLES
-- INSERTING DATA INTO EMPLOYEES TABLES
-- INSERTING DATA FOR EMPLOYEES IN CORPORATE BRANCH
INSERT INTO employees VALUES(100, "John Cooper", 50, "M", 390000.00, NULL, NULL);
-- branch id had no values as no entry has been made for branch table
INSERT INTO employees VALUES(101, "Pete Davidson", 28, "M", 280000.00, 100, 1);
INSERT INTO employees VALUES(102, "Doyle Letterman", 45, "M", 190000.00, 100, 1);
INSERT INTO employees VALUES(103, "Meghan Alex", 32, "F", 325000.00, 102, 1);
INSERT INTO employees VALUES(104, "Andy Sherpherd", 27, "M", 200000.00, 102, NULL);
-- Updating all other entries in abuja branch
INSERT INTO employees VALUES
(105, "Ashley Hudson", 40, "F", 360000.00, 102, 2),
(106, "Carlos Sanchex", 41, "M", 215000.00, 100, 2);

-- CREATING CORPORATE BRANCH
INSERT INTO branch VALUES(1, "Corporate", 100);

-- CREATING ABUJA BRANCH
INSERT INTO branch VALUES(2, "abuja", 102);

-- WE CAN THEN GO AHEAD AND UPDATE EMPLOYEES TABLE WITH CORPORATE'S BRANCH ID AS IT HAS NOW BEEN CREATED
UPDATE employees
SET branch_id = 1
WHERE emp_id = 100;

-- UPDATING EMPLOYEES TABLE WITH ABUJA'S BRANCH ID
UPDATE employees
SET branch_id = 2
WHERE emp_id = 104;

SELECT *
FROM employees;

SELECT *
FROM branch;
