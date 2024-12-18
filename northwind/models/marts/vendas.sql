with vendas as (
    SELECT
        *
    FROM
        {{ ref('stg_crm__nova_tabela') }}
)

SELECT * FROM vendas