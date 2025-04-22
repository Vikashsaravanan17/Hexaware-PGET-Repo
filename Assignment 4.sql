Create database Courier_Management ;
Use Courier_Management
 
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);

Create table Courier  
(CourierID INT PRIMARY KEY,  
SenderName VARCHAR(255),  
SenderAddress TEXT,  
ReceiverName VARCHAR(255),  
ReceiverAddress TEXT,  
Weight DECIMAL(5, 2),  
Status VARCHAR(50),  
TrackingNumber VARCHAR(20) UNIQUE,  
DeliveryDate DATE); 

Create table CourierServices  
(ServiceID INT PRIMARY KEY,  
ServiceName VARCHAR(100),  
Cost DECIMAL(8, 2)); 

Create Table Employee   
(EmployeeID INT PRIMARY KEY,  
Name VARCHAR(255),  
Email VARCHAR(255) UNIQUE,  
ContactNumber VARCHAR(20),  
Role VARCHAR(50),  
Salary DECIMAL(10, 2)); 

Create Table Location   
(LocationID INT PRIMARY KEY,  
LocationName VARCHAR(100),  
Address TEXT); 

Create table Payment  
(PaymentID INT PRIMARY KEY,  
CourierID INT,  
LocationId INT,  
Amount DECIMAL(10, 2),  
PaymentDate DATE,  
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),  
FOREIGN KEY (LocationID) REFERENCES Location(LocationID));

Insert into Users(UserID,Name, Email, Password ,ContactNumber,Address) Values
(1,'Vikash','vikash@gmail.com','Vik123',9940250431,'Ambattur'),
(2,'Vignesh','vignesh@gmail.com','Vig123',9940250432,'Tnagar'),
(3,'Venkat','venkat@gmail.com','Ven123',9940250433,'Redhills'),
(4,'Sunil','sunil@gmail.com','sun123',9940250434,'Tiruttani'),
(5,'Raj','raj@gmail.com','raj123',9940250435,'panrutti'),
(6,'Sri','sri@gmail.com','sri123',9940250436,'Annanagar'),
(7,'Harshith','Harshith@gmail.com','har123',9940250437,'Sowcarpet'),
(8,'Ganesh','ganesh@gmail.com','gan123',9940250438,'Vellore'),
(9,'Hemraj','Hemraj@gmail.com','hem123',9940250439,'Tiruvallur'),
(10,'Ashwin','ashwin@gmail.com','ash123',9940250430,'Poonamalle');
Select*from users

Insert into Courier  (CourierID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,Weight,Status,TrackingNumber,DeliveryDate) values 
(11, 'Saravanan', '123 Main St, New York, NY', 'Alice Smith', '456 Elm St, Los Angeles, CA', 2.50, 'In Transit', 'TRK123456', '2025-03-26'),
(12, 'Ramesh', '789 Pine St, Chicago, IL', 'Michael Brown', '321 Oak St, Houston, TX', 5.00, 'Delivered', 'TRK789654', '2025-03-20'),
(13, 'Malla', '147 Cedar St, San Francisco, CA', 'Sophia Williams', '852 Maple St, Boston, MA', 3.75, 'Out for Delivery', 'TRK321987', '2025-03-24'),
(14, 'Bhaskar', '963 Birch St, Denver, CO', 'Liam Garcia', '741 Spruce St, Seattle, WA', 1.20, 'Processing', 'TRK852369', '2025-03-28'),
(15, 'Mohan', '258 Palm St, Miami, FL', 'Emily Davis', '369 Willow St, Dallas, TX', 4.80, 'Shipped', 'TRK456123', '2025-03-27'),
(16, 'Vishnu', '147 Sunset Blvd, San Diego, CA', 'Ethan Anderson', '963 Lakeview Ave, Portland, OR', 6.50, 'In Transit', 'TRK159753', '2025-03-25'),
(17, 'Jaya', '357 Lincoln Rd, Atlanta, GA', 'Amelia Harris', '654 Washington Ave, Philadelphia, PA', 7.20, 'Delivered', 'TRK753951', '2025-03-22'),
(18, 'Raj', '852 Ocean Dr, Las Vegas, NV', 'James White', '123 Mountain Rd, Phoenix, AZ', 2.00, 'Pending', 'TRK258457', '2025-03-30'),
(19, 'Durai', '852 Ocean Dr, Las Vegas, NV', 'James White', '123 Mountain Rd, Phoenix, AZ', 2.00, 'Out for Delivery', 'TRK258452', '2025-03-30'),
(20, 'Albertr', '852 Ocean Dr, Las Vegas, NV', 'James White', '123 Mountain Rd, Phoenix, AZ', 2.00, 'Delivered', 'TRK258450', '2025-03-30');

