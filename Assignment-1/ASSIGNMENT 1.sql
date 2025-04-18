CREATE DATABASE TECHSHOP;
GO

CREATE TABLE CUSTOMERS
(CUSTOMERID INT PRIMARY KEY,
FIRSTNAME VARCHAR(30),
LASTNAME VARCHAR(30),
EMAIL VARCHAR(200),
PHONE VARCHAR(100),
ADDRESS VARCHAR(200));

CREATE TABLE Products (
 ProductID INT PRIMARY KEY,
 ProductName VARCHAR(100),
 Description TEXT,
 Price DECIMAL(10,2),
);
ALTER TABLE PRODUCTS
ALTER COLUMN PRICE INT;

CREATE TABLE Orders (
 OrderID INT PRIMARY KEY,
 CustomerID INT,
 OrderDate DATE,
 TotalAmount INT,
 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
 OrderDetailID INT PRIMARY KEY,
 OrderID INT,
 ProductID INT,
 Quantity INT,
 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CUSTOMERID,FirstName, LastName, Email, Phone, Address) VALUES
(1,'VIKASH', 'SARAVANAN', 'VIKASH@GMAIL.com', '9940250430', '1,SELVA STREET,CHENNAI'),
(2,'VIGNESH', 'RAMESH', 'VIGNESH@GMAIL.com', '9940250431', '2,AADHAV STREET ,CHENNAI'),
(3,'RUPPESH', 'KAVIN', 'RUPPESH@GMAIL.com', '9940250432', '3,KAASI STREET ,CHENNAI'),
(4,'VENKAT', 'MALLA', 'VENKAT@GMAIL.com', '9940250433', '4,VEDANT STREET ,CHENNAI'),
(5,'SUNIL', 'BASKAR', 'SUNIL@GMAIL.com', '9940250434', '5,BHASKAR STREET ,CHENNAI'),
(6,'SRI', 'VISHNU', 'SRI@GMAIL.com', '9940250435', '6,VR STREET ,CHENNAI'),
(7,'RAJ', 'GOPAL', 'RAJ@GMAIL.com', '9940250436', '7,PANRUTTI STREET ,CHENNAI'),
(8,'HARSHITH', 'JAYA', 'HARSHITH@GMAIL.com', '9940250437', '8,MANNADI STREET ,CHENNAI'),
(9,'HEMRAJ', 'JAIN', 'HEMRAJ@GMAIL.com', '9940250438', '9,PERUMAL STREET ,CHENNAI'),
(10,'ASHWIN', 'AJAY', 'ASHWIN@GMAIL.com', '9940250439', '10,NASARATH STREET ,CHENNAI');

INSERT INTO Products (ProductID,ProductName, Description, Price) VALUES
(1,'Smartphone', 'SAMSUNG SMARTPHONE', 16000),
(2,'Laptop', 'LENOVO LAPTOP', 60000),
(3,'TV', 'REDMI TV', 59000),
(4,'KEYBOARD', 'RGB KEYBOARD', 2000),
(5,'MOUSE', 'ARTIC MOUSE', 800),
(6,'SPEAKERS', 'JBL SPEAKERS', 12500),
(7,'20W CHARGER', 'MOTO CHARGER', 600),
(8,'PENDRIVE', 'SANDISC  PENDRIVE', 700),
(9,'MOUSE PAD', 'KIWI MOUSE PAD', 300),
(10,'LAN WIRE', 'HIGH SPEED LAN WIRE', 400);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(11, 1, '2025-03-15', 700),
(12, 2, '2025-03-16', 400),
(13, 3, '2025-03-17', 12500),
(14, 4, '2025-03-18', 800),
(15, 5, '2025-03-19', 2000),
(16, 6, '2025-03-20', 59000),
(17, 7, '2025-03-21', 300),
(18, 8, '2025-03-22', 600),
(19, 9, '2025-03-23', 16000),
(10, 10, '2025-03-24', 60000);


