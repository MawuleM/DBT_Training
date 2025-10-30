{{config(materialized = 'view')}}
SELECT 
    customer_id,
    store_id,
    product_id,
    employee_id,
    order_amount,
    billed_amount,
    FORMAT_DATE('%B',sale_date) as sale_month,
    status
FROM {{source('raw', 'fact_sales')}}
WHERE EXTRACT(year from sale_date) = 2024
ORDER BY EXTRACT (MONTH FROM sale_date)
