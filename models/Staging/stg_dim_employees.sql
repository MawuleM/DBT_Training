{{config(materialized = 'view')}}
SELECT 
    employee_id,
    first_name,
    last_name,
    store_id_assigned,
    hire_date
FROM {{source('raw','dim_employees')}}
WHERE EXTRACT(year from hire_date) = 2024
ORDER BY hire_date