{{
    config(
        materialized = 'table',
        partition_by = {
            "field": "sale_date",
            "data_type": "date",
            "granularity": "day"
        },
        cluster_by = ["store_name", "product_category", "sales_status"]
    )
}}



SELECT 
    product_category,
    product_subcategory,
    store_name,
    store_city,
    store_region,
    status as sales_status,

   --nb_customers
   count(distinct customer_id) as nb_customers,

   --nb_transactions
   count (distinct unique_key_transaction_id) as total_transactions,

   --turnover
   sum(order_amount) as turnover,

   --unique_product_sold
   count(distinct product_id) as unique_products_sold,

   --nb_refunded_sales
    COUNTIF(status = 'refunded') as nb_refunded_sales,
   
   sale_date

from {{ref("tables_join")}}
group by all

