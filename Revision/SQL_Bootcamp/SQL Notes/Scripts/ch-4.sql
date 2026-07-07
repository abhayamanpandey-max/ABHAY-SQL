CREATE TABLE orders
(
	order_id INT,
	cust_id INT,
	price int,
	order_date DATE
);
INSERT INTO orders(order_id, cust_id, price, order_date)
VALUES
(1, 1, 100, '2022-01-01'),
(2, 2, 200, '2022-01-02'),
(3, 3, 300, '2022-01-03'),
(4, 4, 400, '2022-01-04'),
(5, 5, 500, '2022-01-05'),
(6, 6, 600, '2022-01-06'),
(7, 7, 700, '2022-01-07'),
(8, 8, 800, '2022-01-08'),
(9, 9, 900, '2022-01-09'),
(10, 10, 1000, '2022-01-10');

CREATE TABLE customers
(
	id INT,
	name VARCHAR(100),
	email VARCHAR(100)
);
INSERT INTO customers(id, name, email)
VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com'),
(3, 'Bob Johnson', 'bob.johnson@example.com'),
(4, 'Alice Brown', 'alice.brown@example.com'),
(5, 'Charlie Wilson', 'charlie.wilson@example.com'),
(6, 'Diana Davis', 'diana.davis@example.com'),
(7, 'Eve Miller', 'eve.miller@example.com'),
(8, 'Frank Garcia', 'frank.garcia@example.com'),
(9, 'Grace Rodriguez', 'grace.rodriguez@example.com'),
(10, 'Henry Martinez', 'henry.martinez@example.com');

-- JOINS 
-- INNER JOIN
SELECT 
	*
FROM 
	orders o 
INNER JOIN 
	customers c 
    ON 
		o.cust_id = c.id;

-- LEFT JOIN
SELECT 
	*
FROM 
	orders o 
LEFT JOIN 
	customers c 
    ON 
		o.cust_id = c.id;

-- RIGHT JOIN
SELECT 
	*
FROM 
	orders o 
RIGHT JOIN 
	customers c 
    ON 
		o.cust_id = c.id;
        
-- FULL JOIN (Not Supported)
SELECT 
	*
FROM 
	orders o 
FULL JOIN 
	customers c 
    ON 
		o.cust_id = c.id;
        
        
-- UNIONS
SELECT 
	*
FROM 
	orders o 
LEFT JOIN 
	customers c 
    ON 
		o.cust_id = c.id

UNION

SELECT 
	*
FROM 
	orders o 
RIGHT JOIN 
	customers c 
    ON 
		o.cust_id = c.id;
        