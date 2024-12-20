with sources as (
    SELECT * FROM {{ ref('raw_products') }}
),

with renamed_and_cleaning as (
    SELECT
        product_id,
        product_name,
        supplier_id,
        category_id,
        quantity_per_unit,
        unit_price,
        units_in_stock,
        units_on_order,
        reorder_level,
        discontinued
    FROM 
        sources
)

SELECT * FROM renamed_and_cleaning