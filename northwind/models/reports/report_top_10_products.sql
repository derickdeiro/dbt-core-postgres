{{ config(
    schema='gold',
    materialized='table'
) }}

with top_10_products as (
    SELECT 
        products.product_name,
        SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) as sales
    FROM 
        {{ ref('stg_products') }} as products
    INNER JOIN 
        {{ ref('stg_order_details') }} as order_details
    ON
        products.product_id = order_details.product_id
    GROUP BY
        products.product_name
    ORDER BY
        sales DESC
    LIMIT 10
)

SELECT * FROM top_10_products