-- #Window Functions
-- ROW_NUMBER()
-- Assign a unique sequential integer to rows within a partition of a result set:
SELECT id, name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_number
FROM users;
-- RANK()
-- Assign a rank to rows within a partition of a result set, with gaps in ranking for ties:
SELECT id, name, salary,
       RANK() OVER (ORDER BY salary DESC) AS rank   
FROM users;
-- DENSE_RANK()
-- Assign a rank to rows within a partition of a result set, without gaps in ranking for ties:
SELECT id, name, salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM users; 
-- LAG() and LEAD()
-- Access data from a previous or next row in the same result set without using a self-join:
SELECT id, name, salary,
       LAG(salary) OVER (ORDER BY salary) AS previous_salary,
       LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM users;

-- # Common Table Expressions (CTEs)
-- CTEs allow you to define a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
-- Basic CTE Syntax:    
WITH cte_name AS (
    -- CTE query
    SELECT column1, column2
    FROM table_name
    WHERE u.salary > 50000
)
SELECT *
FROM cte_name
WHERE u.salary < 100000;
-- Example: Get users with above-average salary using a CTE:    
WITH avg_salary AS (
    SELECT AVG(salary) AS average_salary
    FROM users
)
SELECT u.*
FROM users u
CROSS JOIN avg_salary a
WHERE u.salary > a.average_salary;

--Limitations of CTEs:
-- 1. CTEs are not stored as an object and are only available during the execution of the query.
-- 2. CTEs cannot be indexed, which may affect performance for large datasets.

--Like satement
SELECT * FROM users WHERE name LIKE 'A%';  -- Starts with A 

