with sources as (
    SELECT * FROM {{ ref('raw_order_details') }}
),

renamed_and_cleaning as (
    SELECT 
        order_id,
        product_id,
        unit_price,
        quantity,
        discount
    FROM
        sources
)

SELECT * FROM renamed_and_cleaning