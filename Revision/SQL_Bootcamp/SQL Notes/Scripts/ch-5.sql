-- DML COMMANDS

-- INSERT COMMAND (Already Done)
INSERT INTO customers (id, name, email)
VALUES
 (1, 'John Doe', 'john.doe@example.com'),
 (11, 'Abhay', 'abhay@example.com');
-- UPDATE COMMAND
UPDATE customers
SET name = 'John the Don'
WHERE email = 'john.doe@example.com';


-- DELETE COMMAND
DELETE FROM customers 
WHERE email = 'john.doe@example.com';

SELECT * FROM customers