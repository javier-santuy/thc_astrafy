{{ config(materialized='table') }}

WITH orders_base AS (
    SELECT 
        order_id,
        customer_id,
        date,
        net_sales
    FROM {{ ref('stg_orders_raw__sales_recrutement') }}
    WHERE date >= "2022-01-01" AND date < "2024-01-01"
),

segmented_orders AS ( 
    SELECT 
        *,
        COUNT(*) OVER (
            PARTITION BY customer_id 
            ORDER BY UNIX_DATE(date) 
            RANGE BETWEEN 365 PRECEDING AND 1 PRECEDING
        ) AS orders_in_last_12_months
    FROM orders_base
)

SELECT 
    order_id,
    customer_id,
    date,
    net_sales,
    CASE 
        WHEN orders_in_last_12_months = 0 THEN 'New'
        WHEN orders_in_last_12_months BETWEEN 1 AND 3 THEN 'Returning'
        WHEN orders_in_last_12_months >= 4 THEN 'VIP'
    END AS order_segmentation
FROM segmented_orders
WHERE date >= "2023-01-01" AND date < "2024-01-01"