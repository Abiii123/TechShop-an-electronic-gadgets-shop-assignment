--Create the database named "TechShop"

Create database TechShop

--Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables based on the provided schema.
--creating database tables for customers,Products,orders,orderDetails,Inventory

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
Email nvarchar(100),
Phone nvarchar(20),
Address nvarchar(255)
);

Create TABLE Products(
ProductID INT PRIMARY KEY ,
ProductName NVARCHAR(100),
Description NVARCHAR(300),
Price Decimal(10,2)
);

Create TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount Decimal(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

Create TABLE OrderDetails(
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

CREATE TABLE Inventory(
InventoryID INT PRIMARY KEY,
ProductID INT,
QuantityInStock INT,
LeastStockUpdate DATE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

--Inserting Sample Data into the tables created

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(101, 'John', 'Doe', 'john.doe@email.com', '9876543210', '123 Maple Street'),
(102, 'Jane', 'Smith', 'jane.smith@email.com', '9876543211', '456 Oak Avenue'),
(103, 'Robert', 'Brown', 'robert.brown@email.com', '9876543212', '789 Pine Road'),
(104, 'Emily', 'Davis', 'emily.davis@email.com', '9876543213', '321 Birch Blvd'),
(105, 'Michael', 'Wilson', 'michael.wilson@email.com', '9876543214', '654 Cedar Lane'),
(106, 'Laura', 'Johnson', 'laura.johnson@email.com', '9876543215', '987 Elm Court'),
(107, 'David', 'Clark', 'david.clark@email.com', '9876543216', '159 Spruce Circle'),
(108, 'Emma', 'Hall', 'emma.hall@email.com', '9876543217', '753 Fir Place'),
(109, 'Daniel', 'Lopez', 'daniel.lopez@email.com', '9876543218', '852 Walnut Way'),
(110, 'Olivia', 'Lee', 'olivia.lee@email.com', '9876543219', '951 Poplar Street');

INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(201, 'Smartphone A1', 'Android smartphone with 64GB storage', 19999.99),
(202, 'Laptop L2', '14-inch laptop with Intel i5', 49999.00),
(203, 'Bluetooth Speaker', 'Portable speaker with bass', 2499.99),
(204, 'Smartwatch S1', 'Fitness tracker with heart rate sensor', 3499.00),
(205, 'Tablet T5', '10-inch Android tablet', 17999.50),
(206, 'Wireless Earbuds', 'Noise-cancelling earbuds', 3999.00),
(207, 'Gaming Console G1', 'Gaming console 1TB storage', 34999.99),
(208, 'Power Bank 10K', 'Fast-charging 10000mAh power bank', 999.00),
(209, 'Smart TV 40"', '40-inch Full HD Smart TV', 27999.00),
(210, 'Keyboard & Mouse', 'Wireless combo set', 1499.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(301, 101, '2025-06-01', 23498.99),
(302, 102, '2025-06-02', 49999.00),
(303, 103, '2025-06-03', 4999.98),
(304, 104, '2025-06-04', 3999.00),
(305, 105, '2025-06-05', 34999.99),
(306, 106, '2025-06-06', 35999.00),
(307, 107, '2025-06-07', 1499.00),
(308, 108, '2025-06-08', 999.00),
(309, 109, '2025-06-09', 27999.00),
(310, 110, '2025-06-10', 41998.99);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(401, 301, 201, 1),
(402, 301, 204, 1),
(403, 302, 202, 1),
(404, 303, 203, 2),
(405, 304, 206, 1),
(406, 305, 207, 1),
(407, 306, 205, 2),
(408, 307, 210, 1),
(409, 308, 208, 1),
(410, 310, 206, 2);


INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LeastStockUpdate) VALUES
(501, 201, 50, '2025-06-01'),
(502, 202, 30, '2025-06-01'),
(503, 203, 100, '2025-06-01'),
(504, 204, 70, '2025-06-01'),
(505, 205, 40, '2025-06-01'),
(506, 206, 60, '2025-06-01'),
(507, 207, 20, '2025-06-01'),
(508, 208, 200, '2025-06-01'),
(509, 209, 25, '2025-06-01'),
(510, 210, 150, '2025-06-01');

---ERD DIAGRAM CREATED 

---Tasks 2: Select, Where, Between, AND, LIKE

SELECT FirstName,LastName,EMail from Customers

SELECT o.OrderID,o.OrderDate,c.FirstName,c.LastName FROM Orders o join Customers c ON o.CustomerID = c.CustomerID

INSERT INTO Customers ( CustomerID,FirstName,LastName,Email,Address) VALUES (111, 'Arun', 'Kumar', 'arun.kumar@email.com', '101 Palm Street');

UPDATE Products
SET Price = Price*1.10;

DELETE FROM OrderDetails where OrderID = 304;
DELETE FROM Orders WHERE OrderID = 304;

INSERT INTO Orders (OrderID,CustomerID,OrderDate,TotalAmount) VALUES (311,105,'2025-06-12',1300.00);

UPDATE Customers 
SET Email = 'newcust.omer@exapmle.com',
Address='Chennai Road'
Where CustomerID = 105;

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
);

DELETE FROM OrderDetails WHERE OrderID IN ( SELECT OrderID FROM Orders where CustomerID = 109)
DELETE FROM Orders Where CustomerID = 110

INSERT INTO Products(ProductID,ProductName,Description,Price)
Values(211,'VR Headset','Immersive virtual reality headset with controllers', 15900.00);

ALTER TABLE Orders ADD Status Varchar(20);
UPDATE Orders
SET Status = 'Shipped'
Where OrderID = 305

ALTER TABLE Customers ADD OrderCount INT Default 0;
UPDATE Customers
SET OrderCount = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

---Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:

SELECT o.OrderID,o.OrderDate,c.FirstName,c.LastName,c.Email,o.TotalAmount
FROM Orders o Join Customers c
ON o.CustomerID = c.CustomerID

SELECT p.ProductName,
SUM(od.Quantity * p.Price) AS TotalRevenue
From OrderDetails od Join Products p
ON od.ProductID = p.ProductID
Group By p.ProductName

SELECT DISTINCT c.FirstName,C.LastName,c.Email,c.Phone,c.Address
FROM Customers c
Join Orders o ON c.CustomerID= o.CustomerID

SELECT TOP(1) p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered FROM OrderDetails od
JOIN Products p ON od.OrderDetailID=p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;

ALTER TABLE Products ADD Category VARCHAR(50);
SELECT ProductName,Category FROM Products

SELECT c.FirstName,c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName,c.LastName

SELECT TOP 1 o.OrderID,c.FirstName,c.LastName,o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

SELECT p.ProductName, COUNT(od.OrderDetailID) AS TimesOrdered
FROM Products p join OrderDetails od ON p.ProductID=od.ProductID
GROUP BY p.ProductName

SELECT DISTINCT c.FirstName,c.LastName,c.Email FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID=od.OrderID
JOIN Products p ON od.ProductID=p.ProductID
where p.ProductName = 'Bluetooth speaker'

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
Where OrderDate Between '2025-06-01' AND '2025-06-05'

--Task 4 Subquery and its type

SELECT FirstName, LastName,Email 
FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);


SELECT COUNT(*) AS TotalProducts
FROM Products

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders

SELECT AVG(od.Quantity) AS AvgQuantityOrdered
FROM OrderDetails od
Join Products p ON od.ProductID = p.ProductID
WHERE p.Category = Category

SELECT SUM(TotalAmount) AS TotalRevenue
From Orders
WHERE CustomerID = 104

SELECT TOP 1 c.FirstName, c.LastName,Count(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName
ORDER BY OrderCount DESC;

SELECT TOP 1 p.Category, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalQuantity DESC;

SELECT TOP 1 c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpending DESC;

SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

