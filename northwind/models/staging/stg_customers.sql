
-- IMPORTS

with sources as (
    SELECT * FROM {{ ref('raw_customers') }}
),

-- LÓGICA DE NEGÓCIO

with renamed_and_cleaning as (
SELECT 
    customer_id,
    company_name,
    contact_name,
    contact_title,
    address,
    city,
    region,
    postal_code,
    country,
    phone,
    fax
FROM 
    sources
)

-- QUERY FINAL

SELECT * FROM renamed_and_cleaning