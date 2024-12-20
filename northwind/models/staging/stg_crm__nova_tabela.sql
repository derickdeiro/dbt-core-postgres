with renamed as (
    SELECT
        category_id as id,
        category_name as name,
        description,
        updated_at
    FROM 
        {{ ref('raw_crm__nova_tabela') }}
)

SELECT * FROM renamed
