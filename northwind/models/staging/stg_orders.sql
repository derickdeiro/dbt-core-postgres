with sources as (
    SELECT * FROM {{ ref('raw_orders') }}
),


renamed_and_cleaning as (
    SELECT 
        order_id,
        customer_id,
        employee_id,
        order_date,
        required_date,
        shipped_date,
        ship_via,
        freight,
        ship_name,
        ship_address,
        ship_city,
        ship_region,
        ship_postal_code,
        ship_country
    FROM
        sources
)

SELECT * FROM renamed_and_cleaning
