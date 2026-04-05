with source as (
    select * from {{ source('astrafy', 'orders_recrutement') }}
),

renamed as (
    select
   date_date as date,
   cast(customers_id as STRING) as customer_id,
   CAST(orders_id AS STRING) as order_id,
   net_sales
    from source
)

select * from renamed