UPDATE Courier
SET ReceiverName = 'John David'
WHERE CourierID = 20;


INSERT INTO CourierServices (ServiceID, ServiceName, Cost) VALUES
(21, 'Standard Delivery', 50.00),
(22, 'Express Delivery', 100.00),
(23, 'Same-Day Delivery', 150.00),
(24, 'Overnight Delivery', 200.00),
(25, 'International Delivery', 300.00),
(26, 'Economy Shipping', 40.00),
(27, 'Priority Shipping', 120.00),
(28, 'Two-Day Shipping', 180.00),
(29, 'Drone Delivery', 500.00),
(30, 'Freight Shipping', 1000.00);
Select*from CourierServices

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary) VALUES
(41, 'Karthik Kumar', 'karthik@courier.com', '9876543210', 'Delivery Executive', 35000.00),
(42, 'Anjali Sharma', 'anjali@courier.com', '9823456789', 'Delivery Manager', 60000.00),
(43, 'Rahul Verma', 'rahul@courier.com', '9812345678', 'Logistics Manager', 70000.00),
(44, 'Deepa Iyer', 'deepa@courier.com', '9856743210', 'Warehouse Supervisor', 50000.00),
(45, 'Suresh Nair', 'suresh@courier.com', '9786543210', 'Driver', 30000.00),
(46, 'Ajay Mishra', 'ajay@courier.com', '9798456123', 'Customer Support', 40000.00),
(47, 'Neha Kapoor', 'neha@courier.com', '9874563210', 'Operations Manager', 80000.00),
(48, 'Manoj Gupta', 'manoj@courier.com', '9865321470', 'Accountant', 55000.00),
(49, 'Ravi Shankar', 'ravi@courier.com', '9852147630', 'Security Guard', 25000.00),
(50, 'Sonia Das', 'sonia@courier.com', '9847859632', 'Receptionist', 30000.00);
Select*from Employee
UPDATE Employee
SET Name = 'John David'
WHERE EmployeeID = 49;



INSERT INTO Location (LocationID, LocationName, Address) VALUES
(51, 'New York Hub', '123 Main St, New York, NY'),
(52, 'Chicago Warehouse', '789 Pine St, Chicago, IL'),
(53, 'Los Angeles Dispatch', '456 Elm St, Los Angeles, CA'),
(54, 'Houston Distribution', '321 Oak St, Houston, TX'),
(55, 'San Francisco Center', '147 Cedar St, San Francisco, CA'),
(56, 'Miami Logistics', '963 Palm St, Miami, FL'),
(57, 'Dallas Main Hub', '654 Willow St, Dallas, TX'),
(58, 'Seattle Processing', '357 Lincoln Rd, Seattle, WA'),
(59, 'Boston Storage', '852 Maple St, Boston, MA'),
(60, 'Philadelphia Terminal', '951 Washington Ave, Philadelphia, PA');
Select*from Location


INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate) VALUES
(61, 11, 51, 100.00, '2025-03-22'),
(62, 12, 52, 200.00, '2025-03-23'),
(63, 13, 53, 150.00, '2025-03-24'),
(64, 14, 54, 175.00, '2025-03-25'),
(65, 15, 55, 250.00, '2025-03-26'),
(66, 16, 56, 300.00, '2025-03-27'),
(67, 17, 57, 400.00, '2025-03-28'),
(68, 18, 58, 350.00, '2025-03-29'),
(69, 19, 59, 500.00, '2025-03-30'),
(70, 20, 60, 450.00, '2025-03-31');
Select*from Payment


--Task 2 
--2.1. List all customers
Select* from users;

--2.2. List all orders for a specific customer
SELECT * FROM Courier WHERE SenderName = 'Saravanan';

--2.3. List all couriers
SELECT * FROM Courier;

--2.4. List all packages for a specific order
SELECT * FROM Courier WHERE TrackingNumber = 'TRK123456';

--2.5. List all deliveries for a specific courier: 
SELECT * FROM Courier WHERE CourierID = 11 AND Status = 'In Transit';

--2.6.List all undelivered packages
Select* from Courier where status !='Delivered';

--2.7. List all packages that are scheduled for delivery today
Select* from Courier where status ='Out for Delivery';

--2.8.List all packages with a specific status: 
Select* from Courier where status ='In Transit';

--2.9. Calculate the total number of packages for each courier. 
SELECT CourierID, COUNT(*) AS TotalPackages FROM Courier GROUP BY CourierID;

--2.10. Find the average delivery time for each courier 
SELECT CourierID, AVG(DATEDIFF(DAY, GETDATE(), DeliveryDate)) AS AvgDeliveryTime FROM Courier GROUP BY CourierID;

