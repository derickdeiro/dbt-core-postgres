{{ config(
    materialized='incremental',
    unique_key='id'
    on_schema_change='append_new_columns'
) }}

with vendas as (
    SELECT
        *
    FROM
        {{ ref('stg_crm__nova_tabela') }}
)

SELECT * FROM vendas

{ % if is_incremental() % }
    WHERE updated_at > (SELECT max(updated_at) FROM {{ this }})

{ % endif % }