{{config(materialized = 'table')}}

SELECT 
    
    category, 
    subcategory,
    --subcategory_sales_count
    count(*) as subcategory_sales_count,

    --nb_customers_by_subcategory
    count(distinct customer_id) as nb_customers,

    --nb_transactions
    COUNT(DISTINCT CONCAT(customer_id, '_', sale_date, '_', store_id)) AS nb_transactions,

    --turnover
    ROUND(SUM(order_amount),2) as turnover,

    --average_basket
    ROUND(SUM(order_amount)/ NULLIF(COUNT(DISTINCT CONCAT(customer_id, '_', sale_date, '_', store_id) ),0) , 2)as average_basket,

    --nb_refunded_sales
    COUNTIF(status = 'refunded') as nb_refunded_sales,

    --refunded_subcategory_rate
    ROUND(COUNTIF(status = 'refunded') *  100 / NULLIF(COUNT(*),0),2)  AS refunded_rate,


    sale_date

FROM  {{ref("tables_join")}} 
WHERE status  in ('completed','exchanged', 'refunded')
GROUP BY sale_date, category, subcategory
ORDER BY sale_date, category, subcategory