--2.11. List all packages with a specific weight range
SELECT * FROM Courier WHERE Weight BETWEEN 2 AND 5;

--2.12. Retrieve employees whose names contain 'John'  
SELECT * FROM Employee WHERE Name LIKE '%John%';

--2.13.Retrieve all courier records with payments greater than $50
SELECT * FROM Payment WHERE Amount > 50;

ALTER TABLE Courier ADD EmployeeID INT;
UPDATE Courier SET EmployeeID = 41 WHERE CourierID BETWEEN 11 AND 15;
UPDATE Courier SET EmployeeID = 42 WHERE CourierID BETWEEN 16 AND 20;



--Task 3
--3.1.  Find the total number of couriers handled by each employee.
SELECT EmployeeID, COUNT(*) AS TotalCouriers
FROM Courier
GROUP BY EmployeeID;

--3.2. Calculate the total revenue generated by each location  
SELECT p.Amount, l.LocationID, l.LocationName FROM Payment p JOIN Location l ON p.LocationID = l.LocationID;

--3.3. Find the total number of couriers delivered to each location.  
SELECT LocationID, COUNT(CourierID) AS TotalCouriers FROM Payment GROUP BY LocationID;

--3.4.  Find the courier with the highest average delivery time
SELECT TOP 1 CourierID, AVG(DATEDIFF(DAY, DeliveryDate, GETDATE())) AS AvgTime
FROM Courier 
GROUP BY CourierID 
ORDER BY AvgTime DESC;

--3.5. Find Locations with Total Payments Less Than a Certain Amount 
SELECT LocationID FROM Payment GROUP BY LocationID HAVING SUM(Amount) < 500;

--3.6. Calculate Total Payments per Location  
SELECT LocationID, SUM(Amount) AS TotalPayments FROM Payment GROUP BY LocationID;

--3.7 Retrieve couriers who have received payments totaling more than $1000 in a specific location 
SELECT LocationID, SUM(Amount) AS TotalPayments FROM Payment GROUP BY LocationID;

--3.8. Retrieve couriers who have received payments totaling more than $1000 after a certain date 
SELECT CourierID 
FROM Payment 
WHERE PaymentDate > '2025-03-22' 
GROUP BY CourierID 
HAVING SUM(Amount) > 500;

--3.9. Retrieve locations where the total amount received is more than $5000 before a certain date
SELECT LocationID, SUM(Amount) AS TotalAmount
FROM Payment
WHERE PaymentDate < '2025-03-22'
GROUP BY LocationID
HAVING SUM(Amount) > 5000;
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Payment';

--Task 4
--4.23 Retrieve Payments with Courier Information  
SELECT P.PaymentID, P.Amount, C.CourierID, C.TrackingNumber, C.Status
FROM Payment P
INNER JOIN Courier C ON P.CourierID = C.CourierID;

--4.24 Retrieve Payments with Location Information
SELECT P.PaymentID, P.Amount, L.LocationID, L.LocationName
FROM Payment P
INNER JOIN Location L ON P.LocationID = L.LocationID;

--4.25 Retrieve Payments with Courier and Location Information 
SELECT P.PaymentID, P.Amount, C.CourierID, C.TrackingNumber, C.Status, L.LocationID, L.LocationName
FROM Payment P
INNER JOIN Courier C ON P.CourierID = C.CourierID
INNER JOIN Location L ON P.LocationID = L.LocationID;

--4.26 List all payments with courier details  
SELECT P.*, C.SenderName, C.ReceiverName, C.Status
FROM Payment P
INNER JOIN Courier C ON P.CourierID = C.CourierID;

--4.27 Total payments received for each courier  
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

--4.28  List payments made on a specific date
SELECT * FROM Payment WHERE PaymentDate = '2025-03-22';

--4.29 Get Courier Information for Each Payment
SELECT P.PaymentID, P.Amount, C.*
FROM Payment P
INNER JOIN Courier C ON P.CourierID = C.CourierID;

--4.30 Get Payment Details with Location
SELECT P.PaymentID, P.Amount, L.LocationName, L.Address
FROM Payment P
INNER JOIN Location L ON P.LocationID = L.LocationID;

--4.31 Calculating Total Payments for Each Courier
SELECT CourierID, SUM(Amount) AS TotalAmount
FROM Payment
GROUP BY CourierID;

--4.32  List Payments Within a Date Range
SELECT * FROM Payment 
WHERE PaymentDate BETWEEN '2025-03-22' AND '2025-03-29';

