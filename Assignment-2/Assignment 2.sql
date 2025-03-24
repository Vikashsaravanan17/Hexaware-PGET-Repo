-- Task 1

-- 1
CREATE DATABASE SISDB;
USE SISDB;

-- 2
CREATE TABLE Students (
    student_id INT PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15)
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY ,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY ,
    student_id INT,
    amount int,
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);

-- 3
INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number) VALUES
(1,'Vikash', 'Saravanan', '2003-09-17', 'vikash@gmail.com', '9940250431'),
(2,'Vignesh', 'Ramesh', '2003-09-29', 'vignesh@gmail.com', '9940250432'),
(3,'Venkat', 'malla', '2004-04-11', 'venkat@gmail.com', '9940250433'),
(4,'Sunil', 'Bhaskar', '2002-12-10', 'sunil@gmail.com', '9940250434'),
(5,'Raj', 'Mohan', '2003-06-17', 'raj@gmail.com', '9940250435');

--4
INSERT INTO Teacher (teacher_id,first_name, last_name, email) VALUES
(11,'Elumalai', 'David', 'elumalai@example.com'),
(12,'Aruna', 'Veeraselvam', 'aruna@example.com'),
(13,'Jennitha', 'Dave', 'jennitha@example.com'),
(14,'Suguna', 'Durai', 'suguna@example.com'),
(15,'Malathi', 'Thiru', 'malathi@example.com');
--5
INSERT INTO Courses (course_id,course_name, credits, teacher_id) VALUES
(21,'Mathematics', 3, 11),
(22,'Physics', 4, 12),
(23,'Chemistry', 2, 13),
(24,'English', 3, 14),
(25,'Tamil', 2, 15);

--6
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(31, 1, 21, '2024-03-01'), -- Mathematics (21),
(32, 2, 22, '2024-03-02'), -- Physics (22),
(33, 3, 23, '2024-03-03'), -- Chemistry (23),
(34, 4, 24, '2024-03-04'), -- English (24),
(35, 5, 25, '2024-03-05'); -- Tamil (25);
--7
INSERT INTO Payments (payment_id,student_id, amount, payment_date) VALUES
(41,1, 500, '2024-03-05'),
(42,2, 600, '2024-03-06'),
(43,3, 500, '2024-03-07'),
(44,4, 500, '2024-03-08'),
(45,5, 500, '2024-03-09');

-- Task 2:

DELETE FROM Students WHERE student_id = 6;
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) 
VALUES (6,'John', 'Doe', ' 1995-08-15 ', 'john.doe@example.com ', '1234567890 ');--1
Select*from students;

INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date) 
VALUES (36,6, 22, '2024-03-06');--2
Select* from Enrollments where student_id=6;

UPDATE Teacher SET email = 'Elumalaidavid@gamil.com' WHERE teacher_id = 11;--3
Select email from teacher Where teacher_id=11;

DELETE FROM Enrollments WHERE student_id = 1 AND course_id = 21;--4
Select*from Enrollments;

UPDATE Courses SET teacher_id = 13 WHERE course_id = 22;--5
Select * from Courses;

DELETE FROM Students WHERE student_id = 2;--6
Select* from students;

UPDATE Payments SET amount = 700.00 WHERE payment_id = 1;--7

--Task 3
SELECT student_id, SUM(amount) AS total_payments FROM Payments GROUP BY student_id;--1

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;--2

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;--3

SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;--4

SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id;--5

SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Mathematics';--6

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL;--7
--Null output because every student has paid their fees

SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;--8
--Null output because every course has a student enrolled to it.

SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1;--9
--Null output because every student has enrolled to Exactly to one course.

SELECT t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;--10

--Task 4

SELECT AVG(student_count) AS avg_students_per_course
FROM (
    SELECT course_id, COUNT(student_id) AS student_count
    FROM Enrollments
    GROUP BY course_id
) AS subquery;--1

SELECT s.first_name, s.last_name, p.amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount) FROM Payments);--2

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.student_id) = (
    SELECT MAX(student_count)
    FROM (
        SELECT course_id, COUNT(student_id) AS student_count
        FROM Enrollments
        GROUP BY course_id
    ) AS subquery
);--3

SELECT t.first_name, t.last_name, SUM(p.amount) AS total_payments
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id
JOIN Enrollments e ON c.course_id = e.course_id
JOIN Payments p ON e.student_id = p.student_id
GROUP BY t.teacher_id, t.first_name, t.last_name;--4

SELECT s.first_name, s.last_name
FROM Students s
WHERE (
    SELECT COUNT(DISTINCT course_id) FROM Enrollments WHERE student_id = s.student_id
) = (SELECT COUNT(course_id) FROM Courses);--5

SELECT first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);--6
--Null because every teacher have been assignesh to a particular course

SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS avg_age
FROM Students;--7

SELECT course_name
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);--8
--Null because every couse has a student

SELECT s.first_name, s.last_name, c.course_name, 
       (SELECT SUM(amount) FROM Payments p WHERE p.student_id = s.student_id) AS total_payments
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;--9

SELECT s.first_name, s.last_name, COUNT(p.payment_id) AS payment_count
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(p.payment_id) > 1;--10
--Null because no one paid for more than one course

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;--11

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;--12

SELECT AVG(amount) AS avg_payment
FROM Payments;--13












