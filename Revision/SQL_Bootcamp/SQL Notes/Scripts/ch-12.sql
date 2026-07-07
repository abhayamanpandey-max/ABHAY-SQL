-- VIEWS it is a virtual table that is based on the result set of an SQL statement. It contains rows and columns, just like a real table. 
-- The fields in a view are fields from one or more real tables in the database. You can use views to: Simplify complex queries

CREATE VIEW dedup_view AS
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
    
    
    
    