--4.33  Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side  
SELECT U.UserID, U.Name, C.CourierID, C.TrackingNumber
FROM Users U
FULL OUTER JOIN Courier C ON U.Name = C.SenderName;

--4.34 Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
SELECT C.CourierID, C.TrackingNumber, CS.ServiceID, CS.ServiceName
FROM Courier C
FULL OUTER JOIN CourierServices CS ON C.CourierID = CS.ServiceID;

--4.35 Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
SELECT E.EmployeeID, E.Name, P.PaymentID, P.Amount
FROM Employee E
FULL OUTER JOIN Courier C ON E.EmployeeID = C.EmployeeID
FULL OUTER JOIN Payment P ON C.CourierID = P.CourierID;

--4.36 List all users and all courier services, showing all possible combinations
SELECT U.Name, CS.ServiceName
FROM Users U
CROSS JOIN CourierServices CS;

--4.37 List all employees and all locations, showing all possible combinations
SELECT E.Name AS EmployeeName, L.LocationName
FROM Employee E
CROSS JOIN Location L;

--4.38 Retrieve a list of couriers and their corresponding sender information
SELECT C.CourierID, C.TrackingNumber, C.SenderName, C.SenderAddress
FROM Courier C;

--4.39 Retrieve a list of couriers and their corresponding receiver information
SELECT C.CourierID, C.TrackingNumber, C.ReceiverName, C.ReceiverAddress
FROM Courier C;

--4.40 Retrieve a list of couriers along with the courier service details
SELECT C.CourierID, C.TrackingNumber, CS.ServiceName, CS.Cost
FROM Courier C
LEFT JOIN CourierServices CS ON C.CourierID = CS.ServiceID;

--4.41 Retrieve a list of employees and the number of couriers assigned to each employee
SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS CourierCount
FROM Employee E
LEFT JOIN Courier C ON E.EmployeeID = C.EmployeeID
GROUP BY E.EmployeeID, E.Name;

--4.42  Retrieve a list of locations and the total payment amount received at each location
SELECT LocationID, SUM(Amount) AS TotalPayment
FROM Payment
GROUP BY LocationID;

--4.43 Retrieve all couriers sent by the same sender
SELECT C1.*
FROM Courier C1
JOIN Courier C2 ON C1.SenderName = C2.SenderName
WHERE C1.CourierID <> C2.CourierID;

--4.44 List all employees who share the same role
SELECT E1.*
FROM Employee E1
JOIN Employee E2 ON E1.Role = E2.Role
WHERE E1.EmployeeID <> E2.EmployeeID;

--4.45 Retrieve all payments made for couriers sent from the same location
SELECT P.*
FROM Payment P
JOIN Courier C ON P.CourierID = C.CourierID
JOIN Courier C2 ON CAST(C.SenderAddress AS VARCHAR(MAX)) = CAST(C2.SenderAddress AS VARCHAR(MAX))
WHERE C.CourierID <> C2.CourierID;

--4.46 Retrieve all couriers sent from the same location (SenderAddress)
SELECT C1.*
FROM Courier C1
JOIN Courier C2 
    ON CAST(C1.SenderAddress AS VARCHAR(MAX)) = CAST(C2.SenderAddress AS VARCHAR(MAX))
WHERE C1.CourierID <> C2.CourierID;

--4.47 List employees and the number of couriers they have delivered
SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS DeliveredCouriers
FROM Employee E
JOIN Courier C ON E.EmployeeID = C.EmployeeID
GROUP BY E.EmployeeID, E.Name;

--4.48  Find couriers that were paid an amount greater than the cost of their respective courier services  
SELECT C.CourierID, C.TrackingNumber, P.Amount
FROM Courier C
JOIN Payment P ON C.CourierID = P.CourierID
WHERE P.Amount > C.Weight; 

--4.49 Find couriers that have a weight greater than the average weight of all couriers
SELECT CourierID, Weight
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

--4.50 Find the names of all employees who have a salary greater than the average salary
SELECT EmployeeID, Name, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

--4.51: Find the total cost of all courier services where the cost is less than the maximum cost
SELECT SUM(Weight) AS TotalCost
FROM Courier
WHERE Weight < (SELECT MAX(Weight) FROM Courier);

--4.52: Find all couriers that have been paid for
SELECT C.*
FROM Courier C
WHERE EXISTS (SELECT 1 FROM Payment P WHERE C.CourierID = P.CourierID);

--4. 53: Find the locations where the maximum payment amount was made
SELECT LocationID
FROM Payment
WHERE Amount = (SELECT MAX(Amount) FROM Payment);

--4.54 Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender ('SenderName')
SELECT *
FROM Courier
WHERE Weight > ALL (SELECT Weight FROM Courier WHERE SenderName = 'SenderName');









