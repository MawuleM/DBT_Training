{{config(materialized= 'table')}}

SELECT 
    store_id,
    region,
    city,
  
    --nb_transactions
    count(distinct concat(customer_id,'_', store_id,'_',sale_date))as nb_transactions,

    --turnover
    round(sum(order_amount),2) as turnover,

    sale_date

FROM {{ref ("tables_join")}}
WHERE status in ('completed','exchanged')
GROUP BY sale_date,region,city, store_id
ORDER BY sale_date, turnover DESC