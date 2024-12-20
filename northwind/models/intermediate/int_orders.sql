{{ config(
    materialized='view'
) }}

with orders_cte as (
    SELECT 
        order_id,
        order_date,
        customer_id,
        status,
        amount,
        country_code
    FROM {{ ref('stg_orders_dbt_tests') }}
),

customers_cte as (
    SELECT 
        id as customer_id,
        name
    FROM {{ ref('stg_customers_dbt_tests') }}
)

SELECT 
    o.order_id,
    o.order_date,
    o.customer_id,
    c.name as customer_name,
    o.status,
    o.amount,
    o.country_code
FROM orders_cte o
JOIN customers_cte c
ON o.customer_id = c.customer_id