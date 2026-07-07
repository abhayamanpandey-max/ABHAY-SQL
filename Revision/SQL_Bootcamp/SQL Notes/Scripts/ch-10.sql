-- Active: 1781403346823@@Localhost@3306@sales
-- CTEs [Common Table Expressions]
select * from dim_product;
WITH cte_table AS
(
SELECT 
	* 
FROM 
	dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM dim_product)
),
cte_table_2 AS
(
SELECT * FROM cte_table
WHERE 
	product_name IN ('Figure Method','Huge Change', 'Film Finally') 
)
SELECT * FROM cte_table_2
WHERE product_name = 'Figure Method';


--Lag and Lead
SELECT 
	*,
	LAG(unit_price,1,0) OVER(ORDER BY launch_date ASC) AS prev_day_price,
	LAG(unit_price,2,0) OVER(ORDER BY launch_date ASC) AS prev_2days_price,
	LEAD(unit_price,1,0) OVER(ORDER BY launch_date ASC) AS next_day_price,
	LEAD(unit_price,2,0) OVER(ORDER BY launch_date ASC) AS next_2days_price
FROM 
	dim_product;

    
    