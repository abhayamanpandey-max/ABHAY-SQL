-- TRANSFORMATIONS
select * from dim_product;
select * from dim_date;
select * from dim_customer;

-- Numeric Transformations
SELECT 
	unit_price * 0.90 AS discounted_price,
    unit_price + 10 as taxed_price,
    unit_price / 10 as fractioned_price,
    ROUND(unit_price,1) as rounded_price,
    unit_price * unit_price as multiply_price
FROM 
	dim_product;
   
   
-- DATE Transformations
select * from dim_date;
-- 1) 
SELECT 
	date,
    now() as 'current_timestamp',
    utc_date() AS utc_date,
    utc_time() AS utc_time,
    utc_timestamp() AS utc_timestamp
FROM 
	dim_date;
    
-- 2)
SELECT 
	date,
    YEAR(date) AS year,
    MONTH(date) AS month,
    DAY(date) AS day,
    WEEKDAY(date) AS weekday,
    DAYNAME(date) AS day_name,
    DATEDIFF(DATE(utc_timestamp()),date) AS total_days,
    ADDDATE(date,2) AS added_date,
    SUBDATE(date,2) AS subtracted_date,
    CAST('2025-01-01' AS datetime) AS new_date
FROM 
	dim_date;
-- 3)
SELECT 
	date,
    date_format(date,"%W %M %e %Y") AS converted_date
FROM 
	dim_date;

-- TYPE CASTING
SELECT 
	customer_key,
    CAST(customer_key AS CHAR(100)) AS customer_key_char
FROM
	dim_customer;


-- STRING FUNCTIONS
SELECT 
	*,
	CONCAT(first_name,' ',last_name) AS full_name,
    CONCAT_WS(' ',first_name,last_name,country) AS Name_and_Country,
    LENGTH(country) AS country_size,
    LOWER(city) AS lower_city,
    SUBSTRING(email,1,6) AS email_prefix,
    REPLACE(email,'@','%') AS replaced_email,
    LEFT(country,3) AS country_prefix,
    RIGHT(country,3) AS country_suffix,
    REVERSE(country) AS reversed_country,
    REPEAT(first_name,2) AS repeated_first_name
FROM 
	dim_customer;



    
    
    
    
    
    
    
    
    
