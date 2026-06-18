CREATE DATABASE IF NOT EXISTS startersql;
USE startersql;

-- Note never use drop if not need it cant be rollback
-- DROP DATABASE startersql;-- 

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM users; #Every time i have to select and execut this live to get output as table

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

SELECT * FROM users; #Every time i have to select and execut this live to get output as table

SELECT name, email FROM users;

RENAME TABLE users TO customers;
SELECT * FROM customers; #Every time i have to select and execut this live to get output as table

RENAME TABLE customers TO users;

ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

ALTER TABLE users DROP COLUMN is_active;

ALTER TABLE users MODIFY COLUMN name VARCHAR(50);

ALTER TABLE users MODIFY COLUMN email VARCHAR(100) FIRST;

ALTER TABLE users MODIFY COLUMN gender ENUM('Male', 'Female', 'Other') AFTER name;


-- INSERT INTO users VALUES
-- (1, 'Alice', 'alice@example.com', 'Female', '1995-05-14', DEFAULT);
-- Not recommended if your table structure might change (e.g., new columns added later)-- 

INSERT INTO users (name, email, gender, date_of_birth) VALUES
('Bob', 'bob@example.com', 'Male', '1990-11-23');

INSERT INTO users (name, email, gender, date_of_birth) VALUES
('Charlie', 'charlie@example.com', 'Other', '1988-02-17'),
('David', 'david@example.com', 'Male', '2000-08-09'),
('Eva', 'eva@example.com', 'Female', '1993-12-30');

-- SELECT column1, column2 FROM table_name; # basic syntex
SELECT * FROM users;

SELECT * FROM users WHERE gender = 'Male';
-- by not  equal to
SELECT * FROM users WHERE gender != 'Female';
-- or
SELECT * FROM users WHERE gender <> 'Female';

-- Grater than and Less than
SELECT * FROM users WHERE id >= 5;
SELECT * FROM users WHERE id <= 20;

-- Is null and not null
SELECT * FROM users WHERE date_of_birth IS NULL;
SELECT * FROM users WHERE date_of_birth IS NOT NULL;

-- between
SELECT * FROM users WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';
-- in
SELECT * FROM users WHERE gender IN ('Male', 'Other');

-- Like pattern matching 
SELECT * FROM users WHERE name LIKE 'A%';  -- Starts with A
SELECT * FROM users WHERE name LIKE '%a';  -- Ends with a
SELECT * FROM users WHERE name LIKE '%li%'; -- Contains 'li'

-- And / OR
SELECT * FROM users WHERE gender = 'Female' AND date_of_birth > '1990-01-01';
SELECT * FROM users WHERE gender = 'Male' OR gender = 'Other';

-- Order by
SELECT * FROM users ORDER BY date_of_birth ASC;
SELECT * FROM users ORDER BY name DESC;

-- Limits 
SELECT * FROM users LIMIT 5;  -- Top 5 rows
SELECT * FROM users LIMIT 10 OFFSET 5;  -- Skip first 5 rows, then get next 10
SELECT * FROM users LIMIT 5, 10;  -- Get 10 rows starting from the 6th row (Same as above)
SELECT * FROM users ORDER BY created_at DESC LIMIT 10; -- Sorts the rows based on the created_at column (usually a timestamp) in descending order (newest/latest dates first). If it were ASC (ascending), it would show the oldest acounts first

SELECT * FROM users WHERE salary > 60000 ORDER BY created_at DESC LIMIT 5;
SELECT * FROM users ORDER BY salary DESC;
SELECT * FROM users WHERE salary BETWEEN 50000 AND 70000 ORDER BY salary DESC;
SELECT * FROM users WHERE salary BETWEEN 50000 AND 70000 ORDER BY salary ASC;

-- update one colum
UPDATE users
SET name = 'ABHAY'
WHERE id = 1;

-- update multiple colum
UPDATE users
SET name = 'Robert', email = 'robert@example.com'
WHERE id = 2;
 
 -- without where clause(Warning)
--  UPDATE users
-- SET gender = 'Other';

-- Update the salary of user with id = 5 to ₹70,000
UPDATE users SET salary = 70000 WHERE id = 5;

-- Change the name of the user with email aisha@example.com to Aisha Khan.
UPDATE users
SET name = 'Aisha Khan'
WHERE email = 'aisha@example.com';

 -- Increase salary by ₹10,000 for all users whose salary is less than ₹60,000.
 
--  Error : Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
-- Fix 
-- 1. Turn off safe updates for this session
SET SQL_SAFE_UPDATES = 0;

-- 2. Run your update query
UPDATE users
SET salary = salary + 10000
WHERE salary < 60000;

-- 3. Turn it back on to keep your data safe later
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM users WHERE salary < 60000;
SELECT * FROM users;

-- Set the gender of user Ishaan to Other.
SET SQL_SAFE_UPDATES = 0;
UPDATE users
SET gender = 'Other'
WHERE name = 'Ishaan';
SET SQL_SAFE_UPDATES = 1;

-- Reset salary of all users to ₹50,000 (Careful - affects all rows).
-- UPDATE users
-- SET salary = 50000;
-- Note: This query will overwrite salary for every user. Use with caution!

-- Delete one row
DELETE FROM users
WHERE id = 3;

-- Delete multiple rows
SET SQL_SAFE_UPDATES = 0;
DELETE FROM users
WHERE gender = 'Other';
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM users WHERE id = 3;

DELETE FROM users
WHERE salary < 50000;

DELETE FROM users
WHERE salary IS NULL;

-- Delete All Rows (but keep table structure)
-- DELETE FROM users;-- 

-- Drop the Entire Table (use with caution)
-- DROP TABLE users;
-- This removes the table structure and all data permanently.

