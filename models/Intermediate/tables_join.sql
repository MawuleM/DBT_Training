{{config(materialized = 'view')}}

with customers as (
    select * 
    from {{ref("stg_dim_customers")}}
),
employees as (
    select * 
    from {{ref("stg_dim_employees")}}
),
products as (
    select * 
    from {{ref("stg_dim_products")}} 
),
stores as (
    select *
    from {{ref("stg_dim_stores")}}
),
sales as (
    select *
    from {{ref("stg_fact_sales")}}
)

SELECT 
    
    --customers
    sales.customer_id,
    customers.first_name,
    customers.last_name,

    --products
    sales.product_id,
    products.product_name,
    products.category,
    products.subcategory,

    --stores
    sales.store_id,
    stores.store_name,
    stores.city,
    stores.region,

    --sales
    sales.order_amount,
    sales.sale_date,
    sales.status

FROM sales 
LEFT JOIN customers on customers.customer_id = sales.customer_id
LEFT JOIN products on products.product_id = sales.product_id
LEFT JOIN stores on stores.store_id = sales.store_id
ORDER BY sales.sale_date

