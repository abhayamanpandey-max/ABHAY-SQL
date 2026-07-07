-- CONDITIONALS
-- 1)
SELECT 
	*,
    CASE 
    WHEN unit_price <= 100 THEN 'affordable'
    WHEN unit_price <= 400 THEN 'normal'
    ELSE 'expensive (but not for you!)' 
    END AS price_category
FROM 
	dim_product;

-- 2)
SELECT 
	*,
    CASE 
    WHEN unit_price <= 100 AND category = 'clothing' THEN 'affordable'
    WHEN unit_price <= 400 AND category = 'clothing' THEN 'normal'
    WHEN unit_price > 400 AND category = 'clothing' THEN 'expensive (but not for you!)'
    ELSE CONCAT('Not for ',category) 
    END AS price_category
FROM 
	dim_product;
    
    
    
    