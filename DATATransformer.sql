CREATE DATABASE DataTransformer;
USE DataTransformer;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email) VALUES
(1, 'John', 'Doe', 'john@example.com'),
(2, 'Emma', 'Stone', 'emma@example.com'),
(3, 'Amit', 'Shah', 'amit@example.com'); 


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'Ravi', 'Kumar', 'IT', '2019-11-05', 65000.00);  

SELECT o.OrderID, o.OrderDate, o.TotalAmount,
       c.FirstName, c.LastName 
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;


SELECT c.CustomerID, c.FirstName, c.LastName,
       o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;



SELECT c.CustomerID, c.FirstName, c.LastName,
       o.OrderID, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;


SELECT c.CustomerID, c.FirstName, c.LastName,
       o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID

UNION

SELECT c.CustomerID, c.FirstName, c.LastName,
       o.OrderID, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;


SELECT CustomerID, FirstName, LastName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID FROM Orders
    WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
);


SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


SELECT OrderID, OrderDate,
       YEAR(OrderDate) AS OrderYear,
       MONTH(OrderDate) AS OrderMonth
FROM Orders;


SELECT OrderID, OrderDate,
       DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;


SELECT OrderID, TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% Discount'
        WHEN TotalAmount > 500 THEN '5% Discount'
        ELSE 'No Discount'
    END AS DiscountCategory
FROM Orders;


SELECT EmployeeID, FirstName, Salary,
    CASE
        WHEN Salary > 60000 THEN 'High'
        WHEN Salary BETWEEN 40000 AND 60000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryLevel
FROM Employees;


SELECT EmployeeID, FirstName, Salary,
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;