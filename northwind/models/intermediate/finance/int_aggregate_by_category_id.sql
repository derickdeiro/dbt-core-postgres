with int_aggregate_by_category_id as (
    SELECT
        id, 
        count(*)
    FROM
        {{ ref('stg_crm__nova_tabela') }}
    GROUP BY
        id
)

SELECT * FROM int_aggregate_by_category_id