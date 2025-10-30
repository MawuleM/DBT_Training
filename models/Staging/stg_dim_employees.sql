{{config(materialized = 'view')}}
SELECT 
    employee_id,
    first_name,
    last_name,
    store_id_assigned,
    FORMAT_DATE('%B', hire_date) as hire_month
FROM {{source('raw','dim_employees')}}
WHERE EXTRACT(year from hire_date) = 2024
ORDER BY EXTRACT (month from hire_date)