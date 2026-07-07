-- REAL TIME SCENARIOS

-- SCENARIO 1 [Finding the nth value] most expensive product in each category
SELECT 
	subquery.* 
FROM 
(
SELECT 
	*,
    DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price DESC) AS ranking
FROM 
	dim_product
) subquery
WHERE 
	ranking = 5;
    
    
-- SCENARIO 2 [Removing Duplicates]
INSERT INTO customers (id, name, email)
VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com'),
(11, 'Abhay', 'abhay@example.com');

Select * from customers;

SELECT 
	subquery.*
FROM 
(
SELECT 
	*,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS dedup
FROM 
	customers
) subquery
WHERE 
	dedup = 1;


-- SCENARIO 3 [Lag & Lead]
CREATE TABLE weather (
	id INT PRIMARY KEY,
	temp FLOAT,
	date DATE
);

INSERT INTO weather (id, temp, date)
VALUES
(1, 25.5, '2026-07-01'),
(2, 26.0, '2026-07-02'),
(3, 24.8, '2026-07-03'),
(4, 27.2, '2026-07-04'),
(5, 28.1, '2026-07-05');

SELECT 
	*,
    LAG(temp,1,0) OVER(ORDER BY id ASC) AS prev_day_temp,
    LEAD(temp,1,0) OVER(ORDER BY id ASC) AS next_day_temp
FROM 
	weather;

