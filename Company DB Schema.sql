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

-- RETRIEVING DATA FROM TABLES
SELECT *
FROM employees;

SELECT *
FROM branch;

SELECT *
FROM branch_supplier;

SELECT *
FROM client;

SELECT *
FROM works_with;

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

-- DATA ENTRY FOR EMPLOYEES TABLE
-- INSERTING DATA FOR EMPLOYEE/MANAGER IN CORPORATE BRANCH
INSERT INTO employees VALUES(100, "John Cooper", 50, "M", 390000.00, NULL, NULL);
-- branch id had no values as no entry has been made for branch table
-- UPDATING ALL OTHER ENTRIES FOR EMPLOYEES IN LAGOS BRANCH
INSERT INTO employees VALUES(101, "Pete Davidson", 28, "M", 280000.00, 100, 1);
INSERT INTO employees VALUES(102, "Doyle Letterman", 45, "M", 190000.00, 100, 1);
INSERT INTO employees VALUES(103, "Meghan Alex", 32, "F", 325000.00, 102, 1);
-- INSERTING DATA FOR EMPLOYEE/MANAGER IN ABUJA BRANCH
INSERT INTO employees VALUES(104, "Andy Sherpherd", 27, "M", 200000.00, 102, NULL);
-- UPDATING ALL OTHER ENTRIES FOR EMPLOYEES IN ABUJA BRANCH
INSERT INTO employees VALUES
(105, "Ashley Hudson", 40, "F", 360000.00, 102, 2),
(106, "Carlos Sanchex", 41, "M", 215000.00, 100, 2);
-- INSERTING DATA FOR EMPLOYEE/MANAGER IN LONDON BRANCH
INSERT INTO employees VALUES(107, "London Bershley", 24, "F", 350000.00, 106, NULL);
-- UPDATING ALL OTHER ENTRIES FOR EMPLOYEES IN LONDON BRANCH
INSERT INTO employees VALUES
(108, "Michael Scott", 27, "M", 180000.00, 106, 3);

-- CREATING CORPORATE BRANCH
INSERT INTO branch VALUES(1, "Corporate", 100);

-- CREATING ABUJA BRANCH
INSERT INTO branch VALUES(2, "abuja", 102);

-- CREATING LONDON BRANCH
INSERT INTO branch VALUES(3, "london", 107);

-- WE CAN THEN GO AHEAD AND UPDATE EMPLOYEES TABLE WITH CORPORATE'S BRANCH ID AS IT HAS NOW BEEN CREATED
UPDATE employees
SET branch_id = 1
WHERE emp_id = 100;

-- UPDATING EMPLOYEES TABLE WITH ABUJA'S BRANCH ID
UPDATE employees
SET branch_id = 2
WHERE emp_id = 104;

-- UPDATING EMPLOYEES TABLE WITH LONDON'S BRANCH ID
UPDATE employees
SET branch_id = 3
WHERE emp_id = 107;

-- CREATING A DUMMY BRANCH
INSERT INTO branch VALUES
(4, "Chicago", NULL);

-- DELETING DUMMY BRANCH
DELETE FROM branch
WHERE branch_id = 4;


-- DATA ENTRY FOR BRANCH_SUPPLIER TABLE
INSERT INTO branch_supplier VALUES
(2, "Hammer Mill", "Paper"),
(2, "Uni Ball", "Writing Utensils"),
(3, "Patriot Paper", "Paper"),
(3, "J.T Forms & Labels", "Custom Forms"),
(1, "Hammer Mill", "Paper"),
(2, "Stamford Labels", "CustOm Forms"),
(3, "Uni Ball", "Writing Utensils");


-- DATA ENTRY FOR CLIENT TABLE
INSERT INTO client VALUES
(400, "Dufil International", 1),
(401, "Times Newspaper", 1),
(402, "Fed Ex", 2),
(403, "Unilever Nig Plc", 2),
(404, "Nestle", 2),
(405, "Fed Ex", 3),
(406, "Procter & Gamble", 3),
(407, "Nestle", 3),
(408, "Kraft Heinz", 3);

-- DATA ENTRY FOR WORKS_WITH TABLE
INSERT INTO works_with VALUES
(102, 400, 370000.00),
(103, 401, 300000.00),
(104, 402, 500000.00),
(105, 403, 480000.00),
(106, 404, 140000.00),
(107, 405, 900000.00),
(107, 406, 650000.00),
(108, 407, 370000.00),
(108, 408, 700000.00);


-- BASIC QUERIES
-- find all employees ordered by salaries, ranked from highest to lowest
SELECT *
FROM employees
ORDER BY salary DESC;

-- find all employees ordered by sex, then name
SELECT *
FROM employees
ORDER BY sex, name;

-- find the first five employees
SELECT *
FROM employees
LIMIT 5;
-- OR
SELECT *
FROM employees
WHERE emp_id <=104;

-- find out all the different genders in employees table
SELECT DISTINCT sex
FROM employees;

-- find the total number of employees
SELECT COUNT(emp_id)
FROM employees;

-- find the total number of male employees aged 35 and below
SELECT COUNT(emp_id)
FROM employees
WHERE sex = "M" AND age <=35;

-- find the average of all employees' salaries
SELECT AVG(salary)
FROM employees;

-- find the sum of all employees' salary
SELECT SUM(salary)
FROM employees;

-- find out how much all male and female employees make
SELECT sex, SUM(salary)
FROM employees
GROUP BY sex;

-- find the total sales from each salesman
SELECT emp_id, SUM(total_sales)
FROM works_with
GROUP BY emp_id;

-- find the total income received from each client
SELECT client_id, SUM(total_sales)
FROM works_with
GROUP BY client_id;

-- WILDCARDS
-- find employees whose name begins with A
SELECT emp_id, name
FROM employees
WHERE name LIKE "A%";

SELECT emp_id, name
FROM employees
WHERE name LIKE "%shley";

-- find employee whose name ends with "per"
SELECT emp_id, name
FROM employees
WHERE name LIKE "_____Coo%";


-- UNION
-- find a list of all clients and branch suppliers' names
SELECT client_name AS name, client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;


-- JOINS
-- find all branches and the names of their managers
-- it is best practice to use the dot notation where there are multiple tables being referenced
SELECT  employees.emp_id, employees.name AS manager_name, branch.branch_name
FROM employees
JOIN branch
ON employees.emp_id = branch.manager_id;
-- the above shows a relationship between the employees and branch tables