INSERT INTO OrderDetails (OrderDetailID,OrderID, ProductID, Quantity) VALUES
(21, 11, 8,1),
(22, 12, 10,1),
(23, 13, 6,1),
(24, 14, 5,1),
(25, 15, 4,1),
(26, 16, 2,1),
(27, 17, 9,1),
(28, 18, 7,1),
(29, 19, 1,1),
(30, 10, 2,1);

INSERT INTO Inventory (InventoryID,ProductID, QuantityInStock, LastStockUpdate) VALUES
(31,1, 500, '2025-03-01'),
(32, 2,30, '2025-03-03'),
(33, 3,50, '2025-03-04'),
(34, 4,80, '2025-03-06'),
(35, 5,90, '2025-03-07'),
(36, 6,20, '2025-03-09'),
(37, 7,25, '2025-03-11'),
(38, 8,35, '2025-03-11'),
(39, 9,150, '2025-03-12'),
(40, 10,70, '2025-03-13');

--TASK 2

SELECT FirstName, LastName, Email FROM Customers;--1

SELECT 
    OrderID, 
    (SELECT FirstName FROM Customers WHERE Customers.CustomerID = Orders.CustomerID) AS FirstName,
    (SELECT LastName FROM Customers WHERE Customers.CustomerID = Orders.CustomerID) AS LastName,
    OrderDate, 
    TotalAmount
FROM Orders order by FIRSTNAME ASC;--2

INSERT INTO Customers (CUSTOMERID,FirstName, LastName, Email, Phone, Address) 
VALUES (117,'SUBASH', 'CHANDRA', 'SUBASH@GMAIL.com', '9841977935', '5,ARU STREET,CHENNAI');--3

UPDATE Products SET Price = Price * 1.10;
SELECT PRICE FROM PRODUCTS;--4 JUST CHECKING IF ITS WORKING

DELETE FROM ORDERS WHERE ORDERID = 12;
SELECT*FROM ORDERS;--5 JUST CHECKING IF ITS WORKING

INSERT INTO Orders (ORDERID,CustomerID, OrderDate, TotalAmount) VALUES (12,2, '2025-03-16', 400);--6 INSERTING THE SAME ORDER THAT I JUST DELETED


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(11, 1, '2025-03-15', 700),
(12, 2, '2025-03-16', 400),
(13, 3, '2025-03-17', 12500),
(14, 4, '2025-03-18', 800),
(15, 5, '2025-03-19', 2000),
(16, 6, '2025-03-20', 59000),
(17, 7, '2025-03-21', 300),
(18, 8, '2025-03-22', 600),
(19, 9, '2025-03-23', 16000),
(10, 10, '2025-03-24', 60000);

UPDATE CUSTOMERS SET Email = 'SARAVANAN@GMAIL.com', Address ='4,ARUNA STREET,CHENNAI'  WHERE CUSTOMERID = 1;
SELECT * FROM CUSTOMERS WHERE CUSTOMERID=1; -- 7 CHECKING FOR UPDATE

UPDATE O
  SET O.TotalAmount = ISNULL(
    (SELECT SUM(P.Price * OD.QUANTITY)
     FROM OrderDetails OD
     INNER JOIN Products P ON OD.ProductID = P.ProductID
     WHERE OD.OrderID = O.TotalAmount), 0)
  FROM Orders O--8


DELETE FROM ORDERS WHERE CUSTOMERID = 2;
SELECT*FROM ORDERS ORDER BY CUSTOMERID ASC;--9 CHECKING FOR DELETION

INSERT INTO PRODUCTS (PRODUCTID,PRODUCTNAME, Description, PRICE) 
VALUES (111,'TABLET','SAMASUNG TABLET',17000);
SELECT*FROM PRODUCTS ORDER BY PRODUCTID DESC; --10 CHECKING FOR INSERTION

