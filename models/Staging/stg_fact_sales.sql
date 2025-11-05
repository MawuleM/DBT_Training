{{config(materialized = 'view')}}
SELECT 
    customer_id,
    store_id,
    product_id,
    employee_id,
    order_amount,
    billed_amount,
    concat(customer_id, '_', store_id, '_', sale_date, '_', product_id) as unique_key_transaction_id,
    DATE(sale_date) as sale_date,
    status
FROM {{source('raw', 'fact_sales')}}
ORDER BY sale_date

