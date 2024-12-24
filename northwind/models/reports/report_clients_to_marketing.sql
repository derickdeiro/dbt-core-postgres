{{ config(
    schema='gold',
    materialized='table'
) }}

with clientes_para_marketing as (
    SELECT 
        customers.company_name,
        sum(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) as total,
        ntile(5) over (order by sum(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) desc) as group_number
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

SELECT * FROM clientes_para_marketing
WHERE group_number >= 3