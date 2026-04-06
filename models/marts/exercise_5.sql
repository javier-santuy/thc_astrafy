--Exercice 5: Orders are segmented into 3 groups:
    --New: it's the 1st order of the customer (client_id) in the past 12 months. In the 12 months prior to this order, the customer did not place any orders
    --Returning: it's between the 2nd and the 4th order of the customer in the past 12 months. In the 12 months prior to this order, the customer had already placed between 1 and 3 orders
    --VIP: it's the 5th or more order of the customer in the past 12 months. In the 12 months prior to this order, the customer had already placed at least 4 orders or more
--Calculate for each order placed in 2023, the segment of this order.


WITH orders_with_history AS ( 
    SELECT 
        order_id,
        customer_id,
        date,
        COUNT(*) OVER ( -- Count how many orders the customer placed in the last 365 days
            PARTITION BY customer_id 
            ORDER BY UNIX_DATE(date) 
            RANGE BETWEEN 365 PRECEDING AND 1 PRECEDING
        ) AS orders_in_last_12_months
    FROM {{ ref('stg_orders_raw__sales_recrutement') }}
    GROUP BY order_id, customer_id, date
)

SELECT 
    order_id,
    customer_id,
    date,
    orders_in_last_12_months,
    CASE 
        WHEN orders_in_last_12_months = 0 THEN 'New'
        WHEN orders_in_last_12_months BETWEEN 1 AND 3 THEN 'Returning'
        WHEN orders_in_last_12_months >= 4 THEN 'VIP'
    END AS order_segment
FROM orders_with_history
WHERE EXTRACT(YEAR FROM date) = 2023
