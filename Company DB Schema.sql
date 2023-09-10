-- COMPANY DB SCHEMA
-- EMPLOYEES SCHEMA
CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
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
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(24),
    branch_id INT,
    FOREIGN KEY(branch_id)
    REFERENCES branch(branch_id)
    ON DELETE SET NULL
);

-- WORKS_WITH SCHEMA
CREATE TABLE works_with(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    total_sales DECIMAL(10,2)
);

CREATE TABLE branch_supplier(
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(20),
    supplier_type VARCHAR(20)
);

-- DETERMINING THE CONTENTS IN A TABLE
DESCRIBE employees;
DESCRIBE branch;
DESCRIBE client;

-- DELETING TABLES
DROP TABLE employees;

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
