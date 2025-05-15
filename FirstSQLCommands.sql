CREATE DATABASE IF NOT EXISTS CollageDb;
USE CollageDb;

SELECT DATABASE();

CREATE TABLE Students(
	StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Age TINYINT,
    Email VARCHAR(100),
    JoinDate DATE
);

SELECT * FROM Students;

INSERT INTO Students(Name, Age, Email, JoinDate)
VALUES
('Amit Gupta', 22, 'amit@gmail.com', '2024-05-06'),
('Aditi Sharma', 20, 'aditi@gmail.com', '2024-01-04')
;

ALTER TABLE Students ADD COLUMN City VARCHAR(50);
ALTER TABLE Students MODIFY Age SMALLINT;
ALTER TABLE Students RENAME COLUMN Email TO StudentEmail;

-- DROP TABLE IF EXISTS Students;

TRUNCATE TABLE Students;

SELECT Name FROM Students;





CREATE DATABASE ShopDb;
USE ShopDb;

CREATE TABLE Customers(
	CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) unique,
    Address VARCHAR(200)
);

SELECT * FROM Customers;

INSERT INTO Customers(Name, Email, Address) 
VALUES
('Samiran Samanta', 'samiran@gmail.com', 'WB, Kolaghat, Purba Mednipur, 721154'),
('Neha Varma', 'neha@gmail.com', 'Delhi, India'),
('Rahul Varma', 'rahul@gmail.com', 'Delhi, India'),
('Zephirus The God', 'zephirus@gmail.com', 'Panjab, India');

SELECT * FROM Customers;
SELECT DISTINCT Address FROM Customers;

SELECT * FROM Customers WHERE Address LIKE '%Delhi%';
SELECT Name, Email FROM Customers WHERE Address LIKE '%Panjab%';
SELECT * FROM Customers WHERE Name='Samiran Samanta' AND Address Like '%WB%';
SELECT * FROM Customers WHERE Address NOT Like '%Delhi%';

SELECT * FROM Customers ORDER BY Name ASC;
SELECT * FROM Customers ORDER BY CustomerID DESC;

SET SQL_SAFE_UPDATES = 0;
UPDATE Customers SET Email = 'zephirus2004@gmail.com' WHERE Name = 'Zephirus The God';
SELECT * FROM Customers WHERE Name = 'Zephirus The God';

DELETE FROM Customers WHERE Name = 'Neha Varma';
SELECT * FROM Customers;



CREATE TABLE Sales(
	SalesID INT AUTO_INCREMENT PRIMARY KEY,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Amount DECIMAL(10, 2),
    SalesDate DATE
);
SELECT * FROM Sales;

INSERT INTO Sales(Product, Category, Amount, SalesDate)
VALUES
('Pen', 'Stationary', 25.00, '2025-03-20'),
('NoteBook', 'Stationary', 50.00, '2025-03-20'),
('Mouse', 'Electronics', 500.00, '2025-04-10'),
('Keyboard', 'Electronics', 670.00, '2025-04-10'),
('Charger', 'Electronics', 300.00, '2025-04-12'),
('bag', 'Accessories', 1000.00, '2025-04-15');
SELECT * FROM Sales;

SELECT COUNT(*) FROM Sales;
SELECT SUM(Amount) FROM Sales;
SELECT AVG(Amount) FROM Sales;
SELECT MIN(Amount) FROM Sales;
SELECT MAX(Amount) FROM Sales;
SELECT MIN(Amount), MAX(Amount) FROM Sales;


CREATE DATABASE IF NOT EXISTS RetailStore;
USE RetailStore;

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
    Product VARCHAR(100),
    Amount DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Customer Table
INSERT INTO Customers VALUES
(1, 'Rahul Sharma'),
(2, 'Anjali Mehata'),
(3, 'Amit Verma'),
(4, 'Samiran Samanta');
SELECT * FROM Customers;

-- Orders Table
INSERT INTO Orders VALUES
(101, 'Laptop', 50000, 2),
(102, 'Mouse', 500, 1),
(103, 'Keyboard', 700, 1),
(104, 'Monitor', 12000, NULL);
SELECT * FROM Orders;

-- Inner Join
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Left Join
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Right Join
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Full Outer Join simulation using UNION of LEFT and RIGHT JOIN
-- Left Join
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
-- Right Join
SELECT Customers.CustomerName, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
