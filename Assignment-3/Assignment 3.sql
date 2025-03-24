--Task 1
Create database HMBank;--1
use HMBank;

create table Customer( 
customer_id int Primary Key, 
 first_name varchar(50),
 last_name varchar(50),
 DOB date,
 email varchar(100) unique,
 phone_number bigint unique,
 address varchar(50) unique);

 create table Accounts( 
 account_id int primary Key,
 customer_id int,
 account_type VARCHAR(20) NOT NULL CHECK (account_type IN ('savings', 'current', 'zero_balance')),
 foreign key (customer_id) references customer(customer_id) on delete cascade,
 balance int,
);

create table Transactions(
transaction_id int Primary Key,
account_id int, 
transaction_type varchar(50) NOT NULL check(transaction_type in('deposit', 'withdrawal', 'transfer')),
amount int,
transaction_date date,
foreign key(account_id) references accounts(account_id)on delete cascade);--2

--task2
insert into customer(customer_id,first_name,last_name,DOB,email ,phone_number,address) values
(1,'Vikash','Saravanan','2003-09-17','vikash@gmail.com',9940250431,'ambattur'),
(2,'Vignesh','ramesh','2003-11-29','vignesh@gmail.com',9940250432,'Tnagar'),
(3,'Venkat','Malla','2004-04-11','venkat@gmail.com',9940250433,'Redhills'),
(4,'sunil','Bhaskar','2002-12-10','sunil@gmail.com',9940250434,'Tiruttani'),
(5,'Raj','Mohan','2003-06-01','raj@gmail.com',9940250435,'Panrutti'),
(6,'Sri','Vishnu','2004-09-02','vishnu@gmail.com',9940250436,'Anna Nagar'),
(7,'Harshith','Jaya','2003-05-07','harshith@gmai.com',9940250437,'Sowcarpet'),
(8,'Hemraj','rajan','2003-07-08','hemraj@gmail.com',9940250438,'Tiruvallur'),
(9,'Ganesh','Kumar','2003-03-09','ganesh@gmail.com',9940250439,'Vellore'),
(10,'Ashwin','Albert','2003-05-11','ashwin@gmail.com',9940250430,'Poonamalle');

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES 
(11, 1, 'savings', 43000),
(12, 2, 'current', 50000),
(13, 3, 'zero_balance', 60000),
(14, 4, 'savings', 45000),
(15, 5, 'current', 57000),
(16, 6, 'zero_balance', 25000),
(17, 7, 'savings', 6000),
(18, 8, 'current', 35000),
(19, 9, 'zero_balance', 46000),
(20, 10, 'savings', 47000);

INSERT INTO Transactions(transaction_id,account_id, transaction_type,amount, transaction_date) VALUES 
(21, 11, 'deposit',4000,'2025-03-25'),
(22, 12, 'withdrawal',3000, '2025-02-27'),
(23, 13, 'transfer',5000, '2025-01-15'),
(24, 14, 'deposit',1000, '2025-03-24'),
(25, 15, 'withdrawal',2000, '2025-02-02'),
(26, 16, 'transfer',3000, '2025-01-05'),
(27, 17, 'deposit',500, '2025-03-01'),
(28, 18, 'withdrawal',1500, '2025-02-12'),
(29, 19, 'transfer',2500, '2025-01-04'),
(30, 20, 'deposit',3000, '2025-03-10');--1
Delete from Transactions;

--2.1 . Write a SQL query to retrieve the name, account type and email of all customers.  
Select c.first_name,c.last_name,c.email,a.account_type from customer c join accounts a on c.customer_id=a.customer_id;
--2.2 . Write a SQL query to list all transaction corresponding customer. 
Select c.first_name,c.last_name,t.* from Transactions t 
join Accounts a on t.account_id=a.account_id
join customer c on a.customer_id=c.customer_id;

--2.3. Write a SQL query to increase the balance of a specific account by a certain amount.
Update Accounts set balance=balance+20000 where account_id=11;
Select balance from Accounts where account_id=11;

--2.4. Write a SQL query to Combine first and last names of customers as a full_name.
Select CONCAT(first_name,' ',last_name) from customer;

--2.5. Write a SQL query to remove accounts with a balance of zero where the account type is savings. 
Delete from Accounts where balance =0 and account_type='savings';
--No one has zero balance so 0 rows got affected

--2.6. Write a SQL query to Find customers living in a specific city. 
Select * from customer where address ='ambattur';

--2.7. Write a SQL query to Get the account balance for a specific account.
Select balance from Accounts where account_id=12;

--2.8. Write a SQL query to List all current accounts with a balance greater than 1,000.
Select account_id from Accounts where balance > 1000;

--2.9. Write a SQL query to Retrieve all transactions for a specific account.
Select * from Transactions where transaction_id=21;

