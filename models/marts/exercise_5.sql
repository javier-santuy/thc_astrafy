--Exercice 5: Order segmentation



WITH orders_with_history AS (
    SELECT 
        order_id,
        customer_id,
        date_date,
        COUNT(*) OVER (
            PARTITION BY customer_id 
            ORDER BY UNIX_DATE(date_date) 
            RANGE BETWEEN 365 PRECEDING AND 1 PRECEDING
        ) AS orders_in_last_12_months
    FROM {{ ref('stg_orders_raw__sales_recrutement') }}
    GROUP BY order_id, customer_id, date_date
)

SELECT 
    order_id,
    customer_id,
    date_date,
    orders_in_last_12_months,
    CASE 
        WHEN orders_in_last_12_months = 0 THEN 'New'
        WHEN orders_in_last_12_months BETWEEN 1 AND 3 THEN 'Returning'
        WHEN orders_in_last_12_months >= 4 THEN 'VIP'
    END AS order_segment
FROM orders_with_history
WHERE EXTRACT(YEAR FROM date_date) = 2023
