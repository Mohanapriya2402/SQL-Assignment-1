# 🗄️ MySQL Assignment 1 – DDL Commands & Constraints

## 📌 Project Overview

This project focuses on designing and managing an Employee Database using MySQL. The main objective is to understand and implement Data Definition Language (DDL) commands and database constraints to create, modify, and manage relational database objects while maintaining data integrity and consistency.

The project involves creating databases and tables, modifying table structures, renaming tables, truncating records, dropping database objects, and implementing constraints such as PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT, and AUTO_INCREMENT.

This project is part of my learning journey as an **Aspiring Data Analyst**, where I am developing practical SQL skills through hands-on assignments.

## 🎯 Project Objectives

- Create and manage a database using MySQL.
- Create relational tables with appropriate data types.
- Apply DDL commands to modify table structures.
- Add, modify, rename, and drop columns.
- Rename database tables.
- Perform table truncation and database deletion.
- Implement database constraints.
- Establish relationships using primary and foreign keys.
- Maintain data integrity and consistency.
- Insert sample records and verify table structures.

## 🛠️ Tools & Technologies

- **MySQL** – Relational database management
- **MySQL Workbench** – SQL query execution and database management
- **SQL** – Database creation, modification, and constraint implementation

## 📂 Database Structure

**Database Name:** `employee`

This project contains three relational tables:

### 1. Departments Table

| Column Name | Data Type | Constraint |
|---|---|---|
| department_id | INT | PRIMARY KEY |
| department_name | VARCHAR(100) | NOT NULL, UNIQUE |

Stores department information within the organization.

### 2. Location Table

| Column Name | Data Type | Constraint |
|---|---|---|
| location_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| location_name | VARCHAR(30) | NOT NULL, UNIQUE |

Stores unique office location information.

### 3. Employees Table

| Column Name | Data Type | Constraint |
|---|---|---|
| employee_id | INT | PRIMARY KEY |
| employee_name | VARCHAR(50) | NOT NULL |
| gender | ENUM('M','F') | ENUM |
| age | INT | CHECK (age >= 18) |
| hire_date | DATE | DEFAULT CURRENT_DATE |
| designation | VARCHAR(100) | — |
| salary | DECIMAL(10,2) | — |
| department_id | INT | FOREIGN KEY |
| location_id | INT | FOREIGN KEY |

Stores employee information and connects employees with their respective departments and locations.

## 📝 Tasks Performed

# 1. DDL Commands

### 🔹 Database Creation – CREATE

Created a database named `employee` and selected it for further operations.

```sql
CREATE DATABASE employee;

USE employee;
```

### 🔹 Table Creation – CREATE TABLE

Created three tables:

- Departments
- Location
- Employees

Defined appropriate data types, primary keys, and foreign key relationships.

```sql
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
```

### 🔹 Table Modification – ALTER

Performed different ALTER TABLE operations on the Employees table.

**Added a new email column:**

```sql
ALTER TABLE Employees
ADD email VARCHAR(100);
```

**Modified the designation column:**

```sql
ALTER TABLE Employees
MODIFY designation VARCHAR(200);
```

**Dropped the age column:**

```sql
ALTER TABLE Employees
DROP COLUMN age;
```

**Renamed hire_date to date_of_joining:**

```sql
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
```

### 🔹 Table Renaming – RENAME

Renamed the existing tables as required.

```sql
RENAME TABLE Departments
TO Departments_Info;
```

```sql
RENAME TABLE Location
TO Locations;
```

### 🔹 Table Truncation – TRUNCATE

Removed all records from the Employees table while retaining its structure.

```sql
TRUNCATE TABLE Employees;
```

### 🔹 Database and Table Deletion – DROP

Dropped the Employees table and deleted the employee database.

```sql
DROP TABLE Employees;

DROP DATABASE employee;
```

# 2. Database Constraints

After completing the initial DDL operations, recreated the employee database and implemented the required constraints.

### 🔹 Database Recreation

```sql
DROP DATABASE IF EXISTS employee;

CREATE DATABASE employee;

USE employee;
```

### 🔹 Departments Table Constraints

Applied the following constraints:

- PRIMARY KEY – Ensures unique department identification.
- NOT NULL – Prevents missing department names.
- UNIQUE – Prevents duplicate department names.

```sql
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
        NOT NULL UNIQUE
);
```

Inserted sample department records:

- HR
- IT
- Finance

### 🔹 Location Table Constraints

Applied the following constraints:

- PRIMARY KEY – Ensures unique location IDs.
- AUTO_INCREMENT – Automatically generates sequential location IDs.
- NOT NULL – Prevents missing location names.
- UNIQUE – Prevents duplicate location names.

```sql
CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(30)
        NOT NULL UNIQUE
);
```

Inserted sample locations:

- Chennai
- Coimbatore
- Bangalore

### 🔹 Employees Table Constraints

Implemented the following constraints:

**PRIMARY KEY**

Ensures that each employee has a unique employee ID.

**NOT NULL**

Ensures that employee names are always provided.

**ENUM**

Restricts gender values to 'M' or 'F'.

**CHECK**

Ensures that employee age is 18 or above.

**DEFAULT**

Automatically assigns the current date to hire_date when no date is provided.

**FOREIGN KEY**

Establishes relationships between the Employees table and the Departments and Location tables.

```sql
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

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
```

# 3. Sample Data Insertion

Inserted sample records into the three tables to verify database creation and relationships.

### Departments

| Department ID | Department Name |
|---|---|
| 1 | HR |
| 2 | IT |
| 3 | Finance |

### Locations

| Location ID | Location Name |
|---|---|
| 1 | Chennai |
| 2 | Coimbatore |
| 3 | Bangalore |

### Employees

| Employee ID | Employee Name | Gender | Age | Designation | Salary |
|---|---|---|---:|---|---:|
| 101 | Arun | M | 25 | Analyst | 30000 |
| 102 | Priya | F | 24 | Developer | 35000 |
| 103 | Karthik | M | 28 | Manager | 45000 |
| 104 | Divya | F | 26 | Accountant | 32000 |
| 105 | Rahul | M | 30 | HR Executive | 40000 |

## 🔗 Database Relationships

Established foreign key relationships between the three tables.

- Employees.department_id → Departments.department_id
- Employees.location_id → Location.location_id

These relationships maintain referential integrity and connect employee records with their corresponding departments and locations.

## 🧠 SQL Concepts Demonstrated

| SQL Command / Constraint | Purpose |
|---|---|
| CREATE DATABASE | Creates a database |
| CREATE TABLE | Creates database tables |
| ALTER TABLE | Modifies table structures |
| ADD COLUMN | Adds a new column |
| MODIFY | Changes column data type |
| DROP COLUMN | Removes a column |
| RENAME | Renames database tables |
| TRUNCATE | Removes all table records |
| DROP | Deletes database objects |
| PRIMARY KEY | Uniquely identifies records |
| FOREIGN KEY | Establishes table relationships |
| UNIQUE | Prevents duplicate values |
| NOT NULL | Prevents null values |
| CHECK | Enforces specified conditions |
| DEFAULT | Assigns a default value |
| AUTO_INCREMENT | Generates sequential identifiers |
| ENUM | Restricts values to predefined options |

## 🎓 Learning Outcomes

Through this assignment, I gained practical experience in:

- Database creation and management.
- Designing relational database tables.
- Understanding primary and foreign key relationships.
- Modifying database structures using ALTER.
- Managing database objects using RENAME, TRUNCATE, and DROP.
- Implementing constraints to maintain data integrity.
- Inserting and verifying sample records.
- Executing SQL queries using MySQL Workbench.

## 📁 Project Structure

```text
MySQL-Assignment-1-DDL-Constraints/
│
├── README.md
│
└── SQL 1.sql
```

## 👩‍💻 About Me

I am an **Aspiring Data Analyst** developing my technical and analytical skills through practical assignments and hands-on projects.

My current learning journey includes:

**Microsoft Excel | MySQL | Python | Power BI | DAX | Data Analytics**

I believe in learning by doing, and this project is part of my growing Data Analyst portfolio.

---

⭐ Thank you for visiting my project!
