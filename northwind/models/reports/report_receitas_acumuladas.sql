{{ config(
    schema='gold',
    materialized='table'
) }}

with receitas_mensais as (
    SELECT
        EXTRACT(year from orders.order_date) as ano,
        EXTRACT(month from orders.order_date) as mes,
        SUM(order_details.unit_price * order_details.quantity * (1.0 - order_details.discount)) as receita_mensal
    FROM
        {{ ref('stg_orders') }} as orders
    INNER JOIN
        {{ ref('stg_order_details') }} as order_details
    ON
        orders.order_id = order_details.order_id
    GROUP BY
        EXTRACT(year from orders.order_date),
        EXTRACT(month from orders.order_date)
), 

receitas_acumuladas as (
    SELECT
        ano,
        mes,
        receita_mensal,
        SUM(receita_mensal) OVER (PARTITION BY ano ORDER BY mes) as receita_ytd
    FROM
        receitas_mensais
)

SELECT
    ano,
    mes,
    receita_mensal,
    receita_mensal - LAG(receita_mensal) OVER (PARTITION BY ano ORDER BY mes) as diferenca_mensal,
    receita_ytd,
    (receita_mensal - LAG(receita_mensal) OVER (PARTITION BY ano ORDER BY mes)) / LAG(receita_mensal) OVER (PARTITION BY ano ORDER BY mes) * 100 as percentual_mudanca_mensal
FROM
    receitas_acumuladas
ORDER BY
    ano,
    mes