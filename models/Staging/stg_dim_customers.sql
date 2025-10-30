{{config(materialized='view')}}
SELECT 
    customer_id,
    first_name,
    last_name,
    signup_date
FROM {{ source('raw', 'dim_customers') }}   
WHERE EXTRACT(year from signup_date) = 2024 
ORDER BY signup_date