ALTER TABLE ORDERS
ADD STATUS VARCHAR(20) DEFAULT 'Pending';
UPDATE Orders SET STATUS = 'SHIPPED' WHERE OrderID = 11;
SELECT STATUS FROM ORDERS WHERE ORDERID=11;--11

 ALTER TABLE Customers
  ADD NumberOfOrders INT DEFAULT 0;
  
  UPDATE Customers
  SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
  );--12

  DELETE FROM ORDERS;
  INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(11, 1, '2025-03-15', 700),
(12, 2, '2025-03-16', 400),
(13, 3, '2025-03-17', 12500),
(14, 4, '2025-03-18', 800),
(15, 5, '2025-03-19', 2000),
(16, 6, '2025-03-20', 59000),
(17, 7, '2025-03-21', 300),
(18, 8, '2025-03-22', 600),
(19, 9, '2025-03-23', 16000),
(10, 10, '2025-03-24', 60000);
DELETE FROM ORDERDETAILS;
INSERT INTO OrderDetails (OrderDetailID,OrderID, ProductID, Quantity) VALUES
(21, 11, 8,1),
(22, 12, 10,1),
(23, 13, 6,1),
(24, 14, 5,1),
(25, 15, 4,1),
(26, 16, 2,1),
(27, 17, 9,1),
(28, 18, 7,1),
(29, 19, 1,1),
(30, 10, 2,1);

 --TASK3

  SELECT O.OrderID, O.OrderDate, O.TotalAmount, 
       C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
ORDER BY O.OrderID;--1


SELECT P.ProductID, P.ProductName, SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalRevenue DESC;--2

SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerID;--3

SELECT P.ProductID, P.ProductName, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalQuantityOrdered DESC--4

ALTER TABLE Products
ADD Category VARCHAR(50);

UPDATE Products
SET Category = 
    CASE 
        WHEN ProductName LIKE '%Smartphone%' OR ProductName LIKE '%Tablet%' THEN 'Mobile Devices'
        WHEN ProductName LIKE '%Laptop%' THEN 'Computers'
        WHEN ProductName LIKE '%TV%' THEN 'Home Entertainment'
        WHEN ProductName LIKE '%Keyboard%' OR ProductName LIKE '%Mouse%' OR ProductName LIKE '%Pendrive%' THEN 'Accessories'
        WHEN ProductName LIKE '%Speakers%' THEN 'Audio Devices'
        ELSE 'Other'
    END;


SELECT ProductID, ProductName, Description, Category
FROM Products
ORDER BY ProductID;--5

SELECT C.CustomerID, C.FirstName, C.LastName, AVG(O.TotalAmount) AS AvgOrderValue
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY AvgOrderValue DESC;--6

SELECT O.OrderID, C.CustomerID, C.FirstName, C.LastName, O.TotalAmount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
ORDER BY O.TotalAmount DESC;--7

SELECT P.ProductID, P.ProductName, COUNT(OD.OrderDetailID) AS TimesOrdered
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TimesOrdered DESC;--8

SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Smartphone';-- 9

SELECT SUM(O.TotalAmount) AS TotalRevenue
FROM Orders O
WHERE O.OrderDate BETWEEN '2025-03-01' AND '2025-03-31';--10


--TASK 4
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL;--1


SELECT COUNT(*) AS TotalProducts FROM Products;--2

SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;--3

SELECT AVG(OD.Quantity) AS AverageQuantity
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.Category =' MOBILE DEVICES';--4

SELECT SUM(O.TotalAmount) AS CustomerRevenue
FROM Orders O
WHERE O.CustomerID = 1;--5

SELECT C.CustomerID, C.FirstName, C.LastName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY NumberOfOrders DESC;--6

SELECT P.Category, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.Category
ORDER BY TotalQuantityOrdered DESC--7

SELECT FIRSTNAME FROM CUSTOMERS 
WHERE CUSTOMERID LIKE(SELECT CUSTOMERID FROM ORDERS WHERE ORDERID=10)--8

SELECT AVG(O.TotalAmount) AS AverageOrderValue
FROM Orders O;--9

SELECT C.CustomerID, C.FirstName, C.LastName, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalOrders DESC;--10