{{ config(
    schema='gold',
    materialized='table'
) }}


with sources_orders as (
    SELECT order_id, order_date 
    FROM {{ ref('stg_orders') }}
),

sources_orders_details as (
    SELECT * FROM {{ ref('stg_order_details') }}
),

filtered as (
    SELECT 
        order_id
    FROM sources_orders
    WHERE EXTRACT(year from order_date) = 1997
),

business_rules as (
    SELECT
        SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) as total_revenues_1997
    FROM
        sources_orders_details as order_details
    INNER JOIN
        filtered
    ON
        order_details.order_id = filtered.order_id
)

SELECT * FROM business_rules

