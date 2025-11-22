# DataTransformer SQL Project

This repository contains SQL scripts demonstrating **database
creation**, **table design**, **joins**, **subqueries**, **window
functions**, and **conditional logic** using MySQL.\
The project is structured around three main entities: **Customers**,
**Orders**, and **Employees**.

------------------------------------------------------------------------

## 📌 Database Overview

### Database Created:

    CREATE DATABASE DataTransformer;
    USE DataTransformer;

------------------------------------------------------------------------

## 🧱 Tables Included

### 1. Customers

Stores customer details.

    CustomerID (PK)
    FirstName
    LastName
    Email

### 2. Orders

Stores customer order records.

    OrderID (PK)
    CustomerID (FK → Customers.CustomerID)
    OrderDate
    TotalAmount

### 3. Employees

Stores employee information.

    EmployeeID (PK)
    FirstName
    LastName
    Department
    HireDate
    Salary

------------------------------------------------------------------------

## 📥 Sample Data Inserted

### Customers

3 sample customers (John, Emma, Amit)

### Orders

2 sample orders linked to Customers

### Employees

3 employees in different departments with varied salaries

------------------------------------------------------------------------

## 🔍 SQL Queries Included

### 1. **INNER JOIN**

Fetch orders with matching customer details.

### 2. **LEFT JOIN**

Fetch all customers along with available orders.

### 3. **RIGHT JOIN**

Fetch all orders with their corresponding customers.

### 4. **FULL OUTER JOIN Simulation**

Using `UNION` of left + right join.

### 5. **Subqueries**

-   Customers whose order total is above average\
-   Employees earning above average salary

### 6. **Date Functions**

Extract: - Year\
- Month\
Calculate: - Days difference between today and order date

### 7. **CASE Expressions**

-   Discount categories based on TotalAmount\
-   Salary level classification

### 8. **Window Functions**

Ranking employees by salary using:

    RANK() OVER (ORDER BY Salary DESC)

------------------------------------------------------------------------

## 📦 How to Use

1.  Copy the SQL script into MySQL Workbench, phpMyAdmin, XAMPP, or any
    MySQL environment.\
2.  Execute step-by-step:
    -   Create database\
    -   Create tables\
    -   Insert data\
    -   Run queries\
3.  Modify or expand for learning SQL transformations.

------------------------------------------------------------------------

## 📁 Suggested Files for Repository

-   `schema.sql` --- contains CREATE + INSERT statements\
-   `queries.sql` --- contains all SELECT, JOIN, CASE, WINDOW queries\
-   `README.md` --- documentation (this file)

------------------------------------------------------------------------

## ✨ Author

Created by **Harsh Raychur**.\
This project is intended for SQL learning and transformation practice.

------------------------------------------------------------------------

## 📜 License

This project is free to use for learning and educational purposes.
