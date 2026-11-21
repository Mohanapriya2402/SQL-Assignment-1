CREATE DATABASE employee;
USE employee;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(30)
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M','F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    location_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
SHOW TABLES;
DESC Departments;
DESC Location;
DESC Employees;
SELECT * FROM Departments;
SELECT * FROM Location;
SELECT * FROM Employees;
ALTER TABLE Employees ADD email VARCHAR(100);
DESC Employees;
ALTER TABLE Employees MODIFY designation VARCHAR(200);
DESC Employees;
ALTER TABLE Employees DROP COLUMN age;
DESC Employees;
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
DESC Employees;
SELECT * FROM Employees;
RENAME TABLE Departments TO Departments_Info;
SHOW TABLES;
DESC Departments_Info;
RENAME TABLE Location TO Locations;
SHOW TABLES;
DESC Locations;
SELECT * FROM Employees;
TRUNCATE TABLE Employees;
SELECT * FROM Employees;
SHOW TABLES;
DROP TABLE Employees;
SHOW TABLES;
DROP DATABASE employee;
SHOW DATABASES;
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO Departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance');
SHOW TABLES;
DESC Departments;
SELECT * FROM Departments;
CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(30) NOT NULL UNIQUE
);
INSERT INTO Location (location_name) VALUES
('Chennai'),
('Coimbatore'),
('Bangalore');
SHOW TABLES;
DESC Location;
SELECT * FROM Location;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    location_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
INSERT INTO Employees
(employee_id, employee_name, gender, age, designation, salary, department_id, location_id)
VALUES
(101,'Arun','M',25,'Analyst',30000,1,1),
(102,'Priya','F',24,'Developer',35000,2,2),
(103,'Karthik','M',28,'Manager',45000,2,3),
(104,'Divya','F',26,'Accountant',32000,3,1),
(105,'Rahul','M',30,'HR Executive',40000,1,2);
SHOW TABLES;
DESC Employees;
SELECT * FROM Employees;
