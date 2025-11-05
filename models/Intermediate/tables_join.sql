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
    products.category as product_category,
    products.subcategory as product_subcategory,

    --stores
    sales.store_id,
    stores.store_name,
    stores.city as store_city,
    stores.region as store_region,

    --sales
    sales.order_amount,
    sales.sale_date,
    sales.status,
    sales.unique_key_transaction_id as  unique_key_transaction_id


FROM sales 
LEFT JOIN customers on customers.customer_id = sales.customer_id
LEFT JOIN products on products.product_id = sales.product_id
LEFT JOIN stores on stores.store_id = sales.store_id


