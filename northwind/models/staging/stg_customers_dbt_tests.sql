with sources as (

SELECT * FROM {{ source('dbt_postgres', 'customers_dbt_tests') }}

)

SELECT 
    id,
    name, 
    email
FROM sources