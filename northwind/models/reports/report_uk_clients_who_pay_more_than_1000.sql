{{ config(
    schema='reports',
    materialized='table'
) }}

with uk_clients_who_pay_more_than_1000 as (
    SELECT 
        customers.company_name,
        SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount) * 100) / 100 as payments
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
    WHERE
        lower(customers.country) = 'uk'
    GROUP BY
        customers.company_name
    HAVING
        SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) > 1000
)

SELECT * FROM uk_clients_who_pay_more_than_1000