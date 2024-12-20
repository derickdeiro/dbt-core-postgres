{{ config(
    materialized='table'
) }}

with orders_summary_cte as (
    SELECT 
        order_id,
        order_date,
        customer_id,
        customer_name,
        status,
        amount
    FROM {{ ref('int_orders') }}
),

business_logic as (
    SELECT 
        order_id,
        customer_id,
        customer_name,
        status as order_status, 
        sum(amount) as total_sales,
        count(order_id) as total_orders
    FROM orders_summary_cte
    GROUP BY
        order_id,
        customer_id,
        customer_name,
        order_status
)

SELECT * FROM business_logic