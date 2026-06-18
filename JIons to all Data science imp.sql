-- SQL JOINs in MySQL
-- In SQL, JOINs are used to combine rows from two or more tables based on related columns — usually a foreign key in one table referencing a primary key in another.
-- We’ll use the following two tables:
-- users table
-- id	name
-- 1	Aarav
-- 2	Sneha
-- 3	Raj
-- addresses table
-- id	user_id	city
-- 1	1	Mumbai
-- 2	2	Kolkata
-- 3	4	Delhi
-- Note: user_id is a foreign key that references users.id.

USE startersql;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS admin_users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
('Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00),
('Ananya', 'ananya@example.com', 'Female', '1990-11-23', 72000.00),
('Raj', 'raj@example.com', 'Male', '1988-02-17', 58000.00),
('Sneha', 'sneha@example.com', 'Female', '2000-08-09', 50000.00),
('Farhan', 'farhan@example.com', 'Male', '1993-12-30', 61000.00),
('Priyanka', 'priyanka@example.com', 'Female', '1985-07-12', 84000.00),
('Aisha', 'aisha@example.com', 'Female', '1997-03-25', 56000.00),
('Aditya', 'aditya@example.com', 'Male', '1992-06-17', 69000.00),
('Meera', 'meera@example.com', 'Female', '1989-09-05', 77000.00),
('Ishaan', 'ishaan@example.com', 'Male', '2001-10-02', 45000.00),
('Tanvi', 'tanvi@example.com', 'Female', '1994-04-18', 62000.00),
('Rohan', 'rohan@example.com', 'Male', '1986-12-01', 75000.00),
('Zoya', 'zoya@example.com', 'Female', '1998-01-15', 54000.00),
('Karan', 'karan@example.com', 'Male', '1990-08-22', 68000.00),
('Nikita', 'nikita@example.com', 'Female', '1987-03-10', 71000.00),
('Manav', 'manav@example.com', 'Male', '1996-11-29', 61000.00),
('Divya', 'divya@example.com', 'Female', '1991-02-28', 57000.00),
('Harshit', 'harshit@example.com', 'Male', '1993-09-09', 65000.00),
('Ritika', 'ritika@example.com', 'Female', '1999-05-05', 52000.00),
('Imran', 'imran@example.com', 'Male', '1995-07-30', 63000.00),
('Juhi', 'juhi@example.com', 'Female', '1992-10-14', 59000.00),
('Tushar', 'tushar@example.com', 'Male', '1990-01-08', 73000.00),
('Lata', 'lata@example.com', 'Female', '1984-11-11', 78000.00),
('Yash', 'yash@example.com', 'Male', '1997-06-06', 64000.00),
('Fatima', 'fatima@example.com', 'Female', '1993-03-03', 55000.00);

CREATE TABLE addresses (
id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
street VARCHAR(255),
city VARCHAR(100),
state VARCHAR(100),
pincode VARCHAR(10),
CONSTRAINT fk_addresses_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO addresses (user_id, street, city, state, pincode)
VALUES
(1, '221B MG Road', 'Mumbai', 'Maharashtra', '400001'),
(2, '14 Park Street', 'Kolkata', 'West Bengal', '700016'),
(3, '32 Residency Road', 'Bengaluru', 'Karnataka', '560025'),
(4, '5 North Usman Road', 'Chennai', 'Tamil Nadu', '600017'),
(5, '17 Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001'),
(6, '55 Banjara Hills', 'Hyderabad', 'Telangana', '500034'),
(7, '88 Connaught Place', 'Delhi', 'Delhi', '110001'),
(8, '10 MG Marg', 'Dehradun', 'Uttarakhand', '248001'),
(9, '23 Brigade Road', 'Bengaluru', 'Karnataka', '560025'),
(11, '67 Ashoka Road', 'Delhi', 'Delhi', '110001'),
(12, '89 MG Road', 'Pune', 'Maharashtra', '411001'),
(13, '12 Brigade Road', 'Bengaluru', 'Karnataka', '560025'),
(14, '34 Park Street', 'Kolkata', 'West Bengal', '700016'),
(15, '56 Connaught Place', 'Delhi', 'Delhi', '110001'),
(16, '78 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(17, '90 MG Marg', 'Dehradun', 'Uttarakhand', '248001'),
(18, '11 North Usman Road', 'Chennai', 'Tamil Nadu', '600017'),
(19, '33 Residency Road', 'Bengaluru', 'Karnataka', '560025'),
(20, '22 Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001'),
(21, '45 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(22, '45 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(23, '45 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(24, '45 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(25, '69 Boisar', 'Mumbai', 'Maharashtra', '400020');

CREATE TABLE admin_users (
id INT PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(100),
 gender ENUM('Male', 'Female', 'Other'),
 date_of_birth DATE,
 salary INT
);

INSERT INTO admin_users (id, name, email, gender, date_of_birth, salary) VALUES
(101, 'Anil Kumar', 'anil@example.com', 'Male', '1985-04-12', 60000),
(102, 'Pooja Sharma', 'pooja@example.com', 'Female', '1992-09-20', 58000),
(103, 'Rakesh Yadav', 'rakesh@example.com', 'Male', '1989-11-05', 54000),
(104, 'Fatima Begum', 'fatima@example.com', 'Female', '1990-06-30', 62000);

CREATE TABLE user_log (
id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
name VARCHAR(100),
created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 1. INNER JOIN
-- Returns only the matching rows from both tables.
SELECT users.name, addresses.city
FROM users
INNER JOIN addresses ON users.id = addresses.user_id;
-- Output:
-- name	city
-- Aarav	Mumbai
-- Sneha	Kolkata
-- Raj is excluded because there is no matching address. Delhi is excluded because its user_id (4) is not in users.
-- Visual Representation:
-- users          addresses
--  -----           ------
-- |  1  |         |  1  |
-- |  2  |         |  2  |
-- |     |         |     |
--  => only matching pairs

-- 2. LEFT JOIN
-- Returns all rows from the left table (users), and matching rows from the right table (addresses). If no match is found, NULLs are returned.
SELECT users.name, addresses.city
FROM users
LEFT JOIN addresses ON users.id = addresses.user_id;
-- Output:
-- name	city
-- Aarav	Mumbai
-- Sneha	Kolkata
-- Raj	NULL
-- Raj is shown even though he doesn’t have an address.

-- Visual Representation:
-- users          addresses
--  -----           ------
-- |  1  |         |  1  |
-- |  2  |         |  2  |
-- |  3  |         |     |
--  => all users + matched addresses (or NULL)

-- 3. RIGHT JOIN
-- Returns all rows from the right table (addresses), and matching rows from the left table (users). If no match is found, NULLs are returned.
SELECT users.name, addresses.city
FROM users
RIGHT JOIN addresses ON users.id = addresses.user_id;

-- Output:
-- name	city
-- Aarav	Mumbai
-- Sneha	Kolkata
-- NULL	Delhi
-- Delhi is shown even though it points to a user_id that doesn't exist.

-- Visual Representation:
-- users          addresses
--  -----           ------
-- |  1  |         |  1  |
-- |  2  |         |  2  |
-- |     |         |  4  |
--  => all addresses + matched users (or NULL)
-- Summary Table
-- JOIN Type	Description
-- INNER JOIN	Only matching rows from both tables
-- LEFT JOIN	All rows from left table + matching from right
-- RIGHT JOIN	All rows from right table + matching from left

-- SQL UNION and UNION ALL
-- The UNION operator in SQL is used to combine the result sets of two or more SELECT statements. It removes duplicates by default.
-- If you want to include all rows including duplicates, use UNION ALL.
-- Example Scenario
-- You already have a users table for active users. Now, we’ll create an admin_users table to store users who are administrators or have special roles. We will then combine the names from both tables using UNION.

-- Step 1: Create the admin_users Table
CREATE TABLE admin_users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary INT
);

select * from admin_users;

-- Step 2: Insert Sample Data into admin_users
INSERT INTO admin_users (id, name, email, gender, date_of_birth, salary) VALUES
(101, 'Anil Kumar', 'anil@example.com', 'Male', '1985-04-12', 60000),
(102, 'Pooja Sharma', 'pooja@example.com', 'Female', '1992-09-20', 58000),
(103, 'Rakesh Yadav', 'rakesh@example.com', 'Male', '1989-11-05', 54000),
(104, 'Fatima Begum', 'fatima@example.com', 'Female', '1990-06-30', 62000);

-- Step 3: Use UNION to Combine Data
-- Let’s combine the active and admin user names.
SELECT name FROM users
UNION
SELECT name FROM admin_users;

-- This returns a single list of unique names from both tables.

-- UNION ALL Example
-- If you want to keep duplicate names (if any), use UNION ALL.
SELECT name FROM users
UNION ALL
SELECT name FROM admin_users;

-- Using More Than One Column
-- You can also select multiple columns as long as both SELECT queries return the same number of columns with compatible types.
SELECT name, salary FROM users
UNION
SELECT name, salary FROM admin_users;

-- Adding separate roles
SELECT name, 'User' AS role FROM users
UNION
SELECT name, 'Admin' AS role FROM admin_users;

-- Using Order By with UNION
SELECT name FROM users
UNION
SELECT name FROM admin_users
ORDER BY name;

-- Rules of UNION
-- The number of columns and their data types must match in all SELECT statements.
-- UNION removes duplicates by default.
-- UNION ALL keeps duplicates.
-- When to Use UNION
-- When you have two similar tables (like current and archived data).
-- When you need to combine filtered results (e.g., high-salary users from two sources).
-- When performing cross-category reporting.
-- Summary
-- Operator	Behavior
-- UNION	Combines results, removes duplicates
-- UNION ALL	Combines results, keeps duplicates
-- Self JOIN in MySQL
-- A Self JOIN is a regular join, but the table is joined with itself.
-- This is useful when rows in the same table are related to each other. For example, when users refer other users, and we store the ID of the person who referred them in the same users table.

-- Step 1: Add a referred_by_id Column
-- We’ll extend the existing users table to include a column called referred_by_id, which holds the id of the user who referred them.
ALTER TABLE users
ADD COLUMN referred_by_id INT;

-- This column:
-- Will be NULL for users who were not referred.
-- Will contain the id of another user who referred them.
-- Step 2: Insert Referral Data (Optional)
-- Assuming id = 1 is the first user, and referred others:
UPDATE users SET referred_by_id = 1 WHERE id IN (2, 3); -- User 1 referred Users 2 and 3
UPDATE users SET referred_by_id = 2 WHERE id = 4;       -- User 2 referred User 4

-- Step 3: Use a Self JOIN to Get Referrer Names
-- We want to get each user’s name along with the name of the person who referred them.
SELECT 
  a.id,
  a.name AS user_name,
  b.name AS referred_by
FROM users a
LEFT JOIN users b ON a.referred_by_id = b.id;

-- Explanation:
-- a refers to the user being queried.
-- b refers to the user who referred them.
-- LEFT JOIN is used so that users with NULL in referred_by_id are also included.
-- Sample Output:
-- id	user_name	referred_by
-- 1	Aarav	NULL
-- 2	Sneha	Aarav
-- 3	Raj	Aarav
-- 4	Fatima	Sneha
-- Summary
-- Use Self JOIN when you need to join a table with itself.

-- In referral-based relationships, store the referrer’s id in the same table.
-- Use aliases like a and b to differentiate the two instances of the same table.

-- MySQL Views
-- A view in MySQL is a virtual table based on the result of a SELECT query. It does not store data itself — it always reflects the current data in the base tables.
-- Views are useful when:
-- You want to simplify complex queries
-- You want to reuse logic
-- You want to hide certain columns from users
-- You want a "live snapshot" of filtered data
-- Creating a View
-- Suppose we want a view that lists all users earning more than ₹70,000.
CREATE VIEW high_salary_users AS
SELECT id, name, salary
FROM users
WHERE salary > 70000;

-- Querying the View
SELECT * FROM high_salary_users;

-- This will return all users from the users table where salary is above ₹70,000.
-- Demonstrating That a View is Always Up-To-Date
-- Let’s see what happens when the underlying data changes.

-- Step 1: View before update
SELECT * FROM high_salary_users;

-- Output:
-- id	name	salary
-- 2	Sneha	75000
-- 5	Fatima	80000
-- Step 2: Update a user's salary
SET SQL_SAFE_UPDATES = 0;

UPDATE users
SET salary = 72000
WHERE name = 'Raj';

SET SQL_SAFE_UPDATES = 1;

-- Step 3: Query the view again
SELECT * FROM high_salary_users;

-- New Output:
-- id	name	salary
-- 2	Sneha	75000
-- 5	Fatima	80000
-- 3	Raj	72000
-- Notice how Raj is now included in the view — without updating the view itself. That’s because views always reflect live data from the original table.

-- Dropping a View
-- To remove a view:
DROP VIEW high_salary_users;

-- Summary
-- Views act like saved SELECT queries
-- Views are not duplicated data
-- Changes to base tables are reflected automatically
-- Great for simplifying complex queries or creating filtered access
-- MySQL Indexes
-- Indexes in MySQL are used to speed up data retrieval. They work like the index of a book — helping the database engine find rows faster, especially for searches, filters, and joins.

-- Viewing Indexes on a Table
-- To see the indexes on a table, use:
SHOW INDEXES FROM users;

-- This shows all the indexes currently defined on the users table, including the automatically created primary key index.

-- Creating a Single-Column Index
-- Suppose you're frequently searching users by their email. You can speed this up by indexing the email column.
CREATE INDEX idx_email ON users(email);

-- What this does:
-- Creates an index named idx_email
-- Improves performance of queries like:
SELECT * FROM users WHERE email = 'example@example.com';

-- Important Notes
-- Indexes consume extra disk space
-- Indexes slow down INSERT, UPDATE, and DELETE operations slightly (because the index must be updated)
-- Use indexes only when needed (i.e., for columns used in WHERE, JOIN, ORDER BY)
-- Creating a Multi-Column Index
-- If you often query users using both gender and salary, a multi-column index is more efficient than separate indexes.
CREATE INDEX idx_gender_salary ON users(gender, salary);

-- Usage Example:
SELECT * FROM users
WHERE gender = 'Female' AND salary > 70000;

-- This query can take advantage of the combined index on gender and salary.
-- Index Order Matters
-- For a multi-column index on (gender, salary):
-- This works efficiently:
SELECT * FROM users
WHERE gender = 'Female' AND salary > 70000;
-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE salary > 70000' at line 1

-- But this may not use the index effectively:
SELECT * FROM users
WHERE salary > 70000;

-- Because the first column in the index (gender) is missing in the filter.
-- Dropping an Index
-- To delete an index:
DROP INDEX idx_email ON users;

-- Summary
-- Feature	Description
-- SHOW INDEXES	View current indexes on a table
-- CREATE INDEX	Create single or multi-column indexes
-- DROP INDEX	Remove an index
-- Use when	Query performance on large tables is a concern
-- Avoid on	Columns that are rarely queried or always unique

-- Scalar Subquery Example
-- This subquery returns a single value — the average salary — and we compare each user's salary against it.
SELECT id, name, salary
FROM users
WHERE salary > (
    SELECT AVG(salary) FROM users
);

-- Subquery with IN
-- Now let's say we want to find users who have been referred by someone who earns more than ₹75,000.
SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
    SELECT id FROM users WHERE salary > 75000
);

-- Other Places Subqueries Are Used
-- You can also use subqueries:
-- Inside SELECT columns (called scalar subqueries)
-- In the FROM clause to create derived tables
-- Example in SELECT:
SELECT name, salary,
  (SELECT AVG(salary) FROM users) AS average_salary
FROM users;

-- Group by and having 
-- GROUP BY Example: Average Salary by Gender
SELECT gender, AVG(salary) AS average_salary
FROM users
GROUP BY gender;

-- GROUP BY with COUNT
-- Find how many users were referred by each user:
SELECT referred_by_id, COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id;

-- HAVING Clause: Filtering Groups
-- Let’s say we only want to show genders where the average salary is greater than ₹75,000.
SELECT gender, AVG(salary) AS avg_salary
FROM users
GROUP BY gender
HAVING AVG(salary) > 75000;

-- Another Example: Groups with More Than 1 Referral
SELECT referred_by_id, COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id
HAVING COUNT(*) > 1;

-- ROLLUP
-- To get subtotals and grand totals, you can use ROLLUP:
SELECT gender, COUNT(*) AS total_users
FROM users
GROUP BY gender WITH ROLLUP;

-- Syntax for Creating a Stored Procedure
-- DELIMITER $$
--  
-- CREATE PROCEDURE procedure_name()
-- BEGIN
--     -- SQL statements go here
-- END$$
--  
-- DELIMITER ;

-- Creating a Procedure with Input Parameters
-- Let’s say you want to create a stored procedure that inserts a new user into the users table.
-- Example:

DELIMITER $$
CREATE PROCEDURE AddUser(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_gender ENUM('Male', 'Female', 'Other'),
    IN p_dob DATE,
    IN p_salary INT
)
BEGIN
    INSERT INTO users (name, email, gender, date_of_birth, salary)
    VALUES (p_name, p_email, p_gender, p_dob, p_salary);
END$$ 
DELIMITER ;

-- Calling the Procedure
-- You can call the procedure using:
CALL AddUser('Kiran Sharma', 'kiran@example.com', 'Female', '1994-06-15', 72000);

-- Viewing Stored Procedures
SHOW PROCEDURE STATUS WHERE Db = 'startersql';

-- Dropping a Stored Procedure
DROP PROCEDURE IF EXISTS AddUser;

-- Triggers are commonly used for:
-- Logging changes
-- Enforcing additional business rules
-- Automatically updating related data
-- Basic Trigger Structure
-- CREATE TRIGGER trigger_name
-- AFTER INSERT ON table_name
-- FOR EACH ROW
-- BEGIN
--     -- statements to execute
-- END;

-- Step 1: Create the Log Table
CREATE TABLE user_log2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create the Trigger
-- We now define a trigger that runs after a new user is added.

DELIMITER $$
 
CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, name)
    VALUES (NEW.id, NEW.name);
END$$

DELIMITER ;

-- Step 3: Test the Trigger
CALL AddUser('Ritika Jain', 'ritika@example.com', 'Female', '1996-03-12', 74000); # it shows error
-- Now check the user_log table:
SELECT * FROM user_log;

-- Dropping a Trigger
-- If you need to remove a trigger:
DROP TRIGGER IF EXISTS after_user_insert;
 
--  Logical Operator
-- 2. Add a Column to an Existing Table
-- Use ALTER TABLE to add a column:
ALTER TABLE users
ADD COLUMN city VARCHAR(100);

--  LIMIT with OFFSET
-- LIMIT is used to limit the number of rows returned. OFFSET skips a number of rows before starting to return rows.
SELECT * FROM users
ORDER BY id
LIMIT 5 OFFSET 10;

-- This skips the first 10 rows and returns the next 5.
-- Alternative syntax:
SELECT * FROM users
ORDER BY id
LIMIT 1, 5;

--  DISTINCT Keyword
-- DISTINCT is used to return only unique values.
SELECT DISTINCT gender FROM users;

--  TRUNCATE Keyword
-- TRUNCATE removes all rows from a table, but keeps the table structure.
-- TRUNCATE TABLE users;
-- Error Code: 1701. Cannot truncate a table referenced in a foreign key constraint (`startersql`.`addresses`, CONSTRAINT `fk_addresses_user`)
-- Faster than DELETE FROM users
-- Cannot be rolled back (unless in a transaction-safe environment)
 
--  CHANGE vs MODIFY Column
-- Both CHANGE and MODIFY are used to alter existing columns in a table, but they work slightly differently.
-- CHANGE: Rename and change datatype
ALTER TABLE users
CHANGE COLUMN city location VARCHAR(150);

-- This renames city to location and changes its type.
-- MODIFY: Only change datatype
ALTER TABLE users
MODIFY COLUMN salary BIGINT;

