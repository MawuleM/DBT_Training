{{config(materialized = 'table')}}

SELECT 
    --nb_products_sold
    product_name,
    product_category,
    product_subcategory,
    count(*) as nb_products_sold,

    --nb_customers_by_products
    count(distinct customer_id) as nb_customers,

    --nb_transactions
    COUNT(DISTINCT CONCAT(customer_id, '_', sale_date, '_', store_id)) AS nb_transactions,

    --turnover
    ROUND(SUM(order_amount),2) as turnover,

    --average_basket
    ROUND(SUM(order_amount)/ NULLIF(COUNT(DISTINCT CONCAT(customer_id, '_', sale_date, '_', store_id) ),0) , 2)as average_basket,

    --nb_refunded_sales
    COUNTIF(status = 'refunded') as nb_refunded_sales,

    --refunded_products_rate
    ROUND(COUNTIF(status = 'refunded') *  100 / NULLIF(COUNT(*),0),2)  AS refunded_rate,

    sale_date

FROM {{ref("tables_join")}} 
WHERE status  in ('completed','exchanged', 'refunded')
GROUP BY sale_date, product_name,product_category,product_subcategory
ORDER BY sale_date, product_name

