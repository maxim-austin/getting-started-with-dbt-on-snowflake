{{ config(materialized = 'table')}}

SELECT
  region as region,
  count(*) as number_of_orders
FROM {{ ref('orders') }} cl
GROUP BY ALL

