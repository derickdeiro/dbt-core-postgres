{{ config(
    schema='gold',
    materialized='table'
) }}

with total_revenues_per_customer as (
    SELECT 
        customers.company_name,
        SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) as total
    FROM 
        {{ ref('stg_customers') }} as customers
    INNER JOIN 
        {{ ref('stg_orders') }} as orders
    ON
        customers.customer_id = orders.customer_id
    INNER JOIN
        {{ ref('stg_order_details') }} as order_details
    ON 
        orders.order_id = order_details.order_id
    GROUP BY
        customers.company_name
    ORDER BY
        total desc
)

SELECT * FROM total_revenues_per_customer
