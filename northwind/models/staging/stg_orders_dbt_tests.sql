with sources as (

SELECT * FROM {{ source('dbt_postgres', 'orders_dbt_tests') }}

)

SELECT 
    order_id,
    order_date,
    customer_id,
    status,
    amount,
    country_code
FROM sources