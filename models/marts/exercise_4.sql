--Exercice 4: Create a table (1 line per order) for all orders in the year 2022 and 2023; 
--this table is similar to orders with an additional column: the qty_product column that 
--gives the quantity of products in the order, for all orders in 2022 and 2023

{{ config(materialized='table') }}
   SELECT date_Date,customer_id, order_id,sum(net_sales) as sum_net_sales, sum(qty) AS qty_product
    FROM {{ ref('stg_orders_raw__sales_recrutement') }}
    WHERE date_date >= "2022-01-01" AND date_date < "2024-01-01"
    GROUP BY date_date,customer_id, order_id
