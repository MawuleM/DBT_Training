{{config(materialized='view')}}
SELECT 
    customer_id,
    first_name,
    last_name,
    FORMAT_DATE('%B',signup_date) as signup_month
FROM {{ source('raw', 'dim_customers') }}   
WHERE EXTRACT(year from signup_date) = 2024 
ORDER BY EXTRACT(Month from signup_date) 