{{ config(materialized='table') }}

select * from {{ ref('stg_orders_raw__orders_recrutement') }}