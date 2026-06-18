-- MySQL Constraints
-- Constraints in MySQL are rules applied to table columns to ensure the accuracy, validity, and integrity of the data.

CREATE DATABASE IF NOT EXISTS startersql2;
USE startersql2;

-- unique constraints
CREATE TABLE users2 (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

-- Add UNIQUE using ALTER TABLE:-- 
-- ALTER TABLE users2
-- ADD CONSTRAINT unique_email UNIQUE (email);

-- NOT NULL Constraint
-- Ensures that a column cannot contain NULL values.

-- Example:
CREATE TABLE users3 (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Change an existing column to NOT NULL:
ALTER TABLE users3
MODIFY COLUMN name VARCHAR(100) NOT NULL;

-- Make a column nullable again:
ALTER TABLE users3
MODIFY COLUMN name VARCHAR(100) NULL;

-- CHECK Constraint
-- Ensures that values in a column satisfy a specific condition.

-- Example: Allow only dates of birth after Jan 1, 2000
-- ALTER TABLE users
-- ADD CONSTRAINT chk_dob CHECK (date_of_birth > '2000-01-01');
-- Error Code: 3819. Check constraint 'chk_dob' is violated.
-- Error Code: 1054. Unknown column 'date_of_birth' in 'check constraint chk_dob expression'
DESCRIBE users;
-- Naming the constraint (chk_dob) helps if you want to drop it later.
-- Fix
SELECT id, name, date_of_birth 
FROM users 
WHERE date_of_birth <= '2000-01-01' OR date_of_birth IS NULL;

SET SQL_SAFE_UPDATES = 0; -- Just in case safe mode is on
UPDATE users 
SET date_of_birth = '2005-01-01' 
WHERE date_of_birth <= '2000-01-01';
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM users 
WHERE date_of_birth <= '2000-01-01';
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE users ADD CONSTRAINT chk_dob CHECK (date_of_birth > '2000-01-01');

-- DEFAULT Constraint
-- Sets a default value for a column if none is provided during insert.
-- Example:
CREATE TABLE users4 (
    id INT PRIMARY KEY,
    is_active BOOLEAN DEFAULT TRUE
);
-- Add DEFAULT using ALTER TABLE:
ALTER TABLE users4
ALTER COLUMN is_active SET DEFAULT TRUE;

-- PRIMARY KEY Constraint
-- Uniquely identifies each row. Must be NOT NULL and UNIQUE.
-- Example:
CREATE TABLE users5 (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
-- Add later with ALTER TABLE:
-- fix
-- - step 1 If the old primary key has AUTO_INCREMENT, you must remove that attribute first
ALTER TABLE users5 MODIFY COLUMN id INT;
-- step 2 Drop the existing primary key
ALTER TABLE users5 DROP PRIMARY KEY;
ALTER TABLE users5
ADD PRIMARY KEY (id);
-- Error Code: 1068. Multiple primary key defined
-- This error happens because a table can only have one primary key.

-- AUTO_INCREMENT
-- Used with PRIMARY KEY to automatically assign the next number.
-- Example:
CREATE TABLE users6 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
-- Each new row gets the next available integer value in id.

-- SQL Functions (MySQL)
-- SQL functions help you analyze, transform, or summarize data in your tables.

-- We'll use the users table which includes:

-- id, name, email, gender, date_of_birth, salary, created_at
-- 1. Aggregate Functions
-- These return a single value from a set of rows.

-- COUNT()
-- Count total number of users:

SELECT COUNT(*) FROM users;

-- Count users who are Female:

SELECT COUNT(*) FROM users WHERE gender = 'Female';

-- MIN() and MAX()
-- Get the minimum and maximum salary:

SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM users;

-- SUM()
-- Calculate total salary payout:

SELECT SUM(salary) AS total_payroll FROM users;

-- AVG()
-- Find average salary:

SELECT AVG(salary) AS avg_salary FROM users;

-- Grouping with GROUP BY
-- Average salary by gender:

SELECT gender, AVG(salary) AS avg_salary
FROM users
GROUP BY gender;

-- 2. String Functions
-- LENGTH()
-- Length of user names:

SELECT name, LENGTH(name) AS name_length FROM users;

-- LOWER() and UPPER()
-- Convert names to lowercase or uppercase:

SELECT name, LOWER(name) AS lowercase_name FROM users;
SELECT name, UPPER(name) AS uppercase_name FROM users;

-- CONCAT()
-- Combine name and email:

SELECT CONCAT(name, ' <', email, '>') AS user_contact FROM users;

-- 3. Date Functions
-- NOW()
-- Current date and time:

SELECT NOW();

-- YEAR(), MONTH(), DAY()
-- Extract parts of date_of_birth:

SELECT name, YEAR(date_of_birth) AS birth_year FROM users;

-- DATEDIFF()
-- Find number of days between today and birthdate:

SELECT name, DATEDIFF(CURDATE(), date_of_birth) AS days_lived FROM users;

-- TIMESTAMPDIFF()
-- Calculate age in years:

SELECT name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age FROM users;

-- 4. Mathematical Functions
-- ROUND(), FLOOR(), CEIL()
SELECT salary,
       ROUND(salary) AS rounded,
       FLOOR(salary) AS floored,
       CEIL(salary) AS ceiled
FROM users;

-- MOD()
-- Find even or odd user IDs:

SELECT id, MOD(id, 2) AS remainder FROM users;

-- 5. Conditional Functions
-- IF()
SELECT name, gender,
       IF(gender = 'Female', 'Yes', 'No') AS is_female
FROM users;

-- MySQL Transactions and AutoCommit

-- To disable AutoCommit:
SET autocommit = 0;
-- Important: Until you execute a COMMIT, your changes are not permanent

-- To commit a transaction:
COMMIT;

-- To rollback a transaction:
ROLLBACK;

-- Example Workflow
-- Here’s a simple example of using COMMIT and ROLLBACK in a transaction:

-- Turn off AutoCommit:
SET autocommit = 0;

-- Make some changes (e.g., updating a salary):
UPDATE users SET salary = 80000 WHERE id = 5;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
-- --- and we want this to be on sfe side

-- Decide whether to commit or rollback:

-- If you’re happy with the changes, run:
COMMIT;

-- If you’re not happy and want to revert the changes, run:
ROLLBACK;


-- Primary key
CREATE TABLE users7 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE users8 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(100)
);


-- Can I Drop a PRIMARY KEY?
-- Yes, but it is more restricted than dropping a UNIQUE constraint.

ALTER TABLE users8 DROP PRIMARY KEY;
-- This may fail if the primary key is being used elsewhere (like in a foreign key or auto_increment column).
-- To drop a UNIQUE constraint:

ALTER TABLE users8 DROP INDEX email;


-- Auto Increment
CREATE TABLE users9 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

ALTER TABLE users AUTO_INCREMENT = 1000;