--2.10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
Select account_id, balance*0.2 from Accounts where account_type='savings';

 --2.11.Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit. 
 Select * from Accounts where balance <1000;
 --null because every account exceeds the limit

 --2.12.  Write a SQL query to Find customers not living in a specific city. 
 Select* from customer where address !='ambattur';

 --Taks 3
 --3.1. Write a SQL query to Find the average account balance for all customers.  
 Select avg(balance) from Accounts;

 --3.2. Write a SQL query to Retrieve the top 10 highest account balances.  
 Select * from accounts order by balance desc;

 --3.3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
 Select sum(amount) from Transactions where  transaction_type='deposit' and transaction_date='2025-03-25';

 --3.4. Write a SQL query to Find the Oldest and Newest Customers.
 SELECT top 1* FROM Customer ORDER BY DOB ASC ;

 --3.5. Write a SQL query to Retrieve transaction details along with the account type.
 Select t.*,account_type from Transactions t join Accounts a on t.account_id=a.account_id;

 --3.6. Write a SQL query to Get a list of customers along with their account details. 
 select c.first_name,a.* from customer c join Accounts a on c.customer_id=a.customer_id;

 --3.7. Write a SQL query to Retrieve transaction details along with customer information for a specific account. 
 Select c.*, t.* from customer c join Accounts a on c.customer_id= a.customer_id 
 join Transactions t on a.account_id= t.account_id where a.account_id=11;

 --3.8. Write a SQL query to Identify customers who have more than one account.
 SELECT customer_id, COUNT(account_id) FROM Accounts GROUP BY customer_id HAVING COUNT(account_id) > 1;
 --Null becasue each customer have exactly one account

 --3.9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals. 
 SELECT SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS transaction_difference FROM Transactions;

 --3.9 Write a SQL query to Calculate the average daily balance for each account over a specified period.
 Select account_id,avg(balance) from Accounts Group by account_id;

 --3.10. Calculate the total balance for each account type. 
SELECT account_type, SUM(balance) FROM Accounts GROUP BY account_type;

--3.11. Identify accounts with the highest number of transactions order by descending order.
SELECT account_id, COUNT(transaction_id) AS transaction_count FROM Transactions GROUP BY account_id ORDER BY transaction_count DESC;

--3.12. List customers with high aggregate account balances, along with their account types. 
SELECT c.first_name, c.customer_id, SUM(a.balance) AS Total_Available_Balance 
FROM Customer c 
JOIN Accounts a ON c.customer_id = a.customer_id 
GROUP BY c.customer_id, c.first_name 
HAVING SUM(a.balance) > 10000;

--3.13. List customers with high aggregate account balances, along with their account types. 
Select c.first_name,sum(a.balance) From Customer c join accounts a on c.customer_id=a.customer_id group by c.first_name;

--3.14. Identify and list duplicate transactions based on transaction amount, date, and account. 
SELECT transaction_id, amount, transaction_date, account_id FROM Transactions GROUP BY transaction_id,amount, transaction_date, account_id HAVING COUNT(*) > 1;
--Null result because every customer has only one transaction.

--Task 4

--4.1 Retrieve the customer(s) with the highest account balance.
Select * from customer Where customer_id = (Select TOP 1 customer_id from Accounts order by balance DESC);

--4.2. Calculate the average account balance for customers who have more than one account. 
Select avg(balance) from Accounts where customer_id in(Select customer_id from Accounts group by customer_id having COUNT(customer_id)>1);

--4.3. Retrieve accounts with transactions whose amounts exceed the average transaction amount. 
Select *from Accounts where account_id in(select account_id from Transactions group by account_id having avg(amount) > 500);

--4.4. Identify customers who have no recorded transactions. 
Select * FROM Customer where customer_id not in(Select distinct a.customer_id from accounts a join Transactions t on a.account_id=t.account_id);
--null becasue every customer has atleast one transaction done.

--4.5. Calculate the total balance of accounts with no recorded transactions.
Select balance FROM Accounts where customer_id not in(Select distinct a.customer_id from accounts a join Transactions t on a.account_id=t.account_id);
--null becasue every customer has atleast one transaction done.

--4.6. Retrieve transactions for accounts with the lowest balance. 
Select * from Transactions where account_id =(Select top 1 account_id from Accounts order by balance asc);

--4.7. Identify customers who have accounts of multiple types.
Select DISTINCT customer_id FROM Accounts WHERE account_type IN ('savings', 'current') GROUP BY customer_id HAVING COUNT(DISTINCT account_type) > 1;
--Null because everyone has only one type of account

--4.8. Calculate the percentage of each account type out of the total number of accounts.
Select account_type, COUNT(*) * 100 / (SELECT COUNT(*) FROM Accounts) AS percentage FROM Accounts GROUP BY account_type;

--4.9. Retrieve all transactions for a customer with a given customer_id. 
Select* from Transactions where account_id=(Select account_id from Accounts where customer_id=1);

--4.10.Calculate the total balance for each account type, including a subquery within the SELECT clause.
Select account_type, (Select SUM(balance) FROM Accounts WHERE account_type = A.account_type) AS total_balance FROM Accounts A GROUP BY account_type;
