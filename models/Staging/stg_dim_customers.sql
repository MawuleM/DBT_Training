{{config(materialized='view')}}
SELECT 
    customer_id,
    first_name,
    last_name,
    signup_date
FROM {{ source('raw', 'dim_customers') }}    
ORDER BY signup_date
