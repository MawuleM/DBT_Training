{{config(materialized = 'table')}}
--monthly_nb_sales
SELECT DATE_TRUNC (sale_date,month) as month, DATE_TRUNC (sale_date, year) as year, count(billed_amount) as number_sales
FROM `aivancity-learn.sources_tables.fact_sales`
GROUP BY  year, month
ORDER BY